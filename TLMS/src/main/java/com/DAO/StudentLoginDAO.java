package com.DAO;

import com.User.Student;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class StudentLoginDAO {
    private Connection conn;

    public StudentLoginDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean registerStudent(Student s) {
        boolean f = false;
        try {
            String query = "INSERT INTO student(name,email,phone_no,DOB,password,gender,attendance,semester,section,dept_id,photo) " +
                           "VALUES(?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, s.getName());
            ps.setString(2, s.getEmail());
            ps.setString(3, s.getPhoneNo());
            ps.setDate(4, s.getDob());
            ps.setString(5, s.getPassword());
            ps.setString(6, s.getGender());
            ps.setDouble(7, s.getAttendance());
            ps.setInt(8, s.getSemester());
            ps.setString(9, s.getSection());
            ps.setInt(10, s.getDeptId());
            ps.setString(11, s.getPhoto()); // store photo path

            int i = ps.executeUpdate();
            if (i == 1) f = true;

        } catch(Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
