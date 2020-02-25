package com.songgaochao.pojo;

public enum ArticleEnum {
	
	
	HTML(0,"文章"),IMAGE(1,"是图片");
	
	private int contents;
	private String pictures;
	
	
	
	private ArticleEnum(int contents, String pictures) {
		this.contents = contents;
		this.pictures = pictures;
	}
	public int getContents() {
		return contents;
	}
	public void setContents(int contents) {
		this.contents = contents;
	}
	public String getPictures() {
		return pictures;
	}
	public void setPictures(String pictures) {
		this.pictures = pictures;
	}
	
	
}
