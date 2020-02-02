package Test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.songgaochao.dao.CommentDao;
import com.songgaochao.pojo.Comment;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:spring-beans.xml")
public class CommentTest {
	@Autowired
	private CommentDao c;
	@Test
	public void name() {
		
		
		Comment t = new Comment();
		
		t.setArticleId(1123242341);
		t.setUserId(34342);
		t.setContent("招待费苏文峰你认为房价");
		t.setCreated("2020-02-08");
		c.insert(t);
		
	}
}
