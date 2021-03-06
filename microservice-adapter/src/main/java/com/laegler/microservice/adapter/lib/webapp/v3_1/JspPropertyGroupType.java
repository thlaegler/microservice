//
// Diese Datei wurde mit der JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 generiert 
// Siehe <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Änderungen an dieser Datei gehen bei einer Neukompilierung des Quellschemas verloren. 
// Generiert: 2016.09.10 um 03:05:14 AM CEST 
//


package com.laegler.microservice.adapter.lib.webapp.v3_1;

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
 *         The jsp-property-groupType is used to group a number of
 *         files so they can be given global property information.
 *         All files so described are deemed to be JSP files.  The
 *         following additional properties can be described:
 *         
 *         - Control whether EL is ignored.
 *         - Control whether scripting elements are invalid.
 *         - Indicate pageEncoding information.
 *         - Indicate that a resource is a JSP document (XML).
 *         - Prelude and Coda automatic includes.
 *         - Control whether the character sequence #{ is allowed
 *         when used as a String literal.
 *         - Control whether template text containing only
 *         whitespaces must be removed from the response output.
 *         - Indicate the default contentType information.
 *         - Indicate the default buffering model for JspWriter
 *         - Control whether error should be raised for the use of
 *         undeclared namespaces in a JSP page.
 *         
 *       
 * 
 * <p>Java-Klasse für jsp-property-groupType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="jsp-property-groupType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;group ref="{http://xmlns.jcp.org/xml/ns/javaee}descriptionGroup"/>
 *         &lt;element name="url-pattern" type="{http://xmlns.jcp.org/xml/ns/javaee}url-patternType" maxOccurs="unbounded"/>
 *         &lt;element name="el-ignored" type="{http://xmlns.jcp.org/xml/ns/javaee}true-falseType" minOccurs="0"/>
 *         &lt;element name="page-encoding" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
 *         &lt;element name="scripting-invalid" type="{http://xmlns.jcp.org/xml/ns/javaee}true-falseType" minOccurs="0"/>
 *         &lt;element name="is-xml" type="{http://xmlns.jcp.org/xml/ns/javaee}true-falseType" minOccurs="0"/>
 *         &lt;element name="include-prelude" type="{http://xmlns.jcp.org/xml/ns/javaee}pathType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="include-coda" type="{http://xmlns.jcp.org/xml/ns/javaee}pathType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="deferred-syntax-allowed-as-literal" type="{http://xmlns.jcp.org/xml/ns/javaee}true-falseType" minOccurs="0"/>
 *         &lt;element name="trim-directive-whitespaces" type="{http://xmlns.jcp.org/xml/ns/javaee}true-falseType" minOccurs="0"/>
 *         &lt;element name="default-content-type" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
 *         &lt;element name="buffer" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
 *         &lt;element name="error-on-undeclared-namespace" type="{http://xmlns.jcp.org/xml/ns/javaee}true-falseType" minOccurs="0"/>
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
@XmlType(name = "jsp-property-groupType", propOrder = {
    "description",
    "displayName",
    "icon",
    "urlPattern",
    "elIgnored",
    "pageEncoding",
    "scriptingInvalid",
    "isXml",
    "includePrelude",
    "includeCoda",
    "deferredSyntaxAllowedAsLiteral",
    "trimDirectiveWhitespaces",
    "defaultContentType",
    "buffer",
    "errorOnUndeclaredNamespace"
})
public class JspPropertyGroupType {

    protected List<DescriptionType> description;
    @XmlElement(name = "display-name")
    protected List<DisplayNameType> displayName;
    protected List<IconType> icon;
    @XmlElement(name = "url-pattern", required = true)
    protected List<UrlPatternType> urlPattern;
    @XmlElement(name = "el-ignored")
    protected TrueFalseType elIgnored;
    @XmlElement(name = "page-encoding")
    protected com.laegler.microservice.adapter.lib.webapp.v3_1.String pageEncoding;
    @XmlElement(name = "scripting-invalid")
    protected TrueFalseType scriptingInvalid;
    @XmlElement(name = "is-xml")
    protected TrueFalseType isXml;
    @XmlElement(name = "include-prelude")
    protected List<PathType> includePrelude;
    @XmlElement(name = "include-coda")
    protected List<PathType> includeCoda;
    @XmlElement(name = "deferred-syntax-allowed-as-literal")
    protected TrueFalseType deferredSyntaxAllowedAsLiteral;
    @XmlElement(name = "trim-directive-whitespaces")
    protected TrueFalseType trimDirectiveWhitespaces;
    @XmlElement(name = "default-content-type")
    protected com.laegler.microservice.adapter.lib.webapp.v3_1.String defaultContentType;
    protected com.laegler.microservice.adapter.lib.webapp.v3_1.String buffer;
    @XmlElement(name = "error-on-undeclared-namespace")
    protected TrueFalseType errorOnUndeclaredNamespace;
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
     * Gets the value of the displayName property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the displayName property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getDisplayName().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link DisplayNameType }
     * 
     * 
     */
    public List<DisplayNameType> getDisplayName() {
        if (displayName == null) {
            displayName = new ArrayList<DisplayNameType>();
        }
        return this.displayName;
    }

    /**
     * Gets the value of the icon property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the icon property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getIcon().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link IconType }
     * 
     * 
     */
    public List<IconType> getIcon() {
        if (icon == null) {
            icon = new ArrayList<IconType>();
        }
        return this.icon;
    }

    /**
     * Gets the value of the urlPattern property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the urlPattern property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getUrlPattern().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link UrlPatternType }
     * 
     * 
     */
    public List<UrlPatternType> getUrlPattern() {
        if (urlPattern == null) {
            urlPattern = new ArrayList<UrlPatternType>();
        }
        return this.urlPattern;
    }

    /**
     * Ruft den Wert der elIgnored-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link TrueFalseType }
     *     
     */
    public TrueFalseType getElIgnored() {
        return elIgnored;
    }

    /**
     * Legt den Wert der elIgnored-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link TrueFalseType }
     *     
     */
    public void setElIgnored(TrueFalseType value) {
        this.elIgnored = value;
    }

    /**
     * Ruft den Wert der pageEncoding-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link com.laegler.microservice.adapter.lib.webapp.v3_1.String }
     *     
     */
    public com.laegler.microservice.adapter.lib.webapp.v3_1.String getPageEncoding() {
        return pageEncoding;
    }

    /**
     * Legt den Wert der pageEncoding-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link com.laegler.microservice.adapter.lib.webapp.v3_1.String }
     *     
     */
    public void setPageEncoding(com.laegler.microservice.adapter.lib.webapp.v3_1.String value) {
        this.pageEncoding = value;
    }

    /**
     * Ruft den Wert der scriptingInvalid-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link TrueFalseType }
     *     
     */
    public TrueFalseType getScriptingInvalid() {
        return scriptingInvalid;
    }

    /**
     * Legt den Wert der scriptingInvalid-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link TrueFalseType }
     *     
     */
    public void setScriptingInvalid(TrueFalseType value) {
        this.scriptingInvalid = value;
    }

    /**
     * Ruft den Wert der isXml-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link TrueFalseType }
     *     
     */
    public TrueFalseType getIsXml() {
        return isXml;
    }

    /**
     * Legt den Wert der isXml-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link TrueFalseType }
     *     
     */
    public void setIsXml(TrueFalseType value) {
        this.isXml = value;
    }

    /**
     * Gets the value of the includePrelude property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the includePrelude property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getIncludePrelude().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link PathType }
     * 
     * 
     */
    public List<PathType> getIncludePrelude() {
        if (includePrelude == null) {
            includePrelude = new ArrayList<PathType>();
        }
        return this.includePrelude;
    }

    /**
     * Gets the value of the includeCoda property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the includeCoda property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getIncludeCoda().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link PathType }
     * 
     * 
     */
    public List<PathType> getIncludeCoda() {
        if (includeCoda == null) {
            includeCoda = new ArrayList<PathType>();
        }
        return this.includeCoda;
    }

    /**
     * Ruft den Wert der deferredSyntaxAllowedAsLiteral-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link TrueFalseType }
     *     
     */
    public TrueFalseType getDeferredSyntaxAllowedAsLiteral() {
        return deferredSyntaxAllowedAsLiteral;
    }

    /**
     * Legt den Wert der deferredSyntaxAllowedAsLiteral-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link TrueFalseType }
     *     
     */
    public void setDeferredSyntaxAllowedAsLiteral(TrueFalseType value) {
        this.deferredSyntaxAllowedAsLiteral = value;
    }

    /**
     * Ruft den Wert der trimDirectiveWhitespaces-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link TrueFalseType }
     *     
     */
    public TrueFalseType getTrimDirectiveWhitespaces() {
        return trimDirectiveWhitespaces;
    }

    /**
     * Legt den Wert der trimDirectiveWhitespaces-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link TrueFalseType }
     *     
     */
    public void setTrimDirectiveWhitespaces(TrueFalseType value) {
        this.trimDirectiveWhitespaces = value;
    }

    /**
     * Ruft den Wert der defaultContentType-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link com.laegler.microservice.adapter.lib.webapp.v3_1.String }
     *     
     */
    public com.laegler.microservice.adapter.lib.webapp.v3_1.String getDefaultContentType() {
        return defaultContentType;
    }

    /**
     * Legt den Wert der defaultContentType-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link com.laegler.microservice.adapter.lib.webapp.v3_1.String }
     *     
     */
    public void setDefaultContentType(com.laegler.microservice.adapter.lib.webapp.v3_1.String value) {
        this.defaultContentType = value;
    }

    /**
     * Ruft den Wert der buffer-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link com.laegler.microservice.adapter.lib.webapp.v3_1.String }
     *     
     */
    public com.laegler.microservice.adapter.lib.webapp.v3_1.String getBuffer() {
        return buffer;
    }

    /**
     * Legt den Wert der buffer-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link com.laegler.microservice.adapter.lib.webapp.v3_1.String }
     *     
     */
    public void setBuffer(com.laegler.microservice.adapter.lib.webapp.v3_1.String value) {
        this.buffer = value;
    }

    /**
     * Ruft den Wert der errorOnUndeclaredNamespace-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link TrueFalseType }
     *     
     */
    public TrueFalseType getErrorOnUndeclaredNamespace() {
        return errorOnUndeclaredNamespace;
    }

    /**
     * Legt den Wert der errorOnUndeclaredNamespace-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link TrueFalseType }
     *     
     */
    public void setErrorOnUndeclaredNamespace(TrueFalseType value) {
        this.errorOnUndeclaredNamespace = value;
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
