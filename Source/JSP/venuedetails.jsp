<html>
<HEAD>
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


</Style>

</HEAD>

<body>
<div id="NE">
<form action= "VenueDetails" method="get" >
<table style="padding-top: 80px;">
<tr >
<td colspan="2" align="center" style="font: bolder; size: 18px;">Enter The Venue Details</td>
</tr>
<tr >
<td colspan="2" align="center" style="font: bold; size: 18px;">&nbsp;</td>
</tr>
<tr>
<td><label>Venue Name</label></td>
<td><input id="txt_VenueName" name="txt_VenueName" type="text" required="required"></td>
</tr>
<tr>
<td><label>Venue Description</label></td>
<td><input id="txt_VenueDescription" name="txt_VenueDescription" type="text" required="required" ></td>
</tr>
<tr>
<td><label>Venue Type</label></td>
<td>
	<select id="sel_VenueType" name="sel_VenueType" >
		<option value="CF - Conference Room">CF - Conference Room</option>
		<option value="LH - Lecturer Hall">LH - Lecturer Hall</option>
		<option value="TH - Training Hall">TH - Training Hall</option>
		<option value=""></option>
	</select></td>
</tr>
<tr>
<td><label>Venue State</label></td>
<td>	<select id="sel_VenueState" name="sel_VenueState" >
		<option value="IL">IL</option>
		<option value="IN">IN</option>
		<option value="KY">KY</option>
		<option value="KA">KA</option>
		<option value="CA">CA</option>
		<option value="NY">NY</option>
		<option value="FL">FL</option>
		<option value="TX">TX</option>
		<option value="AZ">AZ</option>
	</select></td>
</tr>	
<tr >
<td colspan="2" ><input type="hidden" name="addParam" value="addVenue"></td>
</tr>
<tr>

<td colspan="2" align="right"><input type="submit" value="Submit"> </td>
</tr>		
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

</html>