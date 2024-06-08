package com.mycompany.resumesmongodbclass;

import com.mycompany.resumesmongodbclass.infrastructure.ResumesMongoDB;
import com.mycompany.resumesmongodbclass.models.CV;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Usuario
 */
@WebServlet("/index")
public class SvResumesMongoDB extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        ResumesMongoDB resumesMongoDb = new ResumesMongoDB();
        String idCv = request.getParameter("id");
        String actionCv = request.getParameter("actionCv");

        List<CV> lstCvs = new ArrayList<>();

        if (idCv == null || idCv.isBlank() || idCv.isEmpty()) {
            if (actionCv != null && actionCv.equals("Create")) {
                request.getRequestDispatcher("/cvForm.jsp").forward(request, response);
            } else {
                lstCvs = resumesMongoDb.getAllCvsFromMongo();

                request.setAttribute("cvs", lstCvs);
                request.getRequestDispatcher("/resumes.jsp").forward(request, response);
            }
        } else {
            if (actionCv == null) {
                CV cv = resumesMongoDb.getCvById(idCv);

                request.setAttribute("cv", cv);
                request.getRequestDispatcher("/cvDetails.jsp").forward(request, response);
            } else if (actionCv.equals("Edit")) {
                CV cv = resumesMongoDb.getCvById(idCv);

                request.setAttribute("cv", cv);
                request.getRequestDispatcher("/cvForm.jsp").forward(request, response);
            } else if (actionCv.equals("Delete")) {

                resumesMongoDb.deleteCvById(idCv);

                List<CV> cvs = resumesMongoDb.getAllCvsFromMongo();

                request.setAttribute("cvs", cvs);
                request.getRequestDispatcher("/resumes.jsp").forward(request, response);
            }
        }
    }

    protected boolean isValidCv(HttpServletRequest request) {

        String id = request.getParameter("inputId");
        String name = request.getParameter("inputName");
        String email = request.getParameter("inputEmail");
        String phone = request.getParameter("inputPhone");
        String address = request.getParameter("inputAddress");
        String photo = request.getParameter("inputPhoto");
        String skills = request.getParameter("inputSkills");
        String experience = request.getParameter("inputExperience");

        if (id == null
                || !id.matches("^((\\d{8})|(\\d{10})|(\\d{11})|(\\d{6}-\\d{5}))?$")) {
            return false;
        }

        if (name == null || name.isBlank()) {
            return false;
        }

        if (email == null || !email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            return false;
        }

        if (phone == null) {
            return false;
        }

        if (address == null || address.isBlank()) {
            return false;
        }

        if (photo == null || !photo.matches("^(https?)://[^\\s/$.?#].[^\\s]*$")) {
            return false;
        }

        if (skills == null || skills.isBlank()) {
            return false;
        }

        if (experience == null || experience.isBlank()) {
            return false;
        }
        return true;
    }

    protected void saveCv(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isValidCv(request)) {
            request.setAttribute("errorMessage", "Invalid input. Please correct the errors and try again.");
            request.getRequestDispatcher("/cvForm.jsp").forward(request, response);
            return;
        }
        CV cv = new CV();

        cv.setId(request.getParameter("inputId"));
        cv.setName(request.getParameter("inputName"));
        cv.setEmail(request.getParameter("inputEmail"));
        cv.setPhone(request.getParameter("inputPhone"));
        cv.setAddress(request.getParameter("inputAddress"));
        cv.setPhoto(request.getParameter("inputPhoto"));
        cv.setSkills(request.getParameter("inputSkills"));
        cv.setExperience(request.getParameter("inputExperience"));
        System.out.println(cv.getSkills());
        System.out.println(cv.getExperience());
        ResumesMongoDB resumesDb = new ResumesMongoDB();

        if (request.getParameter("action").equals("Edit")) {
            resumesDb.updateCv(cv);
        } else {
            resumesDb.createCv(cv);
        }

        request.setAttribute("cv", cv);
        request.getRequestDispatcher("/cvDetails.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            processRequest(request, response);
        } catch (Exception exe) { 
           response.sendRedirect("/ResumesMongoDBClass/500.html");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        saveCv(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
