package tw.leonchen.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("workerService")
public class WorkerService {

	@Autowired
	private WorkerDao workerDao;
	
	public void showDetails() {
		workerDao.showDetails();
	}
	
}
