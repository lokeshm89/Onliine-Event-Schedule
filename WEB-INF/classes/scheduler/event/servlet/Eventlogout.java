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



public class Eventlogout extends  HttpServlet{

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		
		HashMap<Integer, Events> eventmap = new HashMap<Integer, Events>();
		
		if (session.getAttribute("eventmap") != null) {
			eventmap = (HashMap) session.getAttribute("eventmap");
		}
		
		
       
		try
        {
           FileOutputStream fileOut =
           new FileOutputStream("C:/venue/event.txt");
           ObjectOutputStream out = new ObjectOutputStream(fileOut);
           out.writeObject(eventmap);
           out.close();
           fileOut.close();
           System.out.printf("Writing to C:/venue/event.txt");
        }catch(IOException i)
        {
            i.printStackTrace();
        }
	
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
	      }catch(ClassNotFoundException c)
	      {
	         System.out.println("Employee class not found");
	         c.printStackTrace();
	         return;
	      }
		 for (Integer key : eventmapserlzd.keySet()) {
	   		  
	     		System.out.println("key: " + key + " value: " + eventmap.get(key));
	             events = (Events)eventmap.get(key);
	             System.out.println("event values: " + events.getEventName()+"----"+events.getEventDescription()+"---"+events.getEventLocation()+"----"+events.getEventDate());
	     		}
	    }
	}
	

