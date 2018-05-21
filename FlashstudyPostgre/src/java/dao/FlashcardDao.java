/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Flashcard;
import org.hibernate.Session;

/**
 *
 * @author Igor
 */
public class FlashcardDao {

    private final Session sessao;
    private HibernateSessionFactory factory;

    public FlashcardDao() {
        sessao = factory.getSessao().openSession();
    }

    public int salvar(Flashcard card) {

        try {

            sessao.beginTransaction();

            sessao.save(card);

            sessao.getTransaction().commit();

            sessao.close();

            sessao.disconnect();

            return 0;
        } catch (Exception e) {
            return 1;
        }
    }

    @SuppressWarnings("unchecked")
    public List<Flashcard> findAll(String email) {
        try {
            List<Flashcard> cards;
            org.hibernate.Transaction tx = sessao.beginTransaction();
            cards = sessao.createSQLQuery("SELECT * FROM FLASHCARDS WHERE usuario_email = '" + email + "'").list();
            if (cards.size() > 0) {
                return cards;
            }
            return cards;
        } catch (Exception e) {
            throw e;
        }
    }
}
