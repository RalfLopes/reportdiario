/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conectadb;

import dados.Funcionario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author T7249320
 */
public class cadastroDAO extends conectadb {
    
    public  void cadFunc(Funcionario func) throws ClassNotFoundException{
          Connection conn = null;
        PreparedStatement pst = null;
        conn = conectadb.conetaBanco();
        
        
        String sql = "insert into logon values (null,'" + func.getNome() + "','" + func.getLogin() + "','"+func.getSenha()+"','"+1+"','"+1+"',null)";

        try {
            pst = conn.prepareStatement(sql);
            pst.execute();

            System.out.println("cadastrado com sucesso ");
            conectadb.fechaConexão(conn);
        } catch (SQLException ex) {
            System.out.println("erro de conexão " + ex.getMessage());
        } catch (NullPointerException ex) {
            System.out.println("Variavel nula " + ex.getMessage());
        }

              
    }
    
}
