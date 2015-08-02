<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
  	<%@page import="java.util.*"%> 
	<%@page import="scheduler.event.entity.Events"%> 
  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body>

<%

HashMap eventmap = (HashMap)session.getAttribute("eventmap");
System.out.println("In jsp page ----map---"+eventmap.size());
Events events = null;
 
 
     Iterator entries = eventmap.entrySet().iterator();
      
 %>

<h1></h1>
<table>
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
<a href = "/ServletExample/EventsDetails?param=registerEvent&key=<%=key%>" >Register Event</a>
</td>

</tr>

<%} %>
</table>
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