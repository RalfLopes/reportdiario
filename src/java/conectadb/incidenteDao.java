/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conectadb;

import ServletsControlls.incidentesServlts;
import dados.Funcionario;
import dados.Sistema;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author t7249320
 */
public class incidenteDao extends conectadb {

    public void criarIcidente(Sistema sist, Funcionario f) throws ClassNotFoundException, SQLException, ParseException {

        Connection conn = null;
        PreparedStatement pst = null;
        conn = conectadb.conetaBanco();
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");

        Timestamp time = null;
        try {
            long date = formato.parse(sist.getAbertura()).getTime();

            time = new Timestamp(date);

        } catch (ParseException ex) {
            Logger.getLogger(incidentesServlts.class.getName()).log(Level.SEVERE, null, ex);
        }

        String sql = "insert into incidente values (null,'" + sist.getSistema() + "','" + sist.getOcorrencia() + "','" + time + "',1,'" + sist.getChamado() + "',null,'" + sist.getHoraI() + ":00" + "', '00:00:00',null,'" + f.getLogin() + "',null,null)";
        String coments = "insert into comentario values (null,'" + "' '" + "','" + sist.getChamado() + "')";
        try {
            pst = conn.prepareStatement(sql);
            pst.execute();

            System.out.println("Input incidente realizado com sucesso ");

        } catch (SQLException ex) {
            System.out.println("erro de conexão " + ex.getMessage());
        } catch (NullPointerException ex) {
            System.out.println("Variavel nula " + ex.getMessage());
        }

        try {
            pst = conn.prepareStatement(coments);
            pst.execute();

            System.out.println("coment incidente realizado com sucesso ");

        } catch (SQLException ex) {
            System.out.println("erro de conexão " + ex.getMessage());
        } catch (NullPointerException ex) {
            System.out.println("Variavel nula " + ex.getMessage());
        }

    }

