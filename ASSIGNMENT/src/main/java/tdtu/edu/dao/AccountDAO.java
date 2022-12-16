package tdtu.edu.dao;

import tdtu.edu.model.Account;
import tdtu.edu.model.Category;
import tdtu.edu.model.Product;
import org.hibernate.cfg.annotations.reflection.JPAOverriddenAnnotationReader;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;
import java.util.List;
@Transactional
public interface AccountDAO extends JpaRepository<Account,String> {
    Account deleteById(long id);
    Account findById(long id);
    Account findByEmail(String email);
    Account findAccountByUsername(String username);
    List<Account> findAllById(long id);
    Page<Account> findByUsernameLike(String keywords, Pageable pageable);
}
