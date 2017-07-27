//
// Diese Datei wurde mit der JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 generiert 
// Siehe <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Änderungen an dieser Datei gehen bei einer Neukompilierung des Quellschemas verloren. 
// Generiert: 2016.09.10 um 03:14:29 AM CEST 
//


package com.laegler.microservice.adapter.lib.javaee.v7;

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
 *         The port-component-ref element declares a client dependency
 *         on the container for resolving a Service Endpoint Interface
 *         to a WSDL port. It optionally associates the Service Endpoint
 *         Interface with a particular port-component. This is only used
 *         by the container for a Service.getPort(Class) method call.
 *         
 *       
 * 
 * <p>Java-Klasse für port-component-refType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="port-component-refType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="service-endpoint-interface" type="{http://xmlns.jcp.org/xml/ns/javaee}fully-qualified-classType"/>
 *         &lt;element name="enable-mtom" type="{http://xmlns.jcp.org/xml/ns/javaee}true-falseType" minOccurs="0"/>
 *         &lt;element name="mtom-threshold" type="{http://xmlns.jcp.org/xml/ns/javaee}xsdNonNegativeIntegerType" minOccurs="0"/>
 *         &lt;element name="addressing" type="{http://xmlns.jcp.org/xml/ns/javaee}addressingType" minOccurs="0"/>
 *         &lt;element name="respect-binding" type="{http://xmlns.jcp.org/xml/ns/javaee}respect-bindingType" minOccurs="0"/>
 *         &lt;element name="port-component-link" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
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
@XmlType(name = "port-component-refType", propOrder = {
    "serviceEndpointInterface",
    "enableMtom",
    "mtomThreshold",
    "addressing",
    "respectBinding",
    "portComponentLink"
})
public class PortComponentRefType {

    @XmlElement(name = "service-endpoint-interface", required = true)
    protected FullyQualifiedClassType serviceEndpointInterface;
    @XmlElement(name = "enable-mtom")
    protected TrueFalseType enableMtom;
    @XmlElement(name = "mtom-threshold")
    protected XsdNonNegativeIntegerType mtomThreshold;
    protected AddressingType addressing;
    @XmlElement(name = "respect-binding")
    protected RespectBindingType respectBinding;
    @XmlElement(name = "port-component-link")
    protected com.laegler.microservice.adapter.lib.javaee.v7.String portComponentLink;
    @XmlAttribute(name = "id")
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    @XmlID
    @XmlSchemaType(name = "ID")
    protected java.lang.String id;

    /**
     * Ruft den Wert der serviceEndpointInterface-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link FullyQualifiedClassType }
     *     
     */
    public FullyQualifiedClassType getServiceEndpointInterface() {
        return serviceEndpointInterface;
    }

    /**
     * Legt den Wert der serviceEndpointInterface-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link FullyQualifiedClassType }
     *     
     */
    public void setServiceEndpointInterface(FullyQualifiedClassType value) {
        this.serviceEndpointInterface = value;
    }

    /**
     * Ruft den Wert der enableMtom-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link TrueFalseType }
     *     
     */
    public TrueFalseType getEnableMtom() {
        return enableMtom;
    }

    /**
     * Legt den Wert der enableMtom-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link TrueFalseType }
     *     
     */
    public void setEnableMtom(TrueFalseType value) {
        this.enableMtom = value;
    }

    /**
     * Ruft den Wert der mtomThreshold-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link XsdNonNegativeIntegerType }
     *     
     */
    public XsdNonNegativeIntegerType getMtomThreshold() {
        return mtomThreshold;
    }

    /**
     * Legt den Wert der mtomThreshold-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link XsdNonNegativeIntegerType }
     *     
     */
    public void setMtomThreshold(XsdNonNegativeIntegerType value) {
        this.mtomThreshold = value;
    }

    /**
     * Ruft den Wert der addressing-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link AddressingType }
     *     
     */
    public AddressingType getAddressing() {
        return addressing;
    }

    /**
     * Legt den Wert der addressing-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link AddressingType }
     *     
     */
    public void setAddressing(AddressingType value) {
        this.addressing = value;
    }

    /**
     * Ruft den Wert der respectBinding-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link RespectBindingType }
     *     
     */
    public RespectBindingType getRespectBinding() {
        return respectBinding;
    }

    /**
     * Legt den Wert der respectBinding-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link RespectBindingType }
     *     
     */
    public void setRespectBinding(RespectBindingType value) {
        this.respectBinding = value;
    }

    /**
     * Ruft den Wert der portComponentLink-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link com.laegler.microservice.adapter.lib.javaee.v7.String }
     *     
     */
    public com.laegler.microservice.adapter.lib.javaee.v7.String getPortComponentLink() {
        return portComponentLink;
    }

    /**
     * Legt den Wert der portComponentLink-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link com.laegler.microservice.adapter.lib.javaee.v7.String }
     *     
     */
    public void setPortComponentLink(com.laegler.microservice.adapter.lib.javaee.v7.String value) {
        this.portComponentLink = value;
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
