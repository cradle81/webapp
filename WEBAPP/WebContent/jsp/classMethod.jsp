<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="kr.or.tta.bmt.F12.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<%

APMBMTClass apm = new APMBMTClass();
out.println("APMBMTClass + printInfo + 1 second");
out.println("</BR>");
apm.printInfo(1);

out.println("APMBMTClass + printInfo + 5 second");
apm.printInfo(5);
out.println("</BR>");

out.println("APMBMTClass + printInfo + 10 second");
apm.printInfo(10);
out.println("</BR>");


out.println("APMBMTClass + printInfo-nested");
apm.printInfo1(1);
out.println("</BR>");

out.println("APMBMTClass + printInfo + Check Method Cap Time ");
apm.printInfo3(1);
out.println("</BR>");

%>


</html>