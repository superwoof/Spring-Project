package tw.leonchen.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity @Table(name = "stockTransaction")
public class StockTransaction {
	
	public StockTransaction() {
	}
	
	public StockTransaction(int tradevolume) {
		this.tradevolume = tradevolume;
	}
	
	@Id @Column(name = "STOCKTRANSID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int stocktransaid;
	
	@Column(name = "TRADEVOLUME")
	private int tradevolume;
	
	@Column(name = "STOCKID",insertable = false,updatable = false)
	private int stockid;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "STOCKID")
	private Stock stock;
	
	public int getStocktransaid() {
		return stocktransaid;
	}
	public void setStocktransaid(int stocktransaid) {
		this.stocktransaid = stocktransaid;
	}
	public int getTradevolume() {
		return tradevolume;
	}
	public void setTradevolume(int tradevolume) {
		this.tradevolume = tradevolume;
	}
	public int getStockid() {
		return stockid;
	}
	public void setStockid(int stockid) {
		this.stockid = stockid;
	}
	public Stock getStock() {
		return stock;
	}
	public void setStock(Stock stock) {
		this.stock = stock;
	}
	
	
}
