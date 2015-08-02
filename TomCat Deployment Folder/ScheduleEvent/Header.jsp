<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="scheduler.event.entity.LoginDo"%>
<head>
<title>Online classs schedule</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="description" content="This is where you add the website description." />

<link rel="stylesheet" type="text/css" media="screen" href="CSS/default.css" />
</head>
<body id="index_page" style="background-color: #6699FF"> 
	<div id="wrapper"  "   >
		<div id="header" >
        	<h1>Online Event  Schedule</h1>
        </div>    
		<ul id="navigation" >
            <li id="contact_us" style="color: white; "><a href="contact-us.html" target="body" style="color: white">Contact Us</a></li>
            <li id="about_us"><a href="about-us.html" target="body" style="color: white">About Us</a></li>
            <li id="index"><a href="First_body.jsp" target="body" style="color: white">Home</a></li>
            <% 
				LoginDo login = (LoginDo)session.getAttribute("login");
				if(login!=null){
			%>
            <li ><a href="First_body.jsp" target="body" style="color: white">LogOut</a></li>
            <%} %>
        </ul>
	</div>
</body>
</html>
