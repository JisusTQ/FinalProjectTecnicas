/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.productsmongodbclass;

import com.mycompany.productsmongodbclass.infrastructure.ProductsMongoDB;
import com.mycompany.productsmongodbclass.models.Product;
import java.io.IOException;
import java.io.PrintWriter;
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
public class SvProductsMongoDB extends HttpServlet {

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
        ProductsMongoDB productsMongoDb = new ProductsMongoDB();
        String idProduct = request.getParameter("idProduct");
        String actionProduct = request.getParameter("actionProduct");

        List<Product> lstProducts = new ArrayList<>();

        if (idProduct == null || idProduct.isBlank() || idProduct.isEmpty()) {

            lstProducts = productsMongoDb.getAllProductsFromMongo();

            request.setAttribute("products", lstProducts);
            request.getRequestDispatcher("/products.jsp").forward(request, response);
        } else {
            if (actionProduct == null) {
                Product product = productsMongoDb.getProductById(Integer.parseInt(idProduct));

                request.setAttribute("product", product);
                request.getRequestDispatcher("/productDetails.jsp").forward(request, response);
            } else if (actionProduct.equals("Delete")) {

                productsMongoDb.deleteProductById(Integer.parseInt(idProduct));

                List<Product> products = productsMongoDb.getAllProductsFromMongo();

                request.setAttribute("products", products);
                request.getRequestDispatcher("/products.jsp").forward(request, response);

            }
        }
    }

    protected void saveProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Product product = new Product();
        product.setId(Integer.parseInt(request.getParameter("inputId")));
        product.setTitle(request.getParameter("inputTitle"));
        product.setPrice(Integer.parseInt(request.getParameter("inputPrice")));
        product.setDiscountPercentage(Double.parseDouble(request.getParameter("inputDiscount")));
        product.setRating(request.getParameter("inputRating"));
        product.setBrand(request.getParameter("inputBrand"));
        product.setCategory(request.getParameter("inputCategory"));
        product.setDescription(request.getParameter("inputDescription"));

        ProductsMongoDB productsDb = new ProductsMongoDB();

        productsDb.updateProduct(product);
        List<Product> products = productsDb.getAllProductsFromMongo();

        request.setAttribute("products", products);
        request.getRequestDispatcher("/products.jsp").forward(request, response);
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
             response.sendRedirect("/ProductsMongoDBClass/500.html");
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
        saveProduct(request, response);
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
