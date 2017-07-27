//
// Diese Datei wurde mit der JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 generiert 
// Siehe <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Änderungen an dieser Datei gehen bei einer Neukompilierung des Quellschemas verloren. 
// Generiert: 2016.09.09 um 01:53:33 PM CEST 
//


package com.laegler.microservice.adapter.lib.beans.v1_1;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAnyElement;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElementRef;
import javax.xml.bind.annotation.XmlElementRefs;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.adapters.CollapsedStringAdapter;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
import org.w3c.dom.Element;


/**
 * <p>Java-Klasse für anonymous complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;choice maxOccurs="unbounded" minOccurs="0">
 *         &lt;element ref="{http://xmlns.jcp.org/xml/ns/javaee}interceptors"/>
 *         &lt;element ref="{http://xmlns.jcp.org/xml/ns/javaee}decorators"/>
 *         &lt;element ref="{http://xmlns.jcp.org/xml/ns/javaee}alternatives"/>
 *         &lt;element ref="{http://xmlns.jcp.org/xml/ns/javaee}scan"/>
 *         &lt;any processContents='lax' namespace='##other'/>
 *       &lt;/choice>
 *       &lt;attribute name="version" default="1.1">
 *         &lt;simpleType>
 *           &lt;restriction base="{http://www.w3.org/2001/XMLSchema}token">
 *             &lt;pattern value="\.?[0-9]+(\.[0-9]+)*"/>
 *           &lt;/restriction>
 *         &lt;/simpleType>
 *       &lt;/attribute>
 *       &lt;attribute name="bean-discovery-mode" use="required">
 *         &lt;simpleType>
 *           &lt;restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *             &lt;enumeration value="annotated"/>
 *             &lt;enumeration value="all"/>
 *             &lt;enumeration value="none"/>
 *           &lt;/restriction>
 *         &lt;/simpleType>
 *       &lt;/attribute>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "interceptorsOrDecoratorsOrAlternatives"
})
@XmlRootElement(name = "beans")
public class Beans {

    @XmlElementRefs({
        @XmlElementRef(name = "alternatives", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = Alternatives.class, required = false),
        @XmlElementRef(name = "decorators", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = Decorators.class, required = false),
        @XmlElementRef(name = "interceptors", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = Interceptors.class, required = false),
        @XmlElementRef(name = "scan", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = Scan.class, required = false)
    })
    @XmlAnyElement(lax = true)
    protected List<Object> interceptorsOrDecoratorsOrAlternatives;
    @XmlAttribute(name = "version")
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    protected String version;
    @XmlAttribute(name = "bean-discovery-mode", required = true)
    protected String beanDiscoveryMode;

    /**
     * Gets the value of the interceptorsOrDecoratorsOrAlternatives property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the interceptorsOrDecoratorsOrAlternatives property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getInterceptorsOrDecoratorsOrAlternatives().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link Interceptors }
     * {@link Alternatives }
     * {@link Object }
     * {@link Decorators }
     * {@link Scan }
     * {@link Element }
     * 
     * 
     */
    public List<Object> getInterceptorsOrDecoratorsOrAlternatives() {
        if (interceptorsOrDecoratorsOrAlternatives == null) {
            interceptorsOrDecoratorsOrAlternatives = new ArrayList<Object>();
        }
        return this.interceptorsOrDecoratorsOrAlternatives;
    }

    /**
     * Ruft den Wert der version-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getVersion() {
        if (version == null) {
            return "1.1";
        } else {
            return version;
        }
    }

    /**
     * Legt den Wert der version-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setVersion(String value) {
        this.version = value;
    }

    /**
     * Ruft den Wert der beanDiscoveryMode-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBeanDiscoveryMode() {
        return beanDiscoveryMode;
    }

    /**
     * Legt den Wert der beanDiscoveryMode-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBeanDiscoveryMode(String value) {
        this.beanDiscoveryMode = value;
    }

}
