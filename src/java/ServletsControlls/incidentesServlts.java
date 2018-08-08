/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsControlls;

import conectadb.incidenteDao;
import conectadb.relatorioDao;
import dados.Funcionario;
import dados.Sistema;
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
public class incidentesServlts extends HttpServlet {

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

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

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

        request.setCharacterEncoding("UTF-8");

        Sistema sist = new Sistema();
        Funcionario f = new Funcionario();

        System.out.println("teste correncia- " + request.getParameter("ocorrencia"));
        incidenteDao inciDao = new incidenteDao();
        request.setCharacterEncoding("UTF8");
        sist.setOcorrencia(request.getParameter("ocorrencia"));
        sist.setSistema(request.getParameter("sistema"));
        f.setLogin(request.getParameter("log"));
        sist.setChamado(Integer.parseInt(request.getParameter("chamado")));
        sist.setAbertura(request.getParameter("dateI"));
        sist.setHoraI(request.getParameter("horaI"));

        sist.setAbertura(request.getParameter("dateI"));
        relatorioDao rel = new relatorioDao();
        try {

            inciDao.criarIcidente(sist, f);
            rel.SomaIncidentes();
            response.sendRedirect("dashBoard.jsp");
        } catch (ClassNotFoundException | SQLException | NullPointerException | ParseException ex) {
            Logger.getLogger(incidentesServlts.class.getName()).log(Level.SEVERE, null, ex);
        }

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
