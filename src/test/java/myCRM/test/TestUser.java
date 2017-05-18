package myCRM.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.myCRM.po.User;
import com.myCRM.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:config/spring/applicationContext-dao.xml","classpath:config/spring/mvc.xml"/*,"classpath:config/spring/applicationContext-shiro.xml"*/})
@Transactional
public class TestUser {
	@Autowired 
	private UserService userService;
	@Test
	public void list(){
		List<User> us = userService.list();
		
		System.out.println(us);
	}
	
	@Test
	@Rollback(value=false)
	public void addUser(){
		User u = new User();
		u.setUsername("admin");
		u.setPassword("123");
		userService.add(u);
	}
	
	@Test
	public void findUserByUsername(){
		User u = new User();
		u = userService.findUserByUsername("admin");
		System.out.println("test user="+u);
	}
	@Test
	public void findUserByUserId(){
		User u = new User();
		u = userService.findUserByUserId(3);
		System.out.println("test user="+u);
	}
	
	@Test
	@Rollback(value=false)
	public void updateUser(){
		User u = new User();
		u = userService.findUserByUsername("admin");
		u.setPassword("321");
		u.setPhone("13816617xxx");
		u.setPosition("IT");
		u.setAge(23);
		u.setGender(1);
		u.setStatus(1);
		u.setUserType(1);
		u.setWechat("wechat number");
		userService.update(u);
	}
	
	@Test
	@Rollback(value=false)
	public void deleteUser(){
		User u = new User();
		u = userService.findUserByUsername("admin");
		userService.delete(u.getId());
	}
}
