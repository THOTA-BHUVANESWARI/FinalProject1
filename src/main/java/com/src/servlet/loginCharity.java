package com.src.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.src.model.Charity;
import com.src.service.CharityServiceImpl;
import com.src.service.CharityServiceInterface;

@WebServlet("/loginCharity")
public class loginCharity extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String regno = request.getParameter("regno");
        String phone = request.getParameter("phone");

        CharityServiceInterface csi = new CharityServiceImpl();
        Charity charity = csi.getCharityByRegNoAndPhone(regno, phone);

        if (charity != null) {
            HttpSession session = request.getSession();
            session.setAttribute("charityId", charity.getCharityId());
            session.setAttribute("charityName", charity.getName());
            session.setMaxInactiveInterval(600); // 10 mins inactivity = logout
            response.sendRedirect("charityDashboard.jsp");
        } else {
            response.sendRedirect("CharityLogin.jsp?error=Invalid+credentials");
        }
    }
}
