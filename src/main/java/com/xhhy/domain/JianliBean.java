package com.xhhy.domain;

import java.sql.Date;
import java.util.Arrays;

public class JianliBean {
	private Integer jianliId;

    private String jobId;

    private String xingming;

    private String xingbie;

    private String zhaopinType;

    private String email;

    private String tel;

    private String address;

    private String live;

    private String mianmao;

    private String idcard;

    private String school;

    private String xueli;

    private String zhuanye;

    private String jianyan;

    private Double xizi;

    private String yinjiesheng;

    private String zizhi;

    private Date time;

    private String tuijian;

    private String tuijianren;

    private Date tuijiantime;
    
    private String jianli;

    private byte[] fujian;

    private String yijian;
    
    private int state;

    public Integer getJianliId() {
        return jianliId;
    }

    public void setJianliId(Integer jianliId) {
        this.jianliId = jianliId;
    }

    public String getJobId() {
        return jobId;
    }

    public void setJobId(String jobId) {
        this.jobId = jobId == null ? null : jobId.trim();
    }

    public String getXingming() {
        return xingming;
    }

    public void setXingming(String xingming) {
        this.xingming = xingming == null ? null : xingming.trim();
    }

    public String getXingbie() {
        return xingbie;
    }

    public void setXingbie(String xingbie) {
        this.xingbie = xingbie == null ? null : xingbie.trim();
    }

    public String getZhaopinType() {
        return zhaopinType;
    }

    public void setZhaopinType(String zhaopinType) {
        this.zhaopinType = zhaopinType == null ? null : zhaopinType.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getLive() {
        return live;
    }

    public void setLive(String live) {
        this.live = live == null ? null : live.trim();
    }

    public String getMianmao() {
        return mianmao;
    }

    public void setMianmao(String mianmao) {
        this.mianmao = mianmao == null ? null : mianmao.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school == null ? null : school.trim();
    }

    public String getXueli() {
        return xueli;
    }

    public void setXueli(String xueli) {
        this.xueli = xueli == null ? null : xueli.trim();
    }

    public String getZhuanye() {
        return zhuanye;
    }

    public void setZhuanye(String zhuanye) {
        this.zhuanye = zhuanye == null ? null : zhuanye.trim();
    }

    public String getJianyan() {
        return jianyan;
    }

    public void setJianyan(String jianyan) {
        this.jianyan = jianyan == null ? null : jianyan.trim();
    }

    public Double getXizi() {
        return xizi;
    }

    public void setXizi(Double xizi) {
        this.xizi = xizi;
    }

    public String getYinjiesheng() {
        return yinjiesheng;
    }

    public void setYinjiesheng(String yinjiesheng) {
        this.yinjiesheng = yinjiesheng == null ? null : yinjiesheng.trim();
    }

    public String getZizhi() {
        return zizhi;
    }

    public void setZizhi(String zizhi) {
        this.zizhi = zizhi == null ? null : zizhi.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getTuijian() {
        return tuijian;
    }

    public void setTuijian(String tuijian) {
        this.tuijian = tuijian == null ? null : tuijian.trim();
    }

    public String getTuijianren() {
        return tuijianren;
    }

    public void setTuijianren(String tuijianren) {
        this.tuijianren = tuijianren == null ? null : tuijianren.trim();
    }

    public Date getTuijiantime() {
        return tuijiantime;
    }

    public void setTuijiantime(Date tuijiantime) {
        this.tuijiantime = tuijiantime;
    }

	public String getJianli() {
		return jianli;
	}

	public void setJianli(String jianli) {
		this.jianli = jianli;
	}

	public byte[] getFujian() {
		return fujian;
	}

	public void setFujian(byte[] fujian) {
		this.fujian = fujian;
	}

	public String getYijian() {
		return yijian;
	}

	public void setYijian(String yijian) {
		this.yijian = yijian;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "JianliBean [jianliId=" + jianliId + ", jobId=" + jobId + ", xingming=" + xingming + ", xingbie="
				+ xingbie + ", zhaopinType=" + zhaopinType + ", email=" + email + ", tel=" + tel + ", address="
				+ address + ", live=" + live + ", mianmao=" + mianmao + ", idcard=" + idcard + ", school=" + school
				+ ", xueli=" + xueli + ", zhuanye=" + zhuanye + ", jianyan=" + jianyan + ", xizi=" + xizi
				+ ", yinjiesheng=" + yinjiesheng + ", zizhi=" + zizhi + ", time=" + time + ", tuijian=" + tuijian
				+ ", tuijianren=" + tuijianren + ", tuijiantime=" + tuijiantime + ", jianli=" + jianli + ", fujian="
				+ Arrays.toString(fujian) + ", yijian=" + yijian + ", state=" + state + "]";
	}

	
	
	
}

