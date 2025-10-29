package com.User;

import java.sql.Timestamp;

public class Notice {
    private int id;
    private String noticeText;
    private Timestamp postedAt;  

   

    public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
    
	public Notice(int id, String noticeText, Timestamp postedAt) {
		super();
		this.id = id;
		this.noticeText = noticeText;
		this.postedAt = postedAt;
	}

	public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getNoticeText() {
        return noticeText;
    }
    public void setNoticeText(String noticeText) {
        this.noticeText = noticeText;
    }

    public Timestamp getPostedAt() {
        return postedAt;
    }
    public void setPostedAt(Timestamp postedAt) {
        this.postedAt = postedAt;
    }
}
