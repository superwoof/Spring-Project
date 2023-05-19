package tw.leonchen.action;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tw.leonchen.model.Information;
import tw.leonchen.model.InformationService;
import tw.leonchen.util.HibernateUtil;

public class DemoInformation {

	public static void main(String[] args) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		
		try {
			session.beginTransaction();
			
			Information info1 = new Information("dusty","test123");
			
			InformationService iService = new InformationService(session);
			boolean statusResult = iService.verfiedInfo(info1);
			System.out.println("statusResult:" + statusResult);
			
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}finally {
			HibernateUtil.closeSessionFactory();
		}
	}

}
