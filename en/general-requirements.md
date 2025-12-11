# General Requirements - MII Implementation Guide Core Dataset Base v2026.0.0

## General Requirements

This page documents requirements common to all MII actors in this guide. The conformance verbs - **SHALL**, **SHOULD**, **MAY** - used in this guide are defined in [FHIR Conformance Rules](http://hl7.org/fhir/R4/conformance-rules.html#conflang).

### MII Conformance Artifacts

The [Profiles and Extensions](profiles-and-extensions.md) page lists the MII Profiles defined for this implementation guide. MII Profile [StructureDefinitions](http://hl7.org/fhir/R4/structuredefinition.html) define the **minimum** elements, extensions, vocabularies, and ValueSets that **SHALL** be present and constrain how the elements are used when using the profile.

The MII Profile elements include **Mandatory** and **Must Support** requirements. Mandatory elements are required and have a minimum cardinality of 1 (min=1). Must Support element Server and Client expectations are defined by MII. The [Must Support](must-support.md) page defines the Server and Client expectations for processing these element requirements and illustrates how they are displayed and documented.

The [Capability Statements](capability-statements.md) page outlines conformance requirements and expectations for MII Servers and Client applications. The MII CapabilityStatements identify the specific profiles and RESTful transactions that need support. The MII Profiles identify the structural constraints, terminology bindings, and invariants. Implementers must refer to the CapabilityStatements for details on the RESTful transactions, specific profiles, and the search parameters applicable to each MII actor.

### Standards and Alignment

The MII core dataset specifications are based, where possible, on international standards and terminologies. In particular, the following standards are highlighted:

* **[International Patient Summary (IPS)](http://hl7.org/fhir/uv/ips/)** - International standard for patient summaries
* **[German Base Profiles (Basisprofil DE R4)](https://ig.fhir.de/basisprofile-de/)** - Adaptation to the general conditions of the German healthcare system
* **[KBV FHIR Specifications](https://simplifier.net/organization/kassenrztlichebundesvereinigungkbv)** - Compatibility with specifications from the National Association of Statutory Health Insurance Physicians
* **[gematik FHIR Specifications](https://simplifier.net/organization/gematik)** - Compatibility with gematik specifications
* **[ISiK (Informationssysteme im Krankenhaus)](https://fachportal.gematik.de/informationen-fuer/isik)** - Reference project for hospital information systems

All elements of the core dataset, adapted to the details and requirements for the use cases of the Medical Informatics Initiative, are described below in the form of FHIR StructureDefinitions. The necessity of adapting the FHIR profiles is explained in textual form on each profile page.

### Conformance Verbs

Requirements in this specification are indicated by the following keywords written in capital letters based on [RFC-2119](https://datatracker.ietf.org/doc/html/rfc2119):

| | | |
| :--- | :--- | :--- |
| MUSS / MÜSSEN | MUST / SHALL | Required, mandatory |
| DARF NICHT / DÜRFEN NICHT | MUST NOT / SHALL NOT | Prohibited |
| VERPFLICHTEND | REQUIRED | Required by specification |
| SOLLTE / SOLLTEN | SHOULD | Recommended |
| SOLLTE NICHT / SOLLTEN NICHT | SHOULD NOT | Not recommended |
| EMPFOHLEN | RECOMMENDED | Recommended |
| KANN / OPTIONAL | MAY | Optional |

### Claiming Conformance to MII Profiles

#### Profile Support

Systems may deploy and support one or more MII Profiles to represent clinical information. They use the profile's content model without any expectations to implement the MII interactions.

To support an MII Profile, a Server:

* **SHALL** be able to populate all profile data elements that are mandatory and flagged as Must Support as defined by that profile's StructureDefinition
* **SHOULD** declare support for an MII Profile by including its official URL in the Server's `CapabilityStatement.rest.resource.supportedProfile` element 
* The MII Profile's official or "canonical" URL is located on each MII Profile page
 

#### Profile Support + Interaction Support

Systems may deploy and support one or more MII Profiles to represent clinical information **and** support the RESTful interactions defined for those resources.

A conformant Server:

* **SHALL** be able to populate all profile data elements that are mandatory and/or flagged as Must Support as defined by that profile's StructureDefinition
* **SHOULD** declare conformance with the appropriate MII CapabilityStatement by including its official URL in the Server's `CapabilityStatement.instantiates` element
* **SHALL** specify the full capability details from the MII CapabilityStatement it claims to implement 
* Declare support for the MII Profile by including its official URL in the Server's `CapabilityStatement.rest.resource.supportedProfile` element
* Declare support for the MII Profile's FHIR RESTful transactions
 

### Using Codes in MII Profiles

The following rules summarize the requirements defined by [FHIR Terminology](http://hl7.org/fhir/R4/terminologies.html) for coded elements (CodeableConcept, Coding, and code datatypes).

#### Required Bindings for Coded Elements

[Required binding](http://hl7.org/fhir/R4/terminologies.html#required) to a ValueSet definition means that one of the codes from the specified ValueSet **SHALL** be used. For `CodeableConcept`, which permits multiple codings and a text element, this rule applies to **at least** one of the codings, and only text is **not** valid.

When claiming conformance to a profile with required bindings:

* MII Servers **SHALL** provide at least one code from the bound ValueSet (additional codes from other systems **MAY** be provided)
* MII Clients **SHALL** be capable of processing the code from the bound ValueSet

#### Extensible Binding for Coded Elements

[Extensible binding](http://hl7.org/fhir/R4/terminologies.html#extensible) means that one of the codes from the specified ValueSet **SHALL** be used if an applicable concept is present. If no suitable code exists in the ValueSet, alternate code(s) may be provided. For `CodeableConcept`, which permits multiple codings and a text element, this rule applies to **at least** one of the codings. If only text is available and it has no conceptual overlap with the bound coded values, then just text may be used.

When claiming conformance to a profile with extensible bindings:

* MII Servers **SHALL** provide: 
* A code from the bound ValueSet **if the concept exists** in the ValueSet
* Or an alternative code **if the concept does not exist** in the ValueSet
* Or text if only text is available
 
* MII Clients **SHALL** be capable of processing codes from the bound ValueSet or alternative codes or text

#### Using Multiple Codes with CodeableConcept Datatype

Alternate codes may be provided in addition to the standard codes defined in required or extensible ValueSets. These alternate codes are called "additional codings". They may be equivalent to or narrower in meaning than the standard concept code.

For example, a diagnosis may include both an ICD-10-GM code and a SNOMED CT code for international interoperability:

```
"code": {
  "coding": [
    {
      "system": "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "code": "E11.90",
      "display": "Diabetes mellitus, Typ 2, ohne Komplikationen"
    },
    {
      "system": "http://snomed.info/sct",
      "code": "44054006",
      "display": "Diabetes mellitus type 2"
    }
  ]
}

```

### Missing Data

There are situations when information on a particular data element is missing, and the source system does not know the reason for the absence of data. See the [Missing Data](missing-data.md) page for detailed guidance on how to handle missing data in MII profiles.

### FHIR RESTful Search API Requirements

For all supported search interactions in this guide:

* Servers **SHALL** support the HTTP `POST`-based search
* Servers **SHALL** support the `GET`-based search

When searching using different search parameter types:

* **Token search parameters** - [(how to search by token)](http://hl7.org/fhir/R4/search.html#token) 
* The Client **SHALL** provide at least a code value and **MAY** provide both the system and code values
* The Server **SHALL** support both
 
* **Reference search parameters** - [(how to search by reference)](http://hl7.org/fhir/R4/search.html#reference) 
* The Client **SHALL** provide at least an id value and **MAY** provide both the Type and id values
* The Server **SHALL** support both
 
* **Date search parameters** - [(how to search by date)](http://hl7.org/fhir/R4/search.html#date) 
* The Client **SHALL** provide values precise to the **day** for elements of datatype `date` and to the **second + time offset** for elements of datatype `dateTime`
* The Server **SHALL** support values precise to the **day** for elements of datatype `date` and to the **second + time offset** for elements of datatype `dateTime`
 

### Modifier Elements

A FHIR [modifier element](http://hl7.org/fhir/R4/conformance-rules.html#isModifier) is an element that modifies the meaning of a resource element. Although Servers and Clients **SHALL** be able to process Mandatory or Must Support elements, not all modifier elements are Mandatory or Must Support, and there is no requirement for supporting them.

FHIR Clients need to be aware of unexpected modifier elements in the data they receive because they can alter the meaning of the data and can potentially lead to errors or even security risks if not properly handled. Unless a Client determines they can process it safely, rejection is typically the only safe action if unexpected modifier elements are present.

Some examples of modifiers that may not be Must Support elements in MII Profiles include:

* `modifierExtension` element common to all profiles
* `Observation.valueQuantity.comparator`
* `Patient.active`

Implementers **SHOULD** review the profile pages carefully to understand which elements are modifiers and how they affect the interpretation of the resource.

-------

For more information, see:

* [Must Support](must-support.md) - Detailed Must Support requirements
* [General Requirements](general-requirements.md) - Additional general requirements
* [Missing Data](missing-data.md) - Guidance for handling missing data
* [Capability Statements](capability-statements.md) - Server and Client capability requirements

