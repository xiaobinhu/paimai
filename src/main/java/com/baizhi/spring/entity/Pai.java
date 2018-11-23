package com.baizhi.spring.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


public class Pai {
    private int id;
    private int user_id;
    private int auction_id;

	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JSONField(format = "yyyy/MM/dd HH:mm:ss")
    private Date auction_time;
    private double auction_price;
    private String user_name;
	public Pai() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Pai(int id, int user_id, int auction_id, Date auction_time,
			double auction_price, String user_name) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.auction_id = auction_id;
		this.auction_time = auction_time;
		this.auction_price = auction_price;
		this.user_name = user_name;
	}
	public Pai(int user_id, int auction_id, Date auction_time,
			double auction_price, String user_name) {
		super();
		this.user_id = user_id;
		this.auction_id = auction_id;
		this.auction_time = auction_time;
		this.auction_price = auction_price;
		this.user_name = user_name;
	}
	@Override
	public String toString() {
		return "Pai [id=" + id + ", user_id=" + user_id + ", auction_id="
				+ auction_id + ", auction_time=" + auction_time
				+ ", auction_price=" + auction_price + ", user_name="
				+ user_name + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getAuction_id() {
		return auction_id;
	}
	public void setAuction_id(int auction_id) {
		this.auction_id = auction_id;
	}
	public Date getAuction_time() {
		return auction_time;
	}
	public void setAuction_time(Date auction_time) {
		this.auction_time = auction_time;
	}
	public double getAuction_price() {
		return auction_price;
	}
	public void setAuction_price(double auction_price) {
		this.auction_price = auction_price;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
    

    
}
