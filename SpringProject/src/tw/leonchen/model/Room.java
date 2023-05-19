package tw.leonchen.model;

public class Room {
	
	private int id;
	private String name;
	private String size;
	
	public Room() {
	}
	
	public Room(int id, String name, String size) {
		this.id = id;
		this.name = name;
		this.size = size;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	
	
}
