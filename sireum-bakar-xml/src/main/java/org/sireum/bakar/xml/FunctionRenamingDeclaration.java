
package org.sireum.bakar.xml;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElements;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for Function_Renaming_Declaration complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="Function_Renaming_Declaration">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="sloc" type="{}Source_Location"/>
 *         &lt;element name="is_overriding_declaration_q">
 *           &lt;complexType>
 *             &lt;complexContent>
 *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 &lt;choice>
 *                   &lt;element name="overriding" type="{}Overriding"/>
 *                   &lt;element name="not_an_element" type="{}Not_An_Element"/>
 *                 &lt;/choice>
 *               &lt;/restriction>
 *             &lt;/complexContent>
 *           &lt;/complexType>
 *         &lt;/element>
 *         &lt;element name="is_not_overriding_declaration_q">
 *           &lt;complexType>
 *             &lt;complexContent>
 *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 &lt;choice>
 *                   &lt;element name="not_overriding" type="{}Not_Overriding"/>
 *                   &lt;element name="not_an_element" type="{}Not_An_Element"/>
 *                 &lt;/choice>
 *               &lt;/restriction>
 *             &lt;/complexContent>
 *           &lt;/complexType>
 *         &lt;/element>
 *         &lt;element name="names_ql" type="{}Defining_Name_List"/>
 *         &lt;element name="parameter_profile_ql" type="{}Parameter_Specification_List"/>
 *         &lt;element name="is_not_null_return_q">
 *           &lt;complexType>
 *             &lt;complexContent>
 *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 &lt;choice>
 *                   &lt;element name="not_null_return" type="{}Not_Null_Return"/>
 *                   &lt;element name="not_an_element" type="{}Not_An_Element"/>
 *                 &lt;/choice>
 *               &lt;/restriction>
 *             &lt;/complexContent>
 *           &lt;/complexType>
 *         &lt;/element>
 *         &lt;element name="result_profile_q" type="{}Element_Class"/>
 *         &lt;element name="renamed_entity_q" type="{}Expression_Class"/>
 *         &lt;element name="aspect_specifications_ql" type="{}Element_List"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Function_Renaming_Declaration", propOrder = {
    "sloc",
    "isOverridingDeclarationQ",
    "isNotOverridingDeclarationQ",
    "namesQl",
    "parameterProfileQl",
    "isNotNullReturnQ",
    "resultProfileQ",
    "renamedEntityQ",
    "aspectSpecificationsQl"
})
public class FunctionRenamingDeclaration
    extends Base
{

    @XmlElement(required = true)
    protected SourceLocation sloc;
    @XmlElement(name = "is_overriding_declaration_q", required = true)
    protected FunctionRenamingDeclaration.IsOverridingDeclarationQ isOverridingDeclarationQ;
    @XmlElement(name = "is_not_overriding_declaration_q", required = true)
    protected FunctionRenamingDeclaration.IsNotOverridingDeclarationQ isNotOverridingDeclarationQ;
    @XmlElement(name = "names_ql", required = true)
    protected DefiningNameList namesQl;
    @XmlElement(name = "parameter_profile_ql", required = true)
    protected ParameterSpecificationList parameterProfileQl;
    @XmlElement(name = "is_not_null_return_q", required = true)
    protected FunctionRenamingDeclaration.IsNotNullReturnQ isNotNullReturnQ;
    @XmlElement(name = "result_profile_q", required = true)
    protected ElementClass resultProfileQ;
    @XmlElement(name = "renamed_entity_q", required = true)
    protected ExpressionClass renamedEntityQ;
    @XmlElement(name = "aspect_specifications_ql", required = true)
    protected ElementList aspectSpecificationsQl;

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
     * Gets the value of the isOverridingDeclarationQ property.
     * 
     * @return
     *     possible object is
     *     {@link FunctionRenamingDeclaration.IsOverridingDeclarationQ }
     *     
     */
    public FunctionRenamingDeclaration.IsOverridingDeclarationQ getIsOverridingDeclarationQ() {
        return isOverridingDeclarationQ;
    }

    /**
     * Sets the value of the isOverridingDeclarationQ property.
     * 
     * @param value
     *     allowed object is
     *     {@link FunctionRenamingDeclaration.IsOverridingDeclarationQ }
     *     
     */
    public void setIsOverridingDeclarationQ(FunctionRenamingDeclaration.IsOverridingDeclarationQ value) {
        this.isOverridingDeclarationQ = value;
    }

    /**
     * Gets the value of the isNotOverridingDeclarationQ property.
     * 
     * @return
     *     possible object is
     *     {@link FunctionRenamingDeclaration.IsNotOverridingDeclarationQ }
     *     
     */
    public FunctionRenamingDeclaration.IsNotOverridingDeclarationQ getIsNotOverridingDeclarationQ() {
        return isNotOverridingDeclarationQ;
    }

    /**
     * Sets the value of the isNotOverridingDeclarationQ property.
     * 
     * @param value
     *     allowed object is
     *     {@link FunctionRenamingDeclaration.IsNotOverridingDeclarationQ }
     *     
     */
    public void setIsNotOverridingDeclarationQ(FunctionRenamingDeclaration.IsNotOverridingDeclarationQ value) {
        this.isNotOverridingDeclarationQ = value;
    }

    /**
     * Gets the value of the namesQl property.
     * 
     * @return
     *     possible object is
     *     {@link DefiningNameList }
     *     
     */
    public DefiningNameList getNamesQl() {
        return namesQl;
    }

    /**
     * Sets the value of the namesQl property.
     * 
     * @param value
     *     allowed object is
     *     {@link DefiningNameList }
     *     
     */
    public void setNamesQl(DefiningNameList value) {
        this.namesQl = value;
    }

    /**
     * Gets the value of the parameterProfileQl property.
     * 
     * @return
     *     possible object is
     *     {@link ParameterSpecificationList }
     *     
     */
    public ParameterSpecificationList getParameterProfileQl() {
        return parameterProfileQl;
    }

    /**
     * Sets the value of the parameterProfileQl property.
     * 
     * @param value
     *     allowed object is
     *     {@link ParameterSpecificationList }
     *     
     */
    public void setParameterProfileQl(ParameterSpecificationList value) {
        this.parameterProfileQl = value;
    }

    /**
     * Gets the value of the isNotNullReturnQ property.
     * 
     * @return
     *     possible object is
     *     {@link FunctionRenamingDeclaration.IsNotNullReturnQ }
     *     
     */
    public FunctionRenamingDeclaration.IsNotNullReturnQ getIsNotNullReturnQ() {
        return isNotNullReturnQ;
    }

    /**
     * Sets the value of the isNotNullReturnQ property.
     * 
     * @param value
     *     allowed object is
     *     {@link FunctionRenamingDeclaration.IsNotNullReturnQ }
     *     
     */
    public void setIsNotNullReturnQ(FunctionRenamingDeclaration.IsNotNullReturnQ value) {
        this.isNotNullReturnQ = value;
    }

    /**
     * Gets the value of the resultProfileQ property.
     * 
     * @return
     *     possible object is
     *     {@link ElementClass }
     *     
     */
    public ElementClass getResultProfileQ() {
        return resultProfileQ;
    }

    /**
     * Sets the value of the resultProfileQ property.
     * 
     * @param value
     *     allowed object is
     *     {@link ElementClass }
     *     
     */
    public void setResultProfileQ(ElementClass value) {
        this.resultProfileQ = value;
    }

    /**
     * Gets the value of the renamedEntityQ property.
     * 
     * @return
     *     possible object is
     *     {@link ExpressionClass }
     *     
     */
    public ExpressionClass getRenamedEntityQ() {
        return renamedEntityQ;
    }

    /**
     * Sets the value of the renamedEntityQ property.
     * 
     * @param value
     *     allowed object is
     *     {@link ExpressionClass }
     *     
     */
    public void setRenamedEntityQ(ExpressionClass value) {
        this.renamedEntityQ = value;
    }

    /**
     * Gets the value of the aspectSpecificationsQl property.
     * 
     * @return
     *     possible object is
     *     {@link ElementList }
     *     
     */
    public ElementList getAspectSpecificationsQl() {
        return aspectSpecificationsQl;
    }

    /**
     * Sets the value of the aspectSpecificationsQl property.
     * 
     * @param value
     *     allowed object is
     *     {@link ElementList }
     *     
     */
    public void setAspectSpecificationsQl(ElementList value) {
        this.aspectSpecificationsQl = value;
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
     *         &lt;element name="not_null_return" type="{}Not_Null_Return"/>
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
        "isNotNullReturn"
    })
    public static class IsNotNullReturnQ
        extends Base
    {

        @XmlElements({
            @XmlElement(name = "not_null_return", type = NotNullReturn.class),
            @XmlElement(name = "not_an_element", type = NotAnElement.class)
        })
        protected Base isNotNullReturn;

        /**
         * Gets the value of the isNotNullReturn property.
         * 
         * @return
         *     possible object is
         *     {@link NotNullReturn }
         *     {@link NotAnElement }
         *     
         */
        public Base getIsNotNullReturn() {
            return isNotNullReturn;
        }

        /**
         * Sets the value of the isNotNullReturn property.
         * 
         * @param value
         *     allowed object is
         *     {@link NotNullReturn }
         *     {@link NotAnElement }
         *     
         */
        public void setIsNotNullReturn(Base value) {
            this.isNotNullReturn = value;
        }

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
     *         &lt;element name="not_overriding" type="{}Not_Overriding"/>
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
        "isNotOverriding"
    })
    public static class IsNotOverridingDeclarationQ
        extends Base
    {

        @XmlElements({
            @XmlElement(name = "not_overriding", type = NotOverriding.class),
            @XmlElement(name = "not_an_element", type = NotAnElement.class)
        })
        protected Base isNotOverriding;

        /**
         * Gets the value of the isNotOverriding property.
         * 
         * @return
         *     possible object is
         *     {@link NotOverriding }
         *     {@link NotAnElement }
         *     
         */
        public Base getIsNotOverriding() {
            return isNotOverriding;
        }

        /**
         * Sets the value of the isNotOverriding property.
         * 
         * @param value
         *     allowed object is
         *     {@link NotOverriding }
         *     {@link NotAnElement }
         *     
         */
        public void setIsNotOverriding(Base value) {
            this.isNotOverriding = value;
        }

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
     *         &lt;element name="overriding" type="{}Overriding"/>
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
        "isOverriding"
    })
    public static class IsOverridingDeclarationQ
        extends Base
    {

        @XmlElements({
            @XmlElement(name = "overriding", type = Overriding.class),
            @XmlElement(name = "not_an_element", type = NotAnElement.class)
        })
        protected Base isOverriding;

        /**
         * Gets the value of the isOverriding property.
         * 
         * @return
         *     possible object is
         *     {@link Overriding }
         *     {@link NotAnElement }
         *     
         */
        public Base getIsOverriding() {
            return isOverriding;
        }

        /**
         * Sets the value of the isOverriding property.
         * 
         * @param value
         *     allowed object is
         *     {@link Overriding }
         *     {@link NotAnElement }
         *     
         */
        public void setIsOverriding(Base value) {
            this.isOverriding = value;
        }

    }

}
