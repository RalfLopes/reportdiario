/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conectadb;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author t7249320
 */
public class loginDao extends conectadb {

    public boolean logar(Funcionario func) throws ClassNotFoundException {
        // VARIAVEL ONDE SE PREPARA A CONFIRMAÇÃO NO BANCO ( STATEMENT == CONFIRMAÇÃO )
        Statement stm = null;
        Connection conn = null;
        String senha = "";
        String login = "";

        String sql = "SELECT * FROM logon where id='" + 2+"'";
        conn = conectadb.conetaBanco();
        try {

            // cada um stm.setxxx referencia a variavel seu tipo e a ordem em que foi alocada no INSERT DO BD COMO ACIMA
            stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery(sql);

            while (rs.next()) {

                //Retrieve by column name
                login = rs.getString("usuario");
                senha = rs.getString("senha");

                //Display values
                System.out.print("User trazido do banco: " + login);
            }

            // EXECUTAR CONSULTA
            stm.close();
            conectadb.fechaConexão(conn);

        } catch (SQLException e) {
            System.out.println("Erro de consulta " + e.getMessage());
        } catch (NullPointerException ex) {
            System.out.println("varivel nula" + ex.getMessage());

        }
        if (login.equalsIgnoreCase(func.getLogin()) && (senha.equalsIgnoreCase("123"))) {
            return true;
        } else {
            return false;
        }

    }
}
