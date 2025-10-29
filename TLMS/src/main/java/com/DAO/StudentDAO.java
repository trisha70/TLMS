package com.DAO;

import java.sql.*;
import java.util.*;
import com.User.Student;
import com.Db.DBConnect;

public class StudentDAO {
    private Connection conn;

    public StudentDAO(Connection conn) {
        this.conn = conn;
    }

    // =========================================
    // Get all students
    // =========================================
    public List<Student> getAllStudents() {
        List<Student> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM student ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Student s = new Student();
                s.setStudentId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setPhoneNo(rs.getString("phone_no"));
                s.setDob(rs.getDate("DOB"));
                s.setPassword(rs.getString("password"));
                s.setGender(rs.getString("gender"));
                s.setAttendance(rs.getDouble("attendance"));
                s.setSemester(rs.getInt("semester"));
                s.setSection(rs.getString("section"));
                s.setDeptId(rs.getInt("dept_id"));
                list.add(s);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // =========================================
    // Delete student by ID
    // =========================================
    public boolean deleteStudent(int studentId) {
        boolean f = false;
        try {
            String sql = "DELETE FROM student WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, studentId);

            int i = ps.executeUpdate();
            if (i == 1) f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
 // =========================================
 // Get student by ID
 // =========================================
 public Student getStudentById(int id) {
     Student s = null;
     try {
         String sql = "SELECT * FROM student WHERE id=?";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setInt(1, id);
         ResultSet rs = ps.executeQuery();

         if (rs.next()) {
             s = new Student();
             s.setStudentId(rs.getInt("id"));
             s.setName(rs.getString("name"));
             s.setEmail(rs.getString("email"));
             s.setPhoneNo(rs.getString("phone_no"));
             s.setDob(rs.getDate("DOB"));
             s.setPassword(rs.getString("password"));
             s.setGender(rs.getString("gender"));
             s.setAttendance(rs.getDouble("attendance"));
             s.setSemester(rs.getInt("semester"));
             s.setSection(rs.getString("section"));
             s.setDeptId(rs.getInt("dept_id"));
         }
     } catch (Exception e) {
         e.printStackTrace();
     }
     return s;
 }

 // =========================================
 // Update student
 // =========================================
 public boolean updateStudent(Student s) {
     boolean f = false;
     try {
         String sql = "UPDATE student SET name=?, email=?, phone_no=?, gender=?, attendance=?, semester=?, section=?, dept_id=? WHERE id=?";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setString(1, s.getName());
         ps.setString(2, s.getEmail());
         ps.setString(3, s.getPhoneNo());
         ps.setString(4, s.getGender());
         ps.setDouble(5, s.getAttendance());
         ps.setInt(6, s.getSemester());
         ps.setString(7, s.getSection());
         ps.setInt(8, s.getDeptId());
         ps.setInt(9, s.getStudentId());

         int i = ps.executeUpdate();
         if (i == 1) f = true;
     } catch (Exception e) {
         e.printStackTrace();
     }
     return f;
 }

}
