//
// Diese Datei wurde mit der JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 generiert 
// Siehe <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Änderungen an dieser Datei gehen bei einer Neukompilierung des Quellschemas verloren. 
// Generiert: 2016.09.10 um 03:14:29 AM CEST 
//


package com.laegler.microservice.codegen.ext.javaee.v7;

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
 *         Configuration of a Mail Session resource.
 *         
 *       
 * 
 * <p>Java-Klasse für mail-sessionType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="mail-sessionType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="description" type="{http://xmlns.jcp.org/xml/ns/javaee}descriptionType" minOccurs="0"/>
 *         &lt;element name="name" type="{http://xmlns.jcp.org/xml/ns/javaee}jndi-nameType"/>
 *         &lt;element name="store-protocol" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
 *         &lt;element name="store-protocol-class" type="{http://xmlns.jcp.org/xml/ns/javaee}fully-qualified-classType" minOccurs="0"/>
 *         &lt;element name="transport-protocol" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
 *         &lt;element name="transport-protocol-class" type="{http://xmlns.jcp.org/xml/ns/javaee}fully-qualified-classType" minOccurs="0"/>
 *         &lt;element name="host" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
 *         &lt;element name="user" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
 *         &lt;element name="password" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
 *         &lt;element name="from" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
 *         &lt;element name="property" type="{http://xmlns.jcp.org/xml/ns/javaee}propertyType" maxOccurs="unbounded" minOccurs="0"/>
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
@XmlType(name = "mail-sessionType", propOrder = {
    "description",
    "name",
    "storeProtocol",
    "storeProtocolClass",
    "transportProtocol",
    "transportProtocolClass",
    "host",
    "user",
    "password",
    "from",
    "property"
})
public class MailSessionType {

    protected DescriptionType description;
    @XmlElement(required = true)
    protected JndiNameType name;
    @XmlElement(name = "store-protocol")
    protected com.laegler.microservice.codegen.ext.javaee.v7.String storeProtocol;
    @XmlElement(name = "store-protocol-class")
    protected FullyQualifiedClassType storeProtocolClass;
    @XmlElement(name = "transport-protocol")
    protected com.laegler.microservice.codegen.ext.javaee.v7.String transportProtocol;
    @XmlElement(name = "transport-protocol-class")
    protected FullyQualifiedClassType transportProtocolClass;
    protected com.laegler.microservice.codegen.ext.javaee.v7.String host;
    protected com.laegler.microservice.codegen.ext.javaee.v7.String user;
    protected com.laegler.microservice.codegen.ext.javaee.v7.String password;
    protected com.laegler.microservice.codegen.ext.javaee.v7.String from;
    protected List<PropertyType> property;
    @XmlAttribute(name = "id")
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    @XmlID
    @XmlSchemaType(name = "ID")
    protected java.lang.String id;

    /**
     * Ruft den Wert der description-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link DescriptionType }
     *     
     */
    public DescriptionType getDescription() {
        return description;
    }

    /**
     * Legt den Wert der description-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link DescriptionType }
     *     
     */
    public void setDescription(DescriptionType value) {
        this.description = value;
    }

    /**
     * Ruft den Wert der name-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link JndiNameType }
     *     
     */
    public JndiNameType getName() {
        return name;
    }

    /**
     * Legt den Wert der name-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link JndiNameType }
     *     
     */
    public void setName(JndiNameType value) {
        this.name = value;
    }

    /**
     * Ruft den Wert der storeProtocol-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link com.laegler.microservice.codegen.ext.javaee.v7.String }
     *     
     */
    public com.laegler.microservice.codegen.ext.javaee.v7.String getStoreProtocol() {
        return storeProtocol;
    }

    /**
     * Legt den Wert der storeProtocol-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link com.laegler.microservice.codegen.ext.javaee.v7.String }
     *     
     */
    public void setStoreProtocol(com.laegler.microservice.codegen.ext.javaee.v7.String value) {
        this.storeProtocol = value;
    }

    /**
     * Ruft den Wert der storeProtocolClass-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link FullyQualifiedClassType }
     *     
     */
    public FullyQualifiedClassType getStoreProtocolClass() {
        return storeProtocolClass;
    }

    /**
     * Legt den Wert der storeProtocolClass-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link FullyQualifiedClassType }
     *     
     */
    public void setStoreProtocolClass(FullyQualifiedClassType value) {
        this.storeProtocolClass = value;
    }

    /**
     * Ruft den Wert der transportProtocol-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link com.laegler.microservice.codegen.ext.javaee.v7.String }
     *     
     */
    public com.laegler.microservice.codegen.ext.javaee.v7.String getTransportProtocol() {
        return transportProtocol;
    }

    /**
     * Legt den Wert der transportProtocol-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link com.laegler.microservice.codegen.ext.javaee.v7.String }
     *     
     */
    public void setTransportProtocol(com.laegler.microservice.codegen.ext.javaee.v7.String value) {
        this.transportProtocol = value;
    }

    /**
     * Ruft den Wert der transportProtocolClass-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link FullyQualifiedClassType }
     *     
     */
    public FullyQualifiedClassType getTransportProtocolClass() {
        return transportProtocolClass;
    }

    /**
     * Legt den Wert der transportProtocolClass-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link FullyQualifiedClassType }
     *     
     */
    public void setTransportProtocolClass(FullyQualifiedClassType value) {
        this.transportProtocolClass = value;
    }

    /**
     * Ruft den Wert der host-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link com.laegler.microservice.codegen.ext.javaee.v7.String }
     *     
     */
    public com.laegler.microservice.codegen.ext.javaee.v7.String getHost() {
        return host;
    }

    /**
     * Legt den Wert der host-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link com.laegler.microservice.codegen.ext.javaee.v7.String }
     *     
     */
    public void setHost(com.laegler.microservice.codegen.ext.javaee.v7.String value) {
        this.host = value;
    }

    /**
     * Ruft den Wert der user-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link com.laegler.microservice.codegen.ext.javaee.v7.String }
     *     
     */
    public com.laegler.microservice.codegen.ext.javaee.v7.String getUser() {
        return user;
    }

    /**
     * Legt den Wert der user-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link com.laegler.microservice.codegen.ext.javaee.v7.String }
     *     
     */
    public void setUser(com.laegler.microservice.codegen.ext.javaee.v7.String value) {
        this.user = value;
    }

    /**
     * Ruft den Wert der password-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link com.laegler.microservice.codegen.ext.javaee.v7.String }
     *     
     */
    public com.laegler.microservice.codegen.ext.javaee.v7.String getPassword() {
        return password;
    }

    /**
     * Legt den Wert der password-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link com.laegler.microservice.codegen.ext.javaee.v7.String }
     *     
     */
    public void setPassword(com.laegler.microservice.codegen.ext.javaee.v7.String value) {
        this.password = value;
    }

    /**
     * Ruft den Wert der from-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link com.laegler.microservice.codegen.ext.javaee.v7.String }
     *     
     */
    public com.laegler.microservice.codegen.ext.javaee.v7.String getFrom() {
        return from;
    }

    /**
     * Legt den Wert der from-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link com.laegler.microservice.codegen.ext.javaee.v7.String }
     *     
     */
    public void setFrom(com.laegler.microservice.codegen.ext.javaee.v7.String value) {
        this.from = value;
    }

    /**
     * Gets the value of the property property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the property property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getProperty().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link PropertyType }
     * 
     * 
     */
    public List<PropertyType> getProperty() {
        if (property == null) {
            property = new ArrayList<PropertyType>();
        }
        return this.property;
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
