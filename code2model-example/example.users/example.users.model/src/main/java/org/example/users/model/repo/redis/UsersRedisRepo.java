package org.example.users.model.repo.redis;

import org.example.users.model.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.jpa.repository.Query;

import java.util.Map;
import java.util.stream.Stream;

public interface UsersRedisRepo {

	public void save(User user);

	public User findOne(long id);

	public Map<Object, User> findAll();

	public void delete(long id);

	@Query("SELECT u FROM User u")
	public Page<User> findAllPaged(Pageable pageable);

	@Query("SELECT u FROM User u")
	public Slice<User> findAllSliced(Pageable pageable);

	@Query("SELECT u FROM User u")
	public Stream<User> findAllStreamed();

}
