package tw.leonchen.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity @Table(name = "book")
public class Book {
	
	@Id @Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column
	private String bookname;
	
	@Column
	private String author;
	
	@Column
	private int price;
	
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "book", cascade = CascadeType.ALL)
	private BookDetail bookDetail;
	
	public BookDetail getBookDetail() {
		return bookDetail;
	}
	public void setBookDetail(BookDetail bookDetail) {
		this.bookDetail = bookDetail;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
