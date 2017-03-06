package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.UserDaoHandle;

/**
 * Servlet implementation class CheckUsernameUnique
 */
@WebServlet("/CheckUsernameUnique")
public class CheckUsernameUnique extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDaoHandle userDao = new UserDaoHandle();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckUsernameUnique() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		boolean result = false;
 		if(userDao.CheckUserExists(username)){
			result = true;
		}
 		Gson gson = new Gson();
 		String json=gson.toJson(result);
		response.getWriter().write(json);
	}

}
