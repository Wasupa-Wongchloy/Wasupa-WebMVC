/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package wasupa.controler;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Best
 */
public class ConnectionDb {
    
    public Connection Connect() throws SQLException{
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            
        } catch (Exception e) {
        }
        return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
    }
    
}
