package com.User;

/**
 * Model class for storing routine details (metadata for the uploaded PDF file).
 * This structure matches the data fields being collected in the servlet.
 */
public class CourseRoutine {

    private String deptName;
    private String academicYear;
    private int semester;
    private String section;
    private String filePath; // Relative path where the PDF is stored

    // Constructor used by RoutineUploadServlet
    public CourseRoutine(String deptName, String academicYear, int semester, String section, String filePath) {
        this.deptName = deptName;
        this.academicYear = academicYear;
        this.semester = semester;
        this.section = section;
        this.filePath = filePath;
    }

    // --- Getters ---
    public String getDeptName() {
        return deptName;
    }

    public String getAcademicYear() {
        return academicYear;
    }

    public int getSemester() {
        return semester;
    }

    public String getSection() {
        return section;
    }

    public String getFilePath() {
        return filePath;
    }

    // --- Setters (optional, but good practice) ---
    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public void setAcademicYear(String academicYear) {
        this.academicYear = academicYear;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
}
