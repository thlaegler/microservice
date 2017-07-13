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
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElements;
import javax.xml.bind.annotation.XmlType;


/**
 * 
 * 
 *         Please see section 8.2.2 of the specification for details.
 *         
 *       
 * 
 * <p>Java-Klasse für absoluteOrderingType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="absoluteOrderingType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;choice maxOccurs="unbounded" minOccurs="0">
 *         &lt;element name="name" type="{http://xmlns.jcp.org/xml/ns/javaee}java-identifierType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="others" type="{http://xmlns.jcp.org/xml/ns/javaee}ordering-othersType" minOccurs="0"/>
 *       &lt;/choice>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "absoluteOrderingType", propOrder = {
    "nameOrOthers"
})
public class AbsoluteOrderingType {

    @XmlElements({
        @XmlElement(name = "name", type = JavaIdentifierType.class),
        @XmlElement(name = "others", type = OrderingOthersType.class)
    })
    protected List<Object> nameOrOthers;

    /**
     * Gets the value of the nameOrOthers property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the nameOrOthers property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getNameOrOthers().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link JavaIdentifierType }
     * {@link OrderingOthersType }
     * 
     * 
     */
    public List<Object> getNameOrOthers() {
        if (nameOrOthers == null) {
            nameOrOthers = new ArrayList<Object>();
        }
        return this.nameOrOthers;
    }

}
