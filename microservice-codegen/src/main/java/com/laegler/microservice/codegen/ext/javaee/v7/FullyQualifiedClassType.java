//
// Diese Datei wurde mit der JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 generiert 
// Siehe <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Änderungen an dieser Datei gehen bei einer Neukompilierung des Quellschemas verloren. 
// Generiert: 2016.09.10 um 03:14:29 AM CEST 
//


package com.laegler.microservice.codegen.ext.javaee.v7;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.bind.annotation.XmlType;


/**
 * 
 * 
 *         The elements that use this type designate the name of a
 *         Java class or interface.  The name is in the form of a
 *         "binary name", as defined in the JLS.  This is the form
 *         of name used in Class.forName().  Tools that need the
 *         canonical name (the name used in source code) will need
 *         to convert this binary name to the canonical name.
 *         
 *       
 * 
 * <p>Java-Klasse für fully-qualified-classType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="fully-qualified-classType">
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
@XmlType(name = "fully-qualified-classType")
@XmlSeeAlso({
    LocalHomeType.class,
    RemoteType.class,
    MessageDestinationTypeType.class,
    HomeType.class,
    LocalType.class,
    EnvEntryTypeValuesType.class
})
public class FullyQualifiedClassType
    extends String
{


}
