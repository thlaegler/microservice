/**
 * generated by Xtext 2.12.0
 */
package com.laegler.microservice.model.microserviceModel;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Relationship</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.laegler.microservice.model.microserviceModel.Relationship#getName <em>Name</em>}</li>
 *   <li>{@link com.laegler.microservice.model.microserviceModel.Relationship#getLabel <em>Label</em>}</li>
 *   <li>{@link com.laegler.microservice.model.microserviceModel.Relationship#getDocumentation <em>Documentation</em>}</li>
 *   <li>{@link com.laegler.microservice.model.microserviceModel.Relationship#getFrom <em>From</em>}</li>
 *   <li>{@link com.laegler.microservice.model.microserviceModel.Relationship#getTo <em>To</em>}</li>
 * </ul>
 *
 * @see com.laegler.microservice.model.microserviceModel.MicroserviceModelPackage#getRelationship()
 * @model
 * @generated
 */
public interface Relationship extends EObject {
  /**
   * Returns the value of the '<em><b>Name</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Name</em>' attribute isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Name</em>' attribute.
   * @see #setName(String)
   * @see com.laegler.microservice.model.microserviceModel.MicroserviceModelPackage#getRelationship_Name()
   * @model
   * @generated
   */
  String getName();

  /**
   * Sets the value of the '{@link com.laegler.microservice.model.microserviceModel.Relationship#getName <em>Name</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Name</em>' attribute.
   * @see #getName()
   * @generated
   */
  void setName(String value);

  /**
   * Returns the value of the '<em><b>Label</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Label</em>' attribute isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Label</em>' attribute.
   * @see #setLabel(String)
   * @see com.laegler.microservice.model.microserviceModel.MicroserviceModelPackage#getRelationship_Label()
   * @model
   * @generated
   */
  String getLabel();

  /**
   * Sets the value of the '{@link com.laegler.microservice.model.microserviceModel.Relationship#getLabel <em>Label</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Label</em>' attribute.
   * @see #getLabel()
   * @generated
   */
  void setLabel(String value);

  /**
   * Returns the value of the '<em><b>Documentation</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Documentation</em>' attribute isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Documentation</em>' attribute.
   * @see #setDocumentation(String)
   * @see com.laegler.microservice.model.microserviceModel.MicroserviceModelPackage#getRelationship_Documentation()
   * @model
   * @generated
   */
  String getDocumentation();

  /**
   * Sets the value of the '{@link com.laegler.microservice.model.microserviceModel.Relationship#getDocumentation <em>Documentation</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Documentation</em>' attribute.
   * @see #getDocumentation()
   * @generated
   */
  void setDocumentation(String value);

  /**
   * Returns the value of the '<em><b>From</b></em>' reference.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>From</em>' reference isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>From</em>' reference.
   * @see #setFrom(Entity)
   * @see com.laegler.microservice.model.microserviceModel.MicroserviceModelPackage#getRelationship_From()
   * @model
   * @generated
   */
  Entity getFrom();

  /**
   * Sets the value of the '{@link com.laegler.microservice.model.microserviceModel.Relationship#getFrom <em>From</em>}' reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>From</em>' reference.
   * @see #getFrom()
   * @generated
   */
  void setFrom(Entity value);

  /**
   * Returns the value of the '<em><b>To</b></em>' reference.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>To</em>' reference isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>To</em>' reference.
   * @see #setTo(Entity)
   * @see com.laegler.microservice.model.microserviceModel.MicroserviceModelPackage#getRelationship_To()
   * @model
   * @generated
   */
  Entity getTo();

  /**
   * Sets the value of the '{@link com.laegler.microservice.model.microserviceModel.Relationship#getTo <em>To</em>}' reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>To</em>' reference.
   * @see #getTo()
   * @generated
   */
  void setTo(Entity value);

} // Relationship
