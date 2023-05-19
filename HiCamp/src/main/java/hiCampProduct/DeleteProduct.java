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


@WebServlet("/DeleteProduct")
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public DeleteProduct() {
        super();
    }
//	Connection conn;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
//		Integer productNo = Integer.parseInt(request.getParameter("productNo"));
		
		HttpSession session = request.getSession();
		session.getAttribute("session");
		
//		System.out.println(session);
		try {
			ProductDao pDao = new ProductDao();
			pDao.deleteProduct((Integer)session.getAttribute("session"));

//			Context context = new InitialContext();
//			DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/servdb");
//			conn = ds.getConnection();
//			String sql = "Delete product where productNo=?";
//			PreparedStatement stmt = conn.prepareStatement(sql);
//			stmt.setString(1, productNo);
//			
//			int row = stmt.executeUpdate();
			String succ = "刪除資料成功";
			request.setAttribute("row", succ);
			System.out.print(succ);
			
		
//			stmt.close();
		request.getRequestDispatcher("./GetAllProduct")
				.forward(request,response);
		}catch (SQLException e) {
			request.setAttribute("row", "刪除失敗，無此筆資料");
			request.getRequestDispatcher("/HiCamp/Product/delProduct.jsp").
			forward(request,response);
			e.printStackTrace();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
