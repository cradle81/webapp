<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
 
<c:set var="title" value="TTA_F01" />
<c:set var="content" value="content" />

<html>
<head>
<title>${param.title}</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/template.css" />
</head>
<body>
	<div id="header">
		<jsp:include page="/jsp/common/header.jsp" />
	</div>	
	
	<div id="middle">
		<div id="left"> <h4>TEST CASE</h4>
			<jsp:include page="/jsp/common/menu.jsp" />  
		</div>
		 
	    <div id="contents" > 
	    	<jsp:include page="/${param.content}" />
	    </div>   	
		
	</div>
	
	<div id="footer">
		<jsp:include page="/jsp/common/footer.jsp" />
	</div>


	
</body>
</html>