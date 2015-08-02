<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>2 Column Frames Layout &mdash; Left Menu</title>
		<style type="text/css">
div { position:fixed; width:100%; height:500px ; }
#NW { top:90px;   left:3%; border-left:  thick;   }
#NE { top:10px;   left:50%;    }
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
input[type=text]:focus, input[type=password]:focus {
  border-color: #7dc9e2;
  outline-color: #dceefc;
  outline-offset: 0;
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
  
		body{
			margin: 0;
			padding: 0;
			overflow: hidden;
			height: 100%; 
			max-height: 100%; 
			font-family:Sans-serif;
			line-height: 1.5em;
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
			background: #eee;
		}
		
		main{
			position: fixed;
			top: 0; 
			left: 230px; /* Set this to the width of the navigation frame */
			right: 0;
			bottom: 0;
			overflow: auto; 
			background-color: #eee;
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
		
		</style>

<Style>
div.formrow {background:#FFF8DC;border:2px solid #ffc;margin:0 0 5px 0;float:left;width:100%;padding:6px 0;}
div.formrow label {float:left;display:block;width:15em;font-weight:bold;padding:0 6px;}
div.formrow label:hover {background:#FFFF66;cursor:pointer;}
div.formrow fieldset {border:1px solid gray;margin:0 6px;}
div.formrow fieldset span {display:block;}
div.formrow fieldset span label {float:none;display:inline;}
div.formrow fieldset legend {font-weight:bold;}
div.requiredRow {border:2px solid #049;}

.button.blue {
  color: #236277;
  text-shadow: 0 1px #c2ecf9;
  background: #61cdf3;
  border-color: #6fbad1 #3fa3c0 #3583ab;
  background-image: -webkit-linear-gradient(top, #9be5fa, #61cdf3 70%, #5fbde8);
  background-image: -moz-linear-gradient(top, #9be5fa, #61cdf3 70%, #5fbde8);
  background-image: -o-linear-gradient(top, #9be5fa, #61cdf3 70%, #5fbde8);
  background-image: linear-gradient(to bottom, #9be5fa, #61cdf3 70%, #5fbde8);
  -webkit-box-shadow: inset 0 1px #c5f0fd, inset 0 0 0 1px #8ad1eb, 0 1px #3583ab, 0 3px #3f9db8, 0 4px #3583ab, 0 5px 2px rgba(0, 0, 0, 0.4);
  box-shadow: inset 0 1px #c5f0fd, inset 0 0 0 1px #8ad1eb, 0 1px #3583ab, 0 3px #3f9db8, 0 4px #3583ab, 0 5px 2px rgba(0, 0, 0, 0.4);
}
</style>
</head>
<body >		
	<div id="NW">
<table style="top:inherit;">
<tr>
<td colspan="2" >
<p style="text-align: center;"><span style="color:#0000FF;">LOGIN AS</span></p>
</td>
</tr>
<tr align="center">
<td>

<a href="loginsignup.jsp?param=1 ">ADMINISTRATER</a> 
</td>
</tr>
<tr align="center">
<td>
<a href="loginsignup.jsp?param=2 ">PRESENTER</a> 
</td>
</tr>
<tr align="center">
<td>
<a href="loginsignup.jsp?param=3 ">ATTENDEE</a> 
</td>
</tr>
</table>
</div>			
	<div id="NE">	
	<form action ="SignUpServlet"  method="post"  >
			<table>	
			<tr>
			<td colspan="2">	
				<h1 style="font-family: sans-serif; line-height: 24px; text-align: center; ">New User Registration</h1>
				</td>
				</tr>
				
				<tr>
				 <% String role=request.getParameter("param");
				 if(role != null)
				 {
				 }
				 else{
				 role=(String)request.getAttribute("param");
				 }
             %>
				<% String PasserrorMessage=(String)request.getAttribute("PasserrorMessage");
				if(PasserrorMessage !=null)
				{
				%>
				<td colspan="2">
				<p style="color: red">Password is  Not Matching</p>
				</td>
				<%} %>
					<% String AdminerrorMessage =(String)request.getAttribute("AdminerrorMessage");
				if(AdminerrorMessage !=null)
				{
				%>
				<td colspan="2">
				<p style="color: red">Already they are Two Admins Registered</p>
				</td>
				<%} %>
				</tr>

<tr>
<td>
	<label for="txt_FirstName" id="FirstName-ariaLabel">First Name</label> </td>
	<td>
	<input id="txt_FirstName" name="txt_FirstName" type="text" aria-labelledby="FirstName-ariaLabel" required="required"/>
</td>
</tr>
<tr>
<td>
	<label for="txt_LastName" id="LastName-ariaLabel">Last Name</label></td>
	<td>
	<input id="txt_LastName" name="txt_LastName" type="text" aria-labelledby="LastName-ariaLabel"  required="required" /></td>
	</tr>
<tr>
<td>
	<label for="txt_EmailID" id="EmailID-ariaLabel">Email ID</label></td>
	<td>
	<input id="txt_EmailID" name="txt_EmailID" type="text" aria-labelledby="EmailID-ariaLabel"  required="required" /></td>
	</tr>
	<tr>
<td>
	<label for="sel_Role" id="Role-ariaLabel">Role</label></td>
<%if(role.equals("1")) {%>
	<td> <input id="sel_Role" name="sel_Role" type="text"  value="Admin"   readonly="readonly" style="border: none;"/></td>
<%} else if(role.equals("2")) { %>
<td> <input id="sel_Role" name="sel_Role" type="text"  value="Presenter"  readonly="readonly" style="border: none;"/></td>
<%} else {  %>
 <td><input id="sel_Role" name="sel_Role" type="text"  value="Attendee" readonly="readonly" style="border: none;"/></td>
<%} %>
</tr>
<tr>
<td>
	<label for="pwd_Password" id="Password-ariaLabel">Password</label> </td>
<td>	<input id="pwd_Password" name="pwd_Password" type="password" aria-labelledby="Password-ariaLabel"  required="required" /></td>
</tr>

<tr>
<td>	<label for="pwd_RetypePassword" id="RetypePassword-ariaLabel">Retype Password</label></td>
<td>	<input id="pwd_RetypePassword" name="pwd_RetypePassword" type="password"   required="required" /></td>
</tr>
<tr>
<td></td>
<td align="right" style="padding-top: 15px;"><input type="submit" value="Sign In" /></td>
</tr>


</table>	
</form>
</div>
</body>
</html>