package com.DAO;

import com.User.CourseRoutine;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.time.LocalDate;

/**
 * Data Access Object for handling database operations related to course routines.
 */
public class RoutineDAO {
    private Connection conn;

    public RoutineDAO(Connection conn) {
        this.conn = conn;
    }

    /**
     * Inserts the metadata for an uploaded course routine into the database.
     * @param routine The CourseRoutine object containing all details.
     * @return true if the insertion was successful, false otherwise.
     */
    public boolean uploadRoutine(CourseRoutine routine) {
        boolean success = false;
        
        // Ensure this SQL matches your 'course_routines' table structure.
        String query = "INSERT INTO course_routines (dept_name, academic_year, semester, section, file_path, upload_date) "
                     + "VALUES (?, ?, ?, ?, ?, ?)";
        
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, routine.getDeptName());
            ps.setString(2, routine.getAcademicYear());
            ps.setInt(3, routine.getSemester());
            ps.setString(4, routine.getSection());
            ps.setString(5, routine.getFilePath());
            
            // Set current date for the upload_date field
            ps.setDate(6, Date.valueOf(LocalDate.now()));

            int i = ps.executeUpdate();
            if (i == 1) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Error during routine upload: " + e.getMessage());
        }
        return success;
    }
    
    /**
     * FIX: Retrieves the file path of a routine based on specific criteria.
     * This method resolves the "undefined method" error for routine viewing/downloading.
     * * @param deptName The department name.
     * @param academicYear The academic year (e.g., "3rd Year").
     * @param semester The semester number (e.g., 5).
     * @param section The section (e.g., "A").
     * @return The file path string if found, or null otherwise.
     */
    public String getRoutineFilePath(String deptName, String academicYear, int semester, String section) {
        String filePath = null;
        
        String query = "SELECT file_path FROM course_routines WHERE dept_name = ? AND academic_year = ? AND semester = ? AND section = ?";
        
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, deptName);
            ps.setString(2, academicYear);
            ps.setInt(3, semester);
            ps.setString(4, section);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    filePath = rs.getString("file_path");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Error during routine file path retrieval: " + e.getMessage());
        }
        return filePath;
    }
}
