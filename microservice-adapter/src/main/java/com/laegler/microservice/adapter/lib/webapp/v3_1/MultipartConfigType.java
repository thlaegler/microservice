//
// Diese Datei wurde mit der JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 generiert 
// Siehe <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Änderungen an dieser Datei gehen bei einer Neukompilierung des Quellschemas verloren. 
// Generiert: 2016.09.10 um 03:05:14 AM CEST 
//


package com.laegler.microservice.adapter.lib.webapp.v3_1;

import java.math.BigInteger;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * 
 * 
 *         This element specifies configuration information related to the
 *         handling of multipart/form-data requests.
 *         
 *       
 * 
 * <p>Java-Klasse für multipart-configType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="multipart-configType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="location" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
 *         &lt;element name="max-file-size" type="{http://www.w3.org/2001/XMLSchema}long" minOccurs="0"/>
 *         &lt;element name="max-request-size" type="{http://www.w3.org/2001/XMLSchema}long" minOccurs="0"/>
 *         &lt;element name="file-size-threshold" type="{http://www.w3.org/2001/XMLSchema}integer" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "multipart-configType", propOrder = {
    "location",
    "maxFileSize",
    "maxRequestSize",
    "fileSizeThreshold"
})
public class MultipartConfigType {

    protected String location;
    @XmlElement(name = "max-file-size")
    protected Long maxFileSize;
    @XmlElement(name = "max-request-size")
    protected Long maxRequestSize;
    @XmlElement(name = "file-size-threshold")
    protected BigInteger fileSizeThreshold;

    /**
     * Ruft den Wert der location-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getLocation() {
        return location;
    }

    /**
     * Legt den Wert der location-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setLocation(String value) {
        this.location = value;
    }

    /**
     * Ruft den Wert der maxFileSize-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link Long }
     *     
     */
    public Long getMaxFileSize() {
        return maxFileSize;
    }

    /**
     * Legt den Wert der maxFileSize-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link Long }
     *     
     */
    public void setMaxFileSize(Long value) {
        this.maxFileSize = value;
    }

    /**
     * Ruft den Wert der maxRequestSize-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link Long }
     *     
     */
    public Long getMaxRequestSize() {
        return maxRequestSize;
    }

    /**
     * Legt den Wert der maxRequestSize-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link Long }
     *     
     */
    public void setMaxRequestSize(Long value) {
        this.maxRequestSize = value;
    }

    /**
     * Ruft den Wert der fileSizeThreshold-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public BigInteger getFileSizeThreshold() {
        return fileSizeThreshold;
    }

    /**
     * Legt den Wert der fileSizeThreshold-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setFileSizeThreshold(BigInteger value) {
        this.fileSizeThreshold = value;
    }

}
