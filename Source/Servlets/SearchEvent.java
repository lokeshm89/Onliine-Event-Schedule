 package scheduler.event.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import scheduler.event.entity.Events;



public class SearchEvent extends HttpServlet{

	private ServletContext context;
	private Events event= new Events();
    private HashMap<Integer, Events> eventmap = new HashMap<Integer, Events>();
    		
    @Override
    public void init(ServletConfig config) throws ServletException {
        this.context = config.getServletContext();
    }

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        
		HttpSession session = request.getSession(true);
		
		if (session.getAttribute("eventmap") != null) {
			eventmap = (HashMap) session.getAttribute("eventmap");
		}
		
        String action = request.getParameter("action");
        String targetId = request.getParameter("id");
        StringBuffer sb = new StringBuffer();
        PrintWriter out = response.getWriter();
        if (targetId != null) {
            targetId = targetId.trim();
        } else {
            context.getRequestDispatcher("/error.jsp").forward(request, response);
        }

        boolean namesAdded = false;
        if (action.equals("complete")) {

            // check if user sent empty string
            if (!targetId.equals("")) {

                Iterator it = eventmap.keySet().iterator();

                while (it.hasNext()) {
                    int id = (Integer)it.next();

                     Events event = (Events) eventmap.get(id);
                     
                    if ( // targetId matches first name
                    		event.getEventName().toLowerCase().startsWith(targetId)) {
                    	
                        sb.append("<event>");
                        sb.append("<id>" + id + "</id>");
                        sb.append("<eventName>" + event.getEventName() + "</eventName>");
                        sb.append("<eventDate>" + event.getEventDate() + "</eventDate>");
                        sb.append("</event>");
                        namesAdded = true;
                    }
                }
            }

            if (namesAdded) {
                response.setContentType("text/xml");
                
                response.getWriter().write("<events>" + sb.toString() + "</events>");
                //response.sendRedirect("/ServletExample/EventsList.jsp");		
            } else {
                
                response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            }
        }

        	
    }
}

