package com.User;

import java.sql.Date;

public class Teacher {

    private int teacherId;
    private String name;
    private String email;
    private String phoneNo;
    private String gender;
    private String password;
    private Date dateOfJoining;
    private int deptId;
    private int subId;
    private String photo;  // Stores the image filename or path

    // Default constructor
    public Teacher() {}

    // Parameterized constructor
    public Teacher(int teacherId, String name, String email, String phoneNo, String gender,
                   String password, Date dateOfJoining, int deptId, int subId, String photo) {
        this.teacherId = teacherId;
        this.name = name;
        this.email = email;
        this.phoneNo = phoneNo;
        this.gender = gender;
        this.password = password;
        this.dateOfJoining = dateOfJoining;
        this.deptId = deptId;
        this.subId = subId;
        this.photo = photo;
    }

    // Getters and Setters
    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDateOfJoining() {
        return dateOfJoining;
    }

    public void setDateOfJoining(Date dateOfJoining) {
        this.dateOfJoining = dateOfJoining;
    }

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }

    public int getSubId() {
        return subId;
    }

    public void setSubId(int subId) {
        this.subId = subId;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    // toString() method
    @Override
    public String toString() {
        return "Teacher [teacherId=" + teacherId + ", name=" + name + ", email=" + email + 
               ", phoneNo=" + phoneNo + ", gender=" + gender + ", password=" + password + 
               ", dateOfJoining=" + dateOfJoining + ", deptId=" + deptId + ", subId=" + subId + 
               ", photo=" + photo + "]";
    }
}
