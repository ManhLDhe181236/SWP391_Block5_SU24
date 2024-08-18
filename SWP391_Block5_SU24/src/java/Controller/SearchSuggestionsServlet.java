/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DBConnect;

/**
 *
 * @author Admin
 */
public class SearchSuggestionsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchSuggestionsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchSuggestionsServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
            throws ServletException, IOException {
        String query = request.getParameter("query");
        List<String> suggestions = new ArrayList<>();

        // Assuming you have a DBConnect class to manage database connection
        DBConnect dbConnect = new DBConnect();
        Connection conn = dbConnect.conn;

        if (query != null && !query.trim().isEmpty()) {
            String sql = "SELECT p.ProductName, pi.ImageURL FROM Products p LEFT JOIN ProductImages pi ON p.ImageID = pi.ImageID WHERE p.ProductName LIKE ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, "%" + query + "%");
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    String productName = rs.getString("ProductName");
                    String imageURL = rs.getString("ImageURL");
                    // Construct an HTML snippet for each suggestion
                    String suggestionHTML = "<div class='dropdown-item d-flex align-items-center'>" +
                                            "<img src='" + imageURL + "' alt='" + productName + "' class='img-thumbnail' style='width: 50px; height: 50px; margin-right: 10px;'>" +
                                            "<span>" + productName + "</span></div>";
                    suggestions.add(suggestionHTML);
                }

                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Output the suggestions as HTML
        for (String suggestion : suggestions) {
            out.println(suggestion);
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
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}