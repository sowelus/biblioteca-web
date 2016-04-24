
package br.sowelus.dao;

import br.sowelus.jpa.EntityManagerUtil;
import br.sowelus.modelo.Autor;
import br.sowelus.util.Util;
import java.util.List;
import java.util.Set;
import javax.persistence.EntityManager;
import javax.validation.ConstraintViolation;
import javax.validation.OverridesAttribute;
import javax.validation.Validation;
import javax.validation.Validator;

public class AutorDAO {
    private Autor objetoSelecionado;
    private String mensagem = "";
    private EntityManager em;
    
    public AutorDAO(){
        em = EntityManagerUtil.getEntityManager();
    }
        
    public boolean validaObjeto(Autor obj){
        Validator validador = Validation.buildDefaultValidatorFactory().getValidator();
        Set<ConstraintViolation<Autor>> erros =
                validador.validate(obj);
        if (erros.size() > 0){
            mensagem = "";
            mensagem += "Objeto com erros!<br/>";
            for (ConstraintViolation<Autor> erro : erros){
                mensagem += "Erro: "+erro.getMessage()+"<br/>";
            }
            return false;
        } else {
            return true;
        }
    }
    
    public List<Autor> getLista(){
        return em.createQuery("from Autor order by nome").getResultList();
    }
    
    public boolean salvar(Autor obj){
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
    
    public boolean remover(Autor obj){
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
    
    public Autor localizar(Integer codigo){
        return em.find(Autor.class, codigo);
    }

    public Autor getObjetoSelecionado() {
        return objetoSelecionado;
    }

    public void setObjetoSelecionado(Autor objetoSelecionado) {
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
