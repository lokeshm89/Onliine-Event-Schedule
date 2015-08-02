package scheduler.event.servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import scheduler.event.entity.Events;

public class EventsDetails extends HttpServlet {

	HashMap<Integer, Events> eventmap = new HashMap<Integer, Events>();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(true);

		if (request.getParameter("addParam") != null
				&& request.getParameter("addParam")
						.equalsIgnoreCase("addEvent")) {
			addEvent(request, response);
			
		}
		
		else if (request.getParameter("updateParam") != null
				&& request.getParameter("updateParam")
						.equalsIgnoreCase("updateEvent")) {
           
			updateEvent(request, response);
					
		}
				
		else if (request.getParameter("param") != null
				&& request.getParameter("param")
						.equalsIgnoreCase("updateLink")) {

			updateLink(request, response);
			
		}

		else if (request.getParameter("param") != null
				&& request.getParameter("param")
						.equalsIgnoreCase("removeEvent")) {

			removeEvent(request, response);

		}
		else if (request.getParameter("param") != null
				&& request.getParameter("param")
						.equalsIgnoreCase("populateEvents")) {

			populateEvents(request, response);

		}
		else if (request.getParameter("searchParam") != null
				&& request.getParameter("searchParam")
						.equalsIgnoreCase("searchParam")) {

			populateSearch(request, response);

		}
	}
	
	public void addEvent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		
		String eventName = request.getParameter("txt_EventName");
    	String eventDescription = request.getParameter("txt_EventDescription");
    	String eventLocation = request.getParameter("sel_EventLocation");
    	String eventDate = request.getParameter("EventDate");

		int keyvalue = 1;

		if (session.getAttribute("eventmap") != null) {
			eventmap = (HashMap) session.getAttribute("eventmap");
		}

		if (eventmap != null && eventmap.size() > 0) {

			eventmap.put(eventmap.size() + 1, new Events(eventName,
					eventDescription, eventLocation, eventDate));
		} else {

			eventmap.put(keyvalue, new Events(eventName, eventDescription,
					eventLocation, eventDate));
		}

		session.setAttribute("eventmap", eventmap);
		response.sendRedirect("EventsList.jsp");	
	}
	
	
	
	public void updateLink(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		HttpSession session = request.getSession(true); 
	
		if (session.getAttribute("eventmap") != null) {
			eventmap = (HashMap) session.getAttribute("eventmap");
		}
		
		int keyUpdate=0;
		if(request.getParameter("key")!=null){
			
			keyUpdate = Integer.parseInt(request.getParameter("key"));
			session.setAttribute("keyUpdate", keyUpdate);
			session.setAttribute("eventmap", eventmap);
			response.sendRedirect("/ServletExample/updateEvent.jsp");
		}	
		else {
			session.setAttribute("eventmap", eventmap);
			response.sendRedirect("EventsList.jsp");
			
		}
		
	}
		
	
	public void removeEvent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		HttpSession session = request.getSession(true); 
		
		if (session.getAttribute("eventmap") != null) {
			eventmap = (HashMap) session.getAttribute("eventmap");
		}
		int keyRemove=0;
		if(request.getParameter("key")!=null){
			keyRemove = Integer.parseInt(request.getParameter("key"));
			
		}
		
		eventmap.remove(keyRemove);
		session.setAttribute("eventmap", eventmap);
		response.sendRedirect("EventsList.jsp");
	}
	
	public void populateEvents(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		HttpSession session = request.getSession(true);
		int approvekey = 0;
		Events event = null;
		if (request.getParameter("approvekey") != null) {

			approvekey = Integer.parseInt(request.getParameter("approvekey"));

			event = (Events) eventmap.get(approvekey);
			System.out.println("venue values: " + event.getEventName() + "----"
					+ event.getEventDescription() + "---"
					+ event.getEventLocation() + "----" + event.getEventDate());

			eventmap.remove(approvekey);
			eventmap.put(
					approvekey,
					new Events(event.getEventName(), event
							.getEventDescription(),
							event.getEventLocation(), event.getEventDate(),
							"Approved"));

			session.setAttribute("eventmap", eventmap);
			response.sendRedirect("EventsListAdmin.jsp");
		}


         else if (session.getAttribute("eventmap") != null) {
			eventmap = (HashMap) session.getAttribute("eventmap");
			session.setAttribute("eventmap", eventmap);
			response.sendRedirect("EventsListAdmin.jsp");
		}
		
         else {
        	 
        	 response.sendRedirect("EventsListAdmin.jsp");
         }
         
      
	}
	
	public void updateEvent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		HttpSession session = request.getSession(true); 
		int key=0;
		
		if(request.getParameter("updateEventKey")!= null)
		{
		key = Integer.parseInt(request.getParameter("updateEventKey"));
		}
		String eventName = request.getParameter("txt_EventName");
    	String eventDescription = request.getParameter("txt_EventDescription");
    	String eventLocation = request.getParameter("sel_EventLocation");
    	String eventDate = request.getParameter("EventDate");
		
	     
		if (session.getAttribute("eventmap") != null) {
			eventmap = (HashMap) session.getAttribute("eventmap");
		}

		eventmap.remove(key);
		
		eventmap.put(key, new Events(eventName, eventDescription,
				eventLocation, eventDate));
		
		session.setAttribute("eventmap", eventmap);
		response.sendRedirect("updateEvent.jsp");
	}
	
	public void populateSearch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		HttpSession session = request.getSession(true); 
		int key=0;
		
		
		System.out.println("In populate Search---"+request.getParameter("updateEventKey"));
		if(request.getParameter("updateEventKey")!= null)
		{
		key = Integer.parseInt(request.getParameter("updateEventKey"));
		}
		session.setAttribute("updateEventKey", key);
		
	     if (session.getAttribute("eventmap") != null) {
			eventmap = (HashMap) session.getAttribute("eventmap");
		}
	     System.out.println("In populate Search-for map size--"+eventmap.size());
		session.setAttribute("eventmap", eventmap);
		response.sendRedirect("search.jsp");
	}
}
