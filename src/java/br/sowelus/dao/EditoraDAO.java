
package br.sowelus.dao;

import br.sowelus.jpa.EntityManagerUtil;
import br.sowelus.modelo.Editora;
import br.sowelus.util.Util;
import java.util.List;
import java.util.Set;
import javax.persistence.EntityManager;
import javax.validation.ConstraintViolation;
import javax.validation.OverridesAttribute;
import javax.validation.Validation;
import javax.validation.Validator;

public class EditoraDAO {
    private Editora objetoSelecionado;
    private String mensagem = "";
    private EntityManager em;
    
    public EditoraDAO(){
        em = EntityManagerUtil.getEntityManager();
    }
        
    public boolean validaObjeto(Editora obj){
        Validator validador = Validation.buildDefaultValidatorFactory().getValidator();
        Set<ConstraintViolation<Editora>> erros =
                validador.validate(obj);
        if (erros.size() > 0){
            mensagem = "";
            mensagem += "Objeto com erros!<br/>";
            for (ConstraintViolation<Editora> erro : erros){
                mensagem += "Erro: "+erro.getMessage()+"<br/>";
            }
            return false;
        } else {
            return true;
        }
    }
    
    public List<Editora> getLista(){
        return em.createQuery("from Editora order by razao_social").getResultList();
    }
    
    public boolean salvar(Editora obj){
        try {
            em.getTransaction().begin();
            if (obj.getCodigo() == null){
                em.persist(obj);
            } else {
                em.merge(obj);
            }
            em.getTransaction().commit();
            mensagem = "Objeto persistido com sucesso!";
            return true;
        } catch (Exception e){
            if (em.getTransaction().isActive() == false){
                em.getTransaction().begin();
            }
            em.getTransaction().rollback();
            mensagem = "Erro ao persistir: "+Util.getMensagemErro(e);
            return false;
        }
    }
    
    public boolean remover(Editora obj){
        try {
            em.getTransaction().begin();
            em.remove(obj);
            em.getTransaction().commit();
            mensagem = "Objeto removido com sucesso!";
            return true;
        } catch (Exception e){
            if (em.getTransaction().isActive() == false){
                em.getTransaction().begin();
            }
            em.getTransaction().rollback();
            mensagem = "Erro ao remover objeto: "+Util.getMensagemErro(e);
            return false;
        }
    }    
    
    public Editora localizar(Integer codigo){
        return em.find(Editora.class, codigo);
    }

    public Editora getObjetoSelecionado() {
        return objetoSelecionado;
    }

    public void setObjetoSelecionado(Editora objetoSelecionado) {
        this.objetoSelecionado = objetoSelecionado;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public EntityManager getEm() {
        return em;
    }

    public void setEm(EntityManager em) {
        this.em = em;
    }
    

}
