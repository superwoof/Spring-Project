package hiCampDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import hiCampBean.ActivityBean;
import hiCampBean.ActivityPeriodBean;
import hiCampBean.ActivityPictureBean;
import hiCampBean.ActivityReviewBean;

//  DAO Class:
public class Activity_Dao {
	Connection conn;

	public Activity_Dao() {
		super();
	}

//	連線class: 
	public class ConnectionUtil {
		private static Connection conn;
		public static Connection getConnection() 
				throws NamingException, SQLException {
			if (conn == null || conn.isClosed()) {
				Context context = new InitialContext();
				DataSource ds = (DataSource) context.lookup("java:/comp/env/jdbc/HiCamp");
				conn = ds.getConnection();
			}
			return conn;
		}

		public static void closeConnection() throws SQLException {
			if (conn != null && !conn.isClosed()) {
				conn.close();
			}
		}
	}

//	Bean: 
	ActivityBean activity = new ActivityBean();
	ActivityPeriodBean period = new ActivityPeriodBean();
	ActivityPictureBean picture = new ActivityPictureBean();
	ActivityReviewBean review = new ActivityReviewBean();

//  CRUD-SQL 
	private static final String SQL_Insert = "insert into activity values(?,?,?,?,?,?)";
	private static final String SQL_Delete = "Delete from activity where activityNo = ?";
	private static final String SQL_Update = "update activity set activityType = ?, activityName = ?,"
			+ "activityLocation =?,activityInfo=?,activityQuota=?," + "activityPrice=? where activityNo = ?";
	private static final String SQL_SelectAll = "select * from activity";
	private static final String SQL_SelectByNo = "select * from activity where activityNo = ?";
	private static final String SQL_SelectByKeyWord = "select * from activity where activityNo like ? "
			+ "OR activityType like ? " + "OR activityName like ? " + "OR activityLocation like ? "
			+ "OR activityInfo like ? " + "OR activityQuota like ? " + "OR activityPrice like ? ";

//	insert picture
	private static final String SQL_InsertPic = "insert into activityPicture(activityPicture) values(?,?)";
		
