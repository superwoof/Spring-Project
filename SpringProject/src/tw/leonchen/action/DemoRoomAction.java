package tw.leonchen.action;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import tw.leonchen.config.SpringJavaConfig;
import tw.leonchen.model.Room;

public class DemoRoomAction {
	public static void main(String[] args) {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfig.class);
		
//		Room room1 = context.getBean("room1",Room.class);
//		System.out.println(room1.getId() + " " + room1.getName() + " " + room1.getSize());
		
		Room r2 = context.getBean("room2",Room.class);
		Room r3 = context.getBean("room2",Room.class);
		
		System.out.println("r2.hashCode():" + r2.hashCode());
		System.out.println("r3.hashCode():" + r3.hashCode());
		
		context.close();
	}
}
