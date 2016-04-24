<%@page import="br.sowelus.dao.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="usuarioDao" 
             scope="session" type="UsuarioDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Usuarios</title>
        <script>
            function doSalvar(){
                document.getElementById("acao").value = 'salvar';
                document.getElementById("form").submit();
            }
            function doCancelar(){
                document.getElementById("acao").value = 'cancelar';
                document.getElementById("form").submit();
            }            
        </script>
    </head>
    <body>
        <h1>Edição de Usuarios</h1>
        <h2><%=usuarioDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletUsuario" method="POST">
            Codigo: <input type="text" name="id" 
                       value="<%= usuarioDao.getObjetoSelecionado().getCodigo() == null
                               ?"" : usuarioDao.getObjetoSelecionado().getCodigo()%>"
                                size="6" readonly/><br/>
            Nome: <input type="text" name="nome"
                         value="<%= usuarioDao.getObjetoSelecionado().getNome() == null
                         ? "" : usuarioDao.getObjetoSelecionado().getNome() %>"
                         size="40"/><br/>
            Sobrenome: <input type="text" name="sobrenome"
                         value="<%= usuarioDao.getObjetoSelecionado().getSobrenome() == null
                         ? "" : usuarioDao.getObjetoSelecionado().getSobrenome() %>"
                         size="40"/><br/>
            E-mail: <input type="text" name="email"
                           value="<%= usuarioDao.getObjetoSelecionado().getEmail()== null
                         ? "" : usuarioDao.getObjetoSelecionado().getEmail() %>"
                         size="40"/><br/>
            Senha: <input type="text" name="senha"
                       value="<%= usuarioDao.getObjetoSelecionado().getSenha()== null
                       ? "" : usuarioDao.getObjetoSelecionado().getSenha()%>"
                       size="2"/><br/>
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>
    </body>
</html>
