<!DOCTYPE HTML><%@page language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	
	<%@page import="java.util.*"%> 
	<%@page import="scheduler.event.entity.Venue"%> 
<html>
<head>
<title>VenueList</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<Style>
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
</Style>
</head>
<body>
<div id="NE">
<%

HashMap venuemap = (HashMap)session.getAttribute("venuemap");
Venue venue = null;
 
     Iterator entries = venuemap.entrySet().iterator();
      
 %>

<form action="/ServletExample/Logout">
<table style="padding-top: 80px;">
<tr>
<th width="60px">
VenueName
</th>
<th width="60px">
VenueDescription
</th>
<th width="200px">
VenueType
</th>
<th width="7=60px">
VenueState
</th>
<th width="60px">
Update
</th>
<th width="7=60px">
Remove
</th>
</tr>
<% while (entries.hasNext()) { 
Map.Entry entry = (Map.Entry) entries.next();
            Integer key = (Integer)entry.getKey();
            venue = (Venue)entry.getValue();%>
<tr>
<td>
<%=venue.getVenueName() %>
</td>
<td>
<%=venue.getVenueDescription() %>
</td>
<td>
<%=venue.getVenueType() %>
</td>
<td>
<%=venue.getVenueState() %>
</td>
<td>
<a href = "<%=request.getContextPath()%>/VenueDetails?param=updateLink&key=<%=key%>" >Link</a>
</td>
<td>
<a href = "<%=request.getContextPath()%>/VenueDetails?param=removeVenue&key=<%=key%>"  >Link</a>
</td>
</tr>
<%} %>
</table>
</form>
</div>
<div id="NW">
			<div class="innertube">
			
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
		</div>
</body>
<script Language="JavaScript" type="text/javascript">

function alertRemove(){

var x = confirm("Are you sure you want to delete?");
  if(x){
      return true;
      }
  else{
    return false;
    }

}
</script>
</html>

