package tw.leonchen.action;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tw.leonchen.model.HouseBean;
import tw.leonchen.util.HibernateUtil;

public class DemoHouseBeanAction4 {

	public static void main(String[] args) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		
		try {
			session.beginTransaction();
			
//			HouseBean deleteBean = new HouseBean();
//			deleteBean.setHouseid(1005);
			
//			session.delete(deleteBean);
//			session.remove(deleteBean);
			
//			HouseBean updateBean2 = session.get(HouseBean.class,1004);
//			updateBean2.setHousename("Glory House");
			
			HouseBean updateBean = new HouseBean();
			updateBean.setHouseid(1005);
			updateBean.setHousename("Beautiful House");
			session.merge(updateBean);
			
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}finally {
			HibernateUtil.closeSessionFactory();
		}
	}

}
