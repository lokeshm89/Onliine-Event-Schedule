<!DOCTYPE HTML><%@page language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@page import="java.util.*"%> 
	<%@page import="scheduler.event.entity.Events"%> 
<html>
<head>
<title>EventsListAdmin</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
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
<body>
<div id="NE">
<h1>Events</h1>
<table style="padding-top: 50px;" >
<tr>
<th>
Event Name
</th>
<th>
Event Description
</th>
<th>
Event Location
</th>
<th>
Event Date
</th>
<th>
Status
</th>
<th>
Approve
</th>
</tr>
<% 
HashMap eventmap = (HashMap)session.getAttribute("eventmap");
Events events = null;

if(eventmap!= null){
Iterator entries = eventmap.entrySet().iterator();
while (entries.hasNext()) { 
Map.Entry entry = (Map.Entry) entries.next();
            Integer key = (Integer)entry.getKey();
            events = (Events)entry.getValue();  
            System.out.println("key value in jsp"+key);
           System.out.println("Approve events"+events.getStatus());%>
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
<%=events.getStatus() %>
</td>
<%if(events.getStatus().equalsIgnoreCase("Pending")) {%>
<td>
<a href = "<%=request.getContextPath()%>/EventsDetails?param=populateEvents&approvekey=<%=key%>" >Approve Event</a>
</td>
<%} %>
</tr>


<%} }%>
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
</div>

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