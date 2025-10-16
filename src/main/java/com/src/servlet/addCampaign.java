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

@WebServlet("/addCampaign")
public class addCampaign extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public addCampaign() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1️⃣ Get form data
        int charityId = Integer.parseInt(request.getParameter("charityId"));  // <-- New
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));
        LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));

        // 2️⃣ Create Campaign object
        Campaign campaign = new Campaign();
        campaign.setCharityId(charityId); // <-- Set charity ID
        campaign.setCampaignName(title);
        campaign.setDescription(description);
        campaign.setStartDate(startDate);
        campaign.setEndDate(endDate);

        // 3️⃣ Call service layer
        CampaignServiceInterface service = new CampaignServiceImpl();
        boolean inserted = service.addCampaign(campaign);

        // 4️⃣ Redirect or show error
        if (inserted) {
            response.sendRedirect(request.getContextPath() + "/Campaignmain.jsp");
        } else {
            response.getWriter().println("<h3>❌ Failed to add campaign. Please try again.</h3>");
        }
    }
}
