package tw.leonchen.action;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import tw.leonchen.model.LoginDao;
import tw.leonchen.model.LoginService;

public class DemoLoginAction {

	public static void main(String[] args) {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		
		LoginDao loginDao = context.getBean("loginDao",LoginDao.class);
		boolean result1 = loginDao.checkLogin("john","test123");
		System.out.println("result1:" + result1);
		
		LoginService loginService1 = context.getBean("loginService1",LoginService.class);
		boolean result2 = loginService1.checkLogin("mary", "12345");
		System.out.println("result2:" + result2);
		
		LoginService loginService2 = context.getBean("loginService2",LoginService.class);
		boolean result3 = loginService2.checkLogin("john", "test123");
		System.out.println("result3:" + result3);
		
		context.close();
		
	}

}
