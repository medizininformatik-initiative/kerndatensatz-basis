Instance: mii-cps-person-capabilitystatement
InstanceOf: CapabilityStatement
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/CapabilityStatement/metadata"
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert CRMIShareableCapabilityStatement
* insert CRMIPublishableCapabilityStatement
* insert CRMIKnowledgeCapabilitiesCapabilityStatement
* insert CRMIVersionPolicyStrictInstance
* insert CRMIPackageSource
* insert CRMIArtifactUsageCapabilityStatement
* insert CRMIApprovalDateInstance(2024-03-07)
* insert CRMIResourceEffectivePeriodInstance
* insert CRMIArtifactTopicInstance(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C16960)
* insert CRMIArtifactTopicInstance(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C25190)
* insert CRMIArtifactTopicInstance(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C81239)
* insert CRMIArtifactTopicInstance(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C25717)
* insert CRMIArtifactContributorsInstance
* name = "MII_CPS_Person_CapabilityStatement"
* title = "MII CPS Person CapabilityStatement"
* status = #active
* experimental = false
* date = "2026-09-01"
* publisher = "Medizininformatik Initiative"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.medizininformatik-initiative.de"
* description = "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss um das Modul Person der Medizininformatik Initiative zu implementieren."
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* purpose = "Define the minimum capabilities a system must support to implement and claim conformance to the MII Person module."
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #xml
* format[+] = #json
* rest.mode = #server
* rest.resource[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension.valueCode = #SHALL
* rest.resource[=].type = #Patient
* rest.resource[=].supportedProfile[0] = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient|2027.0.0-ballot.rc1"
* rest.resource[=].supportedProfile[1] = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert|2027.0.0-ballot.rc1"
* rest.resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].code = #read
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "_count"
* rest.resource[=].searchParam[=].type = #special
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?_count=10`

**Notes:**
For further details see FHIR core specification, section [Page Count](https://www.hl7.org/fhir/R4/search.html#count)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "_summary"
* rest.resource[=].searchParam[=].type = #special
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?_summary=count`

