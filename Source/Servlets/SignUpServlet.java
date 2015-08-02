package scheduler.event.servlet;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import scheduler.event.entity.LoginDo;



public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SignUpServlet() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String txt_FirstName = request.getParameter("txt_FirstName");
		String txt_LastName = request.getParameter("txt_LastName");
		String txt_EmailID = request.getParameter("txt_EmailID");
		String sel_Role = request.getParameter("sel_Role");
		String pwd_Password = request.getParameter("pwd_Password");
		String pwd_RetypePassword = request.getParameter("pwd_RetypePassword");
		System.out.println("txt_EmailID"+txt_EmailID);
		ArrayList<LoginDo> login =  getTextData ();
		boolean error=false;
		if(sel_Role.equals("Admin"))
		{
		 request.setAttribute("param", "1");
		}
		else if(sel_Role.equals("Presenter"))
		{request.setAttribute("param", "2");
			
		}
		else{
			request.setAttribute("param", "3");
		}
		if(!pwd_Password.equals(pwd_RetypePassword))
		{
			request.setAttribute("PasserrorMessage", "Password is  Not Matching");
			error=true;
			request.getRequestDispatcher("SignUp.jsp").forward(request, response);
			
		}
		
		else if (sel_Role.equals("Admin"))
		{
		
			int j=0;
			 for(int i=0;i<login.size();i++)
			   {
				 if(login.get(i).getType().equals("Admin"))
				 {
					 j=j+1;
				 }
			   }
			
		}
		if(!error){
		BufferedWriter  output=null;
		String  id=null;
		if(login.size() ==0)
		{
			id="1";
		}
		else
		{
			 int k=Integer.parseInt(login.get(login.size()-1).getId());
			 k=k+1;
			id=Integer.toString(k) ;
		}
		
		try{
		output = new BufferedWriter(new FileWriter("C:\\apache-tomcat-7.0.34\\webapps\\ScheduleEvent\\Files\\LoginCredentails.txt", true));
		output.write(id+":"+txt_FirstName+":"+txt_LastName+":"+txt_EmailID+":"+sel_Role+":"+pwd_Password);
		output.newLine();
		
		}catch(Throwable e)
		{
			System.out.println("inside the catch bock");
			e.printStackTrace();
		}
		finally{
			output.close();	
		}
	
		request.getRequestDispatcher("loginsignup.jsp").forward(request, response);
	}
	}
		public ArrayList<LoginDo> getTextData ()
		{
			ArrayList<LoginDo> login = new ArrayList<LoginDo>(); 
			 try {
				   BufferedReader inFile = new BufferedReader (new FileReader("C:\\apache-tomcat-7.0.34\\webapps\\ScheduleEvent\\Files\\LoginCredentails.txt"));
				   String inputLine;

				   while ((inputLine = inFile.readLine())!=null) { 
				      if(inputLine.isEmpty()) continue; 
				      LoginDo ns = new LoginDo();
				      String[] Logincred = inputLine.split(":"); 
				      ns.setId(Logincred[0]);
				      ns.setName(Logincred[1]);
				      ns.setLastName(Logincred[2]);
				      ns.setEmail(Logincred[3]);
				      ns.setType(Logincred[4]);
				      ns.setPassword(Logincred[5]);
				      login.add(ns);
				}
			}catch(FileNotFoundException e)
			{
				e.printStackTrace();
			} catch (IOException e) {

				e.printStackTrace();
			}
			return login;
		}

}
