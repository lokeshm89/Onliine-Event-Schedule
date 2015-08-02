<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.*"%> 
	<%@page import="scheduler.event.entity.Events"%>
	<%@page import="scheduler.event.entity.Venue"%> 
	
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Update Event</title>
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
input {
  font-family: 'Lucida Grande', Tahoma, Verdana, sans-serif;
  font-size: 14px;
}

input[type=text], input[type=password] {
  margin: 5px;
  padding: 0 10px;
  width: 200px;
  height: 34px;
  color: #404040;
  background: white;
  border: 1px solid;
  border-color: #c4c4c4 #d1d1d1 #d4d4d4;
  border-radius: 2px;
  outline: 5px solid #eff4f7;
  -moz-outline-radius: 3px;
  -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
}


input[type=submit] {
  padding: 0 18px;
  height: 29px;
  font-size: 12px;
  font-weight: bold;
  color: #527881;
  text-shadow: 0 1px #e3f1f1;
  background: #cde5ef;
  border: 1px solid;
  border-color: #b4ccce #b3c0c8 #9eb9c2;
  border-radius: 16px;
  outline: 0;
  -webkit-box-sizing: content-box;
  -moz-box-sizing: content-box;
  box-sizing: content-box;
  background-image: -webkit-linear-gradient(top, #edf5f8, #cde5ef);
  background-image: -moz-linear-gradient(top, #edf5f8, #cde5ef);
  background-image: -o-linear-gradient(top, #edf5f8, #cde5ef);
  background-image: linear-gradient(to bottom, #edf5f8, #cde5ef);
  -webkit-box-shadow: inset 0 1px white, 0 1px 2px rgba(0, 0, 0, 0.15);
  box-shadow: inset 0 1px white, 0 1px 2px rgba(0, 0, 0, 0.15);
}
select{
  margin: 5px;
  padding: 0 10px;
  width: 200px;
  height: 34px;
  color: #404040;
  background: white;
  border: 1px solid;
  border-color: #c4c4c4 #d1d1d1 #d4d4d4;
  border-radius: 2px;
  outline: 5px solid #eff4f7;
  -moz-outline-radius: 3px;
  -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
}
		
		</style>
	</head>
	<body >		

<% HashMap eventemap = (HashMap)session.getAttribute("eventmap");
   int keyUpdate =   (Integer)session.getAttribute("keyUpdate");
   Events events = null;
   events =  (Events)eventemap.get(keyUpdate);
   if(events != null){
 %>		
	<div id="NE">
<form action="EventsDetails" >
<table>
			<tr>
			<td colspan="2"><h1>Enter the Event details below</h1></td>
			</tr>
			<tr>
			<td colspan="2">&nbsp;</td>
			<td></td>
			</tr>
			<tr>
			<td><label >Event Name</label></td>
			<td><input id="txt_EventName" name="txt_EventName" type="text"  value="<%=events.getEventName()%>" title="Please Enter The Event Name"></td>
			</tr>
			<tr>
			<td><label >Event Description</label></td>
			<td><input id="txt_EventDescription" name="txt_EventDescription" type="text"   value="<%=events.getEventDescription()%>"   title="Enter The Event Description." ></td>
			</tr>
			<tr>
			<td><label>Event Location</label></td>
				<td><select id="sel_EventLocation" name="sel_EventLocation" title="Select  The Event Location. ">
			<% 
			HashMap venuemap = (HashMap)session.getAttribute("venuemap");
				Venue venue = null;
			if(venuemap!= null){
			Iterator entries = venuemap.entrySet().iterator();
			while (entries.hasNext()) { 
					Map.Entry entry = (Map.Entry) entries.next();
    		        Integer key = (Integer)entry.getKey();
       				venue = (Venue)entry.getValue(); 
       				
       				 %>
		<option value="<%=venue.getVenueName()%>"> <%=venue.getVenueName()%></option>
		<%}} %>
	    </select>
	    </td>
			</tr>
			<tr>
			<td><label >Event Date</label></td>
			<td><input id="EventDate" name="EventDate"  value="<%=events.getEventDate()%>"  type="text" title="Enter The Event Date "></td>
			</tr>
			<tr>
			<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
				
				<td colspan="2" align="center">
				<input type="hidden" name="updateEventKey" value="<%=keyUpdate%>">
				<input type="hidden" name="updateParam" value="updateEvent">
				<input type="submit" value="NewEvent" onclick="return emptyCheck()" >
				</td>
				</tr>
				<%}
else{ %>
<tr>
<td colspan="2">
<p>NO Events to Display</p></td> </tr>
<%} %>
				
		</table>
		</form>
		</div>				
		<div id="NW">
			<h3>Actions</h3>
			<ul>
				<li><a href="eventdetails.jsp">Create New Event</a></li>
					<li><a href="<%=request.getContextPath()%>/EventsDetails?param=updateLink">Update Event</a></li>
				<li><a href="<%=request.getContextPath()%>/EventsDetails?param=updateLink">Remove Event</a></li>
				<li><a href="<%=request.getContextPath()%>/LoginAttendeeServlet?role=1">View Attendee</a></li>	
				<li><a href="<%=request.getContextPath()%>/Logout">Logout</a></li>	
			</ul>			
			</div>
	
	</body>
	<script Language="JavaScript" type="text/javascript">

function emptyCheck(){
var eventname = document.getElementById('txt_EventName').value;
var eventdcptn = document.getElementById('txt_EventDescription').value;
var eventdate = document.getElementById('EventDate').value;
	if (eventname==""||eventname==null)
                {
                    alert ("Please Enter a Event Name");
                    return false;
                }else if (eventdcptn==""||eventdcptn==null){
                    alert ("Please Enter a Event Description");
                    return false;
                }else if(eventdate==""||eventdate==null){
                 alert ("Please Enter a Event Date");
                    return false;
                
                }else if(eventdate!=null){
                var dateformat = /^(0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])[\/\-]\d{4}$/;  
  // Match the date format through regular expression  
  if(eventdate.match(dateformat))  
  {  
 
  //Test which seperator is used '/' or '-'  
  var opera1 = eventdate.split('/');  
  var opera2 = eventdate.split('-');  
  lopera1 = opera1.length;  
  lopera2 = opera2.length;  
  // Extract the string into month, date and year  
  if (lopera1>1)  
  {  
  var pdate = eventdate.split('/');  
  }  
  else if (lopera2>1)  
  {  
  var pdate = eventdate.split('-');  
  }  
  var mm  = parseInt(pdate[0]);  
  var dd = parseInt(pdate[1]);  
  var yy = parseInt(pdate[2]);  
  // Create list of days of a month [assume there is no leap year by default]  
  var ListofDays = [31,28,31,30,31,30,31,31,30,31,30,31];  
  if (mm==1 || mm>2)  
  {  
  if (dd>ListofDays[mm-1])  
  {  
  alert('Invalid date format!');  
  return false;  
  }  
  }  
  if (mm==2)  
  {  
  var lyear = false;  
  if ( (!(yy % 4) && yy % 100) || !(yy % 400))   
  {  
  lyear = true;  
  }  
  if ((lyear==false) && (dd>=29))  
  {  
  alert('Invalid date format!');  
  return false;  
  }  
  if ((lyear==true) && (dd>29))  
  {  
  alert('Invalid date format!');  
  return false;  
  }  
  }  
  }  
  else  
  {  
  alert("Invalid date format!");   
  return false;  
  }
                }
               
                
                return true;
                
                
                 
}
</script>
</html>