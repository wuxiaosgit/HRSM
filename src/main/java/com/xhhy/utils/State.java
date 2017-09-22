package com.xhhy.utils;

public class State {
	public static final int UNPASS = 0;//未通过
	public static final int DRAFT = 1;//起草
	public static final int CHECKING = 2;//审核中
	public static final int PASS = 3;//审核通过
	
	public static final int PAGEROWS = 10;//分页每页显示的条数
	
	//招聘信息
	public static final int DEL = 0;//已删除
	public static final int UNDEL = 1;//未删除
	
	//简历状态
	
	public static final int FIRST = 1;//推荐面试
	public static final int SECOND = 2;//推荐二面
	public static final int LAST = 3;//推荐三面
	public static final int PREHIRE = 4;//建议录用
	public static final int HIRE = 5;//录用
	public static final int SAVE = 6;//存档
}
