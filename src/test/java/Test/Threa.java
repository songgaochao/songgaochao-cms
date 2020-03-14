package Test;

import java.io.IOException;
import java.nio.CharBuffer;

import com.songgaochao.pojo.Article;

public class Threa {

	
	public static void main(String[] args) throws IOException {  
		          Runner1 runner1 = new Runner1();  
		          Runner2 runner2 = new Runner2();  
		          Thread thread1 = new Thread(runner1);  
		         
		         Thread thread2 = new Thread(runner2);  
		          
		  //      thread1.start();  
		//      thread2.start();  
		       
		     //     thread1.run();  
		      //  thread2.run();  
		          
		          Article article = new Article();
		 		 
		 		 CharBuffer allocate = CharBuffer.allocate(5);
		 		 CharBuffer put = allocate.put(article.getTitle());
		 		
		 		 
		 	//	 int read = article.read(put);
		 	//	 System.out.println(read);
		     }  
		 }  
		   
		 class Runner1 implements Runnable { // 实现了Runnable接口，jdk就知道这个类是一个线程  
		     public void run() {  
		        Article article = new Article();
		        article.getTitle();
		        System.out.println(article);
		     }  
		 }  
		   
		class Runner2 implements Runnable { // 实现了Runnable接口，jdk就知道这个类是一个线程  
		     public void run() {  
	         for (int i = 0; i < 100; i++) {  
	        	 Article article = new Article();
			        article.getPicture();
			        System.out.println(article);
		         }  
		    }  
		 }  