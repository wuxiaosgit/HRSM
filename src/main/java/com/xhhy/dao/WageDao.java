package com.xhhy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.xhhy.domain.WageBean;

public interface WageDao {
	@Select(value = { "select ss_name,ss_date,ss_zzr,ss_djr,base_pay,award_pay,travel_pay,phone_pay,"
			+ "meal_pay,house_pay,mission_pay,overtime_pay,ss_remark from salary_standard_tb" })
	@Results({@Result(id=true,property="wageId",column="ss_id"),
		@Result(property="wageBm",column="ss_bm"),
		@Result(property="wageName",column="ss_name"),
		@Result(property="wageDate",column="ss_date"),
		@Result(property="zzrName",column="ss_zzr"),
		@Result(property="djrName",column="ss_djr"),
		@Result(property="basePay",column="base_pay"),
		@Result(property="awarPay",column="award_pay"),
		@Result(property="travelPay",column="travel_pay"),
		@Result(property="phonePay",column="phone_pay"),
		@Result(property="mealPay",column="meal_pay"),
		@Result(property="housePay",column="house_pay"),
		@Result(property="missionPay",column="mission_pay"),
		@Result(property="overtimePay",column="overtime_pay"),
		@Result(property="allpay",column="all_pay"),
		@Result(property="remark",column="ss_remark"),
//		wageName,wageDate,zzrName,djrName,basePay,awarPay,travelPay,phonePay,mealPay,housePay,missionPay,overtimePay,remark
//		ss_id,ss_bm,ss_name,ss_date,ss_zzr,ss_djr,base_pay,award_pay,travel_pay,phone_pay,meal_pay,house_pay,mission_pay,overtime_pay,all_pay,ss_remark
	})
	public List<WageBean> selectAll();
	@Insert(value = { "insert into salary_standard_tb(ss_id,ss_bm,ss_name,ss_date,ss_zzr,ss_djr,base_pay,award_pay,travel_pay,phone_pay,meal_pay,house_pay,mission_pay,overtime_pay,all_pay,ss_remark) values"
			+ "(null,#{wageBm},#{wageName},#{wageDate},#{zzrName},#{djrName},#{basePay},#{awarPay},#{travelPay},#{phonePay},"
			+ "#{mealPay},#{housePay},#{missionPay},#{overtimePay},#{all},#{remark})" })
	public void insertWage(WageBean wage);
}
