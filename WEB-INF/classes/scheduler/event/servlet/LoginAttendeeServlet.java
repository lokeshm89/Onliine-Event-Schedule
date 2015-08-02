package scheduler.event.servlet;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import scheduler.event.entity.LoginDo;


public class LoginAttendeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginAttendeeServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<LoginDo> loginDo = new ArrayList<LoginDo>();
		String id=request.getParameter("name");
		String role=request.getParameter("role");
		HttpSession session = request.getSession(true); 
		
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
			loginDo.add(ns);
		}
		if(id!=null)
		{
			BufferedWriter  output=null;
			try{
			output = new BufferedWriter(new FileWriter("C:\\apache-tomcat-7.0.34\\webapps\\ScheduleEvent\\Files\\LoginCredentails.txt"));
			
		for(int k=0;k<loginDo.size();k++)
		{
			if(loginDo.get(k).getId().equals(id))
			{
				loginDo.remove(k);
				k=k-1;
			}
			else{
		output.write(Integer.toString(k+1)+":"+loginDo.get(k).getName()+":"+loginDo.get(k).getLastName()+":"+loginDo.get(k).getEmail()+":"+loginDo.get(k).getType()+":"+loginDo.get(k).getPassword());
		output.newLine();
			}
		
		}
			
			}catch(Throwable e)
		{
			System.out.println("inside the catch bock");
			e.printStackTrace();
		}
		finally{
			output.close();	
		}
		}
			
		List<LoginDo> attendeelist=new ArrayList<LoginDo>();
		List<LoginDo> Presenterlist=new ArrayList<LoginDo>();
		for(int j=0;j< loginDo.size();j++){
			
		
			if(loginDo.get(j).getType().equals("Attendee"))
			{
				attendeelist.add(loginDo.get(j));
			}
			if(loginDo.get(j).getType().equals("Presenter"))
			{
				Presenterlist.add(loginDo.get(j));
			}
}
		if(role.equals("1"))
		{
			request.setAttribute("role", role);
		request.setAttribute("list", attendeelist);
		request.setAttribute("Type", session.getAttribute("type"));
		request.getRequestDispatcher("ViewAttendee.jsp").forward(request, response);
		}
		if(role.equals("2"))
		{
			request.setAttribute("role", role);
		request.setAttribute("list", Presenterlist);
		request.setAttribute("Type", session.getAttribute("type"));
		request.getRequestDispatcher("ViewPresenter.jsp").forward(request, response);
		}
			
				

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
}
