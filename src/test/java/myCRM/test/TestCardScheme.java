package myCRM.test;

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

import com.myCRM.po.CardScheme;
import com.myCRM.po.Set;
import com.myCRM.service.CardSchemeService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:config/spring/applicationContext-dao.xml","classpath:config/spring/mvc.xml"/*,"classpath:config/spring/applicationContext-shiro.xml"*/})
@Transactional
public class TestCardScheme {
	@Autowired 
	private CardSchemeService cardSchemeService;


	@Test
	public void list(){
		List<CardScheme> cardScheme = cardSchemeService.list();
		System.out.println(cardScheme);
	}
	@Test
	@Rollback(value=false)
	public void add(){
		CardScheme cardScheme = new CardScheme();
		cardScheme.setName("setName");
		//cardScheme.setDiscount(80.00);
		cardScheme.setStatus(1);
		cardScheme.setCreateBy("admin");
		cardScheme.setCreateDate(new Date());
		cardScheme.setExpireTo(new Date());
		cardScheme.setAmount(5000.55);
		cardScheme.setPlus(1000.22);
		cardScheme.setTotal(6000.77);
		
		cardSchemeService.add(cardScheme);
	}
	
	@Test
	@Rollback(value=false)
	public void update(){
		CardScheme cardScheme = new CardScheme();
		cardScheme.setId(2);
		cardScheme.setName("Name1");
		cardScheme.setAmount(6000.33);
		cardScheme.setStatus(0);
		cardScheme.setUpdateBy("admin1");
		cardScheme.setUpdateDate(new Date());
		cardScheme.setExpireTo(new Date());
		cardScheme.setPlus(1.00);
		cardScheme.setStartFrom(new Date());
		cardSchemeService.update(cardScheme);
	}
	
	@Test
	@Rollback(value=false)
	public void delete(){
		cardSchemeService.delete(1);
	}
	
}
