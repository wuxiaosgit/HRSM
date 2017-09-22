package com.xhhy.domain;

import java.util.Date;

public class MianshiBean {
    private Integer mianshiid;

    private Integer jianliid;

    private String mianshiren;

    private Date mianshitime;

    private Integer state;

    private String pingjia;

    public Integer getMianshiid() {
        return mianshiid;
    }

    public void setMianshiid(Integer mianshiid) {
        this.mianshiid = mianshiid;
    }

    public Integer getJianliid() {
        return jianliid;
    }

    public void setJianliid(Integer jianliid) {
        this.jianliid = jianliid;
    }

    public String getMianshiren() {
        return mianshiren;
    }

    public void setMianshiren(String mianshiren) {
        this.mianshiren = mianshiren == null ? null : mianshiren.trim();
    }

    public Date getMianshitime() {
        return mianshitime;
    }

    public void setMianshitime(Date mianshitime) {
        this.mianshitime = mianshitime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getPingjia() {
        return pingjia;
    }

    public void setPingjia(String pingjia) {
        this.pingjia = pingjia == null ? null : pingjia.trim();
    }
}