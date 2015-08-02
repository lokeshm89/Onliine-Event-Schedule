<!DOCTYPE HTML><%@page language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@page import="java.util.*"%> 
	<%@page import="scheduler.event.entity.Events"%> 
<html>
<head>
<title>EventsListAdmin</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<h1 style="padding-top: 70px;">Events</h1>
<table style="padding-top: 10px;">
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
Register
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
          if(events.getStatus().equalsIgnoreCase("Approved")){%>
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
<a href = "<%=request.getContextPath()%>/Attendees?paramRegister=registerEvents&registerkey=<%=key%>" >Register for this Event</a>
</td>

</tr>


<%}} }%>
</table>
</div>
<div id="NW">
			
			<h3>Actions</h3>
			<ul>
				<li><a href="<%=request.getContextPath()%>/Attendees?viewParam=viewEvents">View Events</a></li>
				<li><a href="<%=request.getContextPath()%>/Attendees?myEventsParam=myEvents">My Events</a></li>
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