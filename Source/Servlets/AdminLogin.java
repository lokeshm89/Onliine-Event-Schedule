package scheduler.event.servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import scheduler.event.entity.Events;
import scheduler.event.entity.Venue;



public class AdminLogin extends  HttpServlet{

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		HashMap<Integer, Venue> venuemapserlzd = new HashMap<Integer, Venue>();
		Venue venue = null;
		try
	      {
	         FileInputStream fileIn = new FileInputStream("C:/venue/event.txt");
	         ObjectInputStream in = new ObjectInputStream(fileIn);
	         venuemapserlzd = (HashMap) in.readObject();
	         in.close();
	         fileIn.close();
	         
	        
	      }catch(IOException i)
	      {
	         i.printStackTrace();
	         return;
	      } catch (ClassNotFoundException e) {

			e.printStackTrace();
		}
		 
		HttpSession session = request.getSession(true);
		
		session.setAttribute("venuemap", venuemapserlzd);
	    
	HashMap<Integer, Events> eventmapserlzd = new HashMap<Integer, Events>();
	
	Events events = null;
	
	try
    {
       FileInputStream fileIn = new FileInputStream("C:/venue/event.txt");
       ObjectInputStream in = new ObjectInputStream(fileIn);
       eventmapserlzd = (HashMap) in.readObject();
       in.close();
       fileIn.close();
       
      
    }catch(IOException i)
    {
       i.printStackTrace();
       return;
    } catch (ClassNotFoundException e) {

		e.printStackTrace();
	}

	session.setAttribute("eventmap", eventmapserlzd);
	
	HashMap<Integer, Events> eventmap = new HashMap<Integer, Events>();
	eventmap = (HashMap) session.getAttribute("eventmap");
	
	for (Integer key : eventmapserlzd.keySet()) {
 		  
		System.out.println("key: " + key + " value: " + eventmap.get(key));
        events = (Events)eventmap.get(key);
        System.out.println("event values: " + events.getEventName()+"----"+events.getEventDescription()+"---"+events.getEventLocation()+"----"+events.getEventDate());
 		}
}
}
	

