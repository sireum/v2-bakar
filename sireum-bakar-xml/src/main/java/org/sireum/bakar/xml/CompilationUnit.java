
package org.sireum.bakar.xml;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for Compilation_Unit complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="Compilation_Unit">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="sloc" type="{}Source_Location"/>
 *         &lt;element name="context_clause_elements_ql" type="{}Context_Clause_List"/>
 *         &lt;element name="unit_declaration_q" type="{}Declaration_Class"/>
 *         &lt;element name="pragmas_after_ql" type="{}Element_List"/>
 *       &lt;/sequence>
 *       &lt;attribute name="unit_kind" use="required" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="unit_class" use="required" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="unit_origin" use="required" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="unit_full_name" use="required" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="def_name" use="required" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="source_file" use="required" type="{http://www.w3.org/2001/XMLSchema}string" />
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Compilation_Unit", propOrder = {
    "sloc",
    "contextClauseElementsQl",
    "unitDeclarationQ",
    "pragmasAfterQl"
})
public class CompilationUnit
    extends Base
{

    @XmlElement(required = true)
    protected SourceLocation sloc;
    @XmlElement(name = "context_clause_elements_ql", required = true)
    protected ContextClauseList contextClauseElementsQl;
    @XmlElement(name = "unit_declaration_q", required = true)
    protected DeclarationClass unitDeclarationQ;
    @XmlElement(name = "pragmas_after_ql", required = true)
    protected ElementList pragmasAfterQl;
    @XmlAttribute(name = "unit_kind", required = true)
    protected String unitKind;
    @XmlAttribute(name = "unit_class", required = true)
    protected String unitClass;
    @XmlAttribute(name = "unit_origin", required = true)
    protected String unitOrigin;
    @XmlAttribute(name = "unit_full_name", required = true)
    protected String unitFullName;
    @XmlAttribute(name = "def_name", required = true)
    protected String defName;
    @XmlAttribute(name = "source_file", required = true)
    protected String sourceFile;

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
     * Gets the value of the contextClauseElementsQl property.
     * 
     * @return
     *     possible object is
     *     {@link ContextClauseList }
     *     
     */
    public ContextClauseList getContextClauseElementsQl() {
        return contextClauseElementsQl;
    }

    /**
     * Sets the value of the contextClauseElementsQl property.
     * 
     * @param value
     *     allowed object is
     *     {@link ContextClauseList }
     *     
     */
    public void setContextClauseElementsQl(ContextClauseList value) {
        this.contextClauseElementsQl = value;
    }

    /**
     * Gets the value of the unitDeclarationQ property.
     * 
     * @return
     *     possible object is
     *     {@link DeclarationClass }
     *     
     */
    public DeclarationClass getUnitDeclarationQ() {
        return unitDeclarationQ;
    }

    /**
     * Sets the value of the unitDeclarationQ property.
     * 
     * @param value
     *     allowed object is
     *     {@link DeclarationClass }
     *     
     */
    public void setUnitDeclarationQ(DeclarationClass value) {
        this.unitDeclarationQ = value;
    }

    /**
     * Gets the value of the pragmasAfterQl property.
     * 
     * @return
     *     possible object is
     *     {@link ElementList }
     *     
     */
    public ElementList getPragmasAfterQl() {
        return pragmasAfterQl;
    }

    /**
     * Sets the value of the pragmasAfterQl property.
     * 
     * @param value
     *     allowed object is
     *     {@link ElementList }
     *     
     */
    public void setPragmasAfterQl(ElementList value) {
        this.pragmasAfterQl = value;
    }

    /**
     * Gets the value of the unitKind property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUnitKind() {
        return unitKind;
    }

    /**
     * Sets the value of the unitKind property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUnitKind(String value) {
        this.unitKind = value;
    }

    /**
     * Gets the value of the unitClass property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUnitClass() {
        return unitClass;
    }

    /**
     * Sets the value of the unitClass property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUnitClass(String value) {
        this.unitClass = value;
    }

    /**
     * Gets the value of the unitOrigin property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUnitOrigin() {
        return unitOrigin;
    }

    /**
     * Sets the value of the unitOrigin property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUnitOrigin(String value) {
        this.unitOrigin = value;
    }

    /**
     * Gets the value of the unitFullName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUnitFullName() {
        return unitFullName;
    }

    /**
     * Sets the value of the unitFullName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUnitFullName(String value) {
        this.unitFullName = value;
    }

    /**
     * Gets the value of the defName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDefName() {
        return defName;
    }

    /**
     * Sets the value of the defName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDefName(String value) {
        this.defName = value;
    }

    /**
     * Gets the value of the sourceFile property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSourceFile() {
        return sourceFile;
    }

    /**
     * Sets the value of the sourceFile property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSourceFile(String value) {
        this.sourceFile = value;
    }

}
