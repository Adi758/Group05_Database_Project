package com.history.blackpeople.Repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.history.blackpeople.Model.Items;

@Repository
public interface ItemsRepo extends JpaRepository<Items, Long> {
    @Query(value = "SELECT item FROM Items item WHERE item.itemName = ?1")
	   public Items findByitemName(String itemName);
    
    @Query(value = "SELECT item FROM Items item WHERE item.itemName like %?1%")
	   public List<Items> findBySearchedWord(String searchedWord);
}
