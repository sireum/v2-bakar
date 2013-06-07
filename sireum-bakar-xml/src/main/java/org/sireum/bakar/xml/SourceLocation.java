
package org.sireum.bakar.xml;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
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
 *       &lt;attribute name="line" use="required" type="{http://www.w3.org/2001/XMLSchema}int" />
 *       &lt;attribute name="col" use="required" type="{http://www.w3.org/2001/XMLSchema}int" />
 *       &lt;attribute name="endline" use="required" type="{http://www.w3.org/2001/XMLSchema}int" />
 *       &lt;attribute name="endcol" use="required" type="{http://www.w3.org/2001/XMLSchema}int" />
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
    protected int line;
    @XmlAttribute(name = "col", required = true)
    protected int col;
    @XmlAttribute(name = "endline", required = true)
    protected int endline;
    @XmlAttribute(name = "endcol", required = true)
    protected int endcol;

    /**
     * Gets the value of the line property.
     * 
     */
    public int getLine() {
        return line;
    }

    /**
     * Sets the value of the line property.
     * 
     */
    public void setLine(int value) {
        this.line = value;
    }

    /**
     * Gets the value of the col property.
     * 
     */
    public int getCol() {
        return col;
    }

    /**
     * Sets the value of the col property.
     * 
     */
    public void setCol(int value) {
        this.col = value;
    }

    /**
     * Gets the value of the endline property.
     * 
     */
    public int getEndline() {
        return endline;
    }

    /**
     * Sets the value of the endline property.
     * 
     */
    public void setEndline(int value) {
        this.endline = value;
    }

    /**
     * Gets the value of the endcol property.
     * 
     */
    public int getEndcol() {
        return endcol;
    }

    /**
     * Sets the value of the endcol property.
     * 
     */
    public void setEndcol(int value) {
        this.endcol = value;
    }

}
