
<%@page import="br.sowelus.modelo.Editora"%>
<%@page import="br.sowelus.dao.EditoraDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="editoraDao" 
             scope="session" type="EditoraDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de Editoras</title>
    </head>
    <body>
        <a href="../index.html">Início</a>
        <h1>Listagem de Editoras</h1>
        <h2><%=editoraDao.getMensagem()%></h2>
        <a href="ServletEditora?acao=incluir">Incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Razão Social</th>
                    <th>Endereço</th>
                    <th>Telefone Comercial</th>
                    <th>URL Site</th>                   
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Editora e : editoraDao.getLista()) {
                %>
                <tr>
                    <td><%=e.getCodigo()%></td>
                    <td><%=e.getRazaoSocial()%></td>
                    <td><%=e.getEndereco()%></td>
                    <td><%=e.getTelefoneComercial()%></td>
                    <td><%=e.getUrlSite()%></td>
                    <td><a href="ServletEditora?acao=alterar&id=<%=e.getCodigo()%>">Alterar</a></td>
                    <td><a href="ServletEditora?acao=excluir&id=<%=e.getCodigo()%>">Excluir</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>            
        </table>
    </body>
</html>
