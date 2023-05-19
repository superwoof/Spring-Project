package tw.leonchen.model;

import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity @Table(name = "stock")
public class Stock {
	
	@Id @Column(name = "STOCKID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int stockid;
	
	@Column
	private String stockname;
	
	@Column
	private String stockcode;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "stock",cascade = CascadeType.ALL)
	private Set<StockTransaction> stockTransactions = new HashSet<StockTransaction>(0);
	
	public Stock(String stockname, String stockcode) {
		this.stockname = stockname;
		this.stockcode = stockcode;
	}

	public Stock() {
	}

	public int getStockid() {
		return stockid;
	}

	public void setStockid(int stockid) {
		this.stockid = stockid;
	}

	public String getStockname() {
		return stockname;
	}

	public void setStockname(String stockname) {
		this.stockname = stockname;
	}

	public String getStockcode() {
		return stockcode;
	}

	public void setStockcode(String stockcode) {
		this.stockcode = stockcode;
	}

	public Set<StockTransaction> getStockTransactions() {
		return stockTransactions;
	}

	public void setStockTransactions(Set<StockTransaction> stockTransactions) {
		this.stockTransactions = stockTransactions;
	}
}
