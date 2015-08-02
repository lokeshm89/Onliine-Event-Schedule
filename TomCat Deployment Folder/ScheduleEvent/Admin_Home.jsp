<!DOCTYPE html>
<%@page import="scheduler.event.entity.LoginDo"%>
<%@page import="java.util.List"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>2 Column Frames Layout &mdash; Left Menu</title>
		<style type="text/css">
		
		body{
			margin: 0;
			padding: 0;
			overflow: hidden;
			height: 100%; 
			max-height: 100%; 
			font-family:Sans-serif;
			line-height: 1.5em;
			background: url(../images/blue_background.jpeg);
			background-size: 100% 100%;
			background-repeat: no-repeat;
		}
		
		#nav{
			position: absolute;
			top: 0;
			bottom: 0; 
			left: 0;
			width: 230px; /* Width of navigation frame */
			height: 100%;
			overflow: hidden; /* Disables scrollbars on the navigation frame. To enable scrollbars, change "hidden" to "scroll" */
		}
		
		main{
			position: fixed;
			top: 0; 
			left: 230px; /* Set this to the width of the navigation frame */
			right: 0;
			bottom: 0;
			overflow: auto; 
			background-color: rgb(51,153,255);
		}
		
		.innertube{
			margin: 15px; /* Provides padding for the content */
		}
		
		p {
			color: #555;
		}

		nav ul {
			list-style-type: none;
			margin: 0;
			padding: 0;
		}
		
		nav ul a {
			color: darkgreen;
			text-decoration: none;
		}
				
		/*IE6 fix*/
		* html body{
			padding: 0 0 0 230px; /* Set the last value to the width of the navigation frame */
		}
		
		* html main{ 
			height: 100%; 
			width: 100%; 
		}
		div { position:fixed; width:100%; height:500px ; }
#NW { top:90px;   left:3%; border-left:  thick;   }
#NE { top:100px;   left:50%;     }
		</style>		
	
	</head>
	
	<body  >
	
	<div id="NE">
			<table >
			<tr>
			<td><p style="size:18px; ">Welcome to Admin Page......... </p></td>
			</tr>
			</table>
		</div>
	<div id="NW">
			<div class="innertube">
			
			<h3>Actions</h3>
			<ul>
				<li><a href="venuedetails.jsp">Add New Venue</a></li>
				<li><a href="<%=request.getContextPath()%>/VenueDetails?param=updateLink">List Of Venue Details</a></li>
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