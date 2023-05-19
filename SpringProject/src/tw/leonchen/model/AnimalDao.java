package tw.leonchen.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Repository;

//<bean id="animalDao class="tw.leonchen.model.AnimalDao"/>
@Repository(value = "animalDao")
public class AnimalDao {
	
	@Autowired(required = true) @Nullable
	private Animal animal;
	
	public void showInfo() {
		System.out.println(animal.getId() + " " + animal.getName() + " " + animal.getContinent());
		
	}
}
