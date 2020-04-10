
<%@ page language="java" contentType="text/html;charset=EUC-KR"%>
<%@ page import="kr.or.tta.bmt.common.DBManager" %>
<%@ page import="java.sql.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 

<html>
<head>
<title>Conncecion Leak</title>
</head>

<body>
<%
String sql = request.getParameter("sql");
if (sql==null)
	sql="select * from emp";
String dsName  = request.getParameter("dsName");
%>
<Table align=left border="1"  width=100%>
  <tr><td align="left">JNDI NAME</td> <td align="left"><%=dsName%></td></tr>
  <tr><td align="left">selectSQL</td> <td align="left"><%=sql%></td></tr>
  <tr><td align="left">DESC</td> <td align="left">Select from <%=dsName%> </td>
<%
ResultSet rs=null;
Connection con=null;
PreparedStatement ps = null;
DBManager db;
db = new DBManager();	
%>

<h3>
   <Form method = "get" action="${pageContext.request.contextPath}/pages/55.jsp">
 
         <Table align=left border="1" width=100%> 
             <tr>
                 <td align=right width=30% >DataSource JNDI</td>
                 <td><input type="text" name="dsName"  value="${param.dsName}"/> </td>                    
             <tr>
             <tr>
                 <td align=right width=30% >SQL</td> 
                 <td ><input type="text" name="sql" value="${param.sql}" /> </td>                    
             <tr>                    
                 <td colspan="2" align=center width=100%><input type="submit" name="input" value="ют╥б"></td>
             </tr>
         </Table>
    </Form>
</h3>
<%
if (dsName !=null )
{
	con = db.getConnection(dsName);
	ps = con.prepareStatement(sql);
	rs = db.selectSQL(ps); 
	ResultSetMetaData rsmd = rs.getMetaData(); 
	int columnCnt = rsmd.getColumnCount() ;
	out.print("<br>");
	out.print("<h2> Sql Query = " + sql + "</h2>");
	out.print("<table border=1 bordercolor=\"gray\" cellspacing=1 cellpadding=0 width=\"100%\">");
	for(int i=1;i<=columnCnt;i++)
	{
	       out.print("<td>");            
	       out.print(rsmd.getColumnName(i));
	       out.print("</td>");
	}
	out.print("</tr>");
	
	while(rs.next())
	{
	     out.print("<tr>");
	     for(int i=1;i<=columnCnt;i++)
	     {
	    	 
	             out.print("<td>");
	             out.print(rs.getString(i)); 
	             out.print("</td>");
	     }
	     out.print("</tr>");
	}
	out.print("</table>");
	
    //db.close(con, rs, ps);
}	

%>

</body>
</html>
