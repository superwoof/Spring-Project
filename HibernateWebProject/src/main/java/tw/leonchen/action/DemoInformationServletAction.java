package tw.leonchen.action;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tw.leonchen.model.Information;
import tw.leonchen.model.InformationService;
import tw.leonchen.util.HibernateUtil;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class DemoInformationServletAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processAction(request, response);	
	}

	private void processAction(HttpServletRequest request,HttpServletResponse response) throws IOException {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		
		Information info1 = new Information("dusty","test123");
		
		InformationService iService = new InformationService(session);
		boolean statusResult = iService.verfiedInfo(info1);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.write("statusResult:" + statusResult + "<br/>");
		
		out.close();
	}
}
