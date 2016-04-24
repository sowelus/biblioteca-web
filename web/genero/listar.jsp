
<%@page import="br.sowelus.modelo.Genero"%>
<%@page import="br.sowelus.dao.GeneroDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="generoDao" 
             scope="session" type="GeneroDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de Gêneros</title>
    </head>
    <body>
        <a href="../index.html">Início</a>
        <h1>Listagem de Gêneros</h1>
        <h2><%=generoDao.getMensagem()%></h2>
        <a href="ServletGenero?acao=incluir">Incluir</a>
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
                    for (Genero e : generoDao.getLista()) {
                %>
                <tr>
                    <td><%=e.getCodigo()%></td>
                    <td><%=e.getDescricao()%></td>
                    <td><a href="ServletGenero?acao=alterar&id=<%=e.getCodigo()%>">Alterar</a></td>
                    <td><a href="ServletGenero?acao=excluir&id=<%=e.getCodigo()%>">Excluir</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>            
        </table>
    </body>
</html>
