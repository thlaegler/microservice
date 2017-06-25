//
// Diese Datei wurde mit der JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 generiert 
// Siehe <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Änderungen an dieser Datei gehen bei einer Neukompilierung des Quellschemas verloren. 
// Generiert: 2016.09.10 um 03:05:14 AM CEST 
//


package com.laegler.microservice.codegen.ext.webapp.v3_1;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * 
 *         [
 *         The ejb-linkType is used by ejb-link
 *         elements in the ejb-ref or ejb-local-ref elements to specify
 *         that an EJB reference is linked to enterprise bean.
 *         
 *         The value of the ejb-link element must be the ejb-name of an
 *         enterprise bean in the same ejb-jar file or in another ejb-jar
 *         file in the same Java EE application unit. 
 *         
 *         Alternatively, the name in the ejb-link element may be
 *         composed of a path name specifying the ejb-jar containing the
 *         referenced enterprise bean with the ejb-name of the target
 *         bean appended and separated from the path name by "#".  The
 *         path name is relative to the Deployment File containing
 *         Deployment Component that is referencing the enterprise
 *         bean.  This allows multiple enterprise beans with the same
 *         ejb-name to be uniquely identified.
 *         
 *         Examples:
 *         
 *         <ejb-link>EmployeeRecord</ejb-link>
 *         
 *         <ejb-link>../products/product.jar#ProductEJB</ejb-link>
 *         
 *         
 *       
 * 
 * <p>Java-Klasse für ejb-linkType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="ejb-linkType">
 *   &lt;simpleContent>
 *     &lt;restriction base="&lt;http://xmlns.jcp.org/xml/ns/javaee>string">
 *     &lt;/restriction>
 *   &lt;/simpleContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ejb-linkType")
public class EjbLinkType
    extends String
{


}
