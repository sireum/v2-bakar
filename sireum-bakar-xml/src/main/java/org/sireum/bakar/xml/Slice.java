
package org.sireum.bakar.xml;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for Slice complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="Slice">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="sloc" type="{}Source_Location"/>
 *         &lt;element name="prefix_q" type="{}Expression_Class"/>
 *         &lt;element name="slice_range_q" type="{}Discrete_Range_Class"/>
 *       &lt;/sequence>
 *       &lt;attribute name="type" use="required" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="checks" type="{http://www.w3.org/2001/XMLSchema}string" />
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Slice", propOrder = {
    "sloc",
    "prefixQ",
    "sliceRangeQ"
})
public class Slice
    extends Base
{

    @XmlElement(required = true)
    protected SourceLocation sloc;
    @XmlElement(name = "prefix_q", required = true)
    protected ExpressionClass prefixQ;
    @XmlElement(name = "slice_range_q", required = true)
    protected DiscreteRangeClass sliceRangeQ;
    @XmlAttribute(name = "type", required = true)
    protected String type;
    @XmlAttribute(name = "checks")
    protected String checks;

    /**
     * Gets the value of the sloc property.
     * 
     * @return
     *     possible object is
     *     {@link SourceLocation }
     *     
     */
    public SourceLocation getSloc() {
        return sloc;
    }

    /**
     * Sets the value of the sloc property.
     * 
     * @param value
     *     allowed object is
     *     {@link SourceLocation }
     *     
     */
    public void setSloc(SourceLocation value) {
        this.sloc = value;
    }

    /**
     * Gets the value of the prefixQ property.
     * 
     * @return
     *     possible object is
     *     {@link ExpressionClass }
     *     
     */
    public ExpressionClass getPrefixQ() {
        return prefixQ;
    }

    /**
     * Sets the value of the prefixQ property.
     * 
     * @param value
     *     allowed object is
     *     {@link ExpressionClass }
     *     
     */
    public void setPrefixQ(ExpressionClass value) {
        this.prefixQ = value;
    }

    /**
     * Gets the value of the sliceRangeQ property.
     * 
     * @return
     *     possible object is
     *     {@link DiscreteRangeClass }
     *     
     */
    public DiscreteRangeClass getSliceRangeQ() {
        return sliceRangeQ;
    }

    /**
     * Sets the value of the sliceRangeQ property.
     * 
     * @param value
     *     allowed object is
     *     {@link DiscreteRangeClass }
     *     
     */
    public void setSliceRangeQ(DiscreteRangeClass value) {
        this.sliceRangeQ = value;
    }

    /**
     * Gets the value of the type property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getType() {
        return type;
    }

    /**
     * Sets the value of the type property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setType(String value) {
        this.type = value;
    }

    /**
     * Gets the value of the checks property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getChecks() {
        return checks;
    }

    /**
     * Sets the value of the checks property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setChecks(String value) {
        this.checks = value;
    }

}
