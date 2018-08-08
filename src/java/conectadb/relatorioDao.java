/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conectadb;

import dados.Sistema;
import docs.Testejson;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author t7249320
 */
public class relatorioDao extends conectadb {

    public static List<Sistema> relatorioIncidentes() throws ClassNotFoundException {
        Statement stm = null;
        Connection conn = null;
        String senha = "";
        String login = "";

        String sql = "SELECT * FROM incidente order by Name_sys";
        conn = conectadb.conetaBanco();
        List<Sistema> relatotorio = new ArrayList<>();
        try {

            // cada um stm.setxxx referencia a variavel seu tipo e a ordem em que foi alocada no INSERT DO BD COMO ACIMA
            stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery(sql);

            while (rs.next()) {
                Sistema sist = new Sistema();
                sist.setSistema(rs.getString("Name_sys"));

                relatotorio.add(sist);
            }
            // EXECUTAR CONSULTA
            stm.close();
            conectadb.fechaConexão(conn);

        } catch (SQLException e) {
            System.out.println("Erro de consulta " + e.getMessage());
        } catch (NullPointerException ex) {
            System.out.println("varivel nula" + ex.getMessage());
        }
        return relatotorio;
    }

    public void SomaIncidentes() throws ClassNotFoundException, SQLException, IOException, ParseException {
        Statement stm = null;
        Connection conn = null;
        int i = 0;
        sistemasDao sDao = new sistemasDao();
        Testejson json = new Testejson();

        int tamanho = relatorioIncidentes().size();
        int cont[] = new int[tamanho];
        String nome[] = new String[tamanho];
        conn = conectadb.conetaBanco();
        List<String> incidentes = sDao.relatorioSistemas();

        for (String s : incidentes) {

            try {
                String sql = "Select count(*) from Incidente where Name_Sys='" + s + "' ";
                stm = conn.prepareStatement(sql);
                ResultSet rs = stm.executeQuery(sql);

                while (rs.next()) {

                    if (rs.getInt(1) > 0) {
                        cont[i] = rs.getInt(1);
                        nome[i] = s;

                        System.out.println("Sistema: " + nome[i] + " " + cont[i]);
                        i++;
                    }
                }
            } catch (SQLException e) {
                System.out.println("Erro de consulta " + e.getMessage());
            } catch (NullPointerException ex) {
                System.out.println("varivel nula" + ex.getMessage());
            }
        }

        stm.close();
        conectadb.fechaConexão(conn);
        json.jsonDidMount(nome, cont);
    }

    public void searchIncidents(String inicio, String fim, String sistema) throws ClassNotFoundException, SQLException, IOException, ParseException {
        Statement stm = null;
        Connection conn = null;
        int i = 0;
        sistemasDao sDao = new sistemasDao();
        Testejson json = new Testejson();
        System.out.println("datas: " + inicio + " and " + fim);
        int tamanho = relatorioIncidentes().size();
        int cont[] = new int[tamanho];
        String nome[] = new String[tamanho];
        conn = conectadb.conetaBanco();
        List<String> incidentes = sDao.relatorioSistemas();
        if (!inicio.equalsIgnoreCase("")) {
            for (String s : incidentes) {
                try {
                    String sql = "Select count(*) from  incidente where date (dataInicio) between '" + inicio + "' and '" + fim + "' and Name_sys='" + s + "'";
                    stm = conn.prepareStatement(sql);
                    ResultSet rs = stm.executeQuery(sql);

                    while (rs.next()) {
                        if (rs.getInt(1) > 0) {
                            cont[i] = rs.getInt(1);
                            nome[i] = s;

                            i++;
                        }
                    }

                } catch (SQLException e) {
                    System.out.println("Erro de consulta " + e.getMessage());
                } catch (NullPointerException ex) {
                    System.out.println("varivel nula" + ex.getMessage());

                }

            }
            stm.close();
            conectadb.fechaConexão(conn);
            json.jsonDidMount(nome, cont);
        }
        if (!sistema.equalsIgnoreCase("")) {

            try {
                String sql = "Select count(*) from incidente where Name_sys='" + sistema + "'";
                stm = conn.prepareStatement(sql);
                ResultSet rs = stm.executeQuery(sql);

                while (rs.next()) {
                    if (rs.getInt(1) > 0) {
                        cont[i] = rs.getInt(1);
                        nome[i] = sistema;

                        System.out.println("Sistema: " + nome[i] + " " + cont[i]);
                        i++;
                    }
                }

            } catch (SQLException e) {
                System.out.println("Erro de consulta " + e.getMessage());
            } catch (NullPointerException ex) {
                System.out.println("varivel nula" + ex.getMessage());

            }
            stm.close();
            conectadb.fechaConexão(conn);
            json.jsonDidMount(nome, cont);

        } else {
            SomaIncidentes();
        }
    }

    public boolean validaExcel(String inicio, String fim, String sistema) throws ClassNotFoundException, SQLException, IOException, ParseException {
        Statement stm = null;
        Connection conn = null;
        int i = 0;
        sistemasDao sDao = new sistemasDao();
        Testejson json = new Testejson();
        System.out.println("datas: " + inicio + " and " + fim);

        conn = conectadb.conetaBanco();

        if (!inicio.equalsIgnoreCase("")) {

            try {
                String sql = "Select * from incidentes where dataInicio='" + inicio + "' and dataFim='" + fim + "'";
                stm = conn.prepareStatement(sql);
                ResultSet rs = stm.executeQuery(sql);

                while (rs.next()) {

                }

            } catch (SQLException e) {
                System.out.println("Erro de consulta " + e.getMessage());
            } catch (NullPointerException ex) {
                System.out.println("varivel nula" + ex.getMessage());

            }
            stm.close();
            conectadb.fechaConexão(conn);
            return true;
        }
        return false;
    }

}
