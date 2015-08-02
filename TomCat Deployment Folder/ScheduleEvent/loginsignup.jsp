<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Login Form</title>
  <link rel="stylesheet" href="CSS/Login.css">
  <style type="text/css">
div { position:fixed; width:100%; height:320px ; }
#NW { top:90px;   left:3%; border-left:  thick;   }
#NE { top:0px;   left:10%;    }
</style>
  
</head>
<body>
 <% String role=request.getParameter("param");
 
 if(role!= null)
 {
 
 } 
 else{
 role=(String)request.getAttribute("param");
 
 }
 %>
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
</table></div>
<div id="NE">
  
 <div class="login">

 
       
    <form name="loginForm" action="LoginServlet" method ="post">
    <table>
    <tr>
    
    <%if(role.equals("1")) {%>
    <td colspan="2">
     <h1>Adminstartor Login </h1></td>
      <%} else if(role.equals("2")) {%>
     <td colspan="2"> <h1>Presenter Login </h1></td>
       <%} else  {%>
     <td colspan="2">  <h1>Attendee Login </h1></td>
       <%} %>
       </tr>
       <tr>
         <td colspan="2"><%String er=(String)request.getAttribute("loginError"); 
         String tr=(String)request.getAttribute("AccessError");
         if(er != null) {%>
         <p style="size: 18 px ;color: white;">Wrong credentails</p>
         <%} else if(tr !=null) {%>
         <p style="size: 18 px ;color: white;">Don't Have access to with This Page  </p>
         </td>
         <%}else{ %>
         <td colspan="2">&nbsp;</td>
         <%} %>
       </tr>
        <tr>
        <td colspan="2">
        <input type="text" name="login" value="" placeholder="Username or Email" required="required"></td></tr>
        <tr>
     <td colspan="2">   <p><input type="password" name="password" value="" placeholder="Password" required="required"></p></td>
  </tr>

       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
 <tr>
 <td> 
          <label style="color: white; size: 10px;">
            <input type="checkbox" name="remember_me" id="remember_me">
            Remember me on this computer
          </label>
      </td>
      <td>
       <input type="submit" name="submit" value="Login"></td>
   </tr>
   <tr>
         <td colspan="2">&nbsp;</td>
       </tr><tr>
         <td colspan="2">&nbsp;</td>
       </tr>
   <tr>
   <td colspan="2" style="color: white">
    New User? <a href="SignUp.jsp?param=<%=role%>" style="color: white">Click here to SignUp.. </a></td>
    </tr>
          </table>
          <input type="hidden" name="role" value="<%=role%>">
      </form>
    </div>

   
    </div>
  </body>
</html>
