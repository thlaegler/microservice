/**
 * generated by Xtext 2.12.0
 */
package com.laegler.microservice.model.microserviceModel;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Grpc Consume</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.laegler.microservice.model.microserviceModel.GrpcConsume#getTarget <em>Target</em>}</li>
 * </ul>
 *
 * @see com.laegler.microservice.model.microserviceModel.MicroserviceModelPackage#getGrpcConsume()
 * @model
 * @generated
 */
public interface GrpcConsume extends Consume {
  /**
   * Returns the value of the '<em><b>Target</b></em>' reference.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Target</em>' reference isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Target</em>' reference.
   * @see #setTarget(GrpcExpose)
   * @see com.laegler.microservice.model.microserviceModel.MicroserviceModelPackage#getGrpcConsume_Target()
   * @model
   * @generated
   */
  GrpcExpose getTarget();

  /**
   * Sets the value of the '{@link com.laegler.microservice.model.microserviceModel.GrpcConsume#getTarget <em>Target</em>}' reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Target</em>' reference.
   * @see #getTarget()
   * @generated
   */
  void setTarget(GrpcExpose value);

} // GrpcConsume