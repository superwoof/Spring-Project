package hiCampCampsite;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hiCampBean.*;
import hiCampDao.*;

@WebServlet("/AddCamp")
public class AddCamp extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        CampsiteBean camp = new CampsiteBean();
        camp.setCampsiteNo(request.getParameter("campsiteNo"));
        camp.setCampsiteName(request.getParameter("campsiteName"));
        camp.setCampsiteQuantity(request.getParameter("campsiteQuantity"));
        camp.setCampsiteLocation(request.getParameter("campsiteLocation"));
        camp.setCampsiteInfo(request.getParameter("campsiteInfo"));

        CampsiteDao campsiteDao = new CampsiteDao();
        boolean addSuccessful = campsiteDao.addCamp(camp);
        campsiteDao.closeConnection();

        if (addSuccessful) {
            request.setAttribute("camp", camp);
            request.getRequestDispatcher("/campsite/AddCampSuccess.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/campsite/AddFailed.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
