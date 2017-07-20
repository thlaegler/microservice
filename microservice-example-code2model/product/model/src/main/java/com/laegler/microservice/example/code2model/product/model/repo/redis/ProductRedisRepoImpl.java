package com.laegler.microservice.example.code2model.product.model.repo.redis;

import java.util.Map;
import java.util.stream.Stream;

import javax.inject.Inject;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Repository;

import com.laegler.microservice.example.code2model.product.model.entity.Product;

@Repository
public class ProductRedisRepoImpl implements ProductRedisRepo {

  private static final String KEY = "Product";

  @Inject
  private RedisTemplate<String, Product> redisTemplate;

  private HashOperations hashOps;

  // @PostConstruct
  private void init() {
    hashOps = redisTemplate.opsForHash();
  }

  public void save(Product product) {
    hashOps.put(KEY, product.getId(), product);
  }

  public Product findOne(String id) {
    return (Product) hashOps.get(KEY, id);
  }

  public Map<Object, Product> findAll() {
    return hashOps.entries(KEY);
  }

  public void delete(String id) {
    hashOps.delete(KEY, id);
  }

  public Page<Product> findAllPaged(Pageable pageable) {
    // TODO Auto-generated method stub
    return null;
  }

  public Slice<Product> findAllSliced(Pageable pageable) {
    // TODO Auto-generated method stub
    return null;
  }

  public Stream<Product> findAllStreamed() {
    // TODO Auto-generated method stub
    return null;
  }

  public Page<Product> findAllActiveInStock(Pageable pageable) {
    // TODO Auto-generated method stub
    return null;
  }
}
