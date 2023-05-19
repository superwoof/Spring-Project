package tw.leonchen.action;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tw.leonchen.model.Book;
import tw.leonchen.model.BookDetail;
import tw.leonchen.util.HibernateUtil;

public class DemoOneToOneAction {

	public static void main(String[] args) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		
		try {
			session.beginTransaction();
			
			Book book1 = new Book();
			book1.setBookname("Harry Potter");
			book1.setAuthor("J.K.Rowling");
			book1.setPrice(450);
			
			BookDetail bookDetail = new BookDetail();
			bookDetail.setPublisher("Bloombury");
			bookDetail.setPublisheraddress("UK");
			
			book1.setBookDetail(bookDetail);
			bookDetail.setBook(book1);
			
			session.persist(book1);
			
			session.getTransaction().commit();;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}finally {
			HibernateUtil.closeSessionFactory();
		}
	}

}
