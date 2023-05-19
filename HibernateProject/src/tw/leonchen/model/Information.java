package tw.leonchen.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity @Table(name = "information")
public class Information {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;
	private String userpwd;
	
	public Information() {
	}
	
	public Information(String username, String userpwd) {
		this.username = username;
		this.userpwd = userpwd;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	
	
}
