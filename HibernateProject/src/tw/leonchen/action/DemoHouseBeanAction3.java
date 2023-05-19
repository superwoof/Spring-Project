package tw.leonchen.action;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import tw.leonchen.model.HouseBean;
import tw.leonchen.util.HibernateUtil;

public class DemoHouseBeanAction3 {

	@SuppressWarnings("deprecation")
	public static void main(String[] args) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		
		try {
			session.beginTransaction();
			
			HouseBean resultBean = session.get(HouseBean.class,1001);
			if (resultBean != null) {
				System.out.println(resultBean.getHouseid() + " " + resultBean.getHousename());
			}else {
				System.out.println("no result");
			}
			
			try {
				HouseBean resultBean2 = session.load(HouseBean.class,1002);
				System.out.println(resultBean2.getHouseid() + " " + resultBean2.getHousename());
			} catch (Exception e) {
				System.out.println("no result2");
			}
			
			System.out.println("---------------------");
			
			Query<HouseBean> query = session.createQuery("from HouseBean",HouseBean.class);
			List<HouseBean> lists = query.list();
			
			Iterator<HouseBean> i1 = lists.iterator();
			while (i1.hasNext()) {
				HouseBean resultBean3 = i1.next();
				System.out.println(resultBean3.getHouseid() + " " + resultBean3.getHousename());
			}
			
			session.getTransaction().commit();
			System.out.println("Transaction commit");
			
		} catch (Exception e) {
			session.getTransaction().rollback();
			System.out.println("Transaction rollback");
			e.printStackTrace();
			
		}finally {
			System.out.println("Session closed");
			HibernateUtil.closeSessionFactory();
		}
	}

}
