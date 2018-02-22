/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conectadb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author t7249320
 */
public class incidenteDao extends conectadb {

    public void criarIcidente() throws ClassNotFoundException {

        Connection conn = null;
        conn = conectadb.conetaBanco();
String sql = "INSERT INTO DBUSER"
				+ "(USER_ID, USERNAME, CREATED_BY, CREATED_DATE) VALUES"
				+ "(?,?,?,?)";
        PreparedStatement pst = null;
        try {
            pst=conn.prepareStatement(sql);
        } catch (SQLException ex) {
            Logger.getLogger(incidenteDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
