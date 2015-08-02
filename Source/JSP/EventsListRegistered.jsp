<!DOCTYPE HTML><%@page language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@page import="java.util.*"%> 
	<%@page import="scheduler.event.entity.Events"%> 
	<%@page import="scheduler.event.entity.LoginDo"%>
<html>
<head>
<title>EventsListRegistered</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<style type="text/css">
	#NW { float: left;

                width: 30%;
                height: 100%;
                min-height:100%;
                border-right: thick;
                 }
#NE {     float: right;
                width: 70%;
                height: 100%;
                min-height:100%;

}
	td, th {
    border: 1px solid green;
}

th {
    background-color: green;
    color: white;
}	
		</style>	
</head>



<body onload="init()">
<div id="NE">

<h1 style="padding-top: 70px;">You Registered for the following Events</h1>
<table style="padding-top: 10px;">
<form name="autofillform" action="searchEvent">
      <table style="right: 50px;"> 
          <tr>
            <td><strong >Search Events:</strong></td>
                        <td>
                            <input type="text"
                       size="40" 
                       id="complete-field"
                                   onkeyup="doCompletion()" >
                        </td>
          </tr>
          <tr>
              <td id="auto-row" colspan="2" style="border-color: white;">
                <table id="complete-table" class="popupBox" />
              </td>
          </tr>
      </table>
    </form>
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
<% 
HashMap personEventRegstrd = (HashMap)session.getAttribute("personEventRegstrd");
LoginDo login=(LoginDo) session.getAttribute("login");
int personid  = Integer.parseInt(login.getId());

Events events = null;

if(personEventRegstrd!= null){
Iterator entries = personEventRegstrd.entrySet().iterator();
while (entries.hasNext()) { 
Map.Entry entry = (Map.Entry) entries.next();
            Integer key = (Integer)entry.getKey();
            events = (Events)entry.getValue();  
         if((events.getPersonid()==personid)&&( events.getStatus().equalsIgnoreCase("Registered"))){ %>
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

</tr>


<%}} }%>
</table>



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

var req;
var isIE;
var completeField;
var completeTable;
var autoRow;


function init() {
    completeField = document.getElementById("complete-field");
    completeTable = document.getElementById("complete-table");
    autoRow = document.getElementById("auto-row");
    completeTable.style.top = getElementY(autoRow) + "px";
}

function doCompletion() {

    var url = "searchEvent?action=complete&id=" + completeField.value;
    req = initRequest();
    req.open("GET", url, true);
    req.onreadystatechange = callback;
    req.send(null);
}

function initRequest() {
    if (window.XMLHttpRequest) {
        if (navigator.userAgent.indexOf('MSIE') != -1) {
            isIE = true;
        }
        return new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        isIE = true;
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
}

function callback() {
    clearTable();
    if (req.readyState == 4) {
        if (req.status == 200) {
            parseMessages(req.responseXML);
        }
    }
}

function appendComposer(id,eventDate,eventName) {

     var row;
    var cell;
    var linkElement;
    if (isIE) {
        completeTable.style.display = 'block';
        row = completeTable.insertRow(completeTable.rows.length);
        cell = row.insertCell(0);
    } else {
       var myTableDiv = document.getElementById("complete-table");
       var table = document.createElement('TABLE');
       table.border='1';
       completeTable.style.display = 'table';
       row = document.createElement("tr");
       table.appendChild(row);
       cell = document.createElement("td");
       row.appendChild(cell);
       document.getElementById("complete-table").appendChild(row);
    }

    cell.className = "popupCell";
     linkElement = document.createElement("a");
    linkElement.className = "popupItem";
    linkElement.setAttribute("href", "EventsDetails?searchParam=searchParam&updateEventKey="+id);
    linkElement.appendChild(document.createTextNode(eventName + "--" + eventDate));
    cell.appendChild(linkElement);
}

function clearTable() {
    if (completeTable.getElementsByTagName("tr").length > 0) {
        completeTable.style.display = 'none';
        for (loop = completeTable.childNodes.length -1; loop >= 0 ; loop--) {
            completeTable.removeChild(completeTable.childNodes[loop]);
        }
    }
}

function getElementY(element){
    
    var targetTop = 0;
    
    if (element.offsetParent) {
        while (element.offsetParent) {
            targetTop += element.offsetTop;
            element = element.offsetParent;
        }
    } else if (element.y) {
        targetTop += element.y;
    }
    return targetTop;
}

function parseMessages(responseXML) {

    // no matches returned
    if (responseXML == null) {
        return false;
    } else {
       
 
        var events = responseXML.getElementsByTagName("events")[0];

        if (events.childNodes.length > 0) {
            completeTable.setAttribute("bordercolor", "black");
            completeTable.setAttribute("border", "1");
            for (loop = 0; loop < events.childNodes.length; loop++) {
                var event = events.childNodes[loop];
                var id = event.getElementsByTagName("id")[0];
                var eventDate = event.getElementsByTagName("eventDate")[0];
                var eventName = event.getElementsByTagName("eventName")[0];
                appendComposer(id.childNodes[0].nodeValue,
                    eventDate.childNodes[0].nodeValue,
                    eventName.childNodes[0].nodeValue);
            }
        }
    }
}       
</script>
</html>