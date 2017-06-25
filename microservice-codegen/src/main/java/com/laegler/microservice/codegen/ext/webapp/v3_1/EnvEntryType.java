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
 *         The env-entryType is used to declare an application's
 *         environment entry. The declaration consists of an optional
 *         description, the name of the environment entry, a type
 *         (optional if the value is injected, otherwise required), and
 *         an optional value.
 *         
 *         It also includes optional elements to define injection of
 *         the named resource into fields or JavaBeans properties.
 *         
 *         If a value is not specified and injection is requested,
 *         no injection will occur and no entry of the specified name
 *         will be created.  This allows an initial value to be
 *         specified in the source code without being incorrectly
 *         changed when no override has been specified.
 *         
 *         If a value is not specified and no injection is requested,
 *         a value must be supplied during deployment. 
 *         
 *         This type is used by env-entry elements.
 *         
 *       
 * 
 * <p>Java-Klasse für env-entryType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="env-entryType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="description" type="{http://xmlns.jcp.org/xml/ns/javaee}descriptionType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="env-entry-name" type="{http://xmlns.jcp.org/xml/ns/javaee}jndi-nameType"/>
 *         &lt;element name="env-entry-type" type="{http://xmlns.jcp.org/xml/ns/javaee}env-entry-type-valuesType" minOccurs="0"/>
 *         &lt;element name="env-entry-value" type="{http://xmlns.jcp.org/xml/ns/javaee}xsdStringType" minOccurs="0"/>
 *         &lt;group ref="{http://xmlns.jcp.org/xml/ns/javaee}resourceGroup"/>
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
@XmlType(name = "env-entryType", propOrder = {
    "description",
    "envEntryName",
    "envEntryType",
    "envEntryValue",
    "mappedName",
    "injectionTarget",
    "lookupName"
})
public class EnvEntryType {

    protected List<DescriptionType> description;
    @XmlElement(name = "env-entry-name", required = true)
    protected JndiNameType envEntryName;
    @XmlElement(name = "env-entry-type")
    protected EnvEntryTypeValuesType envEntryType;
    @XmlElement(name = "env-entry-value")
    protected XsdStringType envEntryValue;
    @XmlElement(name = "mapped-name")
    protected XsdStringType mappedName;
    @XmlElement(name = "injection-target")
    protected List<InjectionTargetType> injectionTarget;
    @XmlElement(name = "lookup-name")
    protected XsdStringType lookupName;
    @XmlAttribute(name = "id")
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    @XmlID
    @XmlSchemaType(name = "ID")
    protected java.lang.String id;

    /**
     * Gets the value of the description property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the description property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getDescription().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link DescriptionType }
     * 
     * 
     */
    public List<DescriptionType> getDescription() {
        if (description == null) {
            description = new ArrayList<DescriptionType>();
        }
        return this.description;
    }

    /**
     * Ruft den Wert der envEntryName-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link JndiNameType }
     *     
     */
    public JndiNameType getEnvEntryName() {
        return envEntryName;
    }

    /**
     * Legt den Wert der envEntryName-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link JndiNameType }
     *     
     */
    public void setEnvEntryName(JndiNameType value) {
        this.envEntryName = value;
    }

    /**
     * Ruft den Wert der envEntryType-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link EnvEntryTypeValuesType }
     *     
     */
    public EnvEntryTypeValuesType getEnvEntryType() {
        return envEntryType;
    }

    /**
     * Legt den Wert der envEntryType-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link EnvEntryTypeValuesType }
     *     
     */
    public void setEnvEntryType(EnvEntryTypeValuesType value) {
        this.envEntryType = value;
    }

    /**
     * Ruft den Wert der envEntryValue-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link XsdStringType }
     *     
     */
    public XsdStringType getEnvEntryValue() {
        return envEntryValue;
    }

    /**
     * Legt den Wert der envEntryValue-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link XsdStringType }
     *     
     */
    public void setEnvEntryValue(XsdStringType value) {
        this.envEntryValue = value;
    }

    /**
     * Ruft den Wert der mappedName-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link XsdStringType }
     *     
     */
    public XsdStringType getMappedName() {
        return mappedName;
    }

    /**
     * Legt den Wert der mappedName-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link XsdStringType }
     *     
     */
    public void setMappedName(XsdStringType value) {
        this.mappedName = value;
    }

    /**
     * Gets the value of the injectionTarget property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the injectionTarget property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getInjectionTarget().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link InjectionTargetType }
     * 
     * 
     */
    public List<InjectionTargetType> getInjectionTarget() {
        if (injectionTarget == null) {
            injectionTarget = new ArrayList<InjectionTargetType>();
        }
        return this.injectionTarget;
    }

    /**
     * Ruft den Wert der lookupName-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link XsdStringType }
     *     
     */
    public XsdStringType getLookupName() {
        return lookupName;
    }

    /**
     * Legt den Wert der lookupName-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link XsdStringType }
     *     
     */
    public void setLookupName(XsdStringType value) {
        this.lookupName = value;
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
