package tw.leonchen.action;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tw.leonchen.model.HouseBean;
import tw.leonchen.util.HibernateUtil;

public class DemoHouseBeanAction2 {

	public static void main(String[] args) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		
		try {
			session.beginTransaction();
			System.out.println("Transaction Begin");
			
			HouseBean hBean = new HouseBean();
//			hBean.setHouseid(1001);
			hBean.setHousename("Pig House");
			session.persist(hBean);
			
			session.getTransaction().commit();
			System.out.println("Transaction Committed");
		}catch(Exception e) {
			session.getTransaction().rollback();
			System.out.println("Transaction Rollback");
		}finally {
			session.close();
			System.out.println("Session Closed");
			HibernateUtil.closeSessionFactory();
		}
	}

}
