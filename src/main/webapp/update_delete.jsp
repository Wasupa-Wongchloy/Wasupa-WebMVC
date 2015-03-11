<%-- 
    Document   : update
    Created on : Mar 5, 2015, 12:07:20 AM
    Author     : Best
--%>

<%@page import="wasupa.controler.UpdateData"%>
<%@page import="wasupa.model.ShowColumn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="StyUpdate_delete.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 id="h">Update</h1>

        <%
            String fname = "";
            String lname = "";
            String email = "";
            String phone = "";
            String salary = "";
            String id = "";
          
            int index = 0;
            int code = 0;
            if (request.getParameter("group1") != null) {
                ShowColumn show = new ShowColumn();
                show.RunShow("","");

                index = Integer.parseInt(request.getParameter("group1"));
                id = show.getId().get(index);
                fname = show.getFname().get(index);
                lname = show.getLname().get(index);
                email = show.getEmail().get(index);
                phone = show.getPhone().get(index);
                salary = show.getSalary().get(index);
            }
            
            if(request.getParameter("txtcode") != null){
                code = Integer.parseInt(request.getParameter("txtcode"));
                if(code == 1){
                id = request.getParameter("txtid");
                fname = request.getParameter("txtfname");
                lname = request.getParameter("txtlname");
                email = request.getParameter("txtemail");
                phone = request.getParameter("txtphone");
                salary = request.getParameter("txtsalary");
                UpdateData up = new UpdateData();
                up.Update(id, fname, lname, email, phone, salary, id);
                
                %>
        
                <h1 id="outupdate">Update Success</h1>
          <%
                }
            }
            

        %>

        <form id="fromupdate" method="post" action="update_delete.jsp">
            <div id="id"><h3>Id</h3></div>  
            <input id="inputid" name="txtid" value="<%=id %>">

            <div id="firstname"><h3>First Name</h3></div>  
            <input id="inputfirstname" name="txtfname" value="<%=fname%>" >
            <div id="lastname"><h3>Last Name</h3></div>  
            <input id="inputlastname" name="txtlname" value="<%=lname%>">

            <div id="email"><h3>E-mail</h3></div>  
            <input id="inputemail" name="txtemail" value="<%=email%>">
            <div id="phone"><h3>Phone Number</h3></div>  
            <input id="inputphone" name="txtphone" value="<%=phone%>">

            <div id="salary"><h3>Salary</h3></div>  
            <input id="inputsalary" name="txtsalary" value="<%=salary%>">
            <input type="hidden" name="txtcode" value="1">
            <button id="btnupdate" type="submit">Update</button>

        </form>
            
            <form method="post" action="index.jsp">
                <input type="hidden" name="txtid" value="<%=id %>">
                 <button id="btndelete" type="submit">Delete</button>
            </form>

        <form  method="post" action="index.jsp">
            <button id="btnback" type="submit">Back</button>
        </form>
    </body>
</html>

