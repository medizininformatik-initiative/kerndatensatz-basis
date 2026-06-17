Instance: mii-cps-prozedur-capabilitystatement
InstanceOf: CapabilityStatement
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/CapabilityStatement/metadata"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert CRMIShareableCapabilityStatement
* insert CRMIPublishableCapabilityStatement
* insert CRMIKnowledgeCapabilitiesCapabilityStatement
* insert CRMIVersionPolicyStrictInstance
* insert CRMIPackageSource
* insert CRMIArtifactUsageCapabilityStatement
* insert CRMIApprovalDateInstance(2024-03-07)
* insert CRMIResourceEffectivePeriodInstance
* insert CRMIArtifactTopicInstance(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C25218)
* insert CRMIArtifactContributorsInstance
* name = "MII_CPS_Prozedur_CapabilityStatement"
* title = "MII CPS Prozedur CapabilityStatement"
* status = #active
* experimental = false
* date = "2026-06-15"
* description = "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss um das Modul Prozedur der Medizininformatik Initiative zu implementieren."
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* purpose = "Define the minimum capabilities a system must support to implement and claim conformance to the MII Procedure module."
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #xml
* format[+] = #json
* rest.mode = #server

// Procedure requirements
* insert SupportResource(Procedure, #SHALL)
* insert Profile(http://hl7.org/fhir/StructureDefinition/Procedure)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure, #SHALL)
* insert SupportInteraction(#read, #SHALL)
* insert SupportInteraction(#search-type, #SHALL)
* insert SupportSpecialSearchParam(_count, #special, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Procedure?_count=10`

**Notes:**
For further details see FHIR core specification, section [Page Count](https://hl7.org/fhir/R4/search.html#count)."""
* insert SupportSpecialSearchParam(_summary, #special, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Procedure?_summary=count`

**Notes:**
For further details see FHIR core specification, section [Summary](https://hl7.org/fhir/R4/search.html#summary)."""
* insert SupportSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Procedure?_id=mii-exa-prozedur-procedure`

**Notes:**
For further details see FHIR core specification, section [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)."""
* insert SupportSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Procedure?_lastUpdated=ge2020-01-01`

**Notes:**
Searches on `Procedure.meta.lastUpdated`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#_lastUpdated)."""
* insert SupportSearchParam(_profile, http://hl7.org/fhir/SearchParameter/Resource-profile, #uri, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Procedure?_profile=https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure|2026.0.0`

**Notes:**
Searches on `Procedure.meta.profile`. For further details see FHIR core specification, section [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)."""
* insert SupportSearchParam(status, http://hl7.org/fhir/SearchParameter/Procedure-status, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Procedure?status=completed`

**Notes:**
Searches on `Procedure.status`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(category, http://hl7.org/fhir/SearchParameter/Procedure-category, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Procedure?category=http://snomed.info/sct|277132007`
`GET [base]/Procedure?category=277132007`

**Notes:**
Searches on `Procedure.category`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(code, http://hl7.org/fhir/SearchParameter/clinical-code, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Procedure?code=http://fhir.de/CodeSystem/bfarm/ops|5-470`
`GET [base]/Procedure?code=5-470`

**Notes:**
Searches on `Procedure.code`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(date, http://hl7.org/fhir/SearchParameter/clinical-date, #date, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Procedure?date=2020-01-08`
`GET [base]/Procedure?date=ge2020-01-08&date=lt2020-01-09`

**Notes:**
Searches on `Procedure.performed[x]`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#date)."""
* insert SupportSearchParam(patient, http://hl7.org/fhir/SearchParameter/clinical-patient, #reference, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Procedure?patient=Patient/mii-exa-person-patient-1`
`GET [base]/Procedure?patient=mii-exa-person-patient-1`

**Notes:**
Searches on `Procedure.subject` where the subject is a Patient. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."""
* insert SupportSearchParam(subject, http://hl7.org/fhir/SearchParameter/Procedure-subject, #reference, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Procedure?subject=Patient/mii-exa-person-patient-1`
`GET [base]/Procedure?subject=mii-exa-person-patient-1`

**Notes:**
Searches on `Procedure.subject`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."""
* insert SupportSearchParam(bodySite, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-bodysite, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Procedure?bodySite=http://snomed.info/sct|181255000`
`GET [base]/Procedure?bodySite=181255000`

**Notes:**
Searches on `Procedure.bodySite`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(dokumentationsdatum, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-dokumentationsdatum, #date, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Procedure?dokumentationsdatum=2020-01-08`

**Notes:**
Searches on `Procedure.extension('http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum').value`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#date)."""
* insert SupportSearchParam(durchfuehrungsabsicht, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-durchfuehrungsabsicht, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Procedure?durchfuehrungsabsicht=http://snomed.info/sct|262202000`
`GET [base]/Procedure?durchfuehrungsabsicht=262202000`

**Notes:**
Searches on `Procedure.extension('https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht').value`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(ops-seitenlokalisation, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-ops-seitenlokalisation, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Procedure?ops-seitenlokalisation=https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_SEITENLOKALISATION|L`

**Notes:**
Searches on `Procedure.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/ops').extension('http://fhir.de/StructureDefinition/seitenlokalisation').valueCoding.code`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
