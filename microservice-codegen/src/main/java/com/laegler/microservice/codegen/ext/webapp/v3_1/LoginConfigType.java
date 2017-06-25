//
// Diese Datei wurde mit der JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 generiert 
// Siehe <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Änderungen an dieser Datei gehen bei einer Neukompilierung des Quellschemas verloren. 
// Generiert: 2016.09.10 um 03:05:14 AM CEST 
//


package com.laegler.microservice.codegen.ext.webapp.v3_1;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlID;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.adapters.CollapsedStringAdapter;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;


/**
 * 
 * 
 *         The login-configType is used to configure the authentication
 *         method that should be used, the realm name that should be
 *         used for this application, and the attributes that are
 *         needed by the form login mechanism.
 *         
 *         Used in: web-app
 *         
 *       
 * 
 * <p>Java-Klasse für login-configType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="login-configType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="auth-method" type="{http://xmlns.jcp.org/xml/ns/javaee}auth-methodType" minOccurs="0"/>
 *         &lt;element name="realm-name" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
 *         &lt;element name="form-login-config" type="{http://xmlns.jcp.org/xml/ns/javaee}form-login-configType" minOccurs="0"/>
 *       &lt;/sequence>
 *       &lt;attribute name="id" type="{http://www.w3.org/2001/XMLSchema}ID" />
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "login-configType", propOrder = {
    "authMethod",
    "realmName",
    "formLoginConfig"
})
public class LoginConfigType {

    @XmlElement(name = "auth-method")
    protected AuthMethodType authMethod;
    @XmlElement(name = "realm-name")
    protected com.laegler.microservice.codegen.ext.webapp.v3_1.String realmName;
    @XmlElement(name = "form-login-config")
    protected FormLoginConfigType formLoginConfig;
    @XmlAttribute(name = "id")
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    @XmlID
    @XmlSchemaType(name = "ID")
    protected java.lang.String id;

    /**
     * Ruft den Wert der authMethod-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link AuthMethodType }
     *     
     */
    public AuthMethodType getAuthMethod() {
        return authMethod;
    }

    /**
     * Legt den Wert der authMethod-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link AuthMethodType }
     *     
     */
    public void setAuthMethod(AuthMethodType value) {
        this.authMethod = value;
    }

    /**
     * Ruft den Wert der realmName-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link com.laegler.microservice.codegen.ext.webapp.v3_1.String }
     *     
     */
    public com.laegler.microservice.codegen.ext.webapp.v3_1.String getRealmName() {
        return realmName;
    }

    /**
     * Legt den Wert der realmName-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link com.laegler.microservice.codegen.ext.webapp.v3_1.String }
     *     
     */
    public void setRealmName(com.laegler.microservice.codegen.ext.webapp.v3_1.String value) {
        this.realmName = value;
    }

    /**
     * Ruft den Wert der formLoginConfig-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link FormLoginConfigType }
     *     
     */
    public FormLoginConfigType getFormLoginConfig() {
        return formLoginConfig;
    }

    /**
     * Legt den Wert der formLoginConfig-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link FormLoginConfigType }
     *     
     */
    public void setFormLoginConfig(FormLoginConfigType value) {
        this.formLoginConfig = value;
    }

    /**
     * Ruft den Wert der id-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link java.lang.String }
     *     
     */
    public java.lang.String getId() {
        return id;
    }

    /**
     * Legt den Wert der id-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link java.lang.String }
     *     
     */
    public void setId(java.lang.String value) {
        this.id = value;
    }

}
