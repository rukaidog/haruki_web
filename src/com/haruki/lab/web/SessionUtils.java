/**
 * haruki
 */
package com.haruki.lab.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author mid1672
 *
 */
public class SessionUtils {

	
	/**
	 * @param req
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public static boolean checkUserLogin(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession s = req.getSession(false);
		if(s == null || s.getAttribute("username") == null) {
			response.sendRedirect("home.jsp");
			return false;
		}
		return true;
	}
	 
}
