/**
 * generated by Xtext 2.12.0
 */
package com.laegler.microservice.model.microserviceModel.util;

import com.laegler.microservice.model.microserviceModel.*;

import org.eclipse.emf.common.notify.Adapter;
import org.eclipse.emf.common.notify.Notifier;

import org.eclipse.emf.common.notify.impl.AdapterFactoryImpl;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * The <b>Adapter Factory</b> for the model.
 * It provides an adapter <code>createXXX</code> method for each class of the model.
 * <!-- end-user-doc -->
 * @see com.laegler.microservice.model.microserviceModel.MicroserviceModelPackage
 * @generated
 */
public class MicroserviceModelAdapterFactory extends AdapterFactoryImpl {
  /**
   * The cached model package.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected static MicroserviceModelPackage modelPackage;

  /**
   * Creates an instance of the adapter factory.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public MicroserviceModelAdapterFactory() {
    if (modelPackage == null) {
      modelPackage = MicroserviceModelPackage.eINSTANCE;
    }
  }

  /**
   * Returns whether this factory is applicable for the type of the object.
   * <!-- begin-user-doc -->
   * This implementation returns <code>true</code> if the object is either the model's package or is an instance object of the model.
   * <!-- end-user-doc -->
   * @return whether this factory is applicable for the type of the object.
   * @generated
   */
  @Override
  public boolean isFactoryForType(Object object) {
    if (object == modelPackage) {
      return true;
    }
    if (object instanceof EObject) {
      return ((EObject)object).eClass().getEPackage() == modelPackage;
    }
    return false;
  }

  /**
   * The switch that delegates to the <code>createXXX</code> methods.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected MicroserviceModelSwitch<Adapter> modelSwitch =
    new MicroserviceModelSwitch<Adapter>() {
      @Override
      public Adapter caseArchitecture(Architecture object) {
        return createArchitectureAdapter();
      }
      @Override
      public Adapter caseArtifact(Artifact object) {
        return createArtifactAdapter();
      }
      @Override
      public Adapter caseSpring(Spring object) {
        return createSpringAdapter();
      }
      @Override
      public Adapter caseGateway(Gateway object) {
        return createGatewayAdapter();
      }
      @Override
      public Adapter caseRoute(Route object) {
        return createRouteAdapter();
      }
      @Override
      public Adapter caseGrpcJar(GrpcJar object) {
        return createGrpcJarAdapter();
      }
      @Override
      public Adapter caseJar(Jar object) {
        return createJarAdapter();
      }
      @Override
      public Adapter caseOption(Option object) {
        return createOptionAdapter();
      }
      @Override
      public Adapter caseExpose(Expose object) {
        return createExposeAdapter();
      }
      @Override
      public Adapter caseRestExpose(RestExpose object) {
        return createRestExposeAdapter();
      }
      @Override
      public Adapter caseGrpcExpose(GrpcExpose object) {
        return createGrpcExposeAdapter();
      }
      @Override
      public Adapter caseConsume(Consume object) {
        return createConsumeAdapter();
      }
      @Override
      public Adapter caseRestConsume(RestConsume object) {
        return createRestConsumeAdapter();
      }
      @Override
      public Adapter caseGrpcConsume(GrpcConsume object) {
        return createGrpcConsumeAdapter();
      }
      @Override
      public Adapter caseDependency(Dependency object) {
        return createDependencyAdapter();
      }
      @Override
      public Adapter caseEntityModel(EntityModel object) {
        return createEntityModelAdapter();
      }
      @Override
      public Adapter caseEntity(Entity object) {
        return createEntityAdapter();
      }
      @Override
      public Adapter caseEnumeration(Enumeration object) {
        return createEnumerationAdapter();
      }
      @Override
      public Adapter caseAttribute(Attribute object) {
        return createAttributeAdapter();
      }
      @Override
      public Adapter caseRelationship(Relationship object) {
        return createRelationshipAdapter();
      }
      @Override
      public Adapter defaultCase(EObject object) {
        return createEObjectAdapter();
      }
    };

  /**
   * Creates an adapter for the <code>target</code>.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param target the object to adapt.
   * @return the adapter for the <code>target</code>.
   * @generated
   */
  @Override
  public Adapter createAdapter(Notifier target) {
    return modelSwitch.doSwitch((EObject)target);
  }


