package docs;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author T7249320
 */
import conectadb.incidenteDao;
import dados.Sistema;
import dados.getUser;
import java.io.FileWriter;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class Testejson {

    /**
     * @param a
     * @param n
     * @throws java.lang.ClassNotFoundException
     * @throws java.io.IOException
     */
    public void jsonDidMount(String[] a, int[] n) throws ClassNotFoundException, IOException, ParseException {

        JSONObject obj = new JSONObject();
        JSONObject escreve = new JSONObject();

        incidenteDao inciDao = new incidenteDao();
        String ini="", fim="", sistema="";
        List<Sistema> incidentes = inciDao.relatorioIncidentes(ini, fim, sistema);

        JSONArray tempos = new JSONArray();

        for (int i = 0; i < incidentes.size(); i++) {

            JSONObject jsonObjectIV = new JSONObject();
            if (a[i] != null && n[i] != 0) {
                jsonObjectIV.put("key", a[i]);
                jsonObjectIV.put("y", n[i]);

                tempos.add(jsonObjectIV);
            }

        }
        getUser user = new getUser();
        escreve.put("dados", tempos);
        System.out.println(escreve.toJSONString());
        System.out.println("C:\\Program Files\\glassfish-4.1.1\\glassfish\\domains\\domain1\\applications\\reportdiario\\doc.json");
        try {
            try (FileWriter file = new FileWriter("C:\\Program Files\\glassfish-4.1.1\\glassfish\\domains\\domain1\\applications\\reportdiario\\doc.json")){
                file.write(escreve.toJSONString());
                file.flush();
            }

        } catch (IOException e) {
        }
        try {
            try (FileWriter fil = new FileWriter("C:\\Program Files (X86)\\glassfish-4.1.1\\glassfish\\domains\\domain1\\applications\\reportdiario\\doc.json")){
                fil.write(escreve.toJSONString());
                fil.flush();
            }

        } catch (IOException e) {
        }
        try {
            try (FileWriter fil = new FileWriter("C:\\Users\\t7249320\\Documents\\NetBeansProjects\\reportdiario\\build\\web\\doc.json")){
                fil.write(escreve.toJSONString());
                fil.flush();
            }

        } catch (IOException e) {
        }
    }

}
