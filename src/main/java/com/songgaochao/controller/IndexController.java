package com.songgaochao.controller;

import java.io.IOException;
import java.nio.CharBuffer;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.songgaochao.common.CmsConst;
import com.songgaochao.pojo.Article;
import com.songgaochao.pojo.Category;
import com.songgaochao.pojo.Channel;
import com.songgaochao.pojo.Collect;
import com.songgaochao.pojo.Comment;
import com.songgaochao.pojo.Slide;
import com.songgaochao.pojo.User;
import com.songgaochao.service.ArticleService;
import com.songgaochao.service.CollectService;
import com.songgaochao.service.CommentService;
import com.songgaochao.service.SlideService;
import com.songgaochao.service.UserService;


@Controller
public class IndexController {
	@Autowired
	private ArticleService articleService;
	@Autowired
	private SlideService slideService;
	@Autowired
	private UserService userService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private CollectService collectService;
	/**
	 * @Title: index   
	 * @Description: 首页   
	 * @param: @param model
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/")
	public String index(Model model) {
		hot(model, 1);
		return "index";
	}
	/**
	 * @Title: hot   
	 * @Description: 热门分页   
	 * @param: @param model
	 * @param: @param pageNum
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/hot/{pageNum}.html")
	public String hot(Model model,@PathVariable Integer pageNum) {
		List<Channel> channelList = articleService.getChannelAll();
		List<Slide> slideList = slideService.getAll();
		PageInfo<Article> pageInfo = articleService.getHotList(pageNum,4);
		List<Article> newArticleList = articleService.getNewList(6);
		
		//查询24小时热文
				Article hot24article = new Article();
				hot24article.setStatus(1);
				hot24article.setHot(1);
				
				hot24article.setCreated(subDate(new Date()));
							
				PageInfo<Article> hotpageInfo = articleService.gethotPageInfo(hot24article, 1, 4);
				model.addAttribute("hotpageInfo", hotpageInfo);
		
		model.addAttribute("channelList", channelList);
		model.addAttribute("slideList", slideList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("newArticleList", newArticleList);
	
		
		return "index";
	}
	
	/**
	 * @throws IOException 
	 * @Title: channel   
	 * @Description: 频道页   
	 * @param: @param model
	 * @param: @param channelId
	 * @param: @param cateId
	 * @param: @param pageNum
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/{channelId}/{cateId}/{pageNum}.html")
	public String channel(Model model,@PathVariable Integer channelId,@PathVariable Integer cateId,@PathVariable Integer pageNum) throws IOException {
		List<Channel> channelList = articleService.getChannelAll();
		List<Slide> slideList = slideService.getAll();
		
		PageInfo<Article> pageInfo = articleService.getList(channelId,cateId,pageNum,10);
		
		List<Category> cateList = articleService.getCateListByChannelId(channelId);
		Channel channel = articleService.getChannelByChannelId(channelId);
		List<Article> newArticleList = articleService.getNewList(6);
		
		
		model.addAttribute("channelList", channelList);
		model.addAttribute("cateList", cateList);
		model.addAttribute("slideList", slideList);
		
		model.addAttribute("pageInfo", pageInfo);
		
		model.addAttribute("channel", channel);
		model.addAttribute("newArticleList", newArticleList);
		
		 
		
		return "index";
	}
	/**
	 * @Title: articleDetail   
	 * @Description: 文章详情页  
	 * @param: @param id
	 * @param: @param model
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/article/detail/{id}.html")
	public String articleDetail(@PathVariable Integer id,@RequestParam(value="pageNum",defaultValue="1") Integer pageNum,Model model,HttpSession session) {
		Article article = articleService.getById(id);
		User user = userService.getById(article.getUser_id());
		article.setNickname(user.getNickname());
		model.addAttribute("article", article);
		/** 查询相关文章 **/
		List<Article> relArticelList = articleService.getRelArticelList(article.getChannel_id(), article.getCategory_id(), article.getId(), 3);
		model.addAttribute("relArticelList", relArticelList);
		/** 设置文章点击量，若点击量大于20成为热点文章 **/
		articleService.setHitsAndHot(id);
		/** 评论列表 **/
		PageInfo<Comment> commentPageInfo = commentService.getPageInfo(article.getId(), pageNum, 4);
		model.addAttribute("pageInfo", commentPageInfo);
		/**热文推荐**/
		Article hotarticle = new Article();
		hotarticle.setStatus(1);
		hotarticle.setHot(1);		
		PageInfo<Article> hotpageInfo = articleService.gethotPageInfo(hotarticle, 1, 6);
		model.addAttribute("hotpageInfo", hotpageInfo);
		/**用户收藏**/
		User user1 = (User)session.getAttribute(CmsConst.UserSessionKey);
		 if(null!= user1) {
			Collect collect = collectService.selectByTitleAndUserId(article.getTitle(), user1.getId());
			model.addAttribute("collect", collect);
		 }
			
		return "article-detail";
	}

	
	 //把传入的日期向前 推减24 个小时。 即 1天
		public static Date subDate(Date date) {
			//用当前系统时间去实例化一个日历类
			Calendar c = Calendar.getInstance();
			//用传入的日期示例化日历类
			c.setTime(date);
			
			//借助日历类，减去1天
			c.add(Calendar.DATE, -1);
			
			return c.getTime();
			
		}
}
