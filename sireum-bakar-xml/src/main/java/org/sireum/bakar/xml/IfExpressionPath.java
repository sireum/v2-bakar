
package org.sireum.bakar.xml;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for If_Expression_Path complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="If_Expression_Path">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="sloc" type="{}Source_Location"/>
 *         &lt;element name="condition_expression_q" type="{}Expression_Class"/>
 *         &lt;element name="dependent_expression_q" type="{}Expression_Class"/>
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
@XmlType(name = "If_Expression_Path", propOrder = {
    "sloc",
    "conditionExpressionQ",
    "dependentExpressionQ"
})
public class IfExpressionPath
    extends Base
{

    @XmlElement(required = true)
    protected SourceLocation sloc;
    @XmlElement(name = "condition_expression_q", required = true)
    protected ExpressionClass conditionExpressionQ;
    @XmlElement(name = "dependent_expression_q", required = true)
    protected ExpressionClass dependentExpressionQ;
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
     * Gets the value of the conditionExpressionQ property.
     * 
     * @return
     *     possible object is
     *     {@link ExpressionClass }
     *     
     */
    public ExpressionClass getConditionExpressionQ() {
        return conditionExpressionQ;
    }

    /**
     * Sets the value of the conditionExpressionQ property.
     * 
     * @param value
     *     allowed object is
     *     {@link ExpressionClass }
     *     
     */
    public void setConditionExpressionQ(ExpressionClass value) {
        this.conditionExpressionQ = value;
    }

    /**
     * Gets the value of the dependentExpressionQ property.
     * 
     * @return
     *     possible object is
     *     {@link ExpressionClass }
     *     
     */
    public ExpressionClass getDependentExpressionQ() {
        return dependentExpressionQ;
    }

    /**
     * Sets the value of the dependentExpressionQ property.
     * 
     * @param value
     *     allowed object is
     *     {@link ExpressionClass }
     *     
     */
    public void setDependentExpressionQ(ExpressionClass value) {
        this.dependentExpressionQ = value;
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
