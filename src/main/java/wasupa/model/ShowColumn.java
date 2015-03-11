/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package wasupa.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import wasupa.controler.ConnectionDb;

/**
 *
 * @author Best
 */
public class ShowColumn {
    
    ArrayList<String> id = new ArrayList<String>();
    ArrayList<String> fname = new ArrayList<String>();
    ArrayList<String> lname = new ArrayList<String>();
    ArrayList<String> email = new ArrayList<String>();
    ArrayList<String> phone = new ArrayList<String>();
    ArrayList<String> salary = new ArrayList<String>();
    
    public void RunShow(String search, String key) throws SQLException{
        
        String searchby = null;
        if(search.equals("name")){
            searchby = "first_name";
        }
        if(search.equals("email")){
            searchby = "email";
        }
        if(search.equals("salary")){
            searchby = "salary";
        }
        if(search.equals("phone")){
            searchby = "phone_number";
        }
        
        Connection con = new ConnectionDb().Connect();
        String sql = "";
        if(key.equals("")){
           sql = "SELECT * from employees order by employee_id asc";
        }
        else{
            sql = "SELECT * FROM employees where lower("
                  +searchby+") LIKE(lower('%"+key+"%')) order by employee_id asc"; 
        }
        ResultSet rs = con.createStatement().executeQuery(sql);
        
        while(rs.next()){
            id.add(rs.getString("employee_id"));
            fname.add(rs.getString("first_name"));
            lname.add(rs.getString("last_name"));
            email.add(rs.getString("email"));
            phone.add(rs.getString("phone_number"));
            salary.add(rs.getString("salary"));
        }
    }

    public ArrayList<String> getId() {
        return id;
    }

    public void setId(ArrayList<String> id) {
        this.id = id;
    }

    public ArrayList<String> getFname() {
        return fname;
    }

    public void setFname(ArrayList<String> fname) {
        this.fname = fname;
    }

    public ArrayList<String> getLname() {
        return lname;
    }

    public void setLname(ArrayList<String> lname) {
        this.lname = lname;
    }

    public ArrayList<String> getEmail() {
        return email;
    }

    public void setEmail(ArrayList<String> email) {
        this.email = email;
    }

    public ArrayList<String> getPhone() {
        return phone;
    }

    public void setPhone(ArrayList<String> phone) {
        this.phone = phone;
    }

    public ArrayList<String> getSalary() {
        return salary;
    }

    public void setSalary(ArrayList<String> salary) {
        this.salary = salary;
    }
    
    
    
    
    
}
