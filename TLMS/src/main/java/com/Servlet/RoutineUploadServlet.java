package com.Servlet;

import com.DAO.RoutineDAO;

import com.Db.DBConnect;
import com.User.CourseRoutine;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;


@WebServlet("/RoutineUploadServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class RoutineUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Defines the folder where files will be stored INSIDE the deployed web application.
    private static final String UPLOAD_DIRECTORY = "uploaded_routines"; 

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String filePathOnDisk = null; 
        
        // 1. Setup File Path
        // Gets the absolute path to the web application's root directory on the server
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIRECTORY;
        
        // Ensure the directory exists.
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // 2. Get Form Parameters
        String deptName = request.getParameter("dept_name");
        String academicYear = request.getParameter("academic_year");
        
        int semester;
        try {
            // Attempt to parse semester; handles NumberFormatException
            semester = Integer.parseInt(request.getParameter("semester"));
        } catch (NumberFormatException e) {
            session.setAttribute("routine-upload-failed-msg", "Error: Semester value is invalid.");
            response.sendRedirect("admin_routine_upload.jsp");
            return;
        }
        
        String section = request.getParameter("section");
        Part filePart = request.getPart("routineFile");
        
        String fileName = filePart != null ? filePart.getSubmittedFileName() : null;
        
        // Basic Input validation for file
        if (filePart == null || fileName == null || fileName.isEmpty() || !fileName.toLowerCase().endsWith(".pdf")) {
            session.setAttribute("routine-upload-failed-msg", "File missing or not a PDF file.");
            response.sendRedirect("admin_routine_upload.jsp");
            return;
        }

        // 3. Generate Standardized Filename and Path
        String simpleDept = deptName.replaceAll("[^a-zA-Z0-9]", "");
        String simpleYear = academicYear.replaceAll("[^a-zA-Z0-9]", "");
        
        String newFileName = String.format("%s_%s_%d_%s.pdf", 
                                            simpleDept, 
                                            simpleYear, 
                                            semester, 
                                            section);
        
        filePathOnDisk = uploadPath + File.separator + newFileName;
        
        // Path saved in the DB (for web access):
        String fileReferencePath = UPLOAD_DIRECTORY + "/" + newFileName;


        // 4. Save File to Disk and Save Metadata to DB
        Connection conn = null;
        boolean dbSaveSuccess = false;
        
        try {
            // A. Save file to disk
            filePart.write(filePathOnDisk);
            
            // B. Connect to DB and save metadata
            conn = DBConnect.getConn();
            RoutineDAO dao = new RoutineDAO(conn);
            
            CourseRoutine routine = new CourseRoutine(deptName, academicYear, semester, section, fileReferencePath);
            
            if (dao.uploadRoutine(routine)) { 
                dbSaveSuccess = true;
                session.setAttribute("routine-upload-success-msg", "Routine **" + newFileName + "** uploaded successfully!");
            } else {
                session.setAttribute("routine-upload-failed-msg", "File uploaded, but failed to save metadata to the database.");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("routine-upload-failed-msg", "An unexpected error occurred: " + e.getMessage());
        } finally {
            // Cleanup: If the DB save failed, delete the file saved to disk
            if (!dbSaveSuccess && filePathOnDisk != null && new File(filePathOnDisk).exists()) {
                new File(filePathOnDisk).delete();
            }
            // Close connection
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            // Redirect back to the upload page
            response.sendRedirect("admin_routine_upload.jsp");
        }
    }
}