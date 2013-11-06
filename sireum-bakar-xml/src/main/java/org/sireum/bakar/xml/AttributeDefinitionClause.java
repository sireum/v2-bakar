
package org.sireum.bakar.xml;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for Attribute_Definition_Clause complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="Attribute_Definition_Clause">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="sloc" type="{}Source_Location"/>
 *         &lt;element name="representation_clause_name_q" type="{}Name_Class"/>
 *         &lt;element name="representation_clause_expression_q" type="{}Expression_Class"/>
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
@XmlType(name = "Attribute_Definition_Clause", propOrder = {
    "sloc",
    "representationClauseNameQ",
    "representationClauseExpressionQ"
})
public class AttributeDefinitionClause
    extends Base
{

    @XmlElement(required = true)
    protected SourceLocation sloc;
    @XmlElement(name = "representation_clause_name_q", required = true)
    protected NameClass representationClauseNameQ;
    @XmlElement(name = "representation_clause_expression_q", required = true)
    protected ExpressionClass representationClauseExpressionQ;
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
     * Gets the value of the representationClauseNameQ property.
     * 
     * @return
     *     possible object is
     *     {@link NameClass }
     *     
     */
    public NameClass getRepresentationClauseNameQ() {
        return representationClauseNameQ;
    }

    /**
     * Sets the value of the representationClauseNameQ property.
     * 
     * @param value
     *     allowed object is
     *     {@link NameClass }
     *     
     */
    public void setRepresentationClauseNameQ(NameClass value) {
        this.representationClauseNameQ = value;
    }

    /**
     * Gets the value of the representationClauseExpressionQ property.
     * 
     * @return
     *     possible object is
     *     {@link ExpressionClass }
     *     
     */
    public ExpressionClass getRepresentationClauseExpressionQ() {
        return representationClauseExpressionQ;
    }

    /**
     * Sets the value of the representationClauseExpressionQ property.
     * 
     * @param value
     *     allowed object is
     *     {@link ExpressionClass }
     *     
     */
    public void setRepresentationClauseExpressionQ(ExpressionClass value) {
        this.representationClauseExpressionQ = value;
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
