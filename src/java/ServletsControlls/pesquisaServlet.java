/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsControlls;

import conectadb.relatorioDao;
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author t7249320
 */
public class pesquisaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet pesquisaServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet pesquisaServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        relatorioDao rel = new relatorioDao();
        String inicio = request.getParameter("inicio");
        String fim = request.getParameter("fim");
        String sistema = request.getParameter("sistema");
        System.out.println("inicio- "+request.getParameter("inicio")+" e fim "+ request.getParameter("fim") + sistema);

        try {
            rel.searchIncidents( inicio,  fim, sistema);
//            rel.SomaIncidentes();
            Thread.sleep(700);
            response.sendRedirect("grafico.jsp");
        } catch (ClassNotFoundException | SQLException | InterruptedException | ParseException ex) {
            Logger.getLogger(pesquisaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
