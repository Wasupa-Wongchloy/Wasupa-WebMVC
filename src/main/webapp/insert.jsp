

<%@page import="wasupa.model.ShowColumn"%>
<%@page import="wasupa.controler.ConnectionDb"%>
<%@page import="java.sql.Connection"%>
<%@page import="wasupa.controler.InsertData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="StyInsert.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 id="h">Insert</h1>
        
        <%
            int count = 0;
            if (request.getParameter("txtfname") != null) {
                count = Integer.parseInt(request.getParameter("txtcount"));
                InsertData ind = new InsertData();
                String id = request.getParameter("txtid");
                String fname = request.getParameter("txtfname");
                String lname = request.getParameter("txtlname");
                String email = request.getParameter("txtemail");
                String phone = request.getParameter("txtphone");
                String salary = request.getParameter("txtsalary");
                ind.Insert(id, fname, lname, email, phone, salary);
                count++;
                if ((count % 2) == 0) {
        %>    
        <h1 id="outinsert1">Insert Success</h1>
        <%
        } else {
        %>
        <h1 id="outinsert2">Insert Success</h1>
        <%
                }
            }else{
                
            }
        %>

        <form id="fromadd" method="post" action="insert.jsp">
            <div id="id"><h3>Id</h3></div>  
            <input id="inputid" name="txtid">

            <div id="firstname"><h3>First Name</h3></div>  
            <input id="inputfirstname" name="txtfname"  >
            <div id="lastname"><h3>Last Name</h3></div>  
            <input id="inputlastname" name="txtlname" >

            <div id="email"><h3>E-mail</h3></div>  
            <input id="inputemail" name="txtemail" >
            <div id="phone"><h3>Phone Number</h3></div>  
            <input id="inputphone" name="txtphone" >

            <div id="salary"><h3>Salary</h3></div>  
            <input id="inputsalary" name="txtsalary" >

            <button id="btnadd" type="submit">Add</button>
            <input type="hidden" value="<%=count %>" name="txtcount">

        </form>

        <form  method="post" action="index.jsp">
            <button id="btnback" type="submit">Back</button>
        </form>
    </body>
</html>
