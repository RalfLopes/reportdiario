/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsControlls;

import dados.Funcionario;
import conectadb.loginDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jboss.weld.servlet.SessionHolder;

/**
 *
 * @author t7249320
 */
public class loginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    boolean acesso = false;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
        
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
        processRequest(request, response);
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

        Funcionario f = new Funcionario();
        loginDao login = new loginDao();
        request.setAttribute("acesso", null);
        f.setLogin(request.getParameter("login"));
        f.setSenha(request.getParameter("senha"));
        
        
        try {
            if (login.logar(f) == 1) {
                request.setAttribute("tipo", "1");
                
                 request.setAttribute("user", f.getNome());
                 request.setAttribute("log", f.getLogin());
                
            request.getRequestDispatcher("mantemLog.jsp").forward(request, response);

                
            } else if (login.logar(f) == 2) {
               request.setAttribute("tipo", "2");
                
                 request.setAttribute("user", f.getNome());
                 request.setAttribute("log", f.getLogin());

                request.getRequestDispatcher("mantemLog.jsp").forward(request, response);

            } else {
                System.out.println("Usuario não autorizado");
                response.sendRedirect("index.jsp");
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        processRequest(request, response);

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
