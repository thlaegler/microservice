package org.example.users.model.config;

import com.couchbase.client.java.Bucket;
import com.couchbase.client.java.Cluster;
import com.couchbase.client.java.CouchbaseCluster;
import com.couchbase.client.spring.cache.CacheBuilder;
import com.couchbase.client.spring.cache.CouchbaseCacheManager;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.couchbase.config.AbstractCouchbaseConfiguration;
import org.springframework.data.couchbase.repository.config.EnableCouchbaseRepositories;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Configuration
@EnableCaching
@EnableCouchbaseRepositories(basePackages = {"org.example.users.model.repo.couchbase"})
public class CouchbaseConfig extends AbstractCouchbaseConfiguration {

	public static final String USERS_CACHE = "users";
	public static final String USERS_BUCKET = "users";

	@Value("${org.example.users.host}")
	private String host;

	@Bean(destroyMethod = "disconnect")
	public Cluster cluster() {
		// this connects to a Couchbase instance running on localhost
		return CouchbaseCluster.create();
	}

	@Bean(destroyMethod = "close")
	public Bucket bucket() {
		return cluster().openBucket("default", "");
	}

	@Bean
	public CacheManager cacheManager() {
		Map<String, CacheBuilder> mapping = new HashMap<String, CacheBuilder>();
		mapping.put(USERS_CACHE, CacheBuilder.newInstance(bucket()));
		return new CouchbaseCacheManager(mapping);
	}

	@Override
	protected List<String> getBootstrapHosts() {
		return Arrays.asList(host);
	}

	@Override
	protected String getBucketName() {
		return USERS_BUCKET;
	}

	@Override
	protected String getBucketPassword() {
		return "test";
	}

}
