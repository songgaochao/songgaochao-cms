package Test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.songgaochao.dao.UserDao;
import com.songgaochao.pojo.User;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:spring-beans.xml")
public class UserTest {
	@Autowired
	private UserDao u;
	
	@Test
	public void name() {
		
		List<User> selectu = u.selectu(null);
		System.out.println(selectu);
		
	}
	
	
}
