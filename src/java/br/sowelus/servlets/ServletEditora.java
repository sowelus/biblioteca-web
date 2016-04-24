package br.sowelus.servlets;

import br.sowelus.dao.EditoraDAO;
import br.sowelus.modelo.Editora;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ServletEditora", urlPatterns = {"/editora/ServletEditora"})
public class ServletEditora extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EditoraDAO dao = (EditoraDAO) request.getSession().getAttribute("editoraDao");
        if (dao == null){
            dao = new EditoraDAO();
        }
        String tela = "";
        String acao = request.getParameter("acao");
        if (acao == null){
            tela = "listar.jsp";
        } else if (acao.equals("incluir")){
            dao.setObjetoSelecionado(new Editora());
            dao.setMensagem("");
            tela = "formulario.jsp";
        } else if (acao.equals("alterar")){
            Integer codigo = Integer.parseInt(request.getParameter("id"));
            dao.setObjetoSelecionado(dao.localizar(codigo));
            dao.setMensagem("");
            tela = "formulario.jsp";            
        } else  if (acao.equals("excluir")){
            Integer codigo = Integer.parseInt(request.getParameter("id"));
            Editora obj = dao.localizar(codigo);
            if (obj != null){
                dao.remover(obj);                
            }
            tela = "listar.jsp";
        } else  if (acao.equals("salvar")){
            Integer codigo = null;
            try {
                codigo = Integer.parseInt(request.getParameter("id"));
            } catch (Exception e){
                dao.setMensagem("Erro ao converter o codigo");
            }
            dao.getObjetoSelecionado().setCodigo(codigo);
            dao.getObjetoSelecionado().setRazaoSocial(request.getParameter("razao_social"));
            dao.getObjetoSelecionado().setEndereco(request.getParameter("endereco"));
            dao.getObjetoSelecionado().setTelefoneComercial(request.getParameter("telefone_comercial"));
            dao.getObjetoSelecionado().setUrlSite(request.getParameter("url_site"));

            if (dao.validaObjeto(dao.getObjetoSelecionado())){
                dao.salvar(dao.getObjetoSelecionado());
                tela = "listar.jsp";
            } else {
                tela = "formulario.jsp";
            }
        } else if (acao.equals("cancelar")){
            dao.setMensagem("");
            tela = "listar.jsp";
        }
        // atualizar o dao na sessão
        request.getSession().setAttribute("editoraDao", dao);
        // redireciono para a tela desejada
        response.sendRedirect(tela);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
