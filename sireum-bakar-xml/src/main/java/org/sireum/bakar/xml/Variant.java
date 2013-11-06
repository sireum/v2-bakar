
package org.sireum.bakar.xml;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for Variant complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="Variant">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="sloc" type="{}Source_Location"/>
 *         &lt;element name="variant_choices_ql" type="{}Element_List"/>
 *         &lt;element name="record_components_ql" type="{}Record_Component_List"/>
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
@XmlType(name = "Variant", propOrder = {
    "sloc",
    "variantChoicesQl",
    "recordComponentsQl"
})
public class Variant
    extends Base
{

    @XmlElement(required = true)
    protected SourceLocation sloc;
    @XmlElement(name = "variant_choices_ql", required = true)
    protected ElementList variantChoicesQl;
    @XmlElement(name = "record_components_ql", required = true)
    protected RecordComponentList recordComponentsQl;
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
     * Gets the value of the variantChoicesQl property.
     * 
     * @return
     *     possible object is
     *     {@link ElementList }
     *     
     */
    public ElementList getVariantChoicesQl() {
        return variantChoicesQl;
    }

    /**
     * Sets the value of the variantChoicesQl property.
     * 
     * @param value
     *     allowed object is
     *     {@link ElementList }
     *     
     */
    public void setVariantChoicesQl(ElementList value) {
        this.variantChoicesQl = value;
    }

    /**
     * Gets the value of the recordComponentsQl property.
     * 
     * @return
     *     possible object is
     *     {@link RecordComponentList }
     *     
     */
    public RecordComponentList getRecordComponentsQl() {
        return recordComponentsQl;
    }

    /**
     * Sets the value of the recordComponentsQl property.
     * 
     * @param value
     *     allowed object is
     *     {@link RecordComponentList }
     *     
     */
    public void setRecordComponentsQl(RecordComponentList value) {
        this.recordComponentsQl = value;
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
