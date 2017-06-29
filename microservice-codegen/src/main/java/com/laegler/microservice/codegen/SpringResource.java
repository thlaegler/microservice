package com.laegler.microservice.codegen;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

public class SpringResource {
	private Class<?> controllerClass;
	private List<Method> methods;
	private String controllerMappings;
	private String resourceName;
	private String resourceKey;
	private String description;

	/**
	 * @param clazz
	 *            (Class<?>) Controller class
	 * @param resourceName
	 *            resource Name
	 */
	public SpringResource(Class<?> clazz, String resourceName,
			String resourceKey, String description) {
		this.controllerClass = clazz;
		this.resourceName = resourceName;
		this.resourceKey = resourceKey;
		this.description = description;
		methods = new ArrayList<Method>();

		// String[] controllerRequestMappingValues = SpringUtils
		// .getControllerRequestMapping(controllerClass);

		// this.controllerMappings = StringUtils
		// .removeEnd(controllerRequestMappingValues[0], "/");
	}

	public Class<?> getControllerClass() {
		return controllerClass;
	}

	public void setControllerClass(Class<?> controllerClass) {
		this.controllerClass = controllerClass;
	}

	public List<Method> getMethods() {
		return methods;
	}

	public void setMethods(List<Method> methods) {
		this.methods = methods;
	}

	public void addMethod(Method m) {
		this.methods.add(m);
	}

	public String getControllerMapping() {
		return controllerMappings;
	}

	public void setControllerMapping(String controllerMappings) {
		this.controllerMappings = controllerMappings;
	}

	public String getResourceName() {
		return resourceName;
	}

	public void setResource(String resource) {
		this.resourceName = resource;
	}

	public String getResourcePath() {
		return "/" + resourceName;
	}

	public String getResourceKey() {
		return resourceKey;
	}

	public void setResourceKey(String resourceKey) {
		this.resourceKey = resourceKey;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}