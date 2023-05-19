package tw.leonchen.model;

import org.hibernate.Session;
import org.hibernate.query.Query;

public class InformationDao {
	
	private Session session;
	
	public InformationDao(Session session) {
		this.session = session;
	}
	
	public boolean verfiedInfo(Information iBean) {
		Query<Information> query = session.createQuery("from Information where username=:user and userpwd=:pwd",Information.class);
		query.setParameter("user", iBean.getUsername());
		query.setParameter("pwd", iBean.getUserpwd());
		
		Information resultBean = query.uniqueResult();
		if (resultBean != null) {
			return true;
		}
		return false;
	}
}
