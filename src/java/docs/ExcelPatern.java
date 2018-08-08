package docs;

import conectadb.conectadb;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.UnknownHostException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import org.apache.poi.hssf.usermodel.HSSFPalette;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author t7249320
 */
public class ExcelPatern extends conectadb {

    public ArrayList<Object[]> getTable() throws ClassNotFoundException {
        ArrayList<Object[]> tableDataList = null;

            try {
                PreparedStatement ps = conetaBanco().prepareStatement("select Name_sys,Codigo_incidente,ocorrencia,dataInicio,status,chamado,horaInicio,horaFim,volume,coment\n" +
"from incidente inner join comentario on Codigo_incidente = Codigo_coment order by dataInicio");
                ResultSet result = ps.executeQuery();
                tableDataList = new ArrayList<>();
                while (result.next()) {
                    Object[] objArray = new Object[9];
                    objArray[0] = result.getString("Name_sys");
                    objArray[1] = result.getString("ocorrencia");
                    objArray[2] = result.getString("dataInicio");
                    objArray[3] = result.getString("horaInicio");
                    objArray[4] = result.getString("horaFim");
                    objArray[5] = "";
                    if ("1".equals(result.getString("status"))) {
                        objArray[5] = "Aberto";
                    } else {
                        objArray[5] = "Fechado";
                    }
                    objArray[6] = result.getInt("chamado");
                    objArray[7] = result.getInt("volume");
                    objArray[8] = result.getString("coment");
                    tableDataList.add(objArray);
                }

            } catch (SQLException e) {
                System.out.println("Unable to create PreparedStatement");
            }
        
        return tableDataList;
    }
    
public ArrayList<Object[]> getTableData(String ini, String fim,String sistema) throws ClassNotFoundException {
        ArrayList<Object[]> tableDataList = null;

        if (conetaBanco() != null) {
            try {
                PreparedStatement ps = conetaBanco().prepareStatement("select Name_sys,Codigo_incidente,ocorrencia,dataInicio,status,chamado,horaInicio,horaFim,volume,coment\n" +
"from incidente inner join comentario on Codigo_incidente = Codigo_coment where dataInicio='"+ini+"' and dataFim ='"+fim+"'" );
                ResultSet result = ps.executeQuery();
                tableDataList = new ArrayList<>();
                while (result.next()) {
                    Object[] objArray = new Object[9];
                    objArray[0] = result.getString("Name_sys");
                    objArray[1] = result.getString("ocorrencia");
                    objArray[2] = result.getString("dataInicio");
                    objArray[3] = result.getString("horaInicio");
                    objArray[4] = result.getString("horaFim");
                    objArray[5] = "";
                    if ("1".equals(result.getString("status"))) {
                        objArray[5] = "Aberto";
                    } else {
                        objArray[5] = "Fechado";
                    }
                    objArray[6] = result.getInt("chamado");
                    objArray[7] = result.getInt("volume");
                    objArray[8] = result.getString("coment");
                    tableDataList.add(objArray);
                }

            } catch (SQLException e) {
                System.out.println("Unable to create PreparedStatement");
            }
        }
        return tableDataList;
    }

    public void doExport(ArrayList<Object[]> dataList) throws ParseException, UnknownHostException, ClassNotFoundException {
        if (dataList != null && !dataList.isEmpty()) {
            HSSFWorkbook workBook = new HSSFWorkbook();
            HSSFSheet sheet = workBook.createSheet();
            HSSFRow headingRow = sheet.createRow(0);
            HSSFPalette palette = workBook.getCustomPalette();

            // Procura a cor mais próximo que eu quero
            headingRow.createCell((short) 0).setCellValue("Sistema");
            headingRow.createCell((short) 1).setCellValue("Tipo de Ocorrencia");
            headingRow.createCell((short) 2).setCellValue("Data Abertura");
            headingRow.createCell((short) 3).setCellValue("Inicio Impacto");
            headingRow.createCell((short) 4).setCellValue("Termino Impacto");
            headingRow.createCell((short) 5).setCellValue("Status");
            headingRow.createCell((short) 6).setCellValue("nº do chamado pai");
            headingRow.createCell((short) 7).setCellValue("Volumetria");
            headingRow.createCell((short) 8).setCellValue("Descrição da Ocorrência");
            

            short rowNo = 1;
            for (Object[] objects : dataList) {
                HSSFRow row = sheet.createRow(rowNo);
                row.createCell((short) 0).setCellValue(objects[0].toString());
                row.createCell((short) 1).setCellValue(objects[1].toString());
                row.createCell((short) 2).setCellValue(objects[2].toString());
                row.createCell((short) 3).setCellValue(objects[3].toString());
                row.createCell((short) 4).setCellValue(objects[4].toString());
                row.createCell((short) 5).setCellValue(objects[5].toString());
                row.createCell((short) 6).setCellValue(objects[6].toString());
                row.createCell((short) 7).setCellValue(objects[7].toString());
                row.createCell((short) 8).setCellValue(objects[8].toString());
                

                rowNo++;
            }
            
            
            String file = "C:\\Users\\"+System.getProperty("user.name")+"\\Downloads\\Incidentes.xls";
//            File delFile = new File(file);
//            if( delFile.exists()){
//                delFile.delete();
//            }
            System.out.println(file);
            try {
                FileOutputStream fos = new FileOutputStream(file);
                workBook.write(fos);
                fos.flush();
            } catch (FileNotFoundException e) {
                System.out.println("Invalid directory or file not found");
            } catch (IOException e) {
                System.out.println("Error occurred while writting excel file to directory");
            }
        }
    }

    public void executa() throws ClassNotFoundException, ParseException, UnknownHostException {
        ExcelPatern exporter = new ExcelPatern();
        ArrayList<Object[]> dataList = exporter.getTable();
        if (dataList != null ) {
            exporter.doExport(dataList);
        } else {
            System.out.println("There is no data available in the table to export");
        }
    }
     public void executaData(String ini, String fim,String sistema ) throws ClassNotFoundException, ParseException, UnknownHostException {
        ExcelPatern exporter = new ExcelPatern();
        ArrayList<Object[]> dataList = exporter.getTableData(ini, fim, sistema);
            if (dataList != null && dataList.size() > 0) {
            exporter.doExport(dataList);
        } else {
            System.out.println("There is no data available in the table to export");
        }
    }
}
