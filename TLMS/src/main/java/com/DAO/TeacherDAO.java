package com.DAO;

import java.sql.*;
import java.util.*;
import com.User.Teacher;
import com.Db.DBConnect;

public class TeacherDAO {
    private Connection conn;

    public TeacherDAO(Connection conn) {
        this.conn = conn;
    }

    // =========================================
    // Get all teachers
    // =========================================
    public List<Teacher> getAllTeachers() {
        List<Teacher> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM teacher ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Teacher t = new Teacher();
                t.setTeacherId(rs.getInt("id"));
                t.setName(rs.getString("name"));
                t.setEmail(rs.getString("email"));
                t.setPhoneNo(rs.getString("phone_no"));
                t.setGender(rs.getString("gender"));
                t.setPassword(rs.getString("password"));
                t.setDateOfJoining(rs.getDate("date_of_joining"));
                t.setDeptId(rs.getInt("dept_id"));
                t.setSubId(rs.getInt("sub_id"));
                list.add(t);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // =========================================
    // Delete teacher by ID
    // =========================================
    public boolean deleteTeacher(int teacherId) {
        boolean f = false;
        try {
            String sql = "DELETE FROM teacher WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, teacherId);
            int i = ps.executeUpdate();
            if (i == 1) f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
 // =========================================
 // Get Teacher by ID
 // =========================================
 public Teacher getTeacherById(int teacherId) {
     Teacher t = null;
     try {
         String sql = "SELECT * FROM teacher WHERE id=?";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setInt(1, teacherId);
         ResultSet rs = ps.executeQuery();

         if (rs.next()) {
             t = new Teacher();
             t.setTeacherId(rs.getInt("id"));
             t.setName(rs.getString("name"));
             t.setEmail(rs.getString("email"));
             t.setPhoneNo(rs.getString("phone_no"));
             t.setGender(rs.getString("gender"));
             t.setPassword(rs.getString("password"));
             t.setDateOfJoining(rs.getDate("date_of_joining"));
             t.setDeptId(rs.getInt("dept_id"));
             t.setSubId(rs.getInt("sub_id"));
         }
     } catch (Exception e) {
         e.printStackTrace();
     }
     return t;
 }

 // =========================================
 // Update Teacher
 // =========================================
 public boolean updateTeacher(Teacher t) {
     boolean f = false;
     try {
         String sql = "UPDATE teacher SET name=?, email=?, phone_no=?, gender=?, date_of_joining=?, dept_id=?, sub_id=? WHERE id=?";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setString(1, t.getName());
         ps.setString(2, t.getEmail());
         ps.setString(3, t.getPhoneNo());
         ps.setString(4, t.getGender());
         ps.setDate(5, t.getDateOfJoining());
         ps.setInt(6, t.getDeptId());
         ps.setInt(7, t.getSubId());
         ps.setInt(8, t.getTeacherId());

         int i = ps.executeUpdate();
         if (i == 1) f = true;

     } catch (Exception e) {
         e.printStackTrace();
     }
     return f;
 }

}
