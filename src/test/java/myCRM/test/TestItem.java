package myCRM.test;

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
import com.myCRM.service.ItemService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:config/spring/applicationContext-dao.xml","classpath:config/spring/mvc.xml"/*,"classpath:config/spring/applicationContext-shiro.xml"*/})
@Transactional
public class TestItem {
	@Autowired 
	private ItemService itemService;
	@Autowired 
	private ItemMapper itemMapper;


	@Test
	public void list(){
		List<Item> item = itemService.list();
		System.out.println(item);
	}
	@Test
	@Rollback(value=false)
	public void add(){
		Item item = new Item();
		item.setName("护肤");
		item.setPrice(100.00);
		item.setStatus(1);
		itemService.add(item);
	}
	
	@Test
	@Rollback(value=false)
	public void update(){
		Item item = new Item();
		item.setItemId(14);
		item.setName("护肤1");
		item.setPrice(101.00);
		item.setStatus(0);
		item.setCreateBy("admin");
		itemService.update(item);
	}
	
	@Test
	@Rollback(value=false)
	public void deleteCard(){
		itemService.delete(4);
	}
	
	@Test
	public void findItemById(){
		Item item = itemService.findItemById(5);
		System.out.println(item);
	}
	
	@Test
	public void listBusinessItemByPage(){
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("bid", "1");
		param.put("cid", 2);
		List<Item> list = itemMapper.listBusinessItemByPage(param);
		System.out.println(list);
	}
}
