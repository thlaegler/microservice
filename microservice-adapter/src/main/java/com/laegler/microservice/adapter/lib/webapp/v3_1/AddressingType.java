//
// Diese Datei wurde mit der JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 generiert 
// Siehe <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Änderungen an dieser Datei gehen bei einer Neukompilierung des Quellschemas verloren. 
// Generiert: 2016.09.10 um 03:05:14 AM CEST 
//


package com.laegler.microservice.adapter.lib.webapp.v3_1;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * 
 * 
 *         This specifies the WS-Addressing requirements for a JAX-WS web service.
 *         It corresponds to javax.xml.ws.soap.Addressing annotation or its
 *         feature javax.xml.ws.soap.AddressingFeature.
 *         
 *         If the "enabled" element is "true", WS-Addressing is enabled.
 *         It means that the endpoint supports WS-Addressing but does not require
 *         its use. The default value for "enabled" is "true".
 *         
 *         If the WS-Addressing is enabled and the "required" element is "true",
 *         it means that the endpoint requires WS-Addressing. The default value
 *         for "required" is "false".
 *         
 *         If WS-Addressing is enabled, the "responses" element determines
 *         if an endpoint requires the use of only anonymous responses,
 *         or only non-anonymous responses, or all. The value of the "responses"
 *         element must be one of the following:
 *         
 *         ANONYMOUS
 *         NON_ANONYMOUS
 *         ALL
 *         
 *         The default value for the "responses" is ALL.
 *         
 *       
 * 
 * <p>Java-Klasse für addressingType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="addressingType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="enabled" type="{http://xmlns.jcp.org/xml/ns/javaee}true-falseType" minOccurs="0"/>
 *         &lt;element name="required" type="{http://xmlns.jcp.org/xml/ns/javaee}true-falseType" minOccurs="0"/>
 *         &lt;element name="responses" type="{http://xmlns.jcp.org/xml/ns/javaee}addressing-responsesType" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "addressingType", propOrder = {
    "enabled",
    "required",
    "responses"
})
public class AddressingType {

    protected TrueFalseType enabled;
    protected TrueFalseType required;
    protected AddressingResponsesType responses;

    /**
     * Ruft den Wert der enabled-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link TrueFalseType }
     *     
     */
    public TrueFalseType getEnabled() {
        return enabled;
    }

    /**
     * Legt den Wert der enabled-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link TrueFalseType }
     *     
     */
    public void setEnabled(TrueFalseType value) {
        this.enabled = value;
    }

    /**
     * Ruft den Wert der required-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link TrueFalseType }
     *     
     */
    public TrueFalseType getRequired() {
        return required;
    }

    /**
     * Legt den Wert der required-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link TrueFalseType }
     *     
     */
    public void setRequired(TrueFalseType value) {
        this.required = value;
    }

    /**
     * Ruft den Wert der responses-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link AddressingResponsesType }
     *     
     */
    public AddressingResponsesType getResponses() {
        return responses;
    }

    /**
     * Legt den Wert der responses-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link AddressingResponsesType }
     *     
     */
    public void setResponses(AddressingResponsesType value) {
        this.responses = value;
    }

}
