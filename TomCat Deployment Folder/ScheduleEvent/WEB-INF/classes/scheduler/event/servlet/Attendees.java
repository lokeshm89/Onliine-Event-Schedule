package scheduler.event.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import scheduler.event.entity.Events;
import scheduler.event.entity.LoginDo;


public class Attendees extends HttpServlet {

	HashMap<Integer, Events> eventmap = new HashMap<Integer, Events>();
	HashMap<Integer, Events> personEventRegstrd = new HashMap<Integer, Events>();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);

		if (request.getParameter("viewParam") != null
				&& request.getParameter("viewParam")
						.equalsIgnoreCase("viewEvents")) {
			viewEvent(request, response);
			
		}
		if (request.getParameter("paramRegister") != null
				&& request.getParameter("paramRegister")
						.equalsIgnoreCase("registerEvents")) {
			registerEvent(request, response);
			
		}
		
		if (request.getParameter("myEventsParam") != null
				&& request.getParameter("myEventsParam")
						.equalsIgnoreCase("myEvents")) {
			displayMyEvents(request, response);
			
		}
		
	}	
	
	public void viewEvent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		HttpSession session = request.getSession(true); 
	   	    System.out.println("In viewevent()----");
	   	    
	   	 personEventRegstrd= (HashMap<Integer, Events>) session.getAttribute("personEventRegstrd");
	   	 if(personEventRegstrd !=null)
	   	 {
	   	 System.out.println("personEventRegstrd"+personEventRegstrd.size());
	   	session.setAttribute("personEventRegstrd", personEventRegstrd);
	   	 }
	   	 else{
	   		personEventRegstrd= new HashMap<Integer, Events>();
	   	 }
		if (session.getAttribute("eventmap") != null) {
			System.out.println("In viewevent()--when not null--");
			eventmap = (HashMap) session.getAttribute("eventmap");
			session.setAttribute("eventmap", eventmap);
			response.sendRedirect("EventsListAttendee.jsp");
		}
		
         else {
        	 
        	 response.sendRedirect("EventsListAttendee.jsp");
         }
	}
	
	public void registerEvent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		HttpSession session = request.getSession(true); 
	    int personid =0;
	    int eventid=0;
	    Events event = null;
	    LoginDo login=(LoginDo) session.getAttribute("login");
	    System.out.println("PRINTING LOGIN ID"+login.getId());
	    if((request.getParameter("registerkey")!=null)){
	    	
	    	personid = Integer.parseInt(login.getId());
	    	eventid = Integer.parseInt(request.getParameter("registerkey"));
	    	
	    	eventmap = (HashMap) session.getAttribute("eventmap");
	    	Iterator entries = eventmap.entrySet().iterator();
	    	while (entries.hasNext()) { 
	    	Map.Entry entry = (Map.Entry) entries.next();
	    	        Integer key = (Integer)entry.getKey();
	    	            event = (Events)entry.getValue();  
	    	           if(eventid==key){
	    	        	   System.out.println("key"+key);
	    	        	   System.out.println("event.getEventName()"+event.getEventName());
	    	        	   System.out.println("event.getEventDescription()"+event.getEventDescription());
	    	        	   System.out.println(" event.getEventLocation()"+ event.getEventLocation());
	    	           personEventRegstrd.put(key, new Events(personid, event.getEventName(), event.getEventDescription(),  event.getEventLocation(), event.getEventDate(), "Registered"));
	    	           }
	    	       
	    	}
	    	session.setAttribute("personEventRegstrd", personEventRegstrd);
	    	response.sendRedirect("EventsListRegistered.jsp");
	    
	    
   	}
	}
	
	public void displayMyEvents(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		HttpSession session = request.getSession(true); 
	   
		if(session.getAttribute("personEventRegstrd")!=null){
		personEventRegstrd = (HashMap)session.getAttribute("personEventRegstrd");
		}
		session.setAttribute("personEventRegstrd", personEventRegstrd);
    	response.sendRedirect("EventsListRegistered.jsp");
	}
}
