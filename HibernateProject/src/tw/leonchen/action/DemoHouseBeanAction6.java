package tw.leonchen.action;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tw.leonchen.model.HouseBean;
import tw.leonchen.model.HouseBeanSerive;
import tw.leonchen.util.HibernateUtil;

public class DemoHouseBeanAction6 {

	public static void main(String[] args) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		
		try {
			session.beginTransaction();
			
			HouseBeanSerive hSerive = new HouseBeanSerive(session);
			HouseBean resultBean = hSerive.selectById(1003);
			if (resultBean != null) {
				System.out.println(resultBean.getHouseid() + " " + resultBean.getHousename());
			}
			
			boolean status = hSerive.delete(1012);
			System.out.println("status:" + status);
			
			session.getTransaction().commit();
			
		} catch (Exception e) {
			
			session.getTransaction().rollback();
			e.printStackTrace();
			
		}finally {
			HibernateUtil.closeSessionFactory();
		}
	}

}
