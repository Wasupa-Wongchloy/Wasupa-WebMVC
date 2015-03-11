<%@page import="wasupa.controler.DeleteData"%>
<%@page import="wasupa.controler.InsertData"%>
<%@page import="wasupa.model.ShowColumn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <link rel="stylesheet" href="StyleIndex.css">
    <h1 id="h">Employees</h1>
    
    <form method="post" action="insert.jsp">
        <button id="btninsert">Insert</button>
    </form>

    <%
        String searchby = "";
    
                    String key = "";
                    if (request.getParameter("txtsearch") != null) {
                        searchby = request.getParameter("sesearch");
                        key = request.getParameter("txtsearch");
                    }
        if (request.getParameter("txtid") != null) {
            String id = request.getParameter("txtid");
            DeleteData del = new DeleteData();
            del.Delete(id);
        }
    %>

    <form action="index.jsp" method="post">
        <label id="lasearch"><h3>search</h3></label>
        <input id="insearch" name="txtsearch">
        <select id="searchselect" name="sesearch">
            <option value="name" >name</option>
            <option value="email">email</option>
            <option value="phone">phone</option>
            <option value="salary">salary</option>
        </select>
        <button id="btnsearch">Search</button>
    </form>


    <form action="update_delete.jsp" method="post">
        <table>
            <thead>
                <tr class="trcon">
                    <td class="tdno">no.</td>
                    <td class="tdid">employee id</td>
                    <td class="tdfirst">first name</td>
                    <td class="tdlast">last name</td>
                    <td class="tdemail">email</td>
                    <td class="tdphone">phone number</td>
                    <td class="tdsalary">salary</td>
                    <td class="tdmodify">select row</td>
                </tr>
            </thead>
            <tbody>
                <%
                    
                    ShowColumn scl = new ShowColumn();
                    scl.RunShow(searchby, key);
                    for (int i = 0; i < scl.getId().size(); i++) {
                %>
                <tr>
                    <td><%= i + 1%></td>
                    <td><%= scl.getId().get(i)%></td>
                    <td><%= scl.getFname().get(i)%></td>
                    <td><%= scl.getLname().get(i)%></td>
                    <td><%= scl.getEmail().get(i)%></td>
                    <td><%= scl.getPhone().get(i)%></td>
                    <td><%= scl.getSalary().get(i)%></td>
                    <td><input type="radio" name="group1"  value="<%=i%>" >Select</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <button id="btnedit">Edit</button>
    </form>

</body>
</html>
