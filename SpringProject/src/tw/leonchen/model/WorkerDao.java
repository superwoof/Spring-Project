package tw.leonchen.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("workerDao")
public class WorkerDao {

	@Autowired @Qualifier("worker1")
	private Worker worker;
	
	public WorkerDao() {		
	}
	
	public WorkerDao(Worker worker) {
		this.worker = worker;
	}
	
	public void showDetails() {
		System.out.println(worker.getId() + " " + worker.getName() + " " + worker.getTitle());
	}
	
}
