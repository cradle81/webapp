<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<ul>
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>
	<li><a href="${contextPath}/pages/1.jsp">기본페이지 호출</a></li >

    <li> F01 : 클라이언트 분리 호출(이미지/JSP) </li>
    <ul>
    	 <li><a href="${contextPath}/pages/F01-image.jsp">F01 이미지 분리 화면 호출</a></li>
    </ul>

    <li>샘플 세션 정보</li>
    <ul>
    	<li><a href="${contextPath}/pages/session-info.jsp">Session : 샘플 세션 정보 </a></li>
    </ul>

    <li>OOM 테스트</li>
    <ul>
    	<li><a href="${contextPath}/pages/OOMTest.jsp">OOM 테스트 : heapdump, 메모리 추이등 확인 </a></li>
    	<li><a href="${contextPath}/pages/PermOOM.jsp">Perm영역 OOM 테스트 : OutOfMemory 확인</a></li>
    </ul>  
    
    <li>cpu 사용률 증가</li>
    <ul>
    	<li><a href="${contextPath}/pages/cpu.jsp">CPU사용률  테스트 : CPU 사용률 증가 확인 </a></li>
    </ul>    
    

    <li>임의 클래스 매소드 추적</li>
    <ul>
    	<li><a href="${contextPath}/pages/classMethod.jsp">임의 클래스/ 메소드 호출</a></li>
    </ul>             
    
    
    <li>DB 커넥션 정보</li>
    <ul>
    	<li><a href="${contextPath}/pages/db-connection-info.jsp">DB : ConnectionPool </a></li>
    </ul>
    
    <li>DB 커넥션 leak</li>
    <ul>
    	<li><a href="${contextPath}/pages/db-connection-leak.jsp"> DB : Connection Leak </a></li>
    </ul>            
    
    <li>Thread Sleep</li>
    <ul>
    	<li><a href="${contextPath}/pages/thread-sleep.jsp"> Thread : Thread 무한 대기 </a></li>
    	<li><a href="${contextPath}/pages/thread-sleep-3.jsp"> Thread : Thread 3초 대기 </a></li>
    	<li><a href="${contextPath}/pages/thread-sleep-1.jsp"> Thread : Thread 1초 대기 </a></li>
    </ul>    
   

    
</ul>