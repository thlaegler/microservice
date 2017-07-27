//
// Diese Datei wurde mit der JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 generiert 
// Siehe <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Änderungen an dieser Datei gehen bei einer Neukompilierung des Quellschemas verloren. 
// Generiert: 2016.09.10 um 03:14:29 AM CEST 
//


package com.laegler.microservice.adapter.lib.javaee.v7;

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
 *         [
 *         The message-destination-ref element contains a declaration
 *         of Deployment Component's reference to a message destination
 *         associated with a resource in Deployment Component's
 *         environment. It consists of:
 *         
 *         - an optional description
 *         - the message destination reference name
 *         - an optional message destination type
 *         - an optional specification as to whether
 *         the destination is used for 
 *         consuming or producing messages, or both.
 *         if not specified, "both" is assumed.
 *         - an optional link to the message destination
 *         - optional injection targets
 *         
 *         The message destination type must be supplied unless an
 *         injection target is specified, in which case the type
 *         of the target is used.  If both are specified, the type
 *         must be assignment compatible with the type of the injection
 *         target.
 *         
 *         Examples:
 *         
 *         <message-destination-ref>
 *         <message-destination-ref-name>jms/StockQueue
 *         </message-destination-ref-name>
 *         <message-destination-type>javax.jms.Queue
 *         </message-destination-type>
 *         <message-destination-usage>Consumes
 *         </message-destination-usage>
 *         <message-destination-link>CorporateStocks
 *         </message-destination-link>
 *         </message-destination-ref>
 *         
 *         
 *       
 * 
 * <p>Java-Klasse für message-destination-refType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="message-destination-refType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="description" type="{http://xmlns.jcp.org/xml/ns/javaee}descriptionType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="message-destination-ref-name" type="{http://xmlns.jcp.org/xml/ns/javaee}jndi-nameType"/>
 *         &lt;element name="message-destination-type" type="{http://xmlns.jcp.org/xml/ns/javaee}message-destination-typeType" minOccurs="0"/>
 *         &lt;element name="message-destination-usage" type="{http://xmlns.jcp.org/xml/ns/javaee}message-destination-usageType" minOccurs="0"/>
 *         &lt;element name="message-destination-link" type="{http://xmlns.jcp.org/xml/ns/javaee}message-destination-linkType" minOccurs="0"/>
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
@XmlType(name = "message-destination-refType", propOrder = {
    "description",
    "messageDestinationRefName",
    "messageDestinationType",
    "messageDestinationUsage",
    "messageDestinationLink",
    "mappedName",
    "injectionTarget",
    "lookupName"
})
public class MessageDestinationRefType {

    protected List<DescriptionType> description;
    @XmlElement(name = "message-destination-ref-name", required = true)
    protected JndiNameType messageDestinationRefName;
    @XmlElement(name = "message-destination-type")
    protected MessageDestinationTypeType messageDestinationType;
    @XmlElement(name = "message-destination-usage")
    protected MessageDestinationUsageType messageDestinationUsage;
    @XmlElement(name = "message-destination-link")
    protected MessageDestinationLinkType messageDestinationLink;
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
     * Ruft den Wert der messageDestinationRefName-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link JndiNameType }
     *     
     */
    public JndiNameType getMessageDestinationRefName() {
        return messageDestinationRefName;
    }

    /**
     * Legt den Wert der messageDestinationRefName-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link JndiNameType }
     *     
     */
    public void setMessageDestinationRefName(JndiNameType value) {
        this.messageDestinationRefName = value;
    }

    /**
     * Ruft den Wert der messageDestinationType-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link MessageDestinationTypeType }
     *     
     */
    public MessageDestinationTypeType getMessageDestinationType() {
        return messageDestinationType;
    }

    /**
     * Legt den Wert der messageDestinationType-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link MessageDestinationTypeType }
     *     
     */
    public void setMessageDestinationType(MessageDestinationTypeType value) {
        this.messageDestinationType = value;
    }

    /**
     * Ruft den Wert der messageDestinationUsage-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link MessageDestinationUsageType }
     *     
     */
    public MessageDestinationUsageType getMessageDestinationUsage() {
        return messageDestinationUsage;
    }

    /**
     * Legt den Wert der messageDestinationUsage-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link MessageDestinationUsageType }
     *     
     */
    public void setMessageDestinationUsage(MessageDestinationUsageType value) {
        this.messageDestinationUsage = value;
    }

    /**
     * Ruft den Wert der messageDestinationLink-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link MessageDestinationLinkType }
     *     
     */
    public MessageDestinationLinkType getMessageDestinationLink() {
        return messageDestinationLink;
    }

    /**
     * Legt den Wert der messageDestinationLink-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link MessageDestinationLinkType }
     *     
     */
    public void setMessageDestinationLink(MessageDestinationLinkType value) {
        this.messageDestinationLink = value;
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
