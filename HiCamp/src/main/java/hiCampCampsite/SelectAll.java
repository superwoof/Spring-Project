package hiCampCampsite;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hiCampBean.*;
import hiCampDao.*;

@WebServlet("/SelectAll")
public class SelectAll extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CampsiteDao campDao = new CampsiteDao();
        List<CampsiteBean> camps = campDao.selectAllCamps();
        campDao.closeConnection();

        request.setAttribute("camps", camps);
        request.getRequestDispatcher("/campsite/SelectAll.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
