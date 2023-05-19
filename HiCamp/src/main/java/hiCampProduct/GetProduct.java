package hiCampProduct;

import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hiCampDao.ProductDao;
import hiCampBean.ProductBean;


@WebServlet("/GetProduct")
public class GetProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;


//	Connection conn;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		Integer productNo = Integer.parseInt(request.getParameter("productNo"));
		
		HttpSession session = request.getSession();
		session.setAttribute("session", productNo);
		
//		int productNo=0;
//		if(pNo != null) {
//			productNo = Integer.parseInt(pNo);
//		}else {
//			productNo =0;
//		}
//		productNo = 1;
			ProductDao pDao = new ProductDao();
			System.out.print("test");
			try {
			ProductBean product = pDao.getProduct(productNo);
//			Context context = new InitialContext();
//			DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/servdb");
//			conn = ds.getConnection();
//			String sql = "select * from product where productNo=?";
//			PreparedStatement stmt = conn.prepareStatement(sql);
//			stmt.setInt(1, productNo);
//			ResultSet rs = stmt.executeQuery();
//			ProductBean product = new ProductBean();
//			if(rs.next()) {
//				product.setProductNo(rs.getInt("productNo"));
//				product.setProductType(rs.getString("productType"));
//				product.setProductName(rs.getString("productName"));
//				product	.setProductPrice(rs.getInt("productPrice"));
//				product.setProductQuantity(rs.getInt("productQuantity"));
//				product.setProductInfo(rs.getString("productInfo"));
//				product.setProductStutas(rs.getString("productStutas"));
//			
//			}
			

		System.out.println(product.getProductInfo());
		request.setAttribute("product", product);
		
			
//		stmt.close();
		request.getRequestDispatcher("./Product/getProduct.jsp").
				forward(request,response);
		}catch (SQLException e) {
			request.setAttribute("row", "無此筆資料");
			request.getRequestDispatcher("/HiCamp/Product/getProduct.jsp").
			forward(request,response);
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}




}


