/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Usuario;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 *
 * @author Bruno
 */
public class UsuarioDao {

    private final Session sessao;
    private HibernateSessionFactory factory;

    public UsuarioDao() {
        sessao = factory.getSessao().openSession();
    }

    public int salvar(Usuario us) {

        try {
            sessao.beginTransaction();

            sessao.save(us);

            sessao.flush();
            sessao.clear();
            sessao.getTransaction().commit();

            sessao.close();

            return 0;
        } catch (HibernateException e) {
            return 1;
        }
    }

    public Usuario procuraEmail(String email) {
        Usuario usuario;

        sessao.beginTransaction();

        usuario = (Usuario) sessao.get(Usuario.class, email);

        sessao.flush();
        sessao.clear();
        sessao.getTransaction().commit();

        sessao.close();

        return usuario;

    }

}