  /**
   * Creates a new adapter for an object of class '{@link com.laegler.microservice.model.microserviceModel.Architecture <em>Architecture</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see com.laegler.microservice.model.microserviceModel.Architecture
   * @generated
   */
  public Adapter createArchitectureAdapter() {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link com.laegler.microservice.model.microserviceModel.Artifact <em>Artifact</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see com.laegler.microservice.model.microserviceModel.Artifact
   * @generated
   */
  public Adapter createArtifactAdapter() {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link com.laegler.microservice.model.microserviceModel.Spring <em>Spring</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see com.laegler.microservice.model.microserviceModel.Spring
   * @generated
   */
  public Adapter createSpringAdapter() {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link com.laegler.microservice.model.microserviceModel.Gateway <em>Gateway</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see com.laegler.microservice.model.microserviceModel.Gateway
   * @generated
   */
  public Adapter createGatewayAdapter() {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link com.laegler.microservice.model.microserviceModel.Route <em>Route</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see com.laegler.microservice.model.microserviceModel.Route
   * @generated
   */
  public Adapter createRouteAdapter() {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link com.laegler.microservice.model.microserviceModel.GrpcJar <em>Grpc Jar</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see com.laegler.microservice.model.microserviceModel.GrpcJar
   * @generated
   */
  public Adapter createGrpcJarAdapter() {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link com.laegler.microservice.model.microserviceModel.Jar <em>Jar</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see com.laegler.microservice.model.microserviceModel.Jar
   * @generated
   */
  public Adapter createJarAdapter() {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link com.laegler.microservice.model.microserviceModel.Option <em>Option</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see com.laegler.microservice.model.microserviceModel.Option
   * @generated
   */
  public Adapter createOptionAdapter() {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link com.laegler.microservice.model.microserviceModel.Expose <em>Expose</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see com.laegler.microservice.model.microserviceModel.Expose
   * @generated
   */
  public Adapter createExposeAdapter() {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link com.laegler.microservice.model.microserviceModel.RestExpose <em>Rest Expose</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see com.laegler.microservice.model.microserviceModel.RestExpose
   * @generated
   */
  public Adapter createRestExposeAdapter() {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link com.laegler.microservice.model.microserviceModel.GrpcExpose <em>Grpc Expose</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see com.laegler.microservice.model.microserviceModel.GrpcExpose
   * @generated
   */
  public Adapter createGrpcExposeAdapter() {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link com.laegler.microservice.model.microserviceModel.Consume <em>Consume</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see com.laegler.microservice.model.microserviceModel.Consume
   * @generated
   */
  public Adapter createConsumeAdapter() {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link com.laegler.microservice.model.microserviceModel.RestConsume <em>Rest Consume</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see com.laegler.microservice.model.microserviceModel.RestConsume
   * @generated
   */
  public Adapter createRestConsumeAdapter() {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link com.laegler.microservice.model.microserviceModel.GrpcConsume <em>Grpc Consume</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see com.laegler.microservice.model.microserviceModel.GrpcConsume
   * @generated
   */
  public Adapter createGrpcConsumeAdapter() {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link com.laegler.microservice.model.microserviceModel.Dependency <em>Dependency</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see com.laegler.microservice.model.microserviceModel.Dependency
   * @generated
   */
  public Adapter createDependencyAdapter() {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link com.laegler.microservice.model.microserviceModel.EntityModel <em>Entity Model</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see com.laegler.microservice.model.microserviceModel.EntityModel
   * @generated
   */
  public Adapter createEntityModelAdapter() {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link com.laegler.microservice.model.microserviceModel.Entity <em>Entity</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see com.laegler.microservice.model.microserviceModel.Entity
   * @generated
   */
  public Adapter createEntityAdapter() {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link com.laegler.microservice.model.microserviceModel.Enumeration <em>Enumeration</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see com.laegler.microservice.model.microserviceModel.Enumeration
   * @generated
   */
  public Adapter createEnumerationAdapter() {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link com.laegler.microservice.model.microserviceModel.Attribute <em>Attribute</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see com.laegler.microservice.model.microserviceModel.Attribute
   * @generated
   */
  public Adapter createAttributeAdapter() {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link com.laegler.microservice.model.microserviceModel.Relationship <em>Relationship</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see com.laegler.microservice.model.microserviceModel.Relationship
   * @generated
   */
  public Adapter createRelationshipAdapter() {
    return null;
  }

  /**
   * Creates a new adapter for the default case.
   * <!-- begin-user-doc -->
   * This default implementation returns null.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @generated
   */
  public Adapter createEObjectAdapter() {
    return null;
  }

} //MicroserviceModelAdapterFactory
