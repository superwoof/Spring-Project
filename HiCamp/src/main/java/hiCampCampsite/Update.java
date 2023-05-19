package hiCampCampsite;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hiCampBean.*;
import hiCampDao.*;

@WebServlet("/Update")
public class Update extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String campsiteNo = request.getParameter("campsiteNo");
        String campsiteName = request.getParameter("campsiteName");
        String campsiteQuantity = request.getParameter("campsiteQuantity");
        String campsiteLocation = request.getParameter("campsiteLocation");
        String campsiteInfo = request.getParameter("campsiteInfo");

        CampsiteBean camp = new CampsiteBean();
        camp.setCampsiteNo(campsiteNo);
        camp.setCampsiteName(campsiteName);
        camp.setCampsiteQuantity(campsiteQuantity);
        camp.setCampsiteLocation(campsiteLocation);
        camp.setCampsiteInfo(campsiteInfo);

        CampsiteDao campDao = new CampsiteDao();
        boolean updateSuccessful = campDao.updateCamp(camp);
        campDao.closeConnection();

        if (updateSuccessful) {
            response.sendRedirect(request.getContextPath() + "/SelectAll");
        } else {
            response.sendRedirect(request.getContextPath() + "/campsite/UpdateFailed.jsp");
        }
    }
}
