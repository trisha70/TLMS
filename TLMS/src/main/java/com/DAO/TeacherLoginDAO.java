package com.DAO;

import com.User.Teacher;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class TeacherLoginDAO {
    private Connection conn;

    public TeacherLoginDAO(Connection conn) {
        this.conn = conn;
    }

    // Method to register/add a teacher
    public boolean registerTeacher(Teacher teacher) {
        boolean success = false;
        try {
            String query = "INSERT INTO teacher(name, email, phone_no, gender, password, date_of_joining, dept_id, sub_id, photo) "
                         + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, teacher.getName());
            ps.setString(2, teacher.getEmail());
            ps.setString(3, teacher.getPhoneNo());
            ps.setString(4, teacher.getGender());
            ps.setString(5, teacher.getPassword());
            ps.setDate(6, teacher.getDateOfJoining());

            // Dept_id must be provided
            ps.setInt(7, teacher.getDeptId());

            // Handle optional sub_id
            if (teacher.getSubId() > 0) {
                ps.setInt(8, teacher.getSubId());
            } else {
                ps.setNull(8, java.sql.Types.INTEGER);
            }

            ps.setString(9, teacher.getPhoto()); // relative path to photo

            int i = ps.executeUpdate();
            if (i == 1) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
}
