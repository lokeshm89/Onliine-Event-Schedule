<%@page import="java.util.Map"%>
<%@page import="scheduler.event.entity.LoginDo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<style type="text/css">
		
		#NW { float: left;

                width: 30%;
                height: 100%;
                min-height:100%;
                border-right: thick;
                 }
#NE {     float: right;
top:500px;
                width: 70%;
                height: 100%;
                min-height:100%;

}
 td, th {
    border: 1px solid green;
}

th {
    background-color: green;
    color: white;
}
		
		</style>
</head>
<body>
<div id="NE">
	 		<% List<LoginDo> list =(List<LoginDo>)request.getAttribute("list");
			String role =(String)request.getAttribute("role");
			System.out.println("size"+list.size());%>
			<table style="padding-top: 100px;"  >
			<tr background="blue">
			<th width="90px">Name</th>
			<th width="90px">Email</th>
			<th width="90px">Type</th>
			<th width="90px">Delete</th>
			</tr>
				<c:forEach var="lists" items="<%=list %>">
    <tr>
      <td><c:out value="${lists.name}" /></td>
      <td><c:out value="${lists.email}" /></td>
        <td><c:out value="${lists.type}" /></td>
        <td><a href="<%=request.getContextPath()%>/LoginAttendeeServlet?name=${lists.id}&role=<%=role%>"> Link</a></td>
    </tr>
  </c:forEach>
			</table>
</div>	
<div id="NW">	
			
			<h3>Actions</h3>
			<ul>
				<li><a href="venuedetails.jsp">Add New Venue</a></li>
				<li><a href="<%=request.getContextPath()%>/VenueDetails?param=updateLink">Update Venue Details</a></li>
				<li><a href="<%=request.getContextPath()%>/VenueDetails?param=updateLink">Remove Venue</a></li>
				<li><a href="<%=request.getContextPath()%>/EventsDetails?param=populateEvents">Approve Event Request</a></li>	
				<li><a href="<%=request.getContextPath()%>/LoginAttendeeServlet?role=2">View Organizer</a></li>
			<li><a href="<%=request.getContextPath()%>/LoginAttendeeServlet?role=1">View Attendee</a></li>		
			<li><a href="<%=request.getContextPath()%>/Logout">Logout</a></li>						
			</ul>			
		</div>
</body>
</html>