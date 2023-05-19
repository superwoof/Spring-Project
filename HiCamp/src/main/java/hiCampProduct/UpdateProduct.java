package hiCampProduct;

import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hiCampDao.ProductDao;
import hiCampBean.ProductBean;

@WebServlet("/UpdateProduct")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;


//	Connection conn;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
//		String productNo = request.getParameter("productNo");
//		String productType = request.getParameter("productType");
//		String productName = request.getParameter("productName");
//		String productPrice = request.getParameter("productPrice");
//		String productQuantity = request.getParameter("productQuantity");
//		String prosuctInfo = request.getParameter("prosuctInfo");
		
		ProductBean product1 = new ProductBean();
		product1.setProductNo(Integer.parseInt(request.getParameter("productNo")));
		product1.setProductName(request.getParameter("productName"));
		product1.setProductType(request.getParameter("productType"));
		product1.setProductPrice(Integer.parseInt(request.getParameter("productPrice")));
		product1.setProductQuantity(Integer.parseInt(request.getParameter("productQuantity")));
		product1.setProductInfo(request.getParameter("productInfo"));
		product1.setProductStutas(request.getParameter("productStutas"));
		ProductDao pDao = new ProductDao();
		try {
			pDao.updateProductByNo(product1);
//			Context context = new InitialContext();
//			DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/servdb");
//			conn = ds.getConnection();
//			String sql = "update product set productType =? , productName =?, productPrice =? ,productQuantity =?, prosuctInfo=? where productNo =?";
//			PreparedStatement stmt = conn.prepareStatement(sql);
//			stmt.setString(6, productNo);
//			stmt.setString(1, productType);
//			stmt.setString(2, productName);
//			stmt.setString(3, productPrice);
//			stmt.setString(4, productQuantity);
//			stmt.setString(5, prosuctInfo);
//						
//			int row = stmt.executeUpdate();
			String succ = "修改資料成功";
			request.setAttribute("row", succ);
		
			
//		stmt.close();
		request.getRequestDispatcher("./GetAllProduct").
				forward(request,response);
		}catch (SQLException e) {
			request.setAttribute("row", "修改失敗");
			request.getRequestDispatcher("/HiCamp/Product/updateProduct.jsp").
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


