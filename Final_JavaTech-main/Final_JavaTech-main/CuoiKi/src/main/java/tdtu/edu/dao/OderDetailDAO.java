package tdtu.edu.dao;

import tdtu.edu.model.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;
import java.util.List;
@Transactional
public interface OderDetailDAO extends JpaRepository<OrderDetail,Long> {
    List<OrderDetail> findAllByOrder_Id(long id);
}
