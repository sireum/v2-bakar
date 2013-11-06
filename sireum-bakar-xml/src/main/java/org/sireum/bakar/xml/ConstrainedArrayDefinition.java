
package org.sireum.bakar.xml;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for Constrained_Array_Definition complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="Constrained_Array_Definition">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="sloc" type="{}Source_Location"/>
 *         &lt;element name="discrete_subtype_definitions_ql" type="{}Definition_List"/>
 *         &lt;element name="array_component_definition_q" type="{}Element_Class"/>
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
@XmlType(name = "Constrained_Array_Definition", propOrder = {
    "sloc",
    "discreteSubtypeDefinitionsQl",
    "arrayComponentDefinitionQ"
})
public class ConstrainedArrayDefinition
    extends Base
{

    @XmlElement(required = true)
    protected SourceLocation sloc;
    @XmlElement(name = "discrete_subtype_definitions_ql", required = true)
    protected DefinitionList discreteSubtypeDefinitionsQl;
    @XmlElement(name = "array_component_definition_q", required = true)
    protected ElementClass arrayComponentDefinitionQ;
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
     * Gets the value of the discreteSubtypeDefinitionsQl property.
     * 
     * @return
     *     possible object is
     *     {@link DefinitionList }
     *     
     */
    public DefinitionList getDiscreteSubtypeDefinitionsQl() {
        return discreteSubtypeDefinitionsQl;
    }

    /**
     * Sets the value of the discreteSubtypeDefinitionsQl property.
     * 
     * @param value
     *     allowed object is
     *     {@link DefinitionList }
     *     
     */
    public void setDiscreteSubtypeDefinitionsQl(DefinitionList value) {
        this.discreteSubtypeDefinitionsQl = value;
    }

    /**
     * Gets the value of the arrayComponentDefinitionQ property.
     * 
     * @return
     *     possible object is
     *     {@link ElementClass }
     *     
     */
    public ElementClass getArrayComponentDefinitionQ() {
        return arrayComponentDefinitionQ;
    }

    /**
     * Sets the value of the arrayComponentDefinitionQ property.
     * 
     * @param value
     *     allowed object is
     *     {@link ElementClass }
     *     
     */
    public void setArrayComponentDefinitionQ(ElementClass value) {
        this.arrayComponentDefinitionQ = value;
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
