//
// Diese Datei wurde mit der JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 generiert 
// Siehe <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Änderungen an dieser Datei gehen bei einer Neukompilierung des Quellschemas verloren. 
// Generiert: 2016.09.10 um 03:14:29 AM CEST 
//


package com.laegler.microservice.codegen.ext.javaee.v7;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * 
 * 
 *         The lifecycle-callback type specifies a method on a
 *         class to be called when a lifecycle event occurs.
 *         Note that each class may have only one lifecycle callback
 *         method for any given event and that the method may not
 *         be overloaded.
 *         
 *         If the lifefycle-callback-class element is missing then
 *         the class defining the callback is assumed to be the
 *         component class in scope at the place in the descriptor
 *         in which the callback definition appears.
 *         
 *       
 * 
 * <p>Java-Klasse für lifecycle-callbackType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="lifecycle-callbackType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="lifecycle-callback-class" type="{http://xmlns.jcp.org/xml/ns/javaee}fully-qualified-classType" minOccurs="0"/>
 *         &lt;element name="lifecycle-callback-method" type="{http://xmlns.jcp.org/xml/ns/javaee}java-identifierType"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "lifecycle-callbackType", propOrder = {
    "lifecycleCallbackClass",
    "lifecycleCallbackMethod"
})
public class LifecycleCallbackType {

    @XmlElement(name = "lifecycle-callback-class")
    protected FullyQualifiedClassType lifecycleCallbackClass;
    @XmlElement(name = "lifecycle-callback-method", required = true)
    protected JavaIdentifierType lifecycleCallbackMethod;

    /**
     * Ruft den Wert der lifecycleCallbackClass-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link FullyQualifiedClassType }
     *     
     */
    public FullyQualifiedClassType getLifecycleCallbackClass() {
        return lifecycleCallbackClass;
    }

    /**
     * Legt den Wert der lifecycleCallbackClass-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link FullyQualifiedClassType }
     *     
     */
    public void setLifecycleCallbackClass(FullyQualifiedClassType value) {
        this.lifecycleCallbackClass = value;
    }

    /**
     * Ruft den Wert der lifecycleCallbackMethod-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link JavaIdentifierType }
     *     
     */
    public JavaIdentifierType getLifecycleCallbackMethod() {
        return lifecycleCallbackMethod;
    }

    /**
     * Legt den Wert der lifecycleCallbackMethod-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link JavaIdentifierType }
     *     
     */
    public void setLifecycleCallbackMethod(JavaIdentifierType value) {
        this.lifecycleCallbackMethod = value;
    }

}
