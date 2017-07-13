//
// Diese Datei wurde mit der JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 generiert 
// Siehe <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Änderungen an dieser Datei gehen bei einer Neukompilierung des Quellschemas verloren. 
// Generiert: 2016.09.10 um 03:05:14 AM CEST 
//


package com.laegler.microservice.adapter.lib.webapp.v3_1;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * 
 * 
 *         The logical name of the filter is declare
 *         by using filter-nameType. This name is used to map the
 *         filter.  Each filter name is unique within the web
 *         application.
 *         
 *         Used in: filter, filter-mapping
 *         
 *       
 * 
 * <p>Java-Klasse für filter-nameType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="filter-nameType">
 *   &lt;simpleContent>
 *     &lt;extension base="&lt;http://xmlns.jcp.org/xml/ns/javaee>nonEmptyStringType">
 *     &lt;/extension>
 *   &lt;/simpleContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "filter-nameType")
public class FilterNameType
    extends NonEmptyStringType
{


}
