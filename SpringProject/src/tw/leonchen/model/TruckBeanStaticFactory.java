package tw.leonchen.model;

import java.util.HashMap;

public class TruckBeanStaticFactory {
	
	private static HashMap<Integer, TruckBean> map = new HashMap<Integer, TruckBean>();

	static {
		map.put(1, new TruckBean(3,"nissan"));
		map.put(2, new TruckBean(4,"toyota"));
	}
	
	public static TruckBean getTruckBean(Integer key) {
		return map.get(key);
	}
	
}
