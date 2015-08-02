package scheduler.event.servlet;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import scheduler.event.entity.Events;
import scheduler.event.entity.Venue;



public class Logout extends  HttpServlet{

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("insdie the llpog out point");
		HttpSession session = request.getSession(true);
		
		HashMap<Integer, Venue> venuemap = new HashMap<Integer, Venue>();
		HashMap<Integer, Events> eventmap = new HashMap<Integer, Events>();
		HashMap<Integer, Events> personEventRegstrd = new HashMap<Integer, Events>();
		if (session.getAttribute("venuemap") != null) {
			venuemap = (HashMap) session.getAttribute("venuemap");
		}
		if (session.getAttribute("eventmap") != null) {
			eventmap = (HashMap) session.getAttribute("eventmap");
		}
		if (session.getAttribute("personEventRegstrd") != null) {
			personEventRegstrd = (HashMap) session.getAttribute("personEventRegstrd");
			for(int i=0;i<personEventRegstrd.size();i++)
			{
				System.out.println(personEventRegstrd.get(1).getStatus()+"-------"+personEventRegstrd.get(1).getPersonid());
			}
		}

       
		try
        {
           FileOutputStream fileOut =
           new FileOutputStream("C:\\apache-tomcat-7.0.34\\webapps\\ScheduleEvent\\Files\\Attendee.txt");
           ObjectOutputStream out = new ObjectOutputStream(fileOut);
           out.writeObject(personEventRegstrd);
           out.close();
           fileOut.close();
        }catch(IOException i)
        {
            i.printStackTrace();
        }
		try
        {
           FileOutputStream fileOut =
           new FileOutputStream("C:\\apache-tomcat-7.0.34\\webapps\\ScheduleEvent\\Files\\Venue.txt");
           ObjectOutputStream out = new ObjectOutputStream(fileOut);
           out.writeObject(venuemap);
           out.close();
           fileOut.close();
        }catch(IOException i)
        {
            i.printStackTrace();
        }
		 
		try
        {
           FileOutputStream fileOut =
           new FileOutputStream("C:\\apache-tomcat-7.0.34\\webapps\\ScheduleEvent\\Files\\Event.txt");
           ObjectOutputStream out = new ObjectOutputStream(fileOut);
           out.writeObject(eventmap);
           out.close();
           fileOut.close();
        }catch(IOException i)
        {
            i.printStackTrace();
        }
		response.sendRedirect("First_body.jsp") ;
	}
	}
	

