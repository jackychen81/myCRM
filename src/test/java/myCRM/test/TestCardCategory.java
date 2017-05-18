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
import com.myCRM.service.CardCategoryService;
import com.myCRM.service.CardService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:config/spring/applicationContext-dao.xml","classpath:config/spring/mvc.xml"/*,"classpath:config/spring/applicationContext-shiro.xml"*/})
@Transactional
public class TestCardCategory {
	@Autowired 
	private CardCategoryService cardCategoryService;

	@Test
	public void list(){
		List<CardCategory> cardCategory = cardCategoryService.list();
		System.out.println(cardCategory);
	}
	
	@Test
	@Rollback(value=false)
	public void add(){
		CardCategory cardCategory =  new CardCategory();
		cardCategory.setName("白金卡");
		cardCategory.setDiscount(85.00);
		cardCategory.setCardCategoryStatus(1);
		cardCategoryService.add(cardCategory);
	}
	
	@Test
	@Rollback(value=false)
	public void update(){
		CardCategory cardCategory =  new CardCategory();
		cardCategory.setCardCategoryId(4);
		cardCategory.setName("金卡");
		cardCategory.setDiscount(65.00);
		cardCategory.setCardCategoryStatus(0);
		cardCategoryService.update(cardCategory);
	}
	
	@Test
	@Rollback(value=false)
	public void deleteCard(){
		cardCategoryService.delete(4);
	}
	
}