	public int InsertPicture(ActivityPictureBean activityPic) throws SQLException, NamingException {
		int result = 0;
		try {
			conn = ConnectionUtil.getConnection();
			PreparedStatement stmt = conn.prepareStatement(SQL_InsertPic);
			stmt.setString(1, activityPic.getActivityNo());
			stmt.setBytes(2, activityPic.getActivityPicture());
			result = stmt.executeUpdate();

			if (result > 0) {
				System.out.println("新增成功");
			} else {
			}
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

// CRUD- 
// ==Insert=====================================================================
	public int InsertActivity(ActivityBean activity) throws SQLException, NamingException {
		int result = 0;
		try {
			conn = ConnectionUtil.getConnection();
			PreparedStatement stmt = conn.prepareStatement(SQL_Insert);
			stmt.setString(1, activity.getActivityType());
			stmt.setString(2, activity.getActivityName());
			stmt.setString(3, activity.getActivityLocation());
			stmt.setString(4, activity.getActivityInfo());
			stmt.setString(5, activity.getActivityQuota());
			stmt.setString(6, activity.getActivityPrice());
			result = stmt.executeUpdate();

			if (result > 0) {
				System.out.println("新增成功");
			} else {
				System.out.println("新增失敗");
			}

			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

// ==Delete=====================================================================
	public int deleteActivity(ActivityBean activity) throws SQLException, NamingException {
		int result = 0;
		try {
			conn = ConnectionUtil.getConnection();

			PreparedStatement stmt = conn.prepareStatement(SQL_Delete);
			stmt.setInt(1, activity.getActivityNo());
			
			result = stmt.executeUpdate();
			stmt.close();

			if (result > 0) {
				System.out.println("刪除成功");
			} else {
				System.out.println("刪除失敗");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	

// ==Update======================================================================
	public int updateActivity(ActivityBean activity) throws SQLException, NamingException {
		int result = 0;
		try {
			conn = ConnectionUtil.getConnection();

			PreparedStatement stmt = conn.prepareStatement(SQL_Update);

			stmt.setString(1, activity.getActivityType());
			stmt.setString(2, activity.getActivityName());
			stmt.setString(3, activity.getActivityLocation());
			stmt.setString(4, activity.getActivityInfo());
			stmt.setString(5, activity.getActivityQuota());
			stmt.setString(6, activity.getActivityPrice());
			stmt.setInt(7, activity.getActivityNo());
			result = stmt.executeUpdate();
			stmt.close();

			if (result > 0) {
				System.out.println("修改成功");
			} else {
				System.out.println("修改失敗");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

// ==Select======================================================================

// --SelectAll-------------------------------------------------------------------
	public List<ActivityBean> selectAllActivity() throws SQLException, NamingException {
		List<ActivityBean> actList = new ArrayList<ActivityBean>();
		try {
			conn = ConnectionUtil.getConnection();
			PreparedStatement stmt = conn.prepareStatement(SQL_SelectAll);
			ResultSet rs = stmt.executeQuery();

			int rowCount = 0;
			while (rs.next()) {
				ActivityBean activity = new ActivityBean();
				activity.setActivityNo(rs.getInt("activityNo"));
				activity.setActivityType(rs.getString("activityType"));
				activity.setActivityName(rs.getString("activityName"));
				activity.setActivityLocation(rs.getString("activityLocation"));
				activity.setActivityInfo(rs.getString("activityInfo"));
				activity.setActivityQuota(rs.getString("activityQuota"));
				activity.setActivityPrice(rs.getString("activityPrice"));
				actList.add(activity);
				rowCount++;
			}
			if (rowCount > 0) {
				System.out.println("總共 " + rowCount + " 筆活動資料：");
			} else {
				System.out.println("總共0筆活動資料");
			}
			rs.close();
			stmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return actList;
	}

// --SelectByNo------------------------------------------------------------------
	public ActivityBean selectByNo(int activityNo) throws SQLException, NamingException {
		try {
			conn = ConnectionUtil.getConnection();

			PreparedStatement stmt = conn.prepareStatement(SQL_SelectByNo);
			stmt.setInt(1, activityNo);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				activity.setActivityNo(rs.getInt("activityNo"));
				activity.setActivityType(rs.getString("activityType"));
				activity.setActivityName(rs.getString("activityName"));
				activity.setActivityLocation(rs.getString("activityLocation"));
				activity.setActivityInfo(rs.getString("activityInfo"));
				activity.setActivityQuota(rs.getString("activityQuota"));
				activity.setActivityPrice(rs.getString("activityPrice"));
				return activity;
			}
			rs.close();
			stmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.close();
			}
		}
		return activity;
	}

// --SelectByKeyWord-----------------------------------------------------------
	public List<ActivityBean> selectByKeyword(String keyword) throws SQLException, NamingException {
		List<ActivityBean> actList = new ArrayList<>();

		try {
			conn = ConnectionUtil.getConnection();

			PreparedStatement stmt = conn.prepareStatement(SQL_SelectByKeyWord);
			stmt.setString(1, "%" + keyword + "%");
			stmt.setString(2, "%" + keyword + "%");
			stmt.setString(3, "%" + keyword + "%");
			stmt.setString(4, "%" + keyword + "%");
			stmt.setString(5, "%" + keyword + "%");
			stmt.setString(6, "%" + keyword + "%");
			stmt.setString(7, "%" + keyword + "%");
			ResultSet rs = stmt.executeQuery();

			int rowCount = 0;
			while (rs.next()) {
				ActivityBean activity = new ActivityBean();
				activity.setActivityNo(rs.getInt("activityNo"));
				activity.setActivityType(rs.getString("activityType"));
				activity.setActivityName(rs.getString("activityName"));
				activity.setActivityLocation(rs.getString("activityLocation"));
				activity.setActivityInfo(rs.getString("activityInfo"));
				activity.setActivityQuota(rs.getString("activityQuota"));
				activity.setActivityPrice(rs.getString("activityPrice"));
				actList.add(activity);
				rowCount++;
			}
			if (rowCount > 0) {
				System.out.println("查詢結果總共 " + rowCount + " 筆資料：");
			} else {
				System.out.println("查無相關資料");
			}

			rs.close();
			stmt.close();

		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.close();
			}
		}
		return actList;
	}
}