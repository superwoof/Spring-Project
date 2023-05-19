package hiCampDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import hiCampBean.ProductBean;

public class ProductDao {
	
	Connection conn;
		//新增資料
		public void InsertProduct(ProductBean product) 	throws SQLException, NamingException {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/HiCamp");
			conn = ds.getConnection();
			String sql = "insert into product (productType,productName,productPrice,productQuantity,productInfo,productStutas) values (?, ?, ?, ?, ?, ?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, product.getProductType());
			stmt.setString(2, product.getProductName());
			stmt.setInt(3, product.getProductPrice());
			stmt.setInt(4, product.getProductQuantity());
			stmt.setString(5, product.getProductInfo());
			stmt.setString(6, product.getProductStutas());

			
			int i = stmt.executeUpdate();
			if (i != 0) {
				System.out.println("新增 "+i+" 筆資料");
			}
			stmt.close();
			conn.close();
		}
		//查詢資料
		public ProductBean getProduct(Integer productNo) throws SQLException, NamingException {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/HiCamp");
			conn = ds.getConnection();
			String sql = "select * from product where productNo=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, productNo);
			
			ResultSet rs = stmt.executeQuery();
			ProductBean product = new ProductBean();
			if(rs.next()) {
				product.setProductNo(rs.getInt("productNo"));
				product.setProductType(rs.getString("productType"));
				product.setProductName(rs.getString("productName"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setProductQuantity(rs.getInt("productQuantity"));
				product.setProductInfo(rs.getString("productInfo"));
				product.setProductStutas(rs.getString("productStutas"));
				
			}
				
			stmt.close();
			rs.close();
			conn.close();
			return product;
		}
		//修改商品
		public void updateProductByNo(ProductBean product) throws SQLException, NamingException {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/HiCamp");
			conn = ds.getConnection();
			String sql = "update product set productType =? , productName =?, productPrice =? ,productQuantity =?, productInfo=?,productStutas=? where productNo =?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, product.getProductType());
			stmt.setString(2, product.getProductName());
			stmt.setInt(3, product.getProductPrice());
			stmt.setInt(4, product.getProductQuantity());
			stmt.setString(5, product.getProductInfo());
			stmt.setString(6, product.getProductStutas());
			stmt.setInt(7, product.getProductNo());
			
			stmt.executeUpdate();
			System.out.println("修改OK!");
			
			stmt.close();
			conn.close();
		}
		
		//刪除資料
		public void deleteProduct(Integer productNo) throws SQLException, NamingException {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/HiCamp");
			conn = ds.getConnection();
			String sql="Delete product where productNo=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, productNo);
			stmt.executeUpdate();
			
			System.out.println("刪除編號為 " +productNo+ " 的資料");
			
			stmt.close();
			conn.close();
		}
		
}

