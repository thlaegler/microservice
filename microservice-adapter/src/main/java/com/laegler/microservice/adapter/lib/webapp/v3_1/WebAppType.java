//
// Diese Datei wurde mit der JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 generiert 
// Siehe <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Änderungen an dieser Datei gehen bei einer Neukompilierung des Quellschemas verloren. 
// Generiert: 2016.09.10 um 03:05:14 AM CEST 
//


package com.laegler.microservice.adapter.lib.webapp.v3_1;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElementRef;
import javax.xml.bind.annotation.XmlElementRefs;
import javax.xml.bind.annotation.XmlID;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.adapters.CollapsedStringAdapter;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;


/**
 * <p>Java-Klasse für web-appType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="web-appType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;choice maxOccurs="unbounded" minOccurs="0">
 *         &lt;element name="module-name" type="{http://xmlns.jcp.org/xml/ns/javaee}string" minOccurs="0"/>
 *         &lt;group ref="{http://xmlns.jcp.org/xml/ns/javaee}web-commonType"/>
 *         &lt;element name="deny-uncovered-http-methods" type="{http://xmlns.jcp.org/xml/ns/javaee}emptyType"/>
 *         &lt;element name="absolute-ordering" type="{http://xmlns.jcp.org/xml/ns/javaee}absoluteOrderingType"/>
 *       &lt;/choice>
 *       &lt;attGroup ref="{http://xmlns.jcp.org/xml/ns/javaee}web-common-attributes"/>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "web-app", propOrder = {
    "moduleNameOrDescriptionAndDisplayName"
})
@XmlRootElement(name = "web-app")
public class WebAppType {

    @XmlElementRefs({
        @XmlElementRef(name = "persistence-unit-ref", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "locale-encoding-mapping-list", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "filter-mapping", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "listener", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "display-name", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "pre-destroy", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "distributable", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "resource-ref", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "message-destination-ref", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "deny-uncovered-http-methods", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "ejb-local-ref", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "jms-destination", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "servlet-mapping", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "ejb-ref", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "service-ref", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "jsp-config", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "resource-env-ref", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "persistence-context-ref", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "env-entry", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "security-role", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "absolute-ordering", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "welcome-file-list", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "message-destination", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "error-page", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "administered-object", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "login-config", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "mail-session", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "jms-connection-factory", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "servlet", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "context-param", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "filter", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "icon", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "session-config", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "mime-mapping", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "module-name", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "data-source", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "post-construct", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "connection-factory", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "description", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false),
        @XmlElementRef(name = "security-constraint", namespace = "http://xmlns.jcp.org/xml/ns/javaee", type = JAXBElement.class, required = false)
    })
    protected List<JAXBElement<?>> moduleNameOrDescriptionAndDisplayName;
    @XmlAttribute(name = "version", required = true)
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    protected java.lang.String version;
    @XmlAttribute(name = "id")
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    @XmlID
    @XmlSchemaType(name = "ID")
    protected java.lang.String id;
    @XmlAttribute(name = "metadata-complete")
    protected Boolean metadataComplete;

    /**
     * Gets the value of the moduleNameOrDescriptionAndDisplayName property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the moduleNameOrDescriptionAndDisplayName property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getModuleNameOrDescriptionAndDisplayName().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link JAXBElement }{@code <}{@link PersistenceUnitRefType }{@code >}
     * {@link JAXBElement }{@code <}{@link LocaleEncodingMappingListType }{@code >}
     * {@link JAXBElement }{@code <}{@link FilterMappingType }{@code >}
     * {@link JAXBElement }{@code <}{@link ListenerType }{@code >}
     * {@link JAXBElement }{@code <}{@link DisplayNameType }{@code >}
     * {@link JAXBElement }{@code <}{@link LifecycleCallbackType }{@code >}
     * {@link JAXBElement }{@code <}{@link EmptyType }{@code >}
     * {@link JAXBElement }{@code <}{@link ResourceRefType }{@code >}
     * {@link JAXBElement }{@code <}{@link MessageDestinationRefType }{@code >}
     * {@link JAXBElement }{@code <}{@link EmptyType }{@code >}
     * {@link JAXBElement }{@code <}{@link EjbLocalRefType }{@code >}
     * {@link JAXBElement }{@code <}{@link JmsDestinationType }{@code >}
     * {@link JAXBElement }{@code <}{@link ServletMappingType }{@code >}
     * {@link JAXBElement }{@code <}{@link EjbRefType }{@code >}
     * {@link JAXBElement }{@code <}{@link ServiceRefType }{@code >}
     * {@link JAXBElement }{@code <}{@link JspConfigType }{@code >}
     * {@link JAXBElement }{@code <}{@link ResourceEnvRefType }{@code >}
     * {@link JAXBElement }{@code <}{@link PersistenceContextRefType }{@code >}
     * {@link JAXBElement }{@code <}{@link EnvEntryType }{@code >}
     * {@link JAXBElement }{@code <}{@link SecurityRoleType }{@code >}
     * {@link JAXBElement }{@code <}{@link AbsoluteOrderingType }{@code >}
     * {@link JAXBElement }{@code <}{@link WelcomeFileListType }{@code >}
     * {@link JAXBElement }{@code <}{@link MessageDestinationType }{@code >}
     * {@link JAXBElement }{@code <}{@link ErrorPageType }{@code >}
     * {@link JAXBElement }{@code <}{@link AdministeredObjectType }{@code >}
     * {@link JAXBElement }{@code <}{@link LoginConfigType }{@code >}
     * {@link JAXBElement }{@code <}{@link MailSessionType }{@code >}
     * {@link JAXBElement }{@code <}{@link JmsConnectionFactoryType }{@code >}
     * {@link JAXBElement }{@code <}{@link ServletType }{@code >}
     * {@link JAXBElement }{@code <}{@link ParamValueType }{@code >}
     * {@link JAXBElement }{@code <}{@link FilterType }{@code >}
     * {@link JAXBElement }{@code <}{@link IconType }{@code >}
     * {@link JAXBElement }{@code <}{@link SessionConfigType }{@code >}
     * {@link JAXBElement }{@code <}{@link MimeMappingType }{@code >}
     * {@link JAXBElement }{@code <}{@link com.laegler.microservice.adapter.lib.webapp.v3_1.String }{@code >}
     * {@link JAXBElement }{@code <}{@link DataSourceType }{@code >}
     * {@link JAXBElement }{@code <}{@link LifecycleCallbackType }{@code >}
     * {@link JAXBElement }{@code <}{@link ConnectionFactoryResourceType }{@code >}
     * {@link JAXBElement }{@code <}{@link DescriptionType }{@code >}
     * {@link JAXBElement }{@code <}{@link SecurityConstraintType }{@code >}
     * 
     * 
     */
    public List<JAXBElement<?>> getModuleNameOrDescriptionAndDisplayName() {
        if (moduleNameOrDescriptionAndDisplayName == null) {
            moduleNameOrDescriptionAndDisplayName = new ArrayList<JAXBElement<?>>();
        }
        return this.moduleNameOrDescriptionAndDisplayName;
    }

    /**
     * Ruft den Wert der version-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link java.lang.String }
     *     
     */
    public java.lang.String getVersion() {
        return version;
    }

    /**
     * Legt den Wert der version-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link java.lang.String }
     *     
     */
    public void setVersion(java.lang.String value) {
        this.version = value;
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

    /**
     * Ruft den Wert der metadataComplete-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link Boolean }
     *     
     */
    public Boolean isMetadataComplete() {
        return metadataComplete;
    }

    /**
     * Legt den Wert der metadataComplete-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link Boolean }
     *     
     */
    public void setMetadataComplete(Boolean value) {
        this.metadataComplete = value;
    }

}
