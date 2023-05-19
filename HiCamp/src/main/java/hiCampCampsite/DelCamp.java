package hiCampCampsite;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hiCampDao.*;

@WebServlet("/DelCamp")
public class DelCamp extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String campsiteNo = request.getParameter("campsiteNo");

        CampsiteDao campDao = new CampsiteDao();
        campDao.deleteCamp(campsiteNo);
        campDao.closeConnection();

        response.sendRedirect(request.getContextPath() + "/SelectAll");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
