package hiCampDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import hiCampBean.ManagerBean;

public class ManagerDao {

	Connection conn;
	
	public ManagerBean searchManagerAccount(String account) {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/jdbc/HiCamp");
			conn = ds.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from manager where managerAccount = ?");
			ps.setString(1, account);
			ResultSet rs = ps.executeQuery();

			ManagerBean manager = new ManagerBean();
			if (rs.next()) {
				manager.setManagerAccount(rs.getString("managerAccount"));
				manager.setManagerPassword(rs.getString("managerPassword"));
				manager.setManagerName(rs.getString("managerName"));
			}
			rs.close();
			ps.close();
			System.out.println(manager.getManagerPassword());
			return manager;

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} catch (NamingException e) {
			e.printStackTrace();
			return null;
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}
	
	public boolean searchManagerPassword(String password) {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/jdbc/HiCamp");
			conn = ds.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from manager where managerPassword = ?");
			ps.setString(1, password);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next())
				return true;
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL錯誤");
		} catch (NamingException e) {
			e.printStackTrace();
			System.out.println("不知道甚麼錯誤");
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return false;
	}
	
}
