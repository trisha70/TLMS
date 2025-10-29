package com.DAO;
import com.User.Notice;
import com.Db.DBConnect;
import java.sql.*;
import java.util.*;

public class NoticeDAO {
    public List<Notice> getAllNotices() {
        List<Notice> list = new ArrayList<>();
        String sql = "SELECT id, notice_text, posted_at FROM notices ORDER BY posted_at DESC";
        try (Connection con = DBConnect.getConn();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Notice n = new Notice();
                n.setId(rs.getInt("id"));
                n.setNoticeText(rs.getString("notice_text"));
                n.setPostedAt(rs.getTimestamp("posted_at"));
                list.add(n);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public boolean addNotice(String text) {
        String sql = "INSERT INTO notices (notice_text, posted_at) VALUES (?, NOW())";
        try (Connection con = DBConnect.getConn();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, text);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean deleteNoticeById(int id) {
        String sql = "DELETE FROM notices WHERE id=?";
        try (Connection con = DBConnect.getConn();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
