package com.cx.pojo;

import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class Bulletin {
    private Integer BId; // 公告ID
    private String BTitle; // 标题
    private Date BDate; // 时间
    private String BContent; // 公告内容
    private String BDrop;  // 落款

    public Bulletin() {
    }

    public Bulletin(String BTitle, Date BDate, String BContent, String BDrop) {
        this.BTitle = BTitle;
        this.BDate = BDate;
        this.BContent = BContent;
        this.BDrop = BDrop;
    }

    @Override
    public String toString() {
        return "Bulletin{" +
                "BId=" + BId +
                ", BTitle='" + BTitle + '\'' +
                ", BDate=" + BDate +
                ", BContent='" + BContent + '\'' +
                ", BDrop='" + BDrop + '\'' +
                '}';
    }

    public Integer getBId() {
        return BId;
    }

    public void setBId(Integer BId) {
        this.BId = BId;
    }

    public String getBTitle() {
        return BTitle;
    }

    public void setBTitle(String BTitle) {
        this.BTitle = BTitle;
    }

    public Date getBDate() {
        return BDate;
    }

    public void setBDate(Date BDate) {
        this.BDate = BDate;
    }

    public String getBContent() {
        return BContent;
    }

    public void setBContent(String BContent) {
        this.BContent = BContent;
    }

    public String getBDrop() {
        return BDrop;
    }

    public void setBDrop(String BDrop) {
        this.BDrop = BDrop;
    }
}
