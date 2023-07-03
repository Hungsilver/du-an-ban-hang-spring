package com.example.assignment.repository;

import com.example.assignment.dto.ProductDTO;
import com.example.assignment.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    Page<Product> findByNameContains(String name, Pageable pageable);

    Page<Product> findByPriceBetween(Integer gia1, Integer gia2, Pageable pageable);

//    @Query(value = """
//           select p.name,count(od.id_product)
//           from product p
//           inner join orders_detail od on od.id_product=p.id
//           group by p.name limit 2
//                        """, nativeQuery = true)
//    List<ProductView> findTop1Record();

    @Query(value = """
            select new com.example.assignment.dto.ProductDTO(p.id,p.name,sum(od.quantity))
            from Product p
            inner join OrdersDetail od on od.product.id=p.id
            where date(od.createdDate) = :date
            group by p.id,p.name
            order by sum(od.quantity) desc
                         """)
    List<ProductDTO> findTop10SPMaxBuyInDay(@Param("date") LocalDate date);

    @Query(value = """
            select new com.example.assignment.dto.ProductDTO(p.id,p.name,sum(od.quantity))
            from Product p
            inner join OrdersDetail od on od.product.id=p.id
            where yearweek(od.createdDate) = yearweek(:date)
            group by p.id,p.name
            order by sum(od.quantity) desc
                         """)
    List<ProductDTO> findTop10SPMaxBuyInWeek(@Param("date") LocalDate date);

    @Query(value = """
            select new com.example.assignment.dto.ProductDTO(p.id,p.name,sum(od.quantity))
            from Product p
            inner join OrdersDetail od on od.product.id=p.id
            where month(od.createdDate) = month(:date)
            group by p.id,p.name
            order by sum(od.quantity) desc
                         """)
    List<ProductDTO> findTop10SPMaxBuyInMonth(@Param("date") LocalDate date);

    @Query(value = """
            select new com.example.assignment.dto.ProductDTO(p.id,p.name,sum(od.quantity))
            from Product p
            inner join OrdersDetail od on od.product.id=p.id
            group by p.id,p.name
            order by sum(od.quantity) desc
                         """)
    List<ProductDTO> findTop10SPMaxBuy();

}
