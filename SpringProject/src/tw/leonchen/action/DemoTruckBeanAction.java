package tw.leonchen.action;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import tw.leonchen.model.TruckBean;

public class DemoTruckBeanAction {

	public static void main(String[] args) {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		
		TruckBean nissanTruck = context.getBean("nissanTruck", TruckBean.class);
		System.out.println(nissanTruck.getId() + " " + nissanTruck.getBrand());
		
		TruckBean toyotaTruck = context.getBean("toyotaTruck", TruckBean.class);
		System.out.println(toyotaTruck.getId() + " " + toyotaTruck.getBrand());
		
		TruckBean ferrariTruck = context.getBean("ferrariTruck", TruckBean.class);
		System.out.println(ferrariTruck.getId() + " " + ferrariTruck.getBrand());
		
		TruckBean bentlyTruck = context.getBean("bentlyTruck", TruckBean.class);
		System.out.println(bentlyTruck.getId() + " " + bentlyTruck.getBrand());	
		
		context.close();
	}

}
