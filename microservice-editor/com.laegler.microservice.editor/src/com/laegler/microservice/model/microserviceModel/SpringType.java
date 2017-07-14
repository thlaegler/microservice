/**
 * generated by Xtext 2.12.0
 */
package com.laegler.microservice.model.microserviceModel;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.eclipse.emf.common.util.Enumerator;

/**
 * <!-- begin-user-doc -->
 * A representation of the literals of the enumeration '<em><b>Spring Type</b></em>',
 * and utility methods for working with them.
 * <!-- end-user-doc -->
 * @see com.laegler.microservice.model.microserviceModel.MicroserviceModelPackage#getSpringType()
 * @model
 * @generated
 */
public enum SpringType implements Enumerator {
  /**
   * The '<em><b>DAEMON</b></em>' literal object.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #DAEMON_VALUE
   * @generated
   * @ordered
   */
  DAEMON(0, "DAEMON", "daemon {"),

  /**
   * The '<em><b>SERVICE</b></em>' literal object.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #SERVICE_VALUE
   * @generated
   * @ordered
   */
  SERVICE(1, "SERVICE", "service {");

  /**
   * The '<em><b>DAEMON</b></em>' literal value.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of '<em><b>DAEMON</b></em>' literal object isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @see #DAEMON
   * @model literal="daemon {"
   * @generated
   * @ordered
   */
  public static final int DAEMON_VALUE = 0;

  /**
   * The '<em><b>SERVICE</b></em>' literal value.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of '<em><b>SERVICE</b></em>' literal object isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @see #SERVICE
   * @model literal="service {"
   * @generated
   * @ordered
   */
  public static final int SERVICE_VALUE = 1;

  /**
   * An array of all the '<em><b>Spring Type</b></em>' enumerators.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private static final SpringType[] VALUES_ARRAY =
    new SpringType[] {
      DAEMON,
      SERVICE,
    };

  /**
   * A public read-only list of all the '<em><b>Spring Type</b></em>' enumerators.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final List<SpringType> VALUES = Collections.unmodifiableList(Arrays.asList(VALUES_ARRAY));

  /**
   * Returns the '<em><b>Spring Type</b></em>' literal with the specified literal value.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param literal the literal.
   * @return the matching enumerator or <code>null</code>.
   * @generated
   */
  public static SpringType get(String literal) {
    for (int i = 0; i < VALUES_ARRAY.length; ++i) {
      SpringType result = VALUES_ARRAY[i];
      if (result.toString().equals(literal)) {
        return result;
      }
    }
    return null;
  }

  /**
   * Returns the '<em><b>Spring Type</b></em>' literal with the specified name.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param name the name.
   * @return the matching enumerator or <code>null</code>.
   * @generated
   */
  public static SpringType getByName(String name) {
    for (int i = 0; i < VALUES_ARRAY.length; ++i) {
      SpringType result = VALUES_ARRAY[i];
      if (result.getName().equals(name)) {
        return result;
      }
    }
    return null;
  }

  /**
   * Returns the '<em><b>Spring Type</b></em>' literal with the specified integer value.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the integer value.
   * @return the matching enumerator or <code>null</code>.
   * @generated
   */
  public static SpringType get(int value) {
    switch (value) {
      case DAEMON_VALUE: return DAEMON;
      case SERVICE_VALUE: return SERVICE;
    }
    return null;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private final int value;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private final String name;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private final String literal;

  /**
   * Only this class can construct instances.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private SpringType(int value, String name, String literal) {
    this.value = value;
    this.name = name;
    this.literal = literal;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public int getValue() {
    return value;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public String getName() {
    return name;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public String getLiteral() {
    return literal;
  }

  /**
   * Returns the literal value of the enumerator, which is its string representation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public String toString() {
    return literal;
  }
  
} //SpringType