
package org.sireum.bakar.xml;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for Array_Component_Association complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="Array_Component_Association">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="sloc" type="{}Source_Location"/>
 *         &lt;element name="array_component_choices_ql" type="{}Element_List"/>
 *         &lt;element name="component_expression_q" type="{}Expression_Class"/>
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
@XmlType(name = "Array_Component_Association", propOrder = {
    "sloc",
    "arrayComponentChoicesQl",
    "componentExpressionQ"
})
public class ArrayComponentAssociation
    extends Base
{

    @XmlElement(required = true)
    protected SourceLocation sloc;
    @XmlElement(name = "array_component_choices_ql", required = true)
    protected ElementList arrayComponentChoicesQl;
    @XmlElement(name = "component_expression_q", required = true)
    protected ExpressionClass componentExpressionQ;
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
     * Gets the value of the arrayComponentChoicesQl property.
     * 
     * @return
     *     possible object is
     *     {@link ElementList }
     *     
     */
    public ElementList getArrayComponentChoicesQl() {
        return arrayComponentChoicesQl;
    }

    /**
     * Sets the value of the arrayComponentChoicesQl property.
     * 
     * @param value
     *     allowed object is
     *     {@link ElementList }
     *     
     */
    public void setArrayComponentChoicesQl(ElementList value) {
        this.arrayComponentChoicesQl = value;
    }

    /**
     * Gets the value of the componentExpressionQ property.
     * 
     * @return
     *     possible object is
     *     {@link ExpressionClass }
     *     
     */
    public ExpressionClass getComponentExpressionQ() {
        return componentExpressionQ;
    }

    /**
     * Sets the value of the componentExpressionQ property.
     * 
     * @param value
     *     allowed object is
     *     {@link ExpressionClass }
     *     
     */
    public void setComponentExpressionQ(ExpressionClass value) {
        this.componentExpressionQ = value;
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
