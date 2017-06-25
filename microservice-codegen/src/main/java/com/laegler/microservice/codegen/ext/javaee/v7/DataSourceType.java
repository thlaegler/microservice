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
 *         Configuration of a DataSource.
 *         
 *       
 * 
 * <p>Java-Klasse für data-sourceType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="data-sourceType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="description" type="{http://xmlns.jcp.org/xml/ns/javaee}descriptionType" minOccurs="0"/>
 *         &lt;element name="name" type="{http://xmlns.jcp.org/xml/ns/javaee}jndi-nameType"/>
 *         &lt;element name="class-name" type="{http://xmlns.jcp.org/xml/ns/javaee}fully-qualified-classType" minOccurs="0"/>
 *         &lt;element name="server-name" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
 *         &lt;element name="port-number" type="{http://xmlns.jcp.org/xml/ns/javaee}xsdIntegerType" minOccurs="0"/>
 *         &lt;element name="database-name" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
 *         &lt;element name="url" type="{http://xmlns.jcp.org/xml/ns/javaee}jdbc-urlType" minOccurs="0"/>
 *         &lt;element name="user" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
 *         &lt;element name="password" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
 *         &lt;element name="property" type="{http://xmlns.jcp.org/xml/ns/javaee}propertyType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="login-timeout" type="{http://xmlns.jcp.org/xml/ns/javaee}xsdIntegerType" minOccurs="0"/>
 *         &lt;element name="transactional" type="{http://xmlns.jcp.org/xml/ns/javaee}xsdBooleanType" minOccurs="0"/>
 *         &lt;element name="isolation-level" type="{http://xmlns.jcp.org/xml/ns/javaee}isolation-levelType" minOccurs="0"/>
 *         &lt;element name="initial-pool-size" type="{http://xmlns.jcp.org/xml/ns/javaee}xsdIntegerType" minOccurs="0"/>
 *         &lt;element name="max-pool-size" type="{http://xmlns.jcp.org/xml/ns/javaee}xsdIntegerType" minOccurs="0"/>
 *         &lt;element name="min-pool-size" type="{http://xmlns.jcp.org/xml/ns/javaee}xsdIntegerType" minOccurs="0"/>
 *         &lt;element name="max-idle-time" type="{http://xmlns.jcp.org/xml/ns/javaee}xsdIntegerType" minOccurs="0"/>
 *         &lt;element name="max-statements" type="{http://xmlns.jcp.org/xml/ns/javaee}xsdIntegerType" minOccurs="0"/>
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
@XmlType(name = "data-sourceType", propOrder = {
    "description",
    "name",
    "className",
    "serverName",
    "portNumber",
    "databaseName",
    "url",
    "user",
    "password",
    "property",
    "loginTimeout",
    "transactional",
    "isolationLevel",
    "initialPoolSize",
    "maxPoolSize",
    "minPoolSize",
    "maxIdleTime",
    "maxStatements"
})
public class DataSourceType {

    protected DescriptionType description;
    @XmlElement(required = true)
    protected JndiNameType name;
    @XmlElement(name = "class-name")
    protected FullyQualifiedClassType className;
    @XmlElement(name = "server-name")
    protected com.laegler.microservice.codegen.ext.javaee.v7.String serverName;
    @XmlElement(name = "port-number")
    protected XsdIntegerType portNumber;
    @XmlElement(name = "database-name")
    protected com.laegler.microservice.codegen.ext.javaee.v7.String databaseName;
    protected JdbcUrlType url;
    protected com.laegler.microservice.codegen.ext.javaee.v7.String user;
    protected com.laegler.microservice.codegen.ext.javaee.v7.String password;
    protected List<PropertyType> property;
    @XmlElement(name = "login-timeout")
    protected XsdIntegerType loginTimeout;
    protected XsdBooleanType transactional;
    @XmlElement(name = "isolation-level")
    @XmlSchemaType(name = "string")
    protected IsolationLevelType isolationLevel;
    @XmlElement(name = "initial-pool-size")
    protected XsdIntegerType initialPoolSize;
    @XmlElement(name = "max-pool-size")
    protected XsdIntegerType maxPoolSize;
    @XmlElement(name = "min-pool-size")
    protected XsdIntegerType minPoolSize;
    @XmlElement(name = "max-idle-time")
    protected XsdIntegerType maxIdleTime;
    @XmlElement(name = "max-statements")
    protected XsdIntegerType maxStatements;
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
     * Ruft den Wert der serverName-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link com.laegler.microservice.codegen.ext.javaee.v7.String }
     *     
     */
    public com.laegler.microservice.codegen.ext.javaee.v7.String getServerName() {
        return serverName;
    }

    /**
     * Legt den Wert der serverName-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link com.laegler.microservice.codegen.ext.javaee.v7.String }
     *     
     */
    public void setServerName(com.laegler.microservice.codegen.ext.javaee.v7.String value) {
        this.serverName = value;
    }

    /**
     * Ruft den Wert der portNumber-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link XsdIntegerType }
     *     
     */
    public XsdIntegerType getPortNumber() {
        return portNumber;
    }

    /**
     * Legt den Wert der portNumber-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link XsdIntegerType }
     *     
     */
    public void setPortNumber(XsdIntegerType value) {
        this.portNumber = value;
    }

    /**
     * Ruft den Wert der databaseName-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link com.laegler.microservice.codegen.ext.javaee.v7.String }
     *     
     */
    public com.laegler.microservice.codegen.ext.javaee.v7.String getDatabaseName() {
        return databaseName;
    }

    /**
     * Legt den Wert der databaseName-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link com.laegler.microservice.codegen.ext.javaee.v7.String }
     *     
     */
    public void setDatabaseName(com.laegler.microservice.codegen.ext.javaee.v7.String value) {
        this.databaseName = value;
    }

    /**
     * Ruft den Wert der url-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link JdbcUrlType }
     *     
     */
    public JdbcUrlType getUrl() {
        return url;
    }

    /**
     * Legt den Wert der url-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link JdbcUrlType }
     *     
     */
    public void setUrl(JdbcUrlType value) {
        this.url = value;
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
     * Ruft den Wert der loginTimeout-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link XsdIntegerType }
     *     
     */
    public XsdIntegerType getLoginTimeout() {
        return loginTimeout;
    }

    /**
     * Legt den Wert der loginTimeout-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link XsdIntegerType }
     *     
     */
    public void setLoginTimeout(XsdIntegerType value) {
        this.loginTimeout = value;
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
     * Ruft den Wert der isolationLevel-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link IsolationLevelType }
     *     
     */
    public IsolationLevelType getIsolationLevel() {
        return isolationLevel;
    }

    /**
     * Legt den Wert der isolationLevel-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link IsolationLevelType }
     *     
     */
    public void setIsolationLevel(IsolationLevelType value) {
        this.isolationLevel = value;
    }

    /**
     * Ruft den Wert der initialPoolSize-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link XsdIntegerType }
     *     
     */
    public XsdIntegerType getInitialPoolSize() {
        return initialPoolSize;
    }

    /**
     * Legt den Wert der initialPoolSize-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link XsdIntegerType }
     *     
     */
    public void setInitialPoolSize(XsdIntegerType value) {
        this.initialPoolSize = value;
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
     * Ruft den Wert der maxIdleTime-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link XsdIntegerType }
     *     
     */
    public XsdIntegerType getMaxIdleTime() {
        return maxIdleTime;
    }

    /**
     * Legt den Wert der maxIdleTime-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link XsdIntegerType }
     *     
     */
    public void setMaxIdleTime(XsdIntegerType value) {
        this.maxIdleTime = value;
    }

    /**
     * Ruft den Wert der maxStatements-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link XsdIntegerType }
     *     
     */
    public XsdIntegerType getMaxStatements() {
        return maxStatements;
    }

    /**
     * Legt den Wert der maxStatements-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link XsdIntegerType }
     *     
     */
    public void setMaxStatements(XsdIntegerType value) {
        this.maxStatements = value;
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
