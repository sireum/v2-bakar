
package org.sireum.bakar.xml;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElements;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for Anonymous_Access_To_Constant complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="Anonymous_Access_To_Constant">
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
 *         &lt;element name="anonymous_access_to_object_subtype_mark_q" type="{}Expression_Class"/>
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
@XmlType(name = "Anonymous_Access_To_Constant", propOrder = {
    "sloc",
    "hasNullExclusionQ",
    "anonymousAccessToObjectSubtypeMarkQ"
})
public class AnonymousAccessToConstant
    extends Base
{

    @XmlElement(required = true)
    protected SourceLocation sloc;
    @XmlElement(name = "has_null_exclusion_q", required = true)
    protected AnonymousAccessToConstant.HasNullExclusionQ hasNullExclusionQ;
    @XmlElement(name = "anonymous_access_to_object_subtype_mark_q", required = true)
    protected ExpressionClass anonymousAccessToObjectSubtypeMarkQ;
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
     * Gets the value of the hasNullExclusionQ property.
     * 
     * @return
     *     possible object is
     *     {@link AnonymousAccessToConstant.HasNullExclusionQ }
     *     
     */
    public AnonymousAccessToConstant.HasNullExclusionQ getHasNullExclusionQ() {
        return hasNullExclusionQ;
    }

    /**
     * Sets the value of the hasNullExclusionQ property.
     * 
     * @param value
     *     allowed object is
     *     {@link AnonymousAccessToConstant.HasNullExclusionQ }
     *     
     */
    public void setHasNullExclusionQ(AnonymousAccessToConstant.HasNullExclusionQ value) {
        this.hasNullExclusionQ = value;
    }

    /**
     * Gets the value of the anonymousAccessToObjectSubtypeMarkQ property.
     * 
     * @return
     *     possible object is
     *     {@link ExpressionClass }
     *     
     */
    public ExpressionClass getAnonymousAccessToObjectSubtypeMarkQ() {
        return anonymousAccessToObjectSubtypeMarkQ;
    }

    /**
     * Sets the value of the anonymousAccessToObjectSubtypeMarkQ property.
     * 
     * @param value
     *     allowed object is
     *     {@link ExpressionClass }
     *     
     */
    public void setAnonymousAccessToObjectSubtypeMarkQ(ExpressionClass value) {
        this.anonymousAccessToObjectSubtypeMarkQ = value;
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
