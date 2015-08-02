package scheduler.event.servlet;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import scheduler.event.entity.Events;
import scheduler.event.entity.LoginDo;
import scheduler.event.entity.Venue;



public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public LoginServlet() {
		super();

	}


	public void init(ServletConfig config) throws ServletException {

	}


	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		

		String role=(String) request.getParameter("role");
		String username = request.getParameter("login");
		String password = request.getParameter("password");
		System.out.println("username" + username);
		System.out.println("password" + password);
		ArrayList<LoginDo> login = new ArrayList<LoginDo>();
		try {
			BufferedReader inFile = new BufferedReader(
					new FileReader(
							"C:\\apache-tomcat-7.0.34\\webapps\\ScheduleEvent\\Files\\LoginCredentails.txt"));
			String inputLine;

			while ((inputLine = inFile.readLine()) != null) {

				if (inputLine.isEmpty())
					continue; 

				LoginDo ns = new LoginDo();
				String[] logincred = inputLine.split(":");
				ns.setId(logincred[0]);
				ns.setName(logincred[1]);
				ns.setLastName(logincred[2]);
				ns.setEmail(logincred[3]);
				ns.setType(logincred[4]);
				ns.setPassword(logincred[5]);
				login.add(ns);
			}
			HashMap<Integer, Venue> venuemapserlzd = new HashMap<Integer, Venue>();
			Venue venue = null;
			ObjectInputStream in=null;
		     try  {
		    	
		    		  inFile=new BufferedReader (new FileReader("C:\\apache-tomcat-7.0.34\\webapps\\ScheduleEvent\\Files\\Venue.txt"));
		    		  if(  inFile != null){
		         in = new ObjectInputStream( new FileInputStream("C:\\apache-tomcat-7.0.34\\webapps\\ScheduleEvent\\Files\\Venue.txt"));
		        
		         venuemapserlzd = (HashMap) in.readObject();
		    		  }
		      }catch(IOException m)
		      {
		         m.printStackTrace();
		      } catch (ClassNotFoundException e) {

				e.printStackTrace();
			}
			finally{
				if (in != null) {
			        in.close();
			    }
			}
			 
		
			session.setAttribute("venuemap", venuemapserlzd);
			
			session.setAttribute("type", role);
		    
		HashMap<Integer, Events> eventmapserlzd = new HashMap<Integer, Events>();
		
		Events events = null;
		
		try
	    {
			  inFile=new BufferedReader (new FileReader("C:\\apache-tomcat-7.0.34\\webapps\\ScheduleEvent\\Files\\Event.txt"));
    		  if(  inFile.readLine()!= null){
	       
	        in = new ObjectInputStream( new FileInputStream("C:\\apache-tomcat-7.0.34\\webapps\\ScheduleEvent\\Files\\Event.txt"));
	       eventmapserlzd = (HashMap) in.readObject();
	       
    		  }
	      
	    }catch(IOException l)
	    {
	       l.printStackTrace();
	       return;
	    } catch (ClassNotFoundException e) {

			e.printStackTrace();
		}finally{
			if (in != null) {
		        in.close();
		    }
		}

		session.setAttribute("eventmap", eventmapserlzd);
HashMap<Integer, Events> personEventRegstrd = new HashMap<Integer, Events>();
		
		
		try
	    {
			  inFile=new BufferedReader (new FileReader("C:\\apache-tomcat-7.0.34\\webapps\\ScheduleEvent\\Files\\Attendee.txt"));
    		  if(  inFile.readLine()!= null){
	       
	        in = new ObjectInputStream( new FileInputStream("C:\\apache-tomcat-7.0.34\\webapps\\ScheduleEvent\\Files\\Attendee.txt"));
	        personEventRegstrd = (HashMap) in.readObject();
	       
    		  }
	      
	    }catch(IOException l)
	    {
	       l.printStackTrace();
	       return;
	    } catch (ClassNotFoundException e) {

			e.printStackTrace();
		}finally{
			if (in != null) {
		        in.close();
		    }
		}
for(int i=0;i<personEventRegstrd.size();i++)
{
	System.out.println(personEventRegstrd.get(1).getStatus());
}
		session.setAttribute("personEventRegstrd", personEventRegstrd);
	
		
		
			for (int i = 0; i < login.size(); i++) {
				if ((login.get(i).getName().equals(username) || login
						.get(i).getEmail().equals(username))
						&& login.get(i).getPassword().equals(password)) {
				
					
					if (login.get(i).getType().equals("Admin") && role.equals("1")) {
						session.setAttribute("login", login.get(i));
						request.getRequestDispatcher("Admin_Home.jsp").forward(request, response);
					} else if ((login.get(i).getType().equals("Presenter") || login.get(i).getType().equals("Admin"))&& role.equals("2")) {
						session.setAttribute("login", login.get(i));
						response.sendRedirect("Presenter_Home.jsp");
					} else if ((login.get(i).getType().equals("Attendee")|| login.get(i).getType().equals("Admin")) && role.equals("3")) {
						session.setAttribute("login", login.get(i));
						response.sendRedirect("Attendees.jsp");
					}
					else{
						request.setAttribute("AccessError", "You dont have Access to This Page");
						request.setAttribute("param", role);
						request.getRequestDispatcher("loginsignup.jsp").forward(request, response);
					}
				}
				

			}
		} catch (FileNotFoundException e) {
		
			e.printStackTrace();
		}

	}

}
