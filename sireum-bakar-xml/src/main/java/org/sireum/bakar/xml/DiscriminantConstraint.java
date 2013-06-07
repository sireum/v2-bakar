
package org.sireum.bakar.xml;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for Discriminant_Constraint complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="Discriminant_Constraint">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="sloc" type="{}Source_Location"/>
 *         &lt;element name="discriminant_associations_ql" type="{}Discriminant_Association_List"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Discriminant_Constraint", propOrder = {
    "sloc",
    "discriminantAssociationsQl"
})
public class DiscriminantConstraint
    extends Base
{

    @XmlElement(required = true)
    protected SourceLocation sloc;
    @XmlElement(name = "discriminant_associations_ql", required = true)
    protected DiscriminantAssociationList discriminantAssociationsQl;

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
     * Gets the value of the discriminantAssociationsQl property.
     * 
     * @return
     *     possible object is
     *     {@link DiscriminantAssociationList }
     *     
     */
    public DiscriminantAssociationList getDiscriminantAssociationsQl() {
        return discriminantAssociationsQl;
    }

    /**
     * Sets the value of the discriminantAssociationsQl property.
     * 
     * @param value
     *     allowed object is
     *     {@link DiscriminantAssociationList }
     *     
     */
    public void setDiscriminantAssociationsQl(DiscriminantAssociationList value) {
        this.discriminantAssociationsQl = value;
    }

}
