<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/html/";
%>

<!doctype html public "-//w3c//dtd xhtml 1.0 frameset//en" "http://www.w3.org/tr/xhtml1/dtd/xhtml1-frameset.dtd">
<html>

<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8" />
	<meta http-equiv=content-type content="text/html; charset=utf-8" />
        <meta http-equiv=pragma content=no-cache />
        <meta http-equiv=cache-control content=no-cache />
        <meta http-equiv=expires content=-1000 />
        
        <title>银杏树信息技术服务(北京)有限公司</title>
    </head>
    <frameset border=0 framespacing=0 rows="60, *" frameborder=0>
        <frame name=head src="head.jsp" frameborder=0 noresize scrolling=no>
            <frameset cols="170, *">
                <frame name=left src="left.jsp" frameborder=0 noresize />
                <frame name=right src="right.jsp" frameborder=0 noresize scrolling=yes />
            </frameset>
    </frameset>
    <noframes>
    </noframes>
</html>