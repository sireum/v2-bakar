
package org.sireum.bakar.xml;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for If_Path complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="If_Path">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="sloc" type="{}Source_Location"/>
 *         &lt;element name="condition_expression_q" type="{}Expression_Class"/>
 *         &lt;element name="sequence_of_statements_ql" type="{}Statement_List"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "If_Path", propOrder = {
    "sloc",
    "conditionExpressionQ",
    "sequenceOfStatementsQl"
})
public class IfPath
    extends Base
{

    @XmlElement(required = true)
    protected SourceLocation sloc;
    @XmlElement(name = "condition_expression_q", required = true)
    protected ExpressionClass conditionExpressionQ;
    @XmlElement(name = "sequence_of_statements_ql", required = true)
    protected StatementList sequenceOfStatementsQl;

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
     * Gets the value of the sequenceOfStatementsQl property.
     * 
     * @return
     *     possible object is
     *     {@link StatementList }
     *     
     */
    public StatementList getSequenceOfStatementsQl() {
        return sequenceOfStatementsQl;
    }

    /**
     * Sets the value of the sequenceOfStatementsQl property.
     * 
     * @param value
     *     allowed object is
     *     {@link StatementList }
     *     
     */
    public void setSequenceOfStatementsQl(StatementList value) {
        this.sequenceOfStatementsQl = value;
    }

}
