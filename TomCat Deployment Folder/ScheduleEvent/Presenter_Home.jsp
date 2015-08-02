<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>2 Column Frames Layout &mdash; Left Menu</title>
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
		
		</style>		
	
	</head>
	
	<body  >		
				
			<div id="NE">				
				<h2 >Welcome To The Organizer Page</h2>
				<p><span style="color:#FFFFE0;">As a event presenter you can perform the following activities. Please click the  links on the left hand side to proceed.</span></p>
			
			</div>
	
			<div id="NW">
			
			<h3>Actions</h3>
			<ul>
				<li><a href="eventdetails.jsp">Create New Event</a></li>
				<li><a href="<%=request.getContextPath()%>/EventsDetails?param=updateLink">Update Event</a></li>
				<li><a href="<%=request.getContextPath()%>/EventsDetails?param=updateLink"">Remove Event</a></li>
				<li><a href="<%=request.getContextPath()%>/LoginAttendeeServlet?role=1">View Attendee</a></li>			
				<li><a href="<%=request.getContextPath()%>/Logout">Logout</a></li>						
			</ul>			
			</div>
	
	</body>
</html>