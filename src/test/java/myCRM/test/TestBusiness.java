package myCRM.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.myCRM.po.Business;
import com.myCRM.po.Card;
import com.myCRM.po.Item;
import com.myCRM.po.User;
import com.myCRM.service.BusinessService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:config/spring/applicationContext-dao.xml","classpath:config/spring/mvc.xml"/*,"classpath:config/spring/applicationContext-shiro.xml"*/})
@Transactional
public class TestBusiness {
	@Autowired 
	private BusinessService businessService;
	@Test
	public void list(){
		List<Business> business = businessService.list();
		System.out.println(business);
	}
	
	@Test
	@Rollback(value=false)
	public void addUser(){
		Business b = new Business();
		
		User u = new User();
		
		Card c = new Card();
		
		Item i1 = new Item();
		i1.setItemId(1);
		Item i2 = new Item();
		i2.setItemId(2);
		List<Item> items = new ArrayList<Item>();
		items.add(i1);
		items.add(i2);
		u.setId(11);
		c.setCid(4);
		b.setCard(c);
		b.setUser(u);
		b.setDate(new Date());
		b.setItem(items);
		businessService.add(b);
	}
	
	@Test
	public void findBusinessById(){
		Business b = businessService.findBusinessById("1");
		System.out.println("business="+b);
	}
	
	@Test
	@Rollback(value=false)
	public void updateUser(){
Business b = new Business();
		
		User u = new User();
		
		Card c = new Card();
		
		Item i1 = new Item();
		i1.setItemId(1);
		Item i2 = new Item();
		i2.setItemId(2);
		List<Item> items = new ArrayList<Item>();
		items.add(i1);
		items.add(i2);
		u.setId(11);
		c.setCid(4);
		b.setCard(c);
		b.setUser(u);
		b.setDate(new Date());
		b.setItem(items);
		
		businessService.update(b);
	}
	
	@Test
	@Rollback(value=false)
	public void deleteUser(){
		businessService.delete(1);
	}
}
