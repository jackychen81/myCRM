package myCRM.test;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.myCRM.po.Set;
import com.myCRM.service.SetService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:config/spring/applicationContext-dao.xml","classpath:config/spring/mvc.xml"/*,"classpath:config/spring/applicationContext-shiro.xml"*/})
@Transactional
public class TestSet {
	@Autowired
	private SetService setService;
	
	@Test
	@Rollback(false)
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

}
