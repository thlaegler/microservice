//
// Diese Datei wurde mit der JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 generiert 
// Siehe <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Änderungen an dieser Datei gehen bei einer Neukompilierung des Quellschemas verloren. 
// Generiert: 2016.09.10 um 03:14:29 AM CEST 
//


package com.laegler.microservice.codegen.ext.javaee.v7;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * 
 * 
 *         The message-destination-linkType is used to link a message
 *         destination reference or message-driven bean to a message
 *         destination.
 *         
 *         The Assembler sets the value to reflect the flow of messages
 *         between producers and consumers in the application.
 *         
 *         The value must be the message-destination-name of a message
 *         destination in the same Deployment File or in another
 *         Deployment File in the same Java EE application unit.
 *         
 *         Alternatively, the value may be composed of a path name
 *         specifying a Deployment File containing the referenced
 *         message destination with the message-destination-name of the
 *         destination appended and separated from the path name by
 *         "#". The path name is relative to the Deployment File
 *         containing Deployment Component that is referencing the
 *         message destination.  This allows multiple message
 *         destinations with the same name to be uniquely identified.
 *         
 *       
 * 
 * <p>Java-Klasse für message-destination-linkType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="message-destination-linkType">
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
@XmlType(name = "message-destination-linkType")
public class MessageDestinationLinkType
    extends String
{


}
