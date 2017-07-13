//
// Diese Datei wurde mit der JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 generiert 
// Siehe <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Änderungen an dieser Datei gehen bei einer Neukompilierung des Quellschemas verloren. 
// Generiert: 2016.09.10 um 03:14:29 AM CEST 
//


package com.laegler.microservice.adapter.lib.javaee.v7;

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
 *         The security-role-refType contains the declaration of a
 *         security role reference in a component's or a
 *         Deployment Component's code. The declaration consists of an
 *         optional description, the security role name used in the
 *         code, and an optional link to a security role. If the
 *         security role is not specified, the Deployer must choose an
 *         appropriate security role.
 *         
 *       
 * 
 * <p>Java-Klasse für security-role-refType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="security-role-refType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="description" type="{http://xmlns.jcp.org/xml/ns/javaee}descriptionType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="role-name" type="{http://xmlns.jcp.org/xml/ns/javaee}role-nameType"/>
 *         &lt;element name="role-link" type="{http://xmlns.jcp.org/xml/ns/javaee}role-nameType" minOccurs="0"/>
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
@XmlType(name = "security-role-refType", propOrder = {
    "description",
    "roleName",
    "roleLink"
})
public class SecurityRoleRefType {

    protected List<DescriptionType> description;
    @XmlElement(name = "role-name", required = true)
    protected RoleNameType roleName;
    @XmlElement(name = "role-link")
    protected RoleNameType roleLink;
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
     * Ruft den Wert der roleName-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link RoleNameType }
     *     
     */
    public RoleNameType getRoleName() {
        return roleName;
    }

    /**
     * Legt den Wert der roleName-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link RoleNameType }
     *     
     */
    public void setRoleName(RoleNameType value) {
        this.roleName = value;
    }

    /**
     * Ruft den Wert der roleLink-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link RoleNameType }
     *     
     */
    public RoleNameType getRoleLink() {
        return roleLink;
    }

    /**
     * Legt den Wert der roleLink-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link RoleNameType }
     *     
     */
    public void setRoleLink(RoleNameType value) {
        this.roleLink = value;
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
