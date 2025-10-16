package com.src.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Objects;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.src.model.Donor;
import com.src.service.DonorServiceImpl;
import com.src.service.DonorServiceInterface;

@WebServlet("/loginDonor")
public class loginDonor extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        DonorServiceInterface dsi = new DonorServiceImpl();
        List<Donor> donors = dsi.getAllDonors();

        Donor loggedDonor = null;
        for (Donor d : donors) {
            if (Objects.equals(d.getEmail(), email) && Objects.equals(d.getPhone(), phone)) {
                loggedDonor = d;
                break;
            }
        }

        if (loggedDonor != null) {
            HttpSession session = request.getSession();
            session.setAttribute("donorEmail", loggedDonor.getEmail());
            session.setAttribute("donorId", loggedDonor.getDonorId());
            response.sendRedirect("Charitymain.jsp");
        } else {
            response.sendRedirect("Donormain.jsp?msg=Invalid+email+or+phone");
        }
    }
}
