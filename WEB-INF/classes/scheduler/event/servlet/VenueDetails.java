package scheduler.event.servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import scheduler.event.entity.Venue;

public class VenueDetails extends HttpServlet {

	HashMap<Integer, Venue> venuemap = new HashMap<Integer, Venue>();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(true);

		if (request.getParameter("addParam") != null
				&& request.getParameter("addParam")
						.equalsIgnoreCase("addVenue")) {
			
			System.out.println("When clicked on addVenue-----");
			addVenue(request, response);

		}

		else if (request.getParameter("updateParam") != null
				&& request.getParameter("updateParam").equalsIgnoreCase(
						"updateVenue")) {

			updateVenue(request, response);

		}

		else if (request.getParameter("param") != null
				&& request.getParameter("param").equalsIgnoreCase("updateLink")) {

			updateLink(request, response);

		}

		else if (request.getParameter("param") != null
				&& request.getParameter("param")
						.equalsIgnoreCase("removeVenue")) {

			removeVenue(request, response);

		}
	}

	public void addVenue(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);

		System.out.println("In addVenue()-----");
		String venueName = request.getParameter("txt_VenueName");
		String venueDescription = request.getParameter("txt_VenueDescription");
		String venueType = request.getParameter("sel_VenueType");
		String venueState = request.getParameter("sel_VenueState");

		int keyvalue = 1;

		if (session.getAttribute("venuemap") != null) {
			System.out.println("When venue map is not null-----");
			venuemap = (HashMap) session.getAttribute("venuemap");
		}

		if (venuemap != null && venuemap.size() > 0) {

			System.out.println("When venue map size is greater than 1 -----");
			venuemap.put(venuemap.size() + 1, new Venue(venueName,
					venueDescription, venueType, venueState));
		} else {
			System.out.println("Adding to venumap first time-----");
			venuemap.put(keyvalue, new Venue(venueName, venueDescription,
					venueType, venueState));
		}

		System.out.println("venumap size after adding ----"+venuemap.size());
		session.setAttribute("venuemap", venuemap);
		response.sendRedirect("VenueList.jsp");
	}

	public void updateLink(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		String k=request.getParameter("key");
		int keyUpdate=0;
		if(k !=null)
		{
			keyUpdate = Integer.parseInt(k);
		}
		if (session.getAttribute("venuemap") != null) {
			venuemap = (HashMap) session.getAttribute("venuemap");
		}

		session.setAttribute("keyUpdate", keyUpdate);
		session.setAttribute("venuemap", venuemap);
		if(keyUpdate==0)
		{
			response.sendRedirect("VenueList.jsp");
		}
		else{
		response.sendRedirect("updateVenue.jsp");
		}
	}

	public void updateVenue(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		int key=0;
		if(request.getParameter("updateKey") !=null)
		{
		key = Integer.parseInt(request.getParameter("updateKey"));
		}
		String venueName = request.getParameter("txt_VenueName");
		String venueDescription = request.getParameter("txt_VenueDescription");
		String venueType = request.getParameter("sel_VenueType");
		String venueState = request.getParameter("sel_VenueState");

		if (session.getAttribute("venuemap") != null) {
			venuemap = (HashMap) session.getAttribute("venuemap");
		}

		venuemap.remove(key);

		venuemap.put(key, new Venue(venueName, venueDescription, venueType,
				venueState));

		session.setAttribute("venuemap", venuemap);
		response.sendRedirect("VenueList.jsp");
	}

	public void removeVenue(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);

		if (session.getAttribute("venuemap") != null) {
			venuemap = (HashMap) session.getAttribute("venuemap");
		}

		int keyRemove = Integer.parseInt(request.getParameter("key"));

		venuemap.remove(keyRemove);
		session.setAttribute("venuemap", venuemap);
		response.sendRedirect("VenueList.jsp");
	}
}
