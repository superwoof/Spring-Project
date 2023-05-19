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

import hiCampBean.MemberBean;

public class MemberDao {

	Connection conn;

//	新增會員
	public int creatNewMember(MemberBean member) {
		int row = 0;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/jdbc/HiCamp");
			conn = ds.getConnection();
			PreparedStatement ps = conn.prepareStatement(
					"insert into member(memberName,memberGender,memberEmail,memberPassword,memberPhone,memberAddress,memberId,memberBirthday,memberEmergencyContact,memberEmergencyPhone) values(?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, member.getMemberName());
			ps.setString(2, member.getMemberGender());
			ps.setString(3, member.getMemberEmail());
			ps.setString(4, member.getMemberPassword());
			ps.setString(5, member.getMemberPhone());
			ps.setString(6, member.getMemberAddress());
			ps.setString(7, member.getMemberId());
			ps.setString(8, member.getMemberBirthday());
			ps.setString(9, member.getMemberEmergencyContact());
			ps.setString(10, member.getMemberEmergencyPhone());

			row = ps.executeUpdate();
			System.out.println(row);

			ps.close();

			return row;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} catch (NamingException e) {
			e.printStackTrace();
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return row;

	}

//	核對會員信箱
	public MemberBean searchMemberEmail(String email) {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/jdbc/HiCamp");
			conn = ds.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from member where memberEmail = ?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();

			MemberBean member = new MemberBean();
			if (rs.next()) {
				member.setMemberNo(rs.getInt("memberNo"));
				member.setMemberName(rs.getString("memberName"));
				member.setMemberGender(rs.getString("memberGender"));
				member.setMemberEmail(rs.getString("memberEmail"));
				member.setMemberPassword(rs.getString("memberPassword"));
				member.setMemberPhone(rs.getString("memberPhone"));
				member.setMemberAddress(rs.getString("memberAddress"));
				member.setMemberId(rs.getString("memberId"));
				member.setMemberBirthday(rs.getString("memberBirthday"));
				member.setMemberEmergencyContact(rs.getString("memberEmergencyContact"));
				member.setMemberEmergencyPhone(rs.getString("memberEmergencyPhone"));
			}
			System.out.println(member.getMemberEmail());
			rs.close();
			ps.close();
			return member;

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

//	核對會員密碼
	public boolean searchMemberPassword(String password) {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/jdbc/HiCamp");
			conn = ds.getConnection();
			PreparedStatement ps = conn.prepareStatement("select memberName from member where memberPassword = ?");
			ps.setString(1, password);
			ResultSet rs = ps.executeQuery();

			if (rs.next())
				return true;
			rs.close();
			ps.close();

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} catch (NamingException e) {
			e.printStackTrace();
			return false;
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

//	查詢全部會員
	public List<MemberBean> searchAllMember() {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/jdbc/HiCamp");
			conn = ds.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from member");
			ResultSet rs = ps.executeQuery();
			List<MemberBean> members = new ArrayList<>();
			while (rs.next()) {
				MemberBean member = new MemberBean();
				member.setMemberNo(rs.getInt("memberNo"));
				member.setMemberName(rs.getString("memberName"));
//				member.setMemberGender(rs.getString("memberGender"));
				member.setMemberEmail(rs.getString("memberEmail"));
//				member.setMemberPassword(rs.getString("memberPassword"));
//				member.setMemberPhone(rs.getString("memberPhone"));
//				member.setMemberAddress(rs.getString("memberAddress"));
//				member.setMemberId(rs.getString("memberId"));
//				member.setMemberBirthday(rs.getString("memberBirthday"));
//				member.setMemberEmergencyContact(rs.getString("memberEmergencyContact"));
//				member.setMemberEmergencyPhone(rs.getString("memberEmergencyPhone"));
				members.add(member);
			}

			rs.close();
			ps.close();
			return members;
		} catch (NamingException e) {
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
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

//	更新會員資料
	public int updateMemberInfomation(MemberBean member) {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/jdbc/HiCamp");
			conn = ds.getConnection();
			PreparedStatement ps = conn.prepareStatement(
					"update member set memberName = ?, memberPassword = ?,  memberPhone = ?, memberAddress = ?, memberId = ?, memberEmergencyContact = ?, memberEmergencyPhone = ?, memberGender = ?, memberBirthday = ?  where memberEmail = ?");
			ps.setString(1, member.getMemberName());
			ps.setString(2, member.getMemberPassword());
			ps.setString(3, member.getMemberPhone());
			ps.setString(4, member.getMemberAddress());
			ps.setString(5, member.getMemberId());
			ps.setString(6, member.getMemberEmergencyContact());
			ps.setString(7, member.getMemberEmergencyPhone());
			ps.setString(8, member.getMemberGender());
			ps.setString(9, member.getMemberBirthday());
			ps.setString(10, member.getMemberEmail());
			int row = ps.executeUpdate();

			ps.close();
			return row;
		} catch (NamingException e) {
			e.printStackTrace();
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}

//	刪除會員
	public void deleteMember(String memberEmail) {
		try {
			Context	context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/jdbc/HiCamp");
			conn = ds.getConnection();
			PreparedStatement ps = conn.prepareStatement("delete from member where memberEmail = ?");
			ps.setString(1, memberEmail);
			ps.executeUpdate();
			ps.close();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