**Notes:**
For further details see FHIR core specification, section [Summary](https://www.hl7.org/fhir/R4/search.html#summary)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "_id"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?_id=mii-exa-person-patient-1`

**Notes:**
The `_id` parameter is rarely used on its own since the `READ` interaction is more appropriate for fetching a single resource by id. It can be combined with `_include` to pull related resources in one request, e.g.:
`GET [base]/Patient?_id=mii-exa-person-patient-1&_include=Patient:link`
For further details see FHIR core specification, section [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "_profile"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-profile"
* rest.resource[=].searchParam[=].type = #uri
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?_profile=https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient|2027.0.0-ballot.rc1`

**Notes:**
Searches on `Patient.meta.profile`. For further details see FHIR core specification, section [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "identifier"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Patient-identifier"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?identifier=https://www.charite.de/fhir/sid/patienten|42285243`
`GET [base]/Patient?identifier=42285243`

**Notes:**
Searches on `Patient.identifier`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "assigner-pid"
* rest.resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-assignerpid"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?assigner-pid=https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier|Charité`
`GET [base]/Patient?assigner-pid=http://fhir.de/sid/arge-ik/iknr|260326822`

**Notes:**
Searches on `Patient.identifier.assigner`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "given"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-given"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?given=Maja`

**Notes:**
Searches on `Patient.name.given`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "family"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-family"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?family=Van-der-Dussen`

**Notes:**
Searches on `Patient.name.family`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "name"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Patient-name"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?name=Van-der-Dussen`
`GET [base]/Patient?name=Maja`

**Notes:**
Searches on `Patient.name`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "prefix"
* rest.resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-prefix"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?prefix=Prof. Dr. med.`

**Notes:**
Searches on `Patient.name.prefix`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "prefix-qualifier"
* rest.resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-prefixqualifier"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?prefix-qualifier=AC`

**Notes:**
Searches on `Patient.name.prefix.extension:prefix-qualifier`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "gender"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-gender"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?gender=female`

**Notes:**
Searches on `Patient.gender`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "other-amtlich"
* rest.resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-otheramtlich"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?other-amtlich=http://fhir.de/CodeSystem/gender-amtlich-de|D`

**Notes:**
Searches on `Patient.gender.extension:other-amtlich`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "birthdate"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-birthdate"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?birthdate=1998-09-19`
`GET [base]/Patient?birthdate=ge1990-01-01&birthdate=le2000-12-31`

**Notes:**
Searches on `Patient.birthDate`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#date)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "death-date"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Patient-death-date"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?death-date=2021-01-01`

**Notes:**
Searches on `Patient.deceased`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#date)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "deceased"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Patient-deceased"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?deceased=false`

**Notes:**
Searches on `Patient.deceased`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "address"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-address"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?address=Berlin`

**Notes:**
Searches on `Patient.address`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "address-city"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-address-city"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?address-city=Berlin`

**Notes:**
Searches on `Patient.address.city`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "address-postalcode"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-address-postalcode"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?address-postalcode=10178`

**Notes:**
Searches on `Patient.address.postalCode`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "address-country"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-address-country"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?address-country=DE`

**Notes:**
Searches on `Patient.address.country`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "gemeindeschluessel"
* rest.resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-gemeindeschluessel"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?gemeindeschluessel=http://fhir.de/sid/destatis/ags|11000000`

**Notes:**
Searches on `Patient.address.city.extension:gemeindeschluessel`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "strasse"
* rest.resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-strasse"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?strasse=Anna-Louisa-Karsch%20Str.`

**Notes:**
Searches on `Patient.address.line.extension:Strasse`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "hausnummer"
* rest.resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-hausnummer"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?hausnummer=2`

**Notes:**
Searches on `Patient.address.line.extension:Hausnummer`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "adresszusatz"
* rest.resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-adresszusatz"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?adresszusatz=c%2FO%20Abteilung%20XYZ`

**Notes:**
Searches on `Patient.address.line.extension:Adresszusatz`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "postfach"
* rest.resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-postfach"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?postfach=Postfach-252618`

**Notes:**
Searches on `Patient.address.line.extension:Postfach`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "stadtteil"
* rest.resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-stadtteil"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?stadtteil=Berlin-Mitte`

**Notes:**
Searches on `Patient.address.extension:Stadtteil`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "link"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Patient-link"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Patient?link=Patient/mii-exa-person-patient-1`

**Notes:**
Searches on `Patient.link.other`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."""
// * rest.resource[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
// * rest.resource[=].extension.valueCode = #SHALL
// * rest.resource[=].type = #ResearchSubject
// * rest.resource[=].supportedProfile = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/ResearchSubject|2027.0.0-ballot.rc1"
// * rest.resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
// * rest.resource[=].interaction[=].extension.valueCode = #SHALL
// * rest.resource[=].interaction[=].code = #read
// * rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
// * rest.resource[=].interaction[=].extension.valueCode = #SHALL
// * rest.resource[=].interaction[=].code = #search-type
// * rest.resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
// * rest.resource[=].searchParam[=].extension.valueCode = #SHALL
// * rest.resource[=].searchParam[=].name = "_id"
// * rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
// * rest.resource[=].searchParam[=].type = #token
// * rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
// * rest.resource[=].searchParam[=].extension.valueCode = #SHALL
// * rest.resource[=].searchParam[=].name = "_profile"
// * rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-profile"
// * rest.resource[=].searchParam[=].type = #uri
// * rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
// * rest.resource[=].searchParam[=].extension.valueCode = #SHALL
// * rest.resource[=].searchParam[=].name = "identifier"
// * rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ResearchSubject-identifier"
// * rest.resource[=].searchParam[=].type = #token
// * rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
// * rest.resource[=].searchParam[=].extension.valueCode = #SHALL
// * rest.resource[=].searchParam[=].name = "status"
// * rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ResearchSubject-status"
// * rest.resource[=].searchParam[=].type = #token
// * rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
// * rest.resource[=].searchParam[=].extension.valueCode = #SHALL
// * rest.resource[=].searchParam[=].name = "date"
// * rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ResearchSubject-date"
// * rest.resource[=].searchParam[=].type = #date
// * rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
// * rest.resource[=].searchParam[=].extension.valueCode = #SHALL
// * rest.resource[=].searchParam[=].name = "study"
// * rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ResearchSubject-study"
// * rest.resource[=].searchParam[=].type = #reference
// * rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
// * rest.resource[=].searchParam[=].extension.valueCode = #SHALL
// * rest.resource[=].searchParam[=].name = "individual"
// * rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ResearchSubject-individual"
// * rest.resource[=].searchParam[=].type = #reference
// * rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
// * rest.resource[=].searchParam[=].extension.valueCode = #SHALL
// * rest.resource[=].searchParam[=].name = "consent"
// * rest.resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchsubject-consent"
// * rest.resource[=].searchParam[=].type = #reference
* rest.resource[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension.valueCode = #SHALL
* rest.resource[=].type = #Observation
* rest.resource[=].supportedProfile = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Vitalstatus|2027.0.0-ballot.rc1"
* rest.resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].code = #read
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "_count"
* rest.resource[=].searchParam[=].type = #special
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Observation?_count=10`

**Notes:**
For further details see FHIR core specification, section [Page Count](https://www.hl7.org/fhir/R4/search.html#count)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "_summary"
* rest.resource[=].searchParam[=].type = #special
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Observation?_summary=count`

**Notes:**
For further details see FHIR core specification, section [Summary](https://www.hl7.org/fhir/R4/search.html#summary)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "_id"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Observation?_id=mii-exa-person-observation-vitalstatus`

**Notes:**
For further details see FHIR core specification, section [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "_profile"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-profile"
* rest.resource[=].searchParam[=].type = #uri
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Observation?_profile=https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Vitalstatus|2027.0.0-ballot.rc1`

**Notes:**
Searches on `Observation.meta.profile`. For further details see FHIR core specification, section [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Observation?status=final`

**Notes:**
Searches on `Observation.status`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "code"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Observation?code=http://loinc.org|67162-8`

**Notes:**
Searches on `Observation.code`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "subject"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-subject"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Observation?subject=Patient/mii-exa-person-patient-1`

**Notes:**
Searches on `Observation.subject`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Observation?patient=Patient/mii-exa-person-patient-1`

**Notes:**
Searches on `Observation.subject` where the subject is a Patient. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "date"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Observation?date=2020-01-08`
`GET [base]/Observation?date=ge2020-01-01&date=le2020-12-31`

**Notes:**
Searches on `Observation.effective`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#date)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "value-concept"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-value-concept"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Observation?value-concept=https://www.medizininformatik-initiative.de/fhir/core/modul-person/CodeSystem/Vitalstatus|L`

**Notes:**
Searches on `Observation.value` as CodeableConcept. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "code-value-concept"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-code-value-concept"
* rest.resource[=].searchParam[=].type = #composite
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Observation?code-value-concept=http://loinc.org|67162-8$https://www.medizininformatik-initiative.de/fhir/core/modul-person/CodeSystem/Vitalstatus|L`

**Notes:**
Combines `Observation.code` and `Observation.value` as CodeableConcept in a single filter. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#composite)."""
* rest.resource[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension.valueCode = #SHALL
* rest.resource[=].type = #Condition
* rest.resource[=].supportedProfile = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Todesursache|2027.0.0-ballot.rc1"
* rest.resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].code = #read
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "_count"
* rest.resource[=].searchParam[=].type = #special
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?_count=10`

**Notes:**
For further details see FHIR core specification, section [Page Count](https://www.hl7.org/fhir/R4/search.html#count)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "_summary"
* rest.resource[=].searchParam[=].type = #special
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?_summary=count`

**Notes:**
For further details see FHIR core specification, section [Summary](https://www.hl7.org/fhir/R4/search.html#summary)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "_id"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?_id=mii-exa-diagnose-mehrfachcodierung-primaercode`

**Notes:**
For further details see FHIR core specification, section [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "_profile"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-profile"
* rest.resource[=].searchParam[=].type = #uri
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?_profile=https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose|2027.0.0-ballot.rc1`

**Notes:**
Searches on `Condition.meta.profile`. For further details see FHIR core specification, section [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "category"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-category"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?category=http://snomed.info/sct|161000001`

**Notes:**
Searches on `Condition.category`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "code"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?code=http://fhir.de/CodeSystem/bfarm/icd-10-gm|A54.4`

**Notes:**
Searches on `Condition.code`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "subject"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-subject"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?subject=Patient/mii-exa-person-patient-1`

**Notes:**
Searches on `Condition.subject`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."""
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?patient=Patient/mii-exa-person-patient-1`

**Notes:**
Searches on `Condition.subject` where the subject is a Patient. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."""
