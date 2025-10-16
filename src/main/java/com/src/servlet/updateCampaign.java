package com.src.servlet;

import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.src.model.Campaign;
import com.src.service.CampaignServiceImpl;
import com.src.service.CampaignServiceInterface;

@WebServlet("/updateCampaign")
public class updateCampaign extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public updateCampaign() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // 1️⃣ Get form data
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));
            LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));

            // Optional: get charityId if you want to allow updating it
            String charityIdStr = request.getParameter("charityId");
            int charityId = (charityIdStr != null && !charityIdStr.isEmpty()) 
                                ? Integer.parseInt(charityIdStr) 
                                : 0;

            // 2️⃣ Create Campaign object
            Campaign campaign = new Campaign();
            campaign.setCampaignId(id);
            campaign.setCampaignName(title);
            campaign.setDescription(description);
            campaign.setStartDate(startDate);
            campaign.setEndDate(endDate);
            if (charityId > 0) {
                campaign.setCharityId(charityId);
            }

            // 3️⃣ Call service layer
            CampaignServiceInterface service = new CampaignServiceImpl();
            boolean updated = service.updateCampaign(campaign);

            // 4️⃣ Redirect or show error
            if (updated) {
                response.sendRedirect(request.getContextPath() + "/Campaignmain.jsp");
            } else {
                response.getWriter().println("<h3>❌ Failed to update campaign. Please try again.</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>❌ Error: " + e.getMessage() + "</h3>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Optional: Forward GET request to JSP
        int id = Integer.parseInt(request.getParameter("id"));
        CampaignServiceInterface service = new CampaignServiceImpl();
        Campaign campaign = service.getCampaignById(id);

        request.setAttribute("campaign", campaign);
        request.getRequestDispatcher("/updateCampaign.jsp").forward(request, response);
    }
}
