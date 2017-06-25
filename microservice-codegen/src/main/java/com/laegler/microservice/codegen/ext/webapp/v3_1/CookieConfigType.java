//
// Diese Datei wurde mit der JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 generiert 
// Siehe <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Änderungen an dieser Datei gehen bei einer Neukompilierung des Quellschemas verloren. 
// Generiert: 2016.09.10 um 03:05:14 AM CEST 
//


package com.laegler.microservice.codegen.ext.webapp.v3_1;

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
 *         The cookie-configType defines the configuration for the
 *         session tracking cookies of this web application.
 *         
 *         Used in: session-config
 *         
 *       
 * 
 * <p>Java-Klasse für cookie-configType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="cookie-configType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="name" type="{http://xmlns.jcp.org/xml/ns/javaee}cookie-nameType" minOccurs="0"/>
 *         &lt;element name="domain" type="{http://xmlns.jcp.org/xml/ns/javaee}cookie-domainType" minOccurs="0"/>
 *         &lt;element name="path" type="{http://xmlns.jcp.org/xml/ns/javaee}cookie-pathType" minOccurs="0"/>
 *         &lt;element name="comment" type="{http://xmlns.jcp.org/xml/ns/javaee}cookie-commentType" minOccurs="0"/>
 *         &lt;element name="http-only" type="{http://xmlns.jcp.org/xml/ns/javaee}true-falseType" minOccurs="0"/>
 *         &lt;element name="secure" type="{http://xmlns.jcp.org/xml/ns/javaee}true-falseType" minOccurs="0"/>
 *         &lt;element name="max-age" type="{http://xmlns.jcp.org/xml/ns/javaee}xsdIntegerType" minOccurs="0"/>
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
@XmlType(name = "cookie-configType", propOrder = {
    "name",
    "domain",
    "path",
    "comment",
    "httpOnly",
    "secure",
    "maxAge"
})
public class CookieConfigType {

    protected CookieNameType name;
    protected CookieDomainType domain;
    protected CookiePathType path;
    protected CookieCommentType comment;
    @XmlElement(name = "http-only")
    protected TrueFalseType httpOnly;
    protected TrueFalseType secure;
    @XmlElement(name = "max-age")
    protected XsdIntegerType maxAge;
    @XmlAttribute(name = "id")
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    @XmlID
    @XmlSchemaType(name = "ID")
    protected java.lang.String id;

    /**
     * Ruft den Wert der name-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link CookieNameType }
     *     
     */
    public CookieNameType getName() {
        return name;
    }

    /**
     * Legt den Wert der name-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link CookieNameType }
     *     
     */
    public void setName(CookieNameType value) {
        this.name = value;
    }

    /**
     * Ruft den Wert der domain-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link CookieDomainType }
     *     
     */
    public CookieDomainType getDomain() {
        return domain;
    }

    /**
     * Legt den Wert der domain-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link CookieDomainType }
     *     
     */
    public void setDomain(CookieDomainType value) {
        this.domain = value;
    }

    /**
     * Ruft den Wert der path-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link CookiePathType }
     *     
     */
    public CookiePathType getPath() {
        return path;
    }

    /**
     * Legt den Wert der path-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link CookiePathType }
     *     
     */
    public void setPath(CookiePathType value) {
        this.path = value;
    }

    /**
     * Ruft den Wert der comment-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link CookieCommentType }
     *     
     */
    public CookieCommentType getComment() {
        return comment;
    }

    /**
     * Legt den Wert der comment-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link CookieCommentType }
     *     
     */
    public void setComment(CookieCommentType value) {
        this.comment = value;
    }

    /**
     * Ruft den Wert der httpOnly-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link TrueFalseType }
     *     
     */
    public TrueFalseType getHttpOnly() {
        return httpOnly;
    }

    /**
     * Legt den Wert der httpOnly-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link TrueFalseType }
     *     
     */
    public void setHttpOnly(TrueFalseType value) {
        this.httpOnly = value;
    }

    /**
     * Ruft den Wert der secure-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link TrueFalseType }
     *     
     */
    public TrueFalseType getSecure() {
        return secure;
    }

    /**
     * Legt den Wert der secure-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link TrueFalseType }
     *     
     */
    public void setSecure(TrueFalseType value) {
        this.secure = value;
    }

    /**
     * Ruft den Wert der maxAge-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link XsdIntegerType }
     *     
     */
    public XsdIntegerType getMaxAge() {
        return maxAge;
    }

    /**
     * Legt den Wert der maxAge-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link XsdIntegerType }
     *     
     */
    public void setMaxAge(XsdIntegerType value) {
        this.maxAge = value;
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
