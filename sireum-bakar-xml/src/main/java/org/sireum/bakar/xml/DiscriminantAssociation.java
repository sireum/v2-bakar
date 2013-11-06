
package org.sireum.bakar.xml;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for Discriminant_Association complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="Discriminant_Association">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="sloc" type="{}Source_Location"/>
 *         &lt;element name="discriminant_selector_names_ql" type="{}Expression_List"/>
 *         &lt;element name="discriminant_expression_q" type="{}Expression_Class"/>
 *       &lt;/sequence>
 *       &lt;attribute name="checks" type="{http://www.w3.org/2001/XMLSchema}string" />
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Discriminant_Association", propOrder = {
    "sloc",
    "discriminantSelectorNamesQl",
    "discriminantExpressionQ"
})
public class DiscriminantAssociation
    extends Base
{

    @XmlElement(required = true)
    protected SourceLocation sloc;
    @XmlElement(name = "discriminant_selector_names_ql", required = true)
    protected ExpressionList discriminantSelectorNamesQl;
    @XmlElement(name = "discriminant_expression_q", required = true)
    protected ExpressionClass discriminantExpressionQ;
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
     * Gets the value of the discriminantSelectorNamesQl property.
     * 
     * @return
     *     possible object is
     *     {@link ExpressionList }
     *     
     */
    public ExpressionList getDiscriminantSelectorNamesQl() {
        return discriminantSelectorNamesQl;
    }

    /**
     * Sets the value of the discriminantSelectorNamesQl property.
     * 
     * @param value
     *     allowed object is
     *     {@link ExpressionList }
     *     
     */
    public void setDiscriminantSelectorNamesQl(ExpressionList value) {
        this.discriminantSelectorNamesQl = value;
    }

    /**
     * Gets the value of the discriminantExpressionQ property.
     * 
     * @return
     *     possible object is
     *     {@link ExpressionClass }
     *     
     */
    public ExpressionClass getDiscriminantExpressionQ() {
        return discriminantExpressionQ;
    }

    /**
     * Sets the value of the discriminantExpressionQ property.
     * 
     * @param value
     *     allowed object is
     *     {@link ExpressionClass }
     *     
     */
    public void setDiscriminantExpressionQ(ExpressionClass value) {
        this.discriminantExpressionQ = value;
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
