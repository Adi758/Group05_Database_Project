package com.history.blackpeople.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.history.blackpeople.Model.Users;

@Repository
public interface UsersRepo extends JpaRepository<Users, String> {
    
    @Query(value = "SELECT user FROM Users user WHERE user.email = ?1")
	   public Users findByemail(String email);
}
