//
// Diese Datei wurde mit der JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 generiert 
// Siehe <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Änderungen an dieser Datei gehen bei einer Neukompilierung des Quellschemas verloren. 
// Generiert: 2016.09.10 um 03:05:14 AM CEST 
//


package com.laegler.microservice.adapter.lib.webapp.v3_1;

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
 *         The icon type contains small-icon and large-icon elements
 *         that specify the file names for small and large GIF, JPEG,
 *         or PNG icon images used to represent the parent element in a
 *         GUI tool. 
 *         
 *         The xml:lang attribute defines the language that the
 *         icon file names are provided in. Its value is "en" (English)
 *         by default. 
 *         
 *       
 * 
 * <p>Java-Klasse für iconType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="iconType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="small-icon" type="{http://xmlns.jcp.org/xml/ns/javaee}pathType" minOccurs="0"/>
 *         &lt;element name="large-icon" type="{http://xmlns.jcp.org/xml/ns/javaee}pathType" minOccurs="0"/>
 *       &lt;/sequence>
 *       &lt;attribute ref="{http://www.w3.org/XML/1998/namespace}lang"/>
 *       &lt;attribute name="id" type="{http://www.w3.org/2001/XMLSchema}ID" />
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "iconType", propOrder = {
    "smallIcon",
    "largeIcon"
})
public class IconType {

    @XmlElement(name = "small-icon")
    protected PathType smallIcon;
    @XmlElement(name = "large-icon")
    protected PathType largeIcon;
    @XmlAttribute(name = "lang", namespace = "http://www.w3.org/XML/1998/namespace")
    protected java.lang.String lang;
    @XmlAttribute(name = "id")
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    @XmlID
    @XmlSchemaType(name = "ID")
    protected java.lang.String id;

    /**
     * Ruft den Wert der smallIcon-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link PathType }
     *     
     */
    public PathType getSmallIcon() {
        return smallIcon;
    }

    /**
     * Legt den Wert der smallIcon-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link PathType }
     *     
     */
    public void setSmallIcon(PathType value) {
        this.smallIcon = value;
    }

    /**
     * Ruft den Wert der largeIcon-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link PathType }
     *     
     */
    public PathType getLargeIcon() {
        return largeIcon;
    }

    /**
     * Legt den Wert der largeIcon-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link PathType }
     *     
     */
    public void setLargeIcon(PathType value) {
        this.largeIcon = value;
    }

    /**
     * Ruft den Wert der lang-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link java.lang.String }
     *     
     */
    public java.lang.String getLang() {
        return lang;
    }

    /**
     * Legt den Wert der lang-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link java.lang.String }
     *     
     */
    public void setLang(java.lang.String value) {
        this.lang = value;
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
