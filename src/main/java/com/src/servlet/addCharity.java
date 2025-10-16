package com.src.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.src.model.Charity;
import com.src.service.CharityServiceImpl;
import com.src.service.CharityServiceInterface;

@WebServlet("/addCharity")
public class addCharity extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public addCharity() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String regno = request.getParameter("regno");
        String contact = request.getParameter("contact");
        String description = request.getParameter("description");

        Charity charity = new Charity();
        charity.setName(name);
        charity.setRegNo(regno);
        charity.setContact(contact);
        charity.setDescription(description);

        CharityServiceInterface service = new CharityServiceImpl();
        boolean added = service.addCharity(charity);

        if (added) {
            response.sendRedirect("Charitymain.jsp"); 
        } else {
            response.getWriter().println("<h3>❌ Failed to add charity. Please try again.</h3>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
