<%@page import="br.sowelus.dao.AutorDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="autorDao" 
             scope="session" type="AutorDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Autores</title>
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
        <h1>Edição de Autores</h1>
        <h2><%=autorDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletAutor" method="POST">
            Codigo: <input type="text" name="id" 
                       value="<%= autorDao.getObjetoSelecionado().getCodigo() == null
                               ?"" : autorDao.getObjetoSelecionado().getCodigo()%>"
                                size="6" readonly/><br/>
            Nome: <input type="text" name="nome"
                         value="<%= autorDao.getObjetoSelecionado().getNome() == null
                         ? "" : autorDao.getObjetoSelecionado().getNome() %>"
                         size="40"/><br/>
            Sobrenome: <input type="text" name="sobrenome"
                         value="<%= autorDao.getObjetoSelecionado().getSobrenome() == null
                         ? "" : autorDao.getObjetoSelecionado().getSobrenome() %>"
                         size="40"/><br/>
            Nome Artístico: <input type="text" name="nome_artistico"
                         value="<%= autorDao.getObjetoSelecionado().getNomeArtistico()== null
                         ? "" : autorDao.getObjetoSelecionado().getNomeArtistico() %>"
                         size="40"/><br/>
            País: <input type="text" name="pais"
                       value="<%= autorDao.getObjetoSelecionado().getPais() == null
                       ? "" : autorDao.getObjetoSelecionado().getPais() %>"
                       size="2"/><br/>
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>
    </body>
</html>
