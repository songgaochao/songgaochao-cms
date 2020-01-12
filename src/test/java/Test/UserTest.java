package Test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:spring-beans.xml")
public class UserTest {
	@Autowired
//	private Vote_contentDao u;
	
	@Test
	public void name() {
		
		// List<Vote_content> selectu = u.selectu(null);
		//System.out.println(selectu);
		
	}
	
	
}
