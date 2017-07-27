//
// Diese Datei wurde mit der JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 generiert 
// Siehe <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Änderungen an dieser Datei gehen bei einer Neukompilierung des Quellschemas verloren. 
// Generiert: 2016.09.10 um 03:14:29 AM CEST 
//


package com.laegler.microservice.adapter.lib.javaee.v7;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * 
 * 
 *         The elements that use this type designate either a relative
 *         path or an absolute path starting with a "/".
 *         
 *         In elements that specify a pathname to a file within the
 *         same Deployment File, relative filenames (i.e., those not
 *         starting with "/") are considered relative to the root of
 *         the Deployment File's namespace.  Absolute filenames (i.e.,
 *         those starting with "/") also specify names in the root of
 *         the Deployment File's namespace.  In general, relative names
 *         are preferred.  The exception is .war files where absolute
 *         names are preferred for consistency with the Servlet API.
 *         
 *       
 * 
 * <p>Java-Klasse für pathType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="pathType">
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
@XmlType(name = "pathType")
public class PathType
    extends String
{


}
