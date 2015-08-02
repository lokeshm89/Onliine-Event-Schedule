<!doctype html>
<html>
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
<script type="text/javascript">

var slideimages = new Array() // create new array to preload images
slideimages[0] = new Image() // create new instance of image object
slideimages[0].src = "../ScheduleEvent/Images/Ed Miliband speech.jpg" // set image object src property to an image's src, preloading that image in the process
slideimages[1] = new Image()
slideimages[1].src = "../ScheduleEvent/Images/attendees.jpg"
slideimages[2] = new Image()
slideimages[2].src = "../ScheduleEvent/Images/presenter.jpg"

</script>

<head>
	<title>Footer</title>
</head>
<body>
<div id="NW"  >
<table style="padding-top: 80px">

<tr>
<td colspan="2">
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
<img style="padding-top: 80px" src="../ScheduleEvent/Images/Ed Miliband speech.jpg" id="slide" width=615 height=409 align="middle" />
<script type="text/javascript">

//variable that will increment through the images
var step=0

function slideit(){
 //if browser does not support the image object, exit.
 if (!document.images)
  return
 document.getElementById('slide').src = slideimages[step].src
 if (step<2)
  step++
 else
  step=0
 //call function "slideit()" every 2.5 seconds
 setTimeout("slideit()",30000)
}

slideit()

</script>
		</div>

</body>
</html>
