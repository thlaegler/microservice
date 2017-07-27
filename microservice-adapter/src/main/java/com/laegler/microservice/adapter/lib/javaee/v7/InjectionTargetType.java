//
// Diese Datei wurde mit der JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 generiert 
// Siehe <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Änderungen an dieser Datei gehen bei einer Neukompilierung des Quellschemas verloren. 
// Generiert: 2016.09.10 um 03:14:29 AM CEST 
//


package com.laegler.microservice.adapter.lib.javaee.v7;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * 
 * 
 *         An injection target specifies a class and a name within
 *         that class into which a resource should be injected.
 *         
 *         The injection target class specifies the fully qualified
 *         class name that is the target of the injection.  The
 *         Java EE specifications describe which classes can be an
 *         injection target.
 *         
 *         The injection target name specifies the target within
 *         the specified class.  The target is first looked for as a
 *         JavaBeans property name.  If not found, the target is
 *         looked for as a field name.
 *         
 *         The specified resource will be injected into the target
 *         during initialization of the class by either calling the
 *         set method for the target property or by setting a value
 *         into the named field.
 *         
 *       
 * 
 * <p>Java-Klasse für injection-targetType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="injection-targetType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="injection-target-class" type="{http://xmlns.jcp.org/xml/ns/javaee}fully-qualified-classType"/>
 *         &lt;element name="injection-target-name" type="{http://xmlns.jcp.org/xml/ns/javaee}java-identifierType"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "injection-targetType", propOrder = {
    "injectionTargetClass",
    "injectionTargetName"
})
public class InjectionTargetType {

    @XmlElement(name = "injection-target-class", required = true)
    protected FullyQualifiedClassType injectionTargetClass;
    @XmlElement(name = "injection-target-name", required = true)
    protected JavaIdentifierType injectionTargetName;

    /**
     * Ruft den Wert der injectionTargetClass-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link FullyQualifiedClassType }
     *     
     */
    public FullyQualifiedClassType getInjectionTargetClass() {
        return injectionTargetClass;
    }

    /**
     * Legt den Wert der injectionTargetClass-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link FullyQualifiedClassType }
     *     
     */
    public void setInjectionTargetClass(FullyQualifiedClassType value) {
        this.injectionTargetClass = value;
    }

    /**
     * Ruft den Wert der injectionTargetName-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link JavaIdentifierType }
     *     
     */
    public JavaIdentifierType getInjectionTargetName() {
        return injectionTargetName;
    }

    /**
     * Legt den Wert der injectionTargetName-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link JavaIdentifierType }
     *     
     */
    public void setInjectionTargetName(JavaIdentifierType value) {
        this.injectionTargetName = value;
    }

}
