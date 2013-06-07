
package org.sireum.bakar.xml;

import java.math.BigInteger;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for Source_Location complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="Source_Location">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;attribute name="line" use="required" type="{http://www.w3.org/2001/XMLSchema}positiveInteger" />
 *       &lt;attribute name="col" use="required" type="{http://www.w3.org/2001/XMLSchema}positiveInteger" />
 *       &lt;attribute name="endline" use="required" type="{http://www.w3.org/2001/XMLSchema}nonNegativeInteger" />
 *       &lt;attribute name="endcol" use="required" type="{http://www.w3.org/2001/XMLSchema}nonNegativeInteger" />
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Source_Location")
public class SourceLocation
    extends Base
{

    @XmlAttribute(name = "line", required = true)
    @XmlSchemaType(name = "positiveInteger")
    protected int line;
    @XmlAttribute(name = "col", required = true)
    @XmlSchemaType(name = "positiveInteger")
    protected int col;
    @XmlAttribute(name = "endline", required = true)
    @XmlSchemaType(name = "nonNegativeInteger")
    protected int endline;
    @XmlAttribute(name = "endcol", required = true)
    @XmlSchemaType(name = "nonNegativeInteger")
    protected int endcol;

    /**
     * Gets the value of the line property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public int getLine() {
        return line;
    }

    /**
     * Sets the value of the line property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setLine(int value) {
        this.line = value;
    }

    /**
     * Gets the value of the col property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public int getCol() {
        return col;
    }

    /**
     * Sets the value of the col property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setCol(int value) {
        this.col = value;
    }

    /**
     * Gets the value of the endline property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public int getEndline() {
        return endline;
    }

    /**
     * Sets the value of the endline property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setEndline(int value) {
        this.endline = value;
    }

    /**
     * Gets the value of the endcol property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public int getEndcol() {
        return endcol;
    }

    /**
     * Sets the value of the endcol property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setEndcol(int value) {
        this.endcol = value;
    }

}
