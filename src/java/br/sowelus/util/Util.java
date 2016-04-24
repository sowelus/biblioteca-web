
package br.sowelus.util;

public class Util {
    
    public static String getMensagemErro(Exception e){
        while(e.getCause() != null){
            e = (Exception) e.getCause();
        }
        String retorno = e.getMessage();
        if (retorno.contains("foreign key")){
            retorno = "Registro não pode ser excluido por "
                    + "possuir referência em outros objetos...";            
        }
        return retorno;
    }
}
