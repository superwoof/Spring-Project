package tw.leonchen.action;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tw.leonchen.model.Stock;
import tw.leonchen.model.StockTransaction;
import tw.leonchen.util.HibernateUtil;

public class DemoOneToManyAction {

	public static void main(String[] args) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		
		try {
			session.beginTransaction();
			
			Stock stock1 = new Stock("TSMC","2330");
			
			StockTransaction trans1 = new StockTransaction(3000);
			StockTransaction trans2 = new StockTransaction(8000);
			StockTransaction trans3 = new StockTransaction(5000);
			
			trans1.setStock(stock1);
			trans2.setStock(stock1);
			trans3.setStock(stock1);
			
			Set<StockTransaction> stockTrans = new HashSet<StockTransaction>();
			stockTrans.add(trans1);
			stockTrans.add(trans2);
			stockTrans.add(trans3);
			
			stock1.setStockTransactions(stockTrans);
			
			session.persist(stock1);
			
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}finally {
			HibernateUtil.closeSessionFactory();
		}
	}

}
