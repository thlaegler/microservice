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
 * 
 *         The transport-guaranteeType specifies that the communication
 *         between client and server should be NONE, INTEGRAL, or
 *         CONFIDENTIAL. NONE means that the application does not
 *         require any transport guarantees. A value of INTEGRAL means
 *         that the application requires that the data sent between the
 *         client and server be sent in such a way that it can't be
 *         changed in transit. CONFIDENTIAL means that the application
 *         requires that the data be transmitted in a fashion that
 *         prevents other entities from observing the contents of the
 *         transmission. In most cases, the presence of the INTEGRAL or
 *         CONFIDENTIAL flag will indicate that the use of SSL is
 *         required.
 *         
 *         Used in: user-data-constraint
 *         
 *       
 * 
 * <p>Java-Klasse für transport-guaranteeType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="transport-guaranteeType">
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
@XmlType(name = "transport-guaranteeType")
public class TransportGuaranteeType
    extends String
{


}
