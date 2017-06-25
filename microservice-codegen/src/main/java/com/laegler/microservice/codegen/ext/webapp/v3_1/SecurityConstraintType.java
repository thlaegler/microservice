//
// Diese Datei wurde mit der JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 generiert 
// Siehe <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Änderungen an dieser Datei gehen bei einer Neukompilierung des Quellschemas verloren. 
// Generiert: 2016.09.10 um 03:05:14 AM CEST 
//


package com.laegler.microservice.codegen.ext.webapp.v3_1;

import java.util.ArrayList;
import java.util.List;
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
 *         The security-constraintType is used to associate
 *         security constraints with one or more web resource
 *         collections
 *         
 *         Used in: web-app
 *         
 *       
 * 
 * <p>Java-Klasse für security-constraintType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="security-constraintType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="display-name" type="{http://xmlns.jcp.org/xml/ns/javaee}display-nameType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="web-resource-collection" type="{http://xmlns.jcp.org/xml/ns/javaee}web-resource-collectionType" maxOccurs="unbounded"/>
 *         &lt;element name="auth-constraint" type="{http://xmlns.jcp.org/xml/ns/javaee}auth-constraintType" minOccurs="0"/>
 *         &lt;element name="user-data-constraint" type="{http://xmlns.jcp.org/xml/ns/javaee}user-data-constraintType" minOccurs="0"/>
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
@XmlType(name = "security-constraintType", propOrder = {
    "displayName",
    "webResourceCollection",
    "authConstraint",
    "userDataConstraint"
})
public class SecurityConstraintType {

    @XmlElement(name = "display-name")
    protected List<DisplayNameType> displayName;
    @XmlElement(name = "web-resource-collection", required = true)
    protected List<WebResourceCollectionType> webResourceCollection;
    @XmlElement(name = "auth-constraint")
    protected AuthConstraintType authConstraint;
    @XmlElement(name = "user-data-constraint")
    protected UserDataConstraintType userDataConstraint;
    @XmlAttribute(name = "id")
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    @XmlID
    @XmlSchemaType(name = "ID")
    protected java.lang.String id;

    /**
     * Gets the value of the displayName property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the displayName property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getDisplayName().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link DisplayNameType }
     * 
     * 
     */
    public List<DisplayNameType> getDisplayName() {
        if (displayName == null) {
            displayName = new ArrayList<DisplayNameType>();
        }
        return this.displayName;
    }

    /**
     * Gets the value of the webResourceCollection property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the webResourceCollection property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getWebResourceCollection().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link WebResourceCollectionType }
     * 
     * 
     */
    public List<WebResourceCollectionType> getWebResourceCollection() {
        if (webResourceCollection == null) {
            webResourceCollection = new ArrayList<WebResourceCollectionType>();
        }
        return this.webResourceCollection;
    }

    /**
     * Ruft den Wert der authConstraint-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link AuthConstraintType }
     *     
     */
    public AuthConstraintType getAuthConstraint() {
        return authConstraint;
    }

    /**
     * Legt den Wert der authConstraint-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link AuthConstraintType }
     *     
     */
    public void setAuthConstraint(AuthConstraintType value) {
        this.authConstraint = value;
    }

    /**
     * Ruft den Wert der userDataConstraint-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link UserDataConstraintType }
     *     
     */
    public UserDataConstraintType getUserDataConstraint() {
        return userDataConstraint;
    }

    /**
     * Legt den Wert der userDataConstraint-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link UserDataConstraintType }
     *     
     */
    public void setUserDataConstraint(UserDataConstraintType value) {
        this.userDataConstraint = value;
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
