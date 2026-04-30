# Must Support - MII Implementation Guide Core Dataset Base v2026.0.0

## Must Support

For querying and reading MII Profiles, **Must Support** on any profile data element **SHALL** be interpreted as follows:

### Mandatory Elements

Elements of a FHIR resource can be defined in a profile as mandatory or "Must Support". Mandatory elements are elements with a minimum cardinality of 1 (min=1). When an element is mandatory, the data is expected to always be present. In rare cases, data may be missing despite a minimum cardinality of 1. Guidance for cases where data is missing can be found in the [Missing Data](missing-data.md) section.

### Must Support Elements

Resource elements marked as "Must Support" (MS) in a profile must be supported by systems that claim conformance to that particular profile. This is different from cardinality. It is possible to have an element with a minimum cardinality of 0, but still expect systems to support the element.

Support (Must Support) of an element is understood within the MII core dataset specifications as follows:

A distinction is made between data-requesting systems (recipients/clients) and data-providing systems (senders/servers). In the context of the MII infrastructure, the FHIR API of a Data Integration Center (DIZ) is the sending system that accepts requests.

#### Server Expectations

The system (sender/server) **SHALL** be capable of:

* Meaningfully populating a Must Support element with data (e.g., via ETL processes from primary data sources), if the data is locally available
* Storing the element in a resource
* Making it retrievable upon request (e.g., feasibility query)

#### Client Expectations

The data-requesting system (recipient/client) **SHALL** be capable of:

* Displaying the element to the user
* Considering it for further calculations or other processing
* Processing resource instances containing the Must Support data elements without generating an error or causing the application to fail

#### Missing Data

* When information on a particular data element is not present, and the reason for absence is unknown, MII Servers **SHALL NOT** include the data element in the resource instance returned as part of the query results
* When querying MII Servers, MII Clients **SHALL** interpret missing data elements within resource instances as data not present in the MII Server's system
* When information on a particular data element is missing, and the MII Server knows the precise reason for the absence of data, MII Servers **SHOULD** send the reason for the missing information following the guidance in the [Missing Data](missing-data.md) section

### Presentation of Must Support and Mandatory Elements

On each profile page, several different formal views of the profile contents are displayed in a tree format under tabs labeled "Differential Table", "Key Elements Table", and "Snapshot Table".

#### Differential Table View

Elements with a cardinality starting with "1" under the column header "Card." (e.g., 1..1) are **Mandatory** elements. Elements labeled **Must Support** in the "Differential Table" view are flagged with an S.

#### Must Support - Primitive Elements

Primitive elements are single elements with a primitive value. If they are marked as **Must Support**, then the Server **SHALL** be capable of providing the element value to meet the Must Support requirement.

For example, if an element like `Patient.birthDate` is marked as Must Support:

* MII Servers **SHALL** be capable of providing a value in `Patient.birthDate`
* MII Clients **SHALL** be capable of processing the value in `Patient.birthDate`

#### Must Support - Complex Elements

Complex elements are composed of primitive and other complex elements. For any complex element marked as **Must Support**, the Server **SHALL** be capable of providing at least one of the sub-element values. If any sub-element is marked as **Must Support**, it must also meet the Must Support requirements and satisfy the Must Support requirements for the parent element.

For example, if `Patient.name` is labeled **Must Support** and has **Must Support** sub-elements "family" and "given":

* MII Servers **SHALL** be capable of providing values in `Patient.name.family` and `Patient.name.given`
* MII Clients **SHALL** be capable of processing the values in `Patient.name.family` and `Patient.name.given`

On the other hand, if any sub-element is marked as **Must Support** and the parent element is not, there is **no expectation** that you must support the parent. However, if the parent element is represented in the structure, Servers **SHALL** support the sub-element(s) marked as **Must Support**.

#### Must Support - Resource References

When a Reference type element is labeled as **Must Support** and has a single target profile referenced, the target profile **SHALL** be supported.

For example, if `Condition.subject` references the MII Patient profile and is marked as Must Support:

* MII Servers **SHALL** be capable of providing a `Condition.subject` with a valid reference to an MII Patient Profile
* MII Clients **SHALL** be capable of processing a `Condition.subject` with a valid reference to an MII Patient Profile

When a Reference type element is labeled as **Must Support**, has multiple target profiles referenced, but none are labeled as **Must Support**, **at least one** target profile **SHALL** be supported.

#### Must Support - Choice of Data Types

If a **Must Support** element has a choice of datatypes for its content, the datatypes the Server **SHALL** support are labeled as **Must Support**.

For example, if `Observation.value[x]` has multiple Must Support datatypes:

* MII Servers **SHALL** be capable of populating the labeled Must Support datatypes (e.g., `valueQuantity`, `valueCodeableConcept`, `valueString`)
* MII Clients **SHALL** be capable of processing all labeled Must Support datatypes
* Systems **MAY** support other choice elements, but this is not a requirement

#### Must Support - Slices

FHIR profiles use [slicing](http://hl7.org/fhir/R4/profiling.html#slicing) to define constraints on repeating elements. The element that defines the slicing discriminator ("slicer") may be marked as Must Support, but each slice must be explicitly tagged with the Must Support property to define that slice's conformance requirements.

For example, if `Identifier` is a Must Support slicer element and defines slices for different identifier types, only the slices explicitly marked as Must Support are required:

* MII Servers **SHALL** be capable of providing identifiers that conform to the Must Support slices
* MII Clients **SHALL** be capable of processing identifiers that conform to the Must Support slices
* Systems **MAY** support other slices, but this is not required

-------

For more information, see:

* [General Requirements](general-requirements.md) - Requirements common to all actors and profiles
* [Missing Data](missing-data.md) - Guidance for handling missing data
* [Conformance](conformance.md) - General conformance requirements

