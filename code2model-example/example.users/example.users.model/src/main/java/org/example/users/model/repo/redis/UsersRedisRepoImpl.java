package org.example.users.model.repo.redis;

import org.example.users.model.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Repository;

import java.util.Map;
import java.util.stream.Stream;

import javax.annotation.PostConstruct;

@Repository
public class UsersRedisRepoImpl implements UsersRedisRepo {

	private static final String KEY = "User";

	@Autowired
	private RedisTemplate<String, User> redisTemplate;

	private HashOperations hashOps;

	@PostConstruct
	private void init() {
		hashOps = redisTemplate.opsForHash();
	}

	@Override
	public void save(User user) {
		hashOps.put(KEY, user.getId(), user);
	}

	@Override
	public User findOne(long id) {
		return (User) hashOps.get(KEY, id);
	}

	@Override
	public Map<Object, User> findAll() {
		return hashOps.entries(KEY);
	}

	@Override
	public void delete(long id) {
		hashOps.delete(KEY, id);
	}

	@Override
	public Page<User> findAllPaged(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Slice<User> findAllSliced(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Stream<User> findAllStreamed() {
		// TODO Auto-generated method stub
		return null;
	}

}
