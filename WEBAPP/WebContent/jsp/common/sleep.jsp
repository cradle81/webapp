<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%

String second = request.getParameter("second");
if (second == null )
{
	second="1"; 
}


%>
<body>
<table border="0" cellspacing="0" cellpadding="0"> 
<tr>	
	<td colspan=2 style="background-color:#7a7a84;"><img src="../images/tta_logo.png"  alt="TTA logo" /> </td>	
</tr>

 <tr>
 	
 	<td ><img src="../images/bmt_logo.gif"  alt="BMT logo" /></td>
 	<td style=" padding:10px;" width=100%> <h1>Sleep for ${second} second </h1>
 	

 </tr>
</table> 

<hr/>



<%
long start = System.currentTimeMillis();	
Thread.sleep(Integer.parseInt(second)*1000);
long end = System.currentTimeMillis();
long gap = (end-start);
%>

<h1 style=" padding:10px;" >Call Success !!!!! </h1> <br>
<h2>elapsed time = <%= gap  %> ms </h2> <br>  
<hr/>
<class="copyright">Copyright 2017 TTA All Rights Reserved (TTA 한국정보통신기술협회)</p>
</body>
</html>