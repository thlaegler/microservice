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
 *         The taglibType defines the syntax for declaring in
 *         the deployment descriptor that a tag library is
 *         available to the application.  This can be done
 *         to override implicit map entries from TLD files and
 *         from the container.
 *         
 *       
 * 
 * <p>Java-Klasse für taglibType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="taglibType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="taglib-uri" type="{http://xmlns.jcp.org/xml/ns/javaee}string"/>
 *         &lt;element name="taglib-location" type="{http://xmlns.jcp.org/xml/ns/javaee}pathType"/>
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
@XmlType(name = "taglibType", propOrder = {
    "taglibUri",
    "taglibLocation"
})
public class TaglibType {

    @XmlElement(name = "taglib-uri", required = true)
    protected com.laegler.microservice.adapter.lib.webapp.v3_1.String taglibUri;
    @XmlElement(name = "taglib-location", required = true)
    protected PathType taglibLocation;
    @XmlAttribute(name = "id")
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    @XmlID
    @XmlSchemaType(name = "ID")
    protected java.lang.String id;

    /**
     * Ruft den Wert der taglibUri-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link com.laegler.microservice.adapter.lib.webapp.v3_1.String }
     *     
     */
    public com.laegler.microservice.adapter.lib.webapp.v3_1.String getTaglibUri() {
        return taglibUri;
    }

    /**
     * Legt den Wert der taglibUri-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link com.laegler.microservice.adapter.lib.webapp.v3_1.String }
     *     
     */
    public void setTaglibUri(com.laegler.microservice.adapter.lib.webapp.v3_1.String value) {
        this.taglibUri = value;
    }

    /**
     * Ruft den Wert der taglibLocation-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link PathType }
     *     
     */
    public PathType getTaglibLocation() {
        return taglibLocation;
    }

    /**
     * Legt den Wert der taglibLocation-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link PathType }
     *     
     */
    public void setTaglibLocation(PathType value) {
        this.taglibLocation = value;
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
