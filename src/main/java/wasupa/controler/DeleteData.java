/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package wasupa.controler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Best
 */
public class DeleteData {
    
    public void Delete(String key) throws SQLException{
        Connection connect = new ConnectionDb().Connect();
        
        PreparedStatement pre = connect.prepareStatement("Delete from employees where employee_id = ?");
        pre.setInt(1, Integer.parseInt(key));
        
        if(pre.executeUpdate() != -1){
            System.out.println("Success");
        }
    }
    
    public static void main(String[] args) throws SQLException {
        DeleteData de = new DeleteData();
        de.Delete("0007");
    }
    
}
