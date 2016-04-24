<%@page import="br.sowelus.dao.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="categoriaDao" 
             scope="session" type="CategoriaDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Categorias</title>
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
        <h1>Edição de Categorias</h1>
        <h2><%=categoriaDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletCategoria" method="POST">
            Codigo: <input type="text" name="id" 
                       value="<%= categoriaDao.getObjetoSelecionado().getCodigo() == null
                               ?"" : categoriaDao.getObjetoSelecionado().getCodigo()%>"
                                size="6" readonly/><br/>
           Descrição: <input type="text" name="descricao"
                         value="<%= categoriaDao.getObjetoSelecionado().getDescricao()== null
                         ? "" : categoriaDao.getObjetoSelecionado().getDescricao()%>"
                         size="40"/><br/>
    
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>
    </body>
</html>
