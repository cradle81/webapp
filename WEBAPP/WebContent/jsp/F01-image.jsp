<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<ul>
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>


<h1 style=" padding:10px;" width=100%> APM BMT !!</h1>
	<p>
		샘플 1<br>
		<img src="${contextPath}/images/dummy-100x100-1.jpg">
	</p>
	
	<p>
		샘플 2<br>
		<img src="${contextPath}/images/dummy-100x100-2.jpg" width="245">
	</p>


	<p>
		샘플 3<br>
		<img src="${contextPath}/images/dummy-100x100-3.jpg" width="245">
	</p>
	


</br>



</body>
</html>