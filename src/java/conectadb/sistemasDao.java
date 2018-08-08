/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conectadb;

import dados.Sistema;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author T7249320
 */
public class sistemasDao extends conectadb {

    public List<String> relatorioSistemas() throws ClassNotFoundException {
        Statement stm = null;
        Connection conn = null;
        String senha = "";
        String login = "";

        String sql = "SELECT * FROM clarotv order by Sistema_claroTV";
        conn = conectadb.conetaBanco();
        List<String> ocorrencias = new ArrayList<>();
        try {

            // cada um stm.setxxx referencia a variavel seu tipo e a ordem em que foi alocada no INSERT DO BD COMO ACIMA
            stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery(sql);

            while (rs.next()) {
                          

                ocorrencias.add(rs.getString("Sistema_claroTV"));
            }

            // EXECUTAR CONSULTA
            stm.close();
            conectadb.fechaConexão(conn);

        } catch (SQLException e) {
            System.out.println("Erro de consulta " + e.getMessage());
        } catch (NullPointerException ex) {
            System.out.println("varivel nula" + ex.getMessage());

        }
        return ocorrencias;
    }

}
