/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dados;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.ParseException;

/**
 *
 * @author t7249320
 */
public class getUser {
    public  static String User () throws ParseException, UnknownHostException {
  System.out.println();
//nome da maquina
                      
         
        String saida=  System.getProperty("user.name");
        return saida;
    }
    
    public static void main(String[] args) throws ParseException, UnknownHostException {
        User();
        System.out.println(User());
    }
}
