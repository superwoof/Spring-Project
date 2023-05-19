package hiCampMember;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;

@WebServlet("/testImage")
@MultipartConfig
public class testImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 獲取提交的文件
        Part filePart = request.getPart("image");
        InputStream inputStream = filePart.getInputStream();
        
        // 將文件儲存到資料庫中
        try {
        	Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/jdbc/project2");
			Connection conn = ds.getConnection();
            String sql = "INSERT INTO testImage VALUES (?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setBlob(1, inputStream);
            statement.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
