package tw.leonchen.action;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tw.leonchen.model.HouseBean;
import tw.leonchen.model.HouseBeanDao;
import tw.leonchen.util.HibernateUtil;

public class DemoHouseBeanAction5 {

	public static void main(String[] args) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		
		try {
			session.beginTransaction();
			
			HouseBeanDao hDao = new HouseBeanDao(session);
			
			//新增單筆
			HouseBean storeBean = new HouseBean();
			storeBean.setHousename("Worse House");
			hDao.insert(storeBean);
			
			//查詢 by ID
			HouseBean resultBean1 = hDao.selectById(1011);
			if(resultBean1 != null) {
				System.out.println(resultBean1.getHouseid() + " " + resultBean1.getHousename());
			}else {
				System.out.println("no Result");
			}
			
			System.out.println("-------------------------");
			
			//查詢全部
			List<HouseBean> lists = hDao.selectAll();
			
			for(HouseBean bean : lists) {
				System.out.println(bean.getHouseid() + " " + bean.getHousename());
			}
			
			session.getTransaction().commit();
			
		} catch (Exception e) {
			
			session.getTransaction().rollback();
			e.printStackTrace();
			
		}finally {
			HibernateUtil.closeSessionFactory();
		}
	}

}
