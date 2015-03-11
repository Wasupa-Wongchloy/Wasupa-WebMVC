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
public class InsertData {
    
    public void Insert(String id, String fname, String lname,
                       String email, String phone, String salary) throws SQLException{
        Connection connect = new ConnectionDb().Connect();
        
        PreparedStatement pre = connect.prepareStatement("insert into employees "
                + "(employee_id , first_name , last_name , email , phone_number , salary, job_id, hire_date) "
                + "values(?,?,?,?,?,?,?,Sysdate)");
             pre.setInt(1,Integer.parseInt(id) );
             pre.setString(2, fname);
             pre.setString(3, lname);
             pre.setString(4, email);
             pre.setString(5, phone);
             pre.setDouble(6, Double.parseDouble(salary));
             pre.setString(7, "IT_PROG");
             if(pre.executeUpdate() != -1){
                 System.out.println("Success");
             }
    }
    public static void main(String[] args) throws SQLException {
        InsertData ins = new InsertData();
        ins.Insert("0007", "bbbbbb", "bbbbbb", "bbbbbb", "bbbbbb", "12345");
    }
}
