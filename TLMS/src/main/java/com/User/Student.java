package com.User;

import java.sql.Date;

public class Student {
    private int studentId;
    private String name;
    private String email;
    private String phoneNo;
    private Date dob; 
    private String password;
    private String gender;
    private double attendance;
    private int semester;
    private String section;
    private int deptId;
    private String photo; // store file path

    public Student() {}

    public Student(int studentId, String name, String email, String phoneNo, Date dob, String password, String gender,
                   double attendance, int semester, String section, int deptId, String photo) {
        this.studentId = studentId;
        this.name = name;
        this.email = email;
        this.phoneNo = phoneNo;
        this.dob = dob;
        this.password = password;
        this.gender = gender;
        this.attendance = attendance;
        this.semester = semester;
        this.section = section;
        this.deptId = deptId;
        this.photo = photo;
    }

    // Getters and setters
    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPhoneNo() { return phoneNo; }
    public void setPhoneNo(String phoneNo) { this.phoneNo = phoneNo; }
    public Date getDob() { return dob; }
    public void setDob(Date dob) { this.dob = dob; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    public double getAttendance() { return attendance; }
    public void setAttendance(double attendance) { this.attendance = attendance; }
    public int getSemester() { return semester; }
    public void setSemester(int semester) { this.semester = semester; }
    public String getSection() { return section; }
    public void setSection(String section) { this.section = section; }
    public int getDeptId() { return deptId; }
    public void setDeptId(int deptId) { this.deptId = deptId; }
    public String getPhoto() { return photo; }
    public void setPhoto(String photo) { this.photo = photo; }

    @Override
    public String toString() {
        return "Student [studentId=" + studentId + ", name=" + name + ", email=" + email + ", phoneNo=" + phoneNo
                + ", dob=" + dob + ", password=" + password + ", gender=" + gender + ", attendance=" + attendance
                + ", semester=" + semester + ", section=" + section + ", deptId=" + deptId + ", photo=" + photo + "]";
    }
}
