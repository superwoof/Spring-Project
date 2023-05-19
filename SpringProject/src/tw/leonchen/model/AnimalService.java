package tw.leonchen.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "animalService")
public class AnimalService {
	
	@Autowired
	private AnimalDao animalDao;
	
	public void showInfo() {
		animalDao.showInfo();
	}
}
