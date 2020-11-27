<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String userName = request.getParameter("userName");
	if(null!=userName && 0!=userName.length()){
		userName= new String( userName.getBytes("ISO-8859-1"),"UTF-8");
		session.setAttribute("userName",userName);
	}
%>
<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script src="js/j2ee.js"></script>


<div class="thediv">
	<img src="img/tomcat.png">
	<br>
	<c:if test="${empty sessionScope.userName}">
		<form onSubmit="doSubmit()" action="login.jsp" method="post">

			<span class="field">账号 ：</span> <input type="text" id="userName" name="userName"> <br> 
			<span  class="field">密码(随便填): </span>
			<input type="password" name="password"> <br> <input
				type="submit" value="登录">
		</form>
	</c:if>

	<c:if test="${!empty sessionScope.userName}">
		<br>
		当前登陆用户是:<span class="thespan">${sessionScope.userName}</span><br>
		<a href="logout.jsp">点击退出</a>
	</c:if>
</div>