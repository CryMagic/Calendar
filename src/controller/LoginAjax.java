package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.UserDaoHandle;

/**
 * Servlet implementation class LoginAjax
 */
@WebServlet("/LoginAjax")
public class LoginAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDaoHandle userDao = new UserDaoHandle();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String user = request.getParameter("username");
		String pass = request.getParameter("password");
		String result = "";
		try {
			if(userDao.Login(user,pass)) {
				if(userDao.CheckUser(user, pass)){
					result = "admin";
				}
				else{
					result = "user";
				}
				HttpSession session = request.getSession();
				session.setAttribute("username", user);
				String fullname = userDao.getFullName(user);
				session.setAttribute("fullname", fullname);
			} else {
				result = "fail";
			}
			Gson gson=new Gson();
			String json=gson.toJson(result);
			response.getWriter().write(json);
			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
