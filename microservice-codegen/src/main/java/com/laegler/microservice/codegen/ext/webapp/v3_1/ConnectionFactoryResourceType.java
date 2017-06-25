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
 *         Configuration of a Connector Connection Factory resource.
 *         
 *       
 * 
 * <p>Java-Klasse für connection-factory-resourceType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="connection-factory-resourceType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="description" type="{http://xmlns.jcp.org/xml/ns/javaee}descriptionType" minOccurs="0"/>
 *         &lt;element name="name" type="{http://xmlns.jcp.org/xml/ns/javaee}jndi-nameType"/>
 *         &lt;element name="interface-name" type="{http://xmlns.jcp.org/xml/ns/javaee}fully-qualified-classType"/>
 *         &lt;element name="resource-adapter" type="{http://xmlns.jcp.org/xml/ns/javaee}string"/>
 *         &lt;element name="max-pool-size" type="{http://xmlns.jcp.org/xml/ns/javaee}xsdIntegerType" minOccurs="0"/>
 *         &lt;element name="min-pool-size" type="{http://xmlns.jcp.org/xml/ns/javaee}xsdIntegerType" minOccurs="0"/>
 *         &lt;element name="transaction-support" type="{http://xmlns.jcp.org/xml/ns/javaee}transaction-supportType" minOccurs="0"/>
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
@XmlType(name = "connection-factory-resourceType", propOrder = {
    "description",
    "name",
    "interfaceName",
    "resourceAdapter",
    "maxPoolSize",
    "minPoolSize",
    "transactionSupport",
    "property"
})
public class ConnectionFactoryResourceType {

    protected DescriptionType description;
    @XmlElement(required = true)
    protected JndiNameType name;
    @XmlElement(name = "interface-name", required = true)
    protected FullyQualifiedClassType interfaceName;
    @XmlElement(name = "resource-adapter", required = true)
    protected com.laegler.microservice.codegen.ext.webapp.v3_1.String resourceAdapter;
    @XmlElement(name = "max-pool-size")
    protected XsdIntegerType maxPoolSize;
    @XmlElement(name = "min-pool-size")
    protected XsdIntegerType minPoolSize;
    @XmlElement(name = "transaction-support")
    protected TransactionSupportType transactionSupport;
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
     * Ruft den Wert der resourceAdapter-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link com.laegler.microservice.codegen.ext.webapp.v3_1.String }
     *     
     */
    public com.laegler.microservice.codegen.ext.webapp.v3_1.String getResourceAdapter() {
        return resourceAdapter;
    }

    /**
     * Legt den Wert der resourceAdapter-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link com.laegler.microservice.codegen.ext.webapp.v3_1.String }
     *     
     */
    public void setResourceAdapter(com.laegler.microservice.codegen.ext.webapp.v3_1.String value) {
        this.resourceAdapter = value;
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
     * Ruft den Wert der transactionSupport-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link TransactionSupportType }
     *     
     */
    public TransactionSupportType getTransactionSupport() {
        return transactionSupport;
    }

    /**
     * Legt den Wert der transactionSupport-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link TransactionSupportType }
     *     
     */
    public void setTransactionSupport(TransactionSupportType value) {
        this.transactionSupport = value;
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
