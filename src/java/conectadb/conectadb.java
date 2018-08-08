package conectadb;

import java.nio.charset.Charset;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public abstract class conectadb {

    /**
     * @param args the command line arguments
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    public static Connection conetaBanco () throws ClassNotFoundException{

        String driver = "com.mysql.jdbc.Driver"; //Classe do driver JDBC
        String str_conn = "jdbc:mysql://localhost:3306/hitss" + "?useSSL=true";  //URL de conexão
        String usuario = "root"; //Usuário do banco
        String senha = "S!ST&M@DMIN"; //Senha de conexão
        Charset utf8charset = Charset.forName("UTF-8");
        Class.forName(driver);//Carrega o driver
        
        Connection conn = null;
        try {
            conn = (Connection) DriverManager.getConnection(str_conn, usuario, senha);
            System.out.println("Conexão realizada com sucesso");
        } catch (SQLException ex) {
            Logger.getLogger(conectadb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;

    }
    
    public static void fechaConexão( Connection conn){
        
        try {
            conn.close();
            System.out.println("Conexão encerrada");
        } catch (SQLException ex) {
       System.out.println("não foi possivel fechar conexão com banco de dados"+ ex.getMessage());
        }
        
    }
    
    
}
