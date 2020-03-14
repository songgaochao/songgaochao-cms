package com.songgaochao.respository;

import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import com.songgaochao.pojo.Article;


public interface ArticleRepositroy extends ElasticsearchRepository<Article, Integer>{

}
