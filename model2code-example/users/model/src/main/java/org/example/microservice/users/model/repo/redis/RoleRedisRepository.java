package org.example.microservice.repo.redis;

import org.example.microservice.*
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.stream.Stream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.annotation.Generated;
import com.google.gson.annotations.Until;
import com.google.gson.annotations.Since;

/**
 * 
 * 
 * @author johnDoe {@literal <johnDoe[at]model2code-example>}
 * @since 
 * @version 
 * @generated 17.10.2017 - 20:56:34:139
 */
@Since(0.1)
//@Until(0.0)
@Generated(value = '')
@Repository
public class RoleRedisRepo {

	public void save(Role role);

	public User findOne(long id);

	public Map<Object, Role> findAll();

	public void delete(long id);

	@Query("SELECT x FROM Role x")
	public Page<Role> findAllPaged(Pageable pageable);

	@Query("SELECT x FROM Role x")
	public Slice<Role> findAllSliced(Pageable pageable);

	@Query("SELECT x FROM Role x")
	public Stream<Role> findAllStreamed();

}
