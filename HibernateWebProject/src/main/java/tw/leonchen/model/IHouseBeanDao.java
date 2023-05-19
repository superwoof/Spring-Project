package tw.leonchen.model;

import java.util.List;

public interface IHouseBeanDao {
	public HouseBean insert(HouseBean hBean);
	public HouseBean selectById(int houseid);
	public List<HouseBean> selectAll();
	public HouseBean update(int houseid,String housename);
	public boolean delete(int houseid);
}
