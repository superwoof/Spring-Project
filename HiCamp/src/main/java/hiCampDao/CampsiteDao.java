package hiCampDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hiCampBean.*;

public class CampsiteDao {
    private Connection conn;

    public CampsiteDao() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=HiCamp;TrustServerCertificate=True;characterEncoding=UTF-8", "sa", "Ms06f.joshuA");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean addCamp(CampsiteBean camp) {
        try {
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO campsite VALUES (?, ?, ?, ?, ?)");
            stmt.setString(1, camp.getCampsiteNo());
            stmt.setString(2, camp.getCampsiteName());
            stmt.setString(3, camp.getCampsiteQuantity());
            stmt.setString(4, camp.getCampsiteLocation());
            stmt.setString(5, camp.getCampsiteInfo());

            int rowsAffected = stmt.executeUpdate();
            stmt.close();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }


    public void deleteCamp(String campsiteNo) {
        try {
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM campsite WHERE campsiteNo=?");
            stmt.setString(1, campsiteNo);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<CampsiteBean> selectAllCamps() {
        List<CampsiteBean> camps = new ArrayList<>();
        try {
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM campsite");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                CampsiteBean camp = new CampsiteBean();
                camp.setCampsiteNo(rs.getString("campsiteNo"));
                camp.setCampsiteName(rs.getString("campsiteName"));
                camp.setCampsiteQuantity(rs.getString("campsiteQuantity"));
                camp.setCampsiteLocation(rs.getString("campsiteLocation"));
                camp.setCampsiteInfo(rs.getString("campsiteInfo"));
                camps.add(camp);
            }
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return camps;
    }

    public boolean updateCamp(CampsiteBean camp) {
        boolean updateSuccessful = false;
        try {
            PreparedStatement stmt = conn.prepareStatement("UPDATE campsite SET campsiteName=?, campsiteQuantity=?, campsiteLocation=?, campsiteInfo=? WHERE campsiteNo=?");
            stmt.setString(1, camp.getCampsiteName());
            stmt.setString(2, camp.getCampsiteQuantity());
            stmt.setString(3, camp.getCampsiteLocation());
            stmt.setString(4, camp.getCampsiteInfo());
            stmt.setString(5, camp.getCampsiteNo());

            int rowsAffected = stmt.executeUpdate();
            updateSuccessful = (rowsAffected > 0);

            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return updateSuccessful;
    }

    public CampsiteBean getCampByNo(String campsiteNo) {
        CampsiteBean camp = null;
        try {
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM campsite WHERE campsiteNo=?");
            stmt.setString(1, campsiteNo);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                camp = new CampsiteBean();
                camp.setCampsiteNo(rs.getString("campsiteNo"));
                camp.setCampsiteName(rs.getString("campsiteName"));
                camp.setCampsiteQuantity(rs.getString("campsiteQuantity"));
                camp.setCampsiteLocation(rs.getString("campsiteLocation"));
                camp.setCampsiteInfo(rs.getString("campsiteInfo"));
            }
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return camp;
    }


    public void closeConnection() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
