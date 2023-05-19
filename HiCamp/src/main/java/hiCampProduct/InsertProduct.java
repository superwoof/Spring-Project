package hiCampProduct;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hiCampDao.ProductDao;
import hiCampBean.ProductBean;

@WebServlet("/InsertProduct")
public class InsertProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;


	Connection conn;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ProductBean product1 = new ProductBean();
		
		product1.setProductName(request.getParameter("productType"));
		product1.setProductType(request.getParameter("productName"));
		product1.setProductPrice(Integer.parseInt(request.getParameter("productPrice")));
		product1.setProductQuantity(Integer.parseInt(request.getParameter("productQuantity")));
		product1.setProductInfo(request.getParameter("productInfo"));
		product1.setProductStutas(request.getParameter("productStutas"));
		ProductDao pDao = new ProductDao();

		try {
			pDao.InsertProduct(product1);
			
			String succ = "新增資料成功";
			request.setAttribute("row", succ);
		
			
//		stmt.close();
		request.getRequestDispatcher("./Product/insertProduct.jsp").
				forward(request,response);
		}catch (SQLException e) {
			request.setAttribute("row", "新增失敗，已有重複資訊");
			request.getRequestDispatcher("/HiCamp/Product/insertProduct.jsp").
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


