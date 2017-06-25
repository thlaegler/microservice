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
 *         Configuration of a JMS Connection Factory.
 *         
 *       
 * 
 * <p>Java-Klasse für jms-connection-factoryType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="jms-connection-factoryType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="description" type="{http://xmlns.jcp.org/xml/ns/javaee}descriptionType" minOccurs="0"/>
 *         &lt;element name="name" type="{http://xmlns.jcp.org/xml/ns/javaee}jndi-nameType"/>
 *         &lt;element name="interface-name" type="{http://xmlns.jcp.org/xml/ns/javaee}fully-qualified-classType" minOccurs="0"/>
 *         &lt;element name="class-name" type="{http://xmlns.jcp.org/xml/ns/javaee}fully-qualified-classType" minOccurs="0"/>
 *         &lt;element name="resource-adapter" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
 *         &lt;element name="user" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
 *         &lt;element name="password" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
 *         &lt;element name="client-id" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
 *         &lt;element name="property" type="{http://xmlns.jcp.org/xml/ns/javaee}propertyType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="transactional" type="{http://xmlns.jcp.org/xml/ns/javaee}xsdBooleanType" minOccurs="0"/>
 *         &lt;element name="max-pool-size" type="{http://xmlns.jcp.org/xml/ns/javaee}xsdIntegerType" minOccurs="0"/>
 *         &lt;element name="min-pool-size" type="{http://xmlns.jcp.org/xml/ns/javaee}xsdIntegerType" minOccurs="0"/>
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
@XmlType(name = "jms-connection-factoryType", propOrder = {
    "description",
    "name",
    "interfaceName",
    "className",
    "resourceAdapter",
    "user",
    "password",
    "clientId",
    "property",
    "transactional",
    "maxPoolSize",
    "minPoolSize"
})
public class JmsConnectionFactoryType {

    protected DescriptionType description;
    @XmlElement(required = true)
    protected JndiNameType name;
    @XmlElement(name = "interface-name")
    protected FullyQualifiedClassType interfaceName;
    @XmlElement(name = "class-name")
    protected FullyQualifiedClassType className;
    @XmlElement(name = "resource-adapter")
    protected com.laegler.microservice.codegen.ext.javaee.v7.String resourceAdapter;
    protected com.laegler.microservice.codegen.ext.javaee.v7.String user;
    protected com.laegler.microservice.codegen.ext.javaee.v7.String password;
    @XmlElement(name = "client-id")
    protected com.laegler.microservice.codegen.ext.javaee.v7.String clientId;
    protected List<PropertyType> property;
    protected XsdBooleanType transactional;
    @XmlElement(name = "max-pool-size")
    protected XsdIntegerType maxPoolSize;
    @XmlElement(name = "min-pool-size")
    protected XsdIntegerType minPoolSize;
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
     * Ruft den Wert der interfaceName-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link FullyQualifiedClassType }
     *     
     */
    public FullyQualifiedClassType getInterfaceName() {
        return interfaceName;
    }

    /**
     * Legt den Wert der interfaceName-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link FullyQualifiedClassType }
     *     
     */
    public void setInterfaceName(FullyQualifiedClassType value) {
        this.interfaceName = value;
    }

    /**
     * Ruft den Wert der className-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link FullyQualifiedClassType }
     *     
     */
    public FullyQualifiedClassType getClassName() {
        return className;
    }

    /**
     * Legt den Wert der className-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link FullyQualifiedClassType }
     *     
     */
    public void setClassName(FullyQualifiedClassType value) {
        this.className = value;
    }

    /**
     * Ruft den Wert der resourceAdapter-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link com.laegler.microservice.codegen.ext.javaee.v7.String }
     *     
     */
    public com.laegler.microservice.codegen.ext.javaee.v7.String getResourceAdapter() {
        return resourceAdapter;
    }

    /**
     * Legt den Wert der resourceAdapter-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link com.laegler.microservice.codegen.ext.javaee.v7.String }
     *     
     */
    public void setResourceAdapter(com.laegler.microservice.codegen.ext.javaee.v7.String value) {
        this.resourceAdapter = value;
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
     * Ruft den Wert der clientId-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link com.laegler.microservice.codegen.ext.javaee.v7.String }
     *     
     */
    public com.laegler.microservice.codegen.ext.javaee.v7.String getClientId() {
        return clientId;
    }

    /**
     * Legt den Wert der clientId-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link com.laegler.microservice.codegen.ext.javaee.v7.String }
     *     
     */
    public void setClientId(com.laegler.microservice.codegen.ext.javaee.v7.String value) {
        this.clientId = value;
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
     * Ruft den Wert der transactional-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link XsdBooleanType }
     *     
     */
    public XsdBooleanType getTransactional() {
        return transactional;
    }

    /**
     * Legt den Wert der transactional-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link XsdBooleanType }
     *     
     */
    public void setTransactional(XsdBooleanType value) {
        this.transactional = value;
    }

    /**
     * Ruft den Wert der maxPoolSize-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link XsdIntegerType }
     *     
     */
    public XsdIntegerType getMaxPoolSize() {
        return maxPoolSize;
    }

    /**
     * Legt den Wert der maxPoolSize-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link XsdIntegerType }
     *     
     */
    public void setMaxPoolSize(XsdIntegerType value) {
        this.maxPoolSize = value;
    }

    /**
     * Ruft den Wert der minPoolSize-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link XsdIntegerType }
     *     
     */
    public XsdIntegerType getMinPoolSize() {
        return minPoolSize;
    }

    /**
     * Legt den Wert der minPoolSize-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link XsdIntegerType }
     *     
     */
    public void setMinPoolSize(XsdIntegerType value) {
        this.minPoolSize = value;
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
