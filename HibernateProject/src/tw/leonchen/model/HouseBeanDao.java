package tw.leonchen.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

public class HouseBeanDao implements IHouseBeanDao {
	
	private Session session;
	
	public HouseBeanDao() {
	}

	public HouseBeanDao(Session session) {
		this.session = session;
	}

	@Override
	public HouseBean insert(HouseBean hBean) {
		HouseBean resultBean = session.get(HouseBean.class,hBean.getHouseid());
		
		if (resultBean == null) {
			session.persist(hBean);
			return hBean;			
		}
		return null;
	}

	@Override
	public HouseBean selectById(int houseid) {
		return session.get(HouseBean.class,houseid);
	}

	@Override
	public List<HouseBean> selectAll() {
		Query<HouseBean> query = session.createQuery("from HouseBean",HouseBean.class);
		return query.list();
	}

	@Override
	public HouseBean update(int houseid, String housename) {
		HouseBean resultBean = session.get(HouseBean.class,houseid);
		if (resultBean != null) {
			resultBean.setHousename(housename);
		}
		return resultBean;
	}

	@Override
	public boolean delete(int houseid) {
		HouseBean resultBean = session.get(HouseBean.class,houseid);
		if (resultBean != null) {
			session.remove(resultBean);
			return true;
		}
		return false;
	}
}
