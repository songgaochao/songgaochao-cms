package com.songgaochao.respository;

import java.util.List;

import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import com.songgaochao.pojo.Article;


public interface ArticleRepositroy extends ElasticsearchRepository<Article, Integer>{
List<Article> findByTitle(String title);
List<Article> findByTitleAndContent(String title,String content);
}
