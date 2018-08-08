/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conectadb;

import dados.Funcionario;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author t7249320
 */
public class loginDao extends conectadb {

    public int logar(Funcionario func) throws ClassNotFoundException {
        // VARIAVEL ONDE SE PREPARA A CONFIRMAÇÃO NO BANCO ( STATEMENT == CONFIRMAÇÃO )
        Statement stm = null;
        Connection conn = null;
        String senha = "";
        String login = "";

        String sql = "SELECT * FROM logon where usuario='" + func.getLogin() + "'";
        conn = conectadb.conetaBanco();
        try {

            // cada um stm.setxxx referencia a variavel seu tipo e a ordem em que foi alocada no INSERT DO BD COMO ACIMA
            stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery(sql);

            while (rs.next()) {

                //Retrieve by column name
                login = rs.getString("usuario");
                senha = rs.getString("senha");
                func.setNome(rs.getString("nome"));
                
                func.setNivel(rs.getInt("nivel"));
                //Display values
            

            }

            // EXECUTAR CONSULTA
            stm.close();
            conectadb.fechaConexão(conn);

        } catch (SQLException e) {
            System.out.println("Erro de consulta " + e.getMessage());
        } catch (NullPointerException ex) {
            System.out.println("varivel nula" + ex.getMessage());

        }
        if (login.equalsIgnoreCase(func.getLogin()) && (senha.equalsIgnoreCase(func.getSenha())) && (func.getNivel() == 1)) {
            return 1;
        }
        if (login.equalsIgnoreCase(func.getLogin()) && (senha.equalsIgnoreCase(func.getSenha())) && (func.getNivel() == 2)) {
            return 2;
        } else {
            return 0;
        }

    }
}
