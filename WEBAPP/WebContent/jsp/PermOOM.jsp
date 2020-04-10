<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "kr.or.tta.bmt.common.*" %>    

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


<h1 style=" padding:10px;" width=100%> Perm OOM  BMT !!</h1>

<%! 
HeapLeakManager hlm = new HeapLeakManager(true,10000, HeapLeakManager.CheckType.Perm);

%>
 <%
 
 HashMap hm= hlm.doLeak();  
 
 
%>
<BR>
HeapSize =<%= hm.get("heapSize")  %> MB 
<BR>
freeHeapSize =<%= hm.get("freeHeapSize") %> MB 
<BR>
ArraySize =<%= hm.get("ArraySize") %> 개
<BR>
Number of Loaded Class  =<%= hm.get("classesSize") %> 개
<BR>


</h2></p>

</br>



</body>
</html>