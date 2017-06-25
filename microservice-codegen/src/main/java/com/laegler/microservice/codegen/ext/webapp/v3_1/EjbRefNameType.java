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
 *         The ejb-ref-name element contains the name of an EJB
 *         reference. The EJB reference is an entry in the
 *         Deployment Component's environment and is relative to the
 *         java:comp/env context.  The name must be unique within the
 *         Deployment Component.
 *         
 *         It is recommended that name is prefixed with "ejb/".
 *         
 *         Example:
 *         
 *         <ejb-ref-name>ejb/Payroll</ejb-ref-name>
 *         
 *         
 *       
 * 
 * <p>Java-Klasse für ejb-ref-nameType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="ejb-ref-nameType">
 *   &lt;simpleContent>
 *     &lt;restriction base="&lt;http://xmlns.jcp.org/xml/ns/javaee>jndi-nameType">
 *     &lt;/restriction>
 *   &lt;/simpleContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ejb-ref-nameType")
public class EjbRefNameType
    extends JndiNameType
{


}
