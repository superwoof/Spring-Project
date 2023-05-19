package hiCampCampsite;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hiCampBean.*;
import hiCampDao.*;

@WebServlet("/GetUpdateData")
public class GetUpdateData extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String campsiteNo = request.getParameter("campsiteNo");
        CampsiteDao campDao = new CampsiteDao();
        CampsiteBean camp = campDao.getCampByNo(campsiteNo);
        campDao.closeConnection();
        request.setAttribute("camp", camp);
        request.getRequestDispatcher("campsite/UpdateData.jsp").forward(request, response);
    }
}

