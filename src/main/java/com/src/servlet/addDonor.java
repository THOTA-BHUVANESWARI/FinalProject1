package com.src.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.src.model.Donor;
import com.src.service.DonorServiceImpl;
import com.src.service.DonorServiceInterface;

/**
 * Servlet implementation class addDonor
 */
@WebServlet("/addDonor")
public class addDonor extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public addDonor() {
        super();
    }

    /**
     * Handles GET requests
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("phone");
        String address = request.getParameter("address");

        // Create a Donor object and set values
        Donor donor = new Donor();
        donor.setDonorName(name);
        donor.setEmail(email);
        donor.setPhone(mobile);
        donor.setAddress(address);

        // Service call
        DonorServiceInterface service = new DonorServiceImpl();
        boolean isAdded = service.addDonor(donor);

        // Redirect or show message based on result
        if (isAdded) {
            response.sendRedirect("Donormain.jsp"); // redirect to donor list page
        } else {
            response.getWriter().println("<h3>Failed to add donor. Please try again.</h3>");
        }
    }

    /**
     * Handles POST requests (calls doGet)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
