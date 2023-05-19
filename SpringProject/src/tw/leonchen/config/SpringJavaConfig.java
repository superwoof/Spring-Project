package tw.leonchen.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

import tw.leonchen.model.Room;

@Configuration
public class SpringJavaConfig {
	
	@Bean(name = "room2")  //<bean id="room1" class="tw.leonchen.model.Room"/>
//	@Scope(value = "singleton")
	@Scope(value = "prototype")
	public Room room1() {
		//Room r1 = new Room();
		Room r1 = new Room(350,"Living Room","Small");
		return r1;
	}
}
