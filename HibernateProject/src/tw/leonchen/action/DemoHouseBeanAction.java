package tw.leonchen.action;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import tw.leonchen.model.HouseBean;

public class DemoHouseBeanAction {
	public static void main(String[] args) {
		StandardServiceRegistry serviceRegisrty = new StandardServiceRegistryBuilder().configure().build();
		SessionFactory factory = new MetadataSources(serviceRegisrty).buildMetadata().buildSessionFactory();
		
		Session session = factory.openSession();
		Transaction ts = session.beginTransaction();
		
		HouseBean hBean = new HouseBean();
		hBean.setHousename("Ugly House");
		//session.save(hBean);
		session.persist(hBean);
		
		ts.commit();
		session.close();
		factory.close();
		
	}
}

