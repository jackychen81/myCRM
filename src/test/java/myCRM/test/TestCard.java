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

import com.myCRM.po.Card;
import com.myCRM.po.CardCategory;
import com.myCRM.service.CardService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:config/spring/applicationContext-dao.xml","classpath:config/spring/mvc.xml"/*,"classpath:config/spring/applicationContext-shiro.xml"*/})
@Transactional
public class TestCard {
	@Autowired 
	private CardService cardService;

	@Test
	public void list(){
		List<Card> card = cardService.list();
		System.out.println(card);
	}
	@Test
	@Rollback(value=false)
	public void add(){
		Card card =  new Card();
		CardCategory cc = new CardCategory();
		cc.setCardCategoryId(1);
		card.setUid(11);
		card.setAmount(300);
		card.setPlusAmount(30);
		card.setRemaining(320);
		card.setDescription("desc3");
		card.setCardCategory(cc);
		cardService.add(card);
	}
	
	@Test
	@Rollback(value=false)
	public void update(){
		Card ud =  new Card();
		CardCategory cc = new CardCategory();
		cc.setCardCategoryId(2);
		ud.setCid(4);
		ud.setAmount(300.55);
		ud.setPlusAmount(30.55);
		ud.setRemaining(150.55);
		ud.setDescription("desc3-update");
		ud.setCardCategory(cc);
		cardService.update(ud);
	}
	
	@Test
	@Rollback(value=false)
	public void deleteCard(){
		cardService.delete(1);
	}

	@Test
	public void listUserCard(){
		List<Card> card = cardService.listCardByUid(3);
		System.out.println(card);
	}
	/*
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
	}*/
}
