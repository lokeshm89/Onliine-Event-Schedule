<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Attendees Home</title>
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
	
	<body >		
				
			<div id="NE">				
				<h2 ccid="2465">Welcome To Attendeee Page!!</h2>
			
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
</html>