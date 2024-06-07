<%-- 
    Document   : products
    Created on : 16/05/2024, 7:01:00 a. m.
    Author     : Usuario
--%>

<%@page import="com.mycompany.productsmongodbclass.models.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset='utf-8'>
        <title>Datatable example</title>
        <link rel="stylesheet" href="styles/dataTables.dataTables.css">
        <script src="scripts/jquery-3.7.1.min.js"></script>
        <script src="scripts/dataTables.js"></script>
    </head>
    <body>
        <h1>Products Page</h1>
        <table id="tblProducts">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Brand</th>
                    <th>Stock</th>
                    <th>Category</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Product> products = (List<Product>) request.getAttribute("products");
                    if (products.size() > 0) {
                        for (Product product : products) {
                %>
                <tr>
                    <td><%=product.getId()%></td>
                    <td><%=product.getTitle()%></td>
                    <td><%=product.getDescription()%></td>
                    <td><%=product.getBrand()%></td>
                    <td><%=product.getStock()%></td>
                    <td><%=product.getCategory()%></td>
                    <td>
                        <a href="/ProductsMongoDBClass/index?idProduct=<%=product.getId()%>" >Editar</a>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>

        <script>
            new DataTable('#tblProducts');
        </script>
    </body>
</html>