package org.example.users.model.repo.jpa;

import org.example.users.model.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.stream.Stream;

@Repository
public interface UserJpaRepo extends JpaRepository<User, Long> {

	public User findOneByUsername(String username);

	@Query("SELECT u FROM User u")
	public Page<User> findAllPaged(Pageable pageable);

	@Query("SELECT u FROM User u ")
	public Slice<User> findAllSliced(Pageable pageable);

	@Query("SELECT u FROM User u")
	public Stream<User> findAllStreamed();

}
