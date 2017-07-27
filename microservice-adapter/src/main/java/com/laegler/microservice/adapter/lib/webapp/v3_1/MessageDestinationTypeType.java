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
 *         [
 *         The message-destination-typeType specifies the type of
 *         the destination. The type is specified by the Java interface
 *         expected to be implemented by the destination.
 *         
 *         Example: 
 *         
 *         <message-destination-type>javax.jms.Queue
 *         </message-destination-type>
 *         
 *         
 *       
 * 
 * <p>Java-Klasse für message-destination-typeType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="message-destination-typeType">
 *   &lt;simpleContent>
 *     &lt;restriction base="&lt;http://xmlns.jcp.org/xml/ns/javaee>fully-qualified-classType">
 *     &lt;/restriction>
 *   &lt;/simpleContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "message-destination-typeType")
public class MessageDestinationTypeType
    extends FullyQualifiedClassType
{


}
