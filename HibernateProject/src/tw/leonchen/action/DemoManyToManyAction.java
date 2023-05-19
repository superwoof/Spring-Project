package tw.leonchen.action;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tw.leonchen.model.Game;
import tw.leonchen.model.Role;
import tw.leonchen.util.HibernateUtil;

public class DemoManyToManyAction {

	public static void main(String[] args) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		
		try {
			session.beginTransaction();
			
			Game game1 = new Game();
			game1.setGamename("Apex");
			
			Role role1 = new Role("warrior","sniper");
			Role role2 = new Role("zombie","bite");
			Role role3 = new Role("bomberman","rocket");
			
			Set<Role> roles = new HashSet<Role>();
			roles.add(role1);
			roles.add(role2);
			roles.add(role3);
			
			game1.setRoles(roles);
			
			session.persist(game1);
			
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}finally {
			HibernateUtil.closeSessionFactory();
		}
	}

}
