<%@page import="br.sowelus.dao.EditoraDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="editoraDao" 
             scope="session" type="EditoraDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Editoras</title>
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
        <h1>Edição de Editoras</h1>
        <h2><%=editoraDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletEditora" method="POST">
            Codigo: <input type="text" name="id" 
                       value="<%= editoraDao.getObjetoSelecionado().getCodigo() == null
                               ?"" : editoraDao.getObjetoSelecionado().getCodigo()%>"
                                size="6" readonly/><br/>
            Razão Social: <input type="text" name="razao_social"
                         value="<%= editoraDao.getObjetoSelecionado().getRazaoSocial()== null
                         ? "" : editoraDao.getObjetoSelecionado().getRazaoSocial() %>"
                         size="40"/><br/>
            Endereço: <input type="text" name="endereco"
                         value="<%= editoraDao.getObjetoSelecionado().getEndereco()== null
                         ? "" : editoraDao.getObjetoSelecionado().getEndereco() %>"
                         size="40"/><br/>
            Telefone Comercial: <input type="text" name="telefone_comercial"
                         value="<%= editoraDao.getObjetoSelecionado().getTelefoneComercial()== null
                         ? "" : editoraDao.getObjetoSelecionado().getTelefoneComercial() %>"
                         size="40"/><br/>
            URL do site: <input type="text" name="url_site"
                         value="<%= editoraDao.getObjetoSelecionado().getUrlSite()== null
                         ? "" : editoraDao.getObjetoSelecionado().getUrlSite() %>"
                         size="40"/><br/>
    
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>
    </body>
</html>
