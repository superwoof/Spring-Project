package tw.leonchen.model;

import org.hibernate.Session;

public class InformationService {
	
	private InformationDao iDao;
	
	public InformationService(Session session) {
		iDao = new InformationDao(session);
	}
	
	public boolean verfiedInfo(Information iBean) {
		return iDao.verfiedInfo(iBean);
	}
}
