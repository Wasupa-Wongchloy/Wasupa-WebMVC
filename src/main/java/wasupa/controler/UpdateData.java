/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package wasupa.controler;

import com.sun.corba.se.spi.orb.OperationFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Best
 */
public class UpdateData {
    
    public void Update(String id, String fname, String lname,
                       String email, String phone, String salary, String key) throws SQLException{
        Connection connect = new ConnectionDb().Connect();
        
        PreparedStatement pre = connect.prepareStatement(
                "update employees set "
                + "employee_id = ? , "
                + "first_name = ?,"
                + "last_name = ?,"
                + "email = ?,"
                + "phone_number = ?,"
                + "salary = ?"
                + "where employee_id = ?");
        
        pre.setInt(1, Integer.parseInt(id));
        pre.setString(2, fname);
        pre.setString(3, lname);
        pre.setString(4, email);
        pre.setString(5, phone);
        pre.setDouble(6, Double.parseDouble(salary));
        pre.setInt(7, Integer.parseInt(key));
        
        if(pre.executeUpdate() != -1){
            System.out.println("Success");
        }
                
    }
    
    public static void main(String[] args) throws SQLException {
        UpdateData upd = new UpdateData();
        upd.Update("0004", "aaaa", "aaaa", "aaaa","aaaa", "3214", "0007");
    }
}
