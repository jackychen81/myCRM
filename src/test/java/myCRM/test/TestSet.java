package myCRM.test;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.myCRM.mapper.ItemMapper;
import com.myCRM.po.Item;
import com.myCRM.po.Set;
import com.myCRM.service.ItemService;
import com.myCRM.service.SetService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:config/spring/applicationContext-dao.xml","classpath:config/spring/mvc.xml"/*,"classpath:config/spring/applicationContext-shiro.xml"*/})
@Transactional
public class TestSet {
	@Autowired 
	private SetService setService;


	@Test
	public void list(){
		List<Set> set = setService.list();
		System.out.println(set);
	}
	@Test
	@Rollback(value=false)
	public void add(){
		Set set = new Set();
		set.setName("setName");
		set.setPrice(10.56);
		set.setStatus(1);
		set.setCreateBy("admin");
		set.setCreateDate(new Date());
		set.setExpireTo(new Date());
		set.setIscoupon(0);
		setService.add(set);
	}
	
	@Test
	@Rollback(value=false)
	public void update(){
		Set set = new Set();
		set.setSetId(1);
		set.setName("setName1");
		set.setPrice(11.56);
		set.setStatus(0);
		set.setUpdateBy("admin1");
		set.setUpdateDate(new Date());
		set.setExpireTo(new Date());
		set.setIscoupon(1);
		set.setStartFrom(new Date());
		setService.update(set);
	}
	
	@Test
	@Rollback(value=false)
	public void delete(){
		setService.delete(1);
	}
	
	@Test
	@Rollback(value=false)
	public void addMiddle(){
		setService.addMiddle(1,10101);
	}
	
}
