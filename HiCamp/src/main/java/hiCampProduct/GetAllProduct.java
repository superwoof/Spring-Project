package hiCampProduct;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import hiCampBean.ProductBean;


@WebServlet("/GetAllProduct")
public class GetAllProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public GetAllProduct() {
        super();
    }
	Connection conn;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/HiCamp");
			conn = ds.getConnection();
			
			String sql = "select * from product";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			List<ProductBean> products = new ArrayList<>();
			ProductBean product = null;
			
			while(rs.next()) {
				product = new ProductBean();
				product.setProductNo(rs.getInt("productNo"));
				product.setProductType(rs.getString("productType"));
				product.setProductName(rs.getString("productName"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setProductQuantity(rs.getInt("productQuantity"));
				product.setProductInfo(rs.getString("productInfo"));
				product.setProductStutas(rs.getString("productStutas"));
				products.add(product);
			}
			
			request.setAttribute("products", products);
			
		stmt.close();
		request.getRequestDispatcher("./Product/mainProduct2.jsp").
				forward(request,response);
		}catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
