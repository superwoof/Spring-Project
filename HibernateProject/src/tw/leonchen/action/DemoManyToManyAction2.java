package tw.leonchen.action;

import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import tw.leonchen.model.Game;
import tw.leonchen.model.Role;
import tw.leonchen.util.HibernateUtil;

public class DemoManyToManyAction2 {

	public static void main(String[] args) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		
		try {
			session.beginTransaction();
			
			Query<Game> query = session.createQuery("from Game",Game.class);
			
			List<Game> games = query.list();
			for(Game game : games) {
				System.out.println(game.getGameid() + " " + game.getGamename());
				
				Set<Role> roles = game.getRoles();
				for(Role role : roles) {
					System.out.println(role.getRoleid() + " " + role.getRolename());
				}
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
