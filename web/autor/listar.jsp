
<%@page import="br.sowelus.modelo.Autor"%>
<%@page import="br.sowelus.dao.AutorDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="autorDao" 
             scope="session" type="AutorDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de Autores</title>
    </head>
    <body>
        <a href="../index.html">Início</a>
        <h1>Listagem de Autores</h1>
        <h2><%=autorDao.getMensagem()%></h2>
        <a href="ServletAutor?acao=incluir">Incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nome</th>
                    <th>Sobrenome</th>
                    <th>Nome Artístico</th>
                    <th>País</th>
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Autor e : autorDao.getLista()) {
                %>
                <tr>
                    <td><%=e.getCodigo()%></td>
                    <td><%=e.getNome()%></td>
                    <td><%=e.getSobrenome()%></td>
                    <td><%=e.getNomeArtistico()%></td>
                    <td><%=e.getPais()%></td>
                    <td><a href="ServletAutor?acao=alterar&id=<%=e.getCodigo()%>">Alterar</a></td>
                    <td><a href="ServletAutor?acao=excluir&id=<%=e.getCodigo()%>">Excluir</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>            
        </table>
    </body>
</html>
