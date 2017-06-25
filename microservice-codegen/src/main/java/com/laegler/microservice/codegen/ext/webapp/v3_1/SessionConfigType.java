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
 *         The session-configType defines the session parameters
 *         for this web application.
 *         
 *         Used in: web-app
 *         
 *       
 * 
 * <p>Java-Klasse für session-configType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="session-configType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="session-timeout" type="{http://xmlns.jcp.org/xml/ns/javaee}xsdIntegerType" minOccurs="0"/>
 *         &lt;element name="cookie-config" type="{http://xmlns.jcp.org/xml/ns/javaee}cookie-configType" minOccurs="0"/>
 *         &lt;element name="tracking-mode" type="{http://xmlns.jcp.org/xml/ns/javaee}tracking-modeType" maxOccurs="3" minOccurs="0"/>
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
@XmlType(name = "session-configType", propOrder = {
    "sessionTimeout",
    "cookieConfig",
    "trackingMode"
})
public class SessionConfigType {

    @XmlElement(name = "session-timeout")
    protected XsdIntegerType sessionTimeout;
    @XmlElement(name = "cookie-config")
    protected CookieConfigType cookieConfig;
    @XmlElement(name = "tracking-mode")
    protected List<TrackingModeType> trackingMode;
    @XmlAttribute(name = "id")
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    @XmlID
    @XmlSchemaType(name = "ID")
    protected java.lang.String id;

    /**
     * Ruft den Wert der sessionTimeout-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link XsdIntegerType }
     *     
     */
    public XsdIntegerType getSessionTimeout() {
        return sessionTimeout;
    }

    /**
     * Legt den Wert der sessionTimeout-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link XsdIntegerType }
     *     
     */
    public void setSessionTimeout(XsdIntegerType value) {
        this.sessionTimeout = value;
    }

    /**
     * Ruft den Wert der cookieConfig-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link CookieConfigType }
     *     
     */
    public CookieConfigType getCookieConfig() {
        return cookieConfig;
    }

    /**
     * Legt den Wert der cookieConfig-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link CookieConfigType }
     *     
     */
    public void setCookieConfig(CookieConfigType value) {
        this.cookieConfig = value;
    }

    /**
     * Gets the value of the trackingMode property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the trackingMode property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getTrackingMode().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link TrackingModeType }
     * 
     * 
     */
    public List<TrackingModeType> getTrackingMode() {
        if (trackingMode == null) {
            trackingMode = new ArrayList<TrackingModeType>();
        }
        return this.trackingMode;
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
