### Guidance for Implementers

This guide provides essential information for implementing the MII Core Dataset in FHIR-based systems.

#### Understanding the Requirements

**1. Logical Models - Business Requirements**

The [Logical Models](logical-models.html) contain the business and clinical requirements for each module:

* **Person Module** - Patient demographics and vital status
* **Diagnosis Module** - Diagnosis documentation requirements
* **Procedure Module** - Procedure and intervention documentation
* **Treatment Case Module** - Encounter management

These models provide a technology-independent view of what data must be captured and exchanged.

**2. UML Diagrams - Data Relationships**

The [UML Diagrams](uml-diagrams.html) illustrate:

* Relationships between different data elements
* Cardinalities and constraints
* Module dependencies and cross-references

#### Conformance and Implementation Requirements

**3. Conformance Rules**

Conformance requirements:

* [General Requirements](general-requirements.html) - Overall implementation rules and expectations
* [Must Support](must-support.html) - Critical elements that systems must be able to handle
* [Handling Missing Data](missing-data.html) - Strategies for dealing with incomplete data

These pages define the minimum conformance criteria for claiming compliance with the MII Core Dataset.

**4. Technical Artifacts**

Implementation artifacts can be found in:

* [Profiles and Extensions](profiles-and-extensions.html) - FHIR profiles with constraints and extensions
* [Terminology](terminology.html) - Value sets and code systems
* [Capability Statements](capability-statements.html) - Server capability requirements
* [Search Parameters and Operations](search-parameters-and-operations.html) - Required search capabilities
* [Examples](examples.html) - Sample resources demonstrating correct implementation

#### Getting Started with Implementation

**5. Downloads**

Visit the [Downloads](downloads.html) page to obtain:

* **FHIR Package** - Complete implementation guide package for validation
* **Example Resources** - Sample data in JSON and XML formats
* **ImplementationGuide Resource** - Machine-readable IG definition

#### Validation and Testing

**Terminology Services**

For terminology validation, use the MII Terminology Service:
* **URL:** [https://www.ontoserver.mii-termserv.de/](https://www.ontoserver.mii-termserv.de/)
* **Purpose:** ValueSet expansions, code validation, and terminology lookups

**Validation Tools**

Use the FHIR package with:
* [FHIR Validator](https://confluence.hl7.org/spaces/FHIR/pages/35718580/Using+the+FHIR+Validator)