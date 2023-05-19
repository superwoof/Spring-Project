package tw.leonchen.action;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import tw.leonchen.model.Animal;
import tw.leonchen.model.AnimalDao;
import tw.leonchen.model.AnimalService;

public class DemoAnimalAction {

	public static void main(String[] args) {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		
		Animal animal = context.getBean("animal",Animal.class);
		animal.setId(100);
		animal.setName("elephant");
		animal.setContinent("africa");
		
		System.out.println(animal.getId() + " " + animal.getName() + " " + animal.getContinent());
		
		AnimalDao animalDao = context.getBean("animalDao", AnimalDao.class);
		animalDao.showInfo();
		
		AnimalService animalService = context.getBean("animalService", AnimalService.class);
		animalService.showInfo();
		
		context.close();
	}

}
