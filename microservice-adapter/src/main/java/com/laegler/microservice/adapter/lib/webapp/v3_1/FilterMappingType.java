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
import javax.xml.bind.annotation.XmlElements;
import javax.xml.bind.annotation.XmlID;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.adapters.CollapsedStringAdapter;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;


/**
 * 
 * 
 *         Declaration of the filter mappings in this web
 *         application is done by using filter-mappingType. 
 *         The container uses the filter-mapping
 *         declarations to decide which filters to apply to a request,
 *         and in what order. The container matches the request URI to
 *         a Servlet in the normal way. To determine which filters to
 *         apply it matches filter-mapping declarations either on
 *         servlet-name, or on url-pattern for each filter-mapping
 *         element, depending on which style is used. The order in
 *         which filters are invoked is the order in which
 *         filter-mapping declarations that match a request URI for a
 *         servlet appear in the list of filter-mapping elements.The
 *         filter-name value must be the value of the filter-name
 *         sub-elements of one of the filter declarations in the
 *         deployment descriptor.
 *         
 *       
 * 
 * <p>Java-Klasse für filter-mappingType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="filter-mappingType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="filter-name" type="{http://xmlns.jcp.org/xml/ns/javaee}filter-nameType"/>
 *         &lt;choice maxOccurs="unbounded">
 *           &lt;element name="url-pattern" type="{http://xmlns.jcp.org/xml/ns/javaee}url-patternType"/>
 *           &lt;element name="servlet-name" type="{http://xmlns.jcp.org/xml/ns/javaee}servlet-nameType"/>
 *         &lt;/choice>
 *         &lt;element name="dispatcher" type="{http://xmlns.jcp.org/xml/ns/javaee}dispatcherType" maxOccurs="5" minOccurs="0"/>
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
@XmlType(name = "filter-mappingType", propOrder = {
    "filterName",
    "urlPatternOrServletName",
    "dispatcher"
})
public class FilterMappingType {

    @XmlElement(name = "filter-name", required = true)
    protected FilterNameType filterName;
    @XmlElements({
        @XmlElement(name = "url-pattern", type = UrlPatternType.class),
        @XmlElement(name = "servlet-name", type = ServletNameType.class)
    })
    protected List<Object> urlPatternOrServletName;
    protected List<DispatcherType> dispatcher;
    @XmlAttribute(name = "id")
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    @XmlID
    @XmlSchemaType(name = "ID")
    protected java.lang.String id;

    /**
     * Ruft den Wert der filterName-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link FilterNameType }
     *     
     */
    public FilterNameType getFilterName() {
        return filterName;
    }

    /**
     * Legt den Wert der filterName-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link FilterNameType }
     *     
     */
    public void setFilterName(FilterNameType value) {
        this.filterName = value;
    }

    /**
     * Gets the value of the urlPatternOrServletName property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the urlPatternOrServletName property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getUrlPatternOrServletName().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link UrlPatternType }
     * {@link ServletNameType }
     * 
     * 
     */
    public List<Object> getUrlPatternOrServletName() {
        if (urlPatternOrServletName == null) {
            urlPatternOrServletName = new ArrayList<Object>();
        }
        return this.urlPatternOrServletName;
    }

    /**
     * Gets the value of the dispatcher property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the dispatcher property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getDispatcher().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link DispatcherType }
     * 
     * 
     */
    public List<DispatcherType> getDispatcher() {
        if (dispatcher == null) {
            dispatcher = new ArrayList<DispatcherType>();
        }
        return this.dispatcher;
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
