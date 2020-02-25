package Test;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

import com.github.pagehelper.PageInfo;
import com.songgaochao.dao.CollectDao;
import com.songgaochao.pojo.Collect;
import com.songgaochao.pojo.User;
import com.songgaochao.service.CollectService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:/spring-beans.xml")
public class CollectTest {
	@Autowired	
	private CollectService collectService;
	
	@Autowired
	private CollectDao dao;
	
	@Test
	public void collectTest() {
		
		Collect collect = new Collect();
		User user = new User();
		
		user.setId(217);
		collect.setText("可是居然回复让我改变授课巨人法");
		collect.setUser_id(user);
		collect.setUrl("https://www.baidu.com");
		collect.setCreated(new Date());
		collectService.insert(collect);
		
		//collect.setTitle("任何合同");
		//collect.setUser_id(user);
		
	// List<Collect> select = dao.select(collect);
		//for (Collect collect2 : select) {
		//	System.out.println(collect2);
		//}
	
		
	
		
		//collectService.delete("23");
		
	}
}
