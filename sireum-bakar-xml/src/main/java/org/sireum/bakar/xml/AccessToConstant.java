
package org.sireum.bakar.xml;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElements;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for Access_To_Constant complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="Access_To_Constant">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="sloc" type="{}Source_Location"/>
 *         &lt;element name="has_null_exclusion_q">
 *           &lt;complexType>
 *             &lt;complexContent>
 *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 &lt;choice>
 *                   &lt;element name="null_exclusion" type="{}Null_Exclusion"/>
 *                   &lt;element name="not_an_element" type="{}Not_An_Element"/>
 *                 &lt;/choice>
 *               &lt;/restriction>
 *             &lt;/complexContent>
 *           &lt;/complexType>
 *         &lt;/element>
 *         &lt;element name="access_to_object_definition_q" type="{}Element_Class"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Access_To_Constant", propOrder = {
    "sloc",
    "hasNullExclusionQ",
    "accessToObjectDefinitionQ"
})
public class AccessToConstant
    extends Base
{

    @XmlElement(required = true)
    protected SourceLocation sloc;
    @XmlElement(name = "has_null_exclusion_q", required = true)
    protected AccessToConstant.HasNullExclusionQ hasNullExclusionQ;
    @XmlElement(name = "access_to_object_definition_q", required = true)
    protected ElementClass accessToObjectDefinitionQ;

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
     * Gets the value of the hasNullExclusionQ property.
     * 
     * @return
     *     possible object is
     *     {@link AccessToConstant.HasNullExclusionQ }
     *     
     */
    public AccessToConstant.HasNullExclusionQ getHasNullExclusionQ() {
        return hasNullExclusionQ;
    }

    /**
     * Sets the value of the hasNullExclusionQ property.
     * 
     * @param value
     *     allowed object is
     *     {@link AccessToConstant.HasNullExclusionQ }
     *     
     */
    public void setHasNullExclusionQ(AccessToConstant.HasNullExclusionQ value) {
        this.hasNullExclusionQ = value;
    }

    /**
     * Gets the value of the accessToObjectDefinitionQ property.
     * 
     * @return
     *     possible object is
     *     {@link ElementClass }
     *     
     */
    public ElementClass getAccessToObjectDefinitionQ() {
        return accessToObjectDefinitionQ;
    }

    /**
     * Sets the value of the accessToObjectDefinitionQ property.
     * 
     * @param value
     *     allowed object is
     *     {@link ElementClass }
     *     
     */
    public void setAccessToObjectDefinitionQ(ElementClass value) {
        this.accessToObjectDefinitionQ = value;
    }


    /**
     * <p>Java class for anonymous complex type.
     * 
     * <p>The following schema fragment specifies the expected content contained within this class.
     * 
     * <pre>
     * &lt;complexType>
     *   &lt;complexContent>
     *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *       &lt;choice>
     *         &lt;element name="null_exclusion" type="{}Null_Exclusion"/>
     *         &lt;element name="not_an_element" type="{}Not_An_Element"/>
     *       &lt;/choice>
     *     &lt;/restriction>
     *   &lt;/complexContent>
     * &lt;/complexType>
     * </pre>
     * 
     * 
     */
    @XmlAccessorType(XmlAccessType.FIELD)
    @XmlType(name = "", propOrder = {
        "hasNullExclusion"
    })
    public static class HasNullExclusionQ
        extends Base
    {

        @XmlElements({
            @XmlElement(name = "null_exclusion", type = NullExclusion.class),
            @XmlElement(name = "not_an_element", type = NotAnElement.class)
        })
        protected Base hasNullExclusion;

        /**
         * Gets the value of the hasNullExclusion property.
         * 
         * @return
         *     possible object is
         *     {@link NullExclusion }
         *     {@link NotAnElement }
         *     
         */
        public Base getHasNullExclusion() {
            return hasNullExclusion;
        }

        /**
         * Sets the value of the hasNullExclusion property.
         * 
         * @param value
         *     allowed object is
         *     {@link NullExclusion }
         *     {@link NotAnElement }
         *     
         */
        public void setHasNullExclusion(Base value) {
            this.hasNullExclusion = value;
        }

    }

}
