
<%@page import="br.sowelus.modelo.Categoria"%>
<%@page import="br.sowelus.dao.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="categoriaDao" 
             scope="session" type="CategoriaDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de Categorias</title>
    </head>
    <body>
        <a href="../index.html">Início</a>
        <h1>Listagem de Categorias</h1>
        <h2><%=categoriaDao.getMensagem()%></h2>
        <a href="ServletCategoria?acao=incluir">Incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Descrição</th>
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Categoria e : categoriaDao.getLista()) {
                %>
                <tr>
                    <td><%=e.getCodigo()%></td>
                    <td><%=e.getDescricao()%></td>
                    <td><a href="ServletCategoria?acao=alterar&id=<%=e.getCodigo()%>">Alterar</a></td>
                    <td><a href="ServletCategoria?acao=excluir&id=<%=e.getCodigo()%>">Excluir</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>            
        </table>
    </body>
</html>