    public List<Sistema> listaIncidentes() throws ClassNotFoundException {
        Statement stm = null;
        Connection conn = null;
        String senha = "";
        String login = "";

        String sql = "SELECT * FROM incidente where status='" + 1 + "or"+3+"' order by dataInicio";
        conn = conectadb.conetaBanco();
        List<Sistema> ocorrencias = new ArrayList<>();
        try {

            // cada um stm.setxxx referencia a variavel seu tipo e a ordem em que foi alocada no INSERT DO BD COMO ACIMA
            stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery(sql);

            while (rs.next()) {
                Sistema sist = new Sistema();
                sist.setSistema(rs.getString("Name_sys"));
                sist.setOcorrencia(rs.getString("ocorrencia"));
                sist.setAbertura(rs.getString("dataInicio"));
                sist.setHoraI(rs.getString("horaInicio"));
                sist.setChamado(rs.getInt("chamado"));

                sist.setStatus("Aberto");

                ocorrencias.add(sist);
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

    public List<Sistema> relatorioIncidentes(String ini, String fim, String sistema) throws ClassNotFoundException, ParseException {
        Statement stm = null;
        Connection conn = null;
        String senha = "";
        String login = "";

        String sql = "SELECT * FROM incidente order by dataInicio";
        conn = conectadb.conetaBanco();
        List<Sistema> ocorrencias = new ArrayList<>();

        java.sql.Timestamp sq = null;
        Date date = null;

        try {

            // cada um stm.setxxx referencia a variavel seu tipo e a ordem em que foi alocada no INSERT DO BD COMO ACIMA
            stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery(sql);

            while (rs.next()) {
                Sistema sist = new Sistema();
                sist.setSistema(rs.getString("Name_sys"));
                sist.setOcorrencia(rs.getString("ocorrencia"));

                sist.setAbertura(rs.getString("dataInicio"));

                sist.setChamado(rs.getInt("chamado"));

                if (rs.getInt("status") == 1) {
                    sist.setStatus("Aberto");
                    sist.setFechamento(" ");
                    sist.setHoraF(" ");

                } else {
                    sist.setStatus("Fechado");
                    sist.setFechamento(rs.getString("dataFim"));
                    sist.setHoraF(rs.getString("horafim"));
                }

                ocorrencias.add(sist);
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

    public List<Sistema> getIncident(int num) throws ClassNotFoundException {
        Sistema sist = new Sistema();
        Statement stm = null;
        Connection conn = null;
        String senha = "";
        String login = "";

        String sql = "SELECT * FROM incidente where chamado='" + num + "'";
        String sql2 = "SELECT * FROM comentario where cod_chamado='" + num + "'";
        conn = conectadb.conetaBanco();
        List<Sistema> ocorrencias = new ArrayList<>();
        List<String> teste = new ArrayList<>();
        try {

            // cada um stm.setxxx referencia a variavel seu tipo e a ordem em que foi alocada no INSERT DO BD COMO ACIMA
            stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery(sql);

            while (rs.next()) {

                sist.setSistema(rs.getString("Name_sys"));
                sist.setOcorrencia(rs.getString("ocorrencia"));
                sist.setAbertura(rs.getString("dataInicio"));
                sist.setHoraI(rs.getString("horaInicio"));
                sist.setChamado(rs.getInt("chamado"));
                if (rs.getInt("status") == 1) {
                    sist.setStatus("Aberto");
                    sist.setFechamento(" ");
                } else {
                    sist.setStatus("Fechado");
                    sist.setFechamento(rs.getString("dataFim"));
                }
            }

            // ===================================================================================//
            stm = conn.prepareStatement(sql2);
            rs = stm.executeQuery(sql2);
            while (rs.next()) {

                sist.setObservações(rs.getString("coment"));

            }

            ocorrencias.add(sist);
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

    public void fecharIncidente(Sistema sist) throws ClassNotFoundException, ParseException {

        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Timestamp time = null;
        try {
            long date = formato.parse(sist.getFechamento()).getTime();
            System.out.println("date- " + date);
            time = new Timestamp(date);
            System.out.println("timestamp- " + time);
        } catch (ParseException ex) {
            Logger.getLogger(incidentesServlts.class.getName()).log(Level.SEVERE, null, ex);
        }

        Connection conn = null;
        PreparedStatement pst = null;
        Statement stm = null;
//        System.out.println("saida" + num);
        String sql = "UPDATE incidente SET status ='" + 2 + "',dataFim ='" + time + "',horaFim='" + sist.getHoraF() + ":00',volume='" + Integer.parseInt(sist.getVolume()) + "' where chamado='" + sist.getChamado() + "'";
        String coments = "UPDATE comentario SET coment='" + sist.getObservações() + "' where cod_chamado='" + sist.getChamado() + "'";
        conn = conectadb.conetaBanco();

        try {

            // cada um stm.setxxx referencia a variavel seu tipo e a ordem em que foi alocada no INSERT DO BD COMO ACIMA
            stm = conn.createStatement();
            stm.executeUpdate(sql);

        } catch (SQLException e) {
            System.out.println("Erro de consulta " + e.getMessage());
        } catch (NullPointerException ex) {
            System.out.println("varivel nula" + ex.getMessage());

        }
        try {

            stm.executeUpdate(coments);
            stm.close();
            System.out.println("Input descrição realizado com sucesso ");
            conectadb.fechaConexão(conn);
        } catch (SQLException ex) {
            System.out.println("erro de conexão " + ex.getMessage());
        } catch (NullPointerException ex) {
            System.out.println("Variavel nula " + ex.getMessage());
        }

    }

    public void atualizarIncidente(Sistema sist) throws ClassNotFoundException {

        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");

        Timestamp time = null;
        try {
            long date = formato.parse(sist.getAbertura()).getTime();

            time = new Timestamp(date);

        } catch (ParseException ex) {
            Logger.getLogger(incidentesServlts.class.getName()).log(Level.SEVERE, null, ex);
        }

        Connection conn = null;
        PreparedStatement pst = null;
        Statement stm = null;
        String sql = "UPDATE incidente SET log_alt ='" + 3 + "',dataInicio ='" + time + "' where chamado='" + sist.getChamado() + "'";
        String coments = "UPDATE comentario SET coment='" + sist.getObservações() + "' where cod_chamado='" + sist.getChamado() + "'";
        conn = conectadb.conetaBanco();

       try {

            // cada um stm.setxxx referencia a variavel seu tipo e a ordem em que foi alocada no INSERT DO BD COMO ACIMA
            stm = conn.createStatement();
            stm.executeUpdate(sql);

        } catch (SQLException e) {
            System.out.println("Erro de consulta " + e.getMessage());
        } catch (NullPointerException ex) {
            System.out.println("varivel nula" + ex.getMessage());

        }
        try {

            stm.executeUpdate(coments);
            stm.close();
            System.out.println("Input descrição realizado com sucesso ");
            conectadb.fechaConexão(conn);
        } catch (SQLException ex) {
            System.out.println("erro de conexão " + ex.getMessage());
        } catch (NullPointerException ex) {
            System.out.println("Variavel nula " + ex.getMessage());
        }

    }

}
