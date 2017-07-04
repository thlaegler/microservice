/**
 * generated by Xtext 2.12.0
 */
package com.laegler.microservice.model.microserviceModel.impl;

import com.laegler.microservice.model.microserviceModel.GrpcExpose;
import com.laegler.microservice.model.microserviceModel.MicroserviceModelPackage;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.ecore.EClass;

import org.eclipse.emf.ecore.impl.ENotificationImpl;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Grpc Expose</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.laegler.microservice.model.microserviceModel.impl.GrpcExposeImpl#getProtoInline <em>Proto Inline</em>}</li>
 *   <li>{@link com.laegler.microservice.model.microserviceModel.impl.GrpcExposeImpl#getProtoFile <em>Proto File</em>}</li>
 * </ul>
 *
 * @generated
 */
public class GrpcExposeImpl extends ExposeImpl implements GrpcExpose {
  /**
   * The default value of the '{@link #getProtoInline() <em>Proto Inline</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #getProtoInline()
   * @generated
   * @ordered
   */
  protected static final String PROTO_INLINE_EDEFAULT = null;

  /**
   * The cached value of the '{@link #getProtoInline() <em>Proto Inline</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #getProtoInline()
   * @generated
   * @ordered
   */
  protected String protoInline = PROTO_INLINE_EDEFAULT;

  /**
   * The default value of the '{@link #getProtoFile() <em>Proto File</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #getProtoFile()
   * @generated
   * @ordered
   */
  protected static final String PROTO_FILE_EDEFAULT = null;

  /**
   * The cached value of the '{@link #getProtoFile() <em>Proto File</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #getProtoFile()
   * @generated
   * @ordered
   */
  protected String protoFile = PROTO_FILE_EDEFAULT;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected GrpcExposeImpl() {
    super();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  protected EClass eStaticClass() {
    return MicroserviceModelPackage.Literals.GRPC_EXPOSE;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public String getProtoInline() {
    return protoInline;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public void setProtoInline(String newProtoInline) {
    String oldProtoInline = protoInline;
    protoInline = newProtoInline;
    if (eNotificationRequired())
      eNotify(new ENotificationImpl(this, Notification.SET, MicroserviceModelPackage.GRPC_EXPOSE__PROTO_INLINE, oldProtoInline, protoInline));
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public String getProtoFile() {
    return protoFile;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public void setProtoFile(String newProtoFile) {
    String oldProtoFile = protoFile;
    protoFile = newProtoFile;
    if (eNotificationRequired())
      eNotify(new ENotificationImpl(this, Notification.SET, MicroserviceModelPackage.GRPC_EXPOSE__PROTO_FILE, oldProtoFile, protoFile));
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public Object eGet(int featureID, boolean resolve, boolean coreType) {
    switch (featureID) {
      case MicroserviceModelPackage.GRPC_EXPOSE__PROTO_INLINE:
        return getProtoInline();
      case MicroserviceModelPackage.GRPC_EXPOSE__PROTO_FILE:
        return getProtoFile();
    }
    return super.eGet(featureID, resolve, coreType);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public void eSet(int featureID, Object newValue) {
    switch (featureID) {
      case MicroserviceModelPackage.GRPC_EXPOSE__PROTO_INLINE:
        setProtoInline((String)newValue);
        return;
      case MicroserviceModelPackage.GRPC_EXPOSE__PROTO_FILE:
        setProtoFile((String)newValue);
        return;
    }
    super.eSet(featureID, newValue);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public void eUnset(int featureID) {
    switch (featureID) {
      case MicroserviceModelPackage.GRPC_EXPOSE__PROTO_INLINE:
        setProtoInline(PROTO_INLINE_EDEFAULT);
        return;
      case MicroserviceModelPackage.GRPC_EXPOSE__PROTO_FILE:
        setProtoFile(PROTO_FILE_EDEFAULT);
        return;
    }
    super.eUnset(featureID);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public boolean eIsSet(int featureID) {
    switch (featureID) {
      case MicroserviceModelPackage.GRPC_EXPOSE__PROTO_INLINE:
        return PROTO_INLINE_EDEFAULT == null ? protoInline != null : !PROTO_INLINE_EDEFAULT.equals(protoInline);
      case MicroserviceModelPackage.GRPC_EXPOSE__PROTO_FILE:
        return PROTO_FILE_EDEFAULT == null ? protoFile != null : !PROTO_FILE_EDEFAULT.equals(protoFile);
    }
    return super.eIsSet(featureID);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public String toString() {
    if (eIsProxy()) return super.toString();

    StringBuffer result = new StringBuffer(super.toString());
    result.append(" (protoInline: ");
    result.append(protoInline);
    result.append(", protoFile: ");
    result.append(protoFile);
    result.append(')');
    return result.toString();
  }

} //GrpcExposeImpl
