package model;


// Generated 07/05/2018 20:44:06 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Horario generated by hbm2java
 */
public class Horario  implements java.io.Serializable {


     private Integer codigo;
     private Usuario usuario;
     private String inicio;
     private String fim;
     private int ordem;
     private Integer tempo;
     private Set<Executado> executados = new HashSet<Executado>(0);

    public Horario() {
    }

	
    public Horario(Usuario usuario, String inicio, String fim, int ordem) {
        this.usuario = usuario;
        this.inicio = inicio;
        this.fim = fim;
        this.ordem = ordem;
    }
    public Horario(Usuario usuario, String inicio, String fim, int ordem, Integer tempo, Set<Executado> executados) {
       this.usuario = usuario;
       this.inicio = inicio;
       this.fim = fim;
       this.ordem = ordem;
       this.tempo = tempo;
       this.executados = executados;
    }
   
    public Integer getCodigo() {
        return this.codigo;
    }
    
    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }
    public Usuario getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    public String getInicio() {
        return this.inicio;
    }
    
    public void setInicio(String inicio) {
        this.inicio = inicio;
    }
    public String getFim() {
        return this.fim;
    }
    
    public void setFim(String fim) {
        this.fim = fim;
    }
    public int getOrdem() {
        return this.ordem;
    }
    
    public void setOrdem(int ordem) {
        this.ordem = ordem;
    }
    public Integer getTempo() {
        return this.tempo;
    }
    
    public void setTempo(Integer tempo) {
        this.tempo = tempo;
    }
    public Set<Executado> getExecutados() {
        return this.executados;
    }
    
    public void setExecutados(Set<Executado> executados) {
        this.executados = executados;
    }




}


