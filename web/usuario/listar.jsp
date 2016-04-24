
<%@page import="br.sowelus.modelo.Usuario"%>
<%@page import="br.sowelus.dao.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="usuarioDao" 
             scope="session" type="UsuarioDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de Usuarios</title>
    </head>
    <body>
        <a href="../index.html">Início</a>
        <h1>Listagem de Usuarioes</h1>
        <h2><%=usuarioDao.getMensagem()%></h2>
        <a href="ServletUsuario?acao=incluir">Incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nome</th>
                    <th>Sobrenome</th>
                    <th>E-mail</th>
                    <th>Senha</th>
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Usuario e : usuarioDao.getLista()) {
                %>
                <tr>
                    <td><%=e.getCodigo()%></td>
                    <td><%=e.getNome()%></td>
                    <td><%=e.getSobrenome()%></td>
                    <td><%=e.getEmail()%></td>
                    <td><%=e.getSenha()%></td>              
                    <td><a href="ServletUsuario?acao=alterar&id=<%=e.getCodigo()%>">Alterar</a></td>
                    <td><a href="ServletUsuario?acao=excluir&id=<%=e.getCodigo()%>">Excluir</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>            
        </table>
    </body>
</html>
