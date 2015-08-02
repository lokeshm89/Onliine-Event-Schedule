<!DOCTYPE HTML><%@page language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	
	<%@page import="java.util.*"%> 
	<%@page import="scheduler.event.entity.Events"%> 
<html>
<head>
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
<title>EventsList</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

<%

HashMap eventmap = (HashMap)session.getAttribute("eventmap");
System.out.println("In jsp page ----map---"+eventmap.size());
Events events = null;
 
 
     Iterator entries = eventmap.entrySet().iterator();
      
 %>
<div id="NE">
<h1></h1>
<form action="/ServletExample/Eventlogout">
<table style="padding-top: 80px;">
<tr>
<th width="80px">
Event Name
</th>
<th width="80px">
Event Description
</th>
<th width="200px">
Event Location
</th>
<th width="80px">
Event Date
</th>
<th width="80px">
Update
</th>
<th width="80px">
Delete</th>
</tr>
<% while (entries.hasNext()) { 
Map.Entry entry = (Map.Entry) entries.next();
            Integer key = (Integer)entry.getKey();
            events = (Events)entry.getValue();%>
<tr>
<td>
<%=events.getEventName() %>
</td>
<td>
<%=events.getEventDescription() %>
</td>
<td>
<%=events.getEventLocation() %>
</td>
<td>
<%=events.getEventDate() %>
</td>
<td>
<a href = "<%=request.getContextPath()%>/EventsDetails?updateParam=updateEvent&key=<%=key%>" >Link</a>
</td>
<td>
<a href = "<%=request.getContextPath()%>/EventsDetails?param=removeEvent&key=<%=key%>" onclick= "return alertRemove()" >Link</a>
</td>


</tr>


<%} %>

</table>
</form>
</div>
	<div id="NW">
			<h3>Actions</h3>
			<ul>
				<li><a href="eventdetails.jsp">Create New Event</a></li>
					<li><a href="<%=request.getContextPath()%>/EventsDetails?param=updateLink">Update Event</a></li>
				<li><a href="<%=request.getContextPath()%>/EventsDetails?param=updateLink"">Remove Event</a></li>
				<li><a href="Add_New.html">View Attendees</a></li>						
				<li><a href="<%=request.getContextPath()%>/Logout">Logout</a></li>	
			</ul>			
			</div>
</body>
<script Language="JavaScript" type="text/javascript">

function alertRemove(){

var x = confirm("Are you sure you want to delete this event?");
  if(x){
      return true;
      }
  else{
    return false;
    }

}



</script>

</html>