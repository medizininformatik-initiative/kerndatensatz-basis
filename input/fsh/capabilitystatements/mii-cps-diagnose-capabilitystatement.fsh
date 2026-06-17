Instance: mii-cps-diagnose-capabilitystatement
InstanceOf: CapabilityStatement
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/CapabilityStatement/metadata"
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
* insert CRMIArtifactTopicInstance(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C15607)
* insert CRMIArtifactContributorsInstance
* name = "MII_CPS_Diagnose_CapabilityStatement"
* title = "MII CPS Diagnose CapabilityStatement"
* status = #active
* experimental = false
* date = "2026-06-15"
* description = "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss, um das Modul Diagnose der Medizininformatik Initiative zu implementieren."
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* purpose = "Define the minimum capabilities a system must support to implement and claim conformance to the MII Diagnosis module."
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #xml
* format[+] = #json
* rest.mode = #server

// Condition requirements
* insert SupportResource(Condition, #SHALL)
* insert Profile(http://hl7.org/fhir/StructureDefinition/Condition)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose, #SHALL)
* insert SupportInteraction(#read, #SHALL)
* insert SupportInteraction(#search-type, #SHALL)
* insert SupportSpecialSearchParam(_count, #special, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?_count=10`

**Notes:**
For further details see FHIR core specification, section [Page Count](https://www.hl7.org/fhir/R4/search.html#count)."""
* insert SupportSpecialSearchParam(_summary, #special, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?_summary=count`

**Notes:**
For further details see FHIR core specification, section [Summary](https://www.hl7.org/fhir/R4/search.html#summary)."""
* insert SupportSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?_id=mii-exa-diagnose-appendicitis`

**Notes:**
For further details see FHIR core specification, section [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)."""
* insert SupportSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?_lastUpdated=ge2026-01-01`

**Notes:**
Searches on `Condition.meta.lastUpdated`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#_lastUpdated)."""
* insert SupportSearchParam(_profile, http://hl7.org/fhir/SearchParameter/Resource-profile, #uri, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?_profile=https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose|2026.0.0`

**Notes:**
Searches on `Condition.meta.profile`. For further details see FHIR core specification, section [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)."""
* insert SupportSearchParam(abatement-age, http://hl7.org/fhir/SearchParameter/Condition-abatement-age, #quantity, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?abatement-age=20|http://unitsofmeasure.org|a`

**Notes:**
Searches on `Condition.abatement.ofType(Age)`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#quantity)."""
* insert SupportSearchParam(abatement-date, http://hl7.org/fhir/SearchParameter/Condition-abatement-date, #date, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?abatement-date=2020-01-08`

**Notes:**
Searches on `Condition.abatement.ofType(dateTime)`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#date)."""
* insert SupportSearchParam(abatement-string, http://hl7.org/fhir/SearchParameter/Condition-abatement-string, #string, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?abatement-string=resolved`

**Notes:**
Searches on `Condition.abatement.ofType(string)`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."""
* insert SupportSearchParam(body-site, http://hl7.org/fhir/SearchParameter/Condition-body-site, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?body-site=elbow`

**Notes:**
Searches on `Condition.bodySite`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(category, http://hl7.org/fhir/SearchParameter/Condition-category, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?category=problem-list-item`

**Notes:**
Searches on `Condition.category`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(clinical-status, http://hl7.org/fhir/SearchParameter/Condition-clinical-status, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?clinical-status=active`

**Notes:**
Searches on `Condition.clinicalStatus`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(code, http://hl7.org/fhir/SearchParameter/clinical-code, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?code=http://fhir.de/CodeSystem/bfarm/icd-10-gm|K35.8`
`GET [base]/Condition?code=K35.8`

**Notes:**
Searches on `Condition.code`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(encounter, http://hl7.org/fhir/SearchParameter/Condition-encounter, #reference, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?encounter=Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-2`
`GET [base]/Condition?encounter=mii-exa-fall-kontakt-gesundheitseinrichtung-2`

**Notes:**
Searches on `Condition.encounter`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."""
* insert SupportSearchParam(evidence, http://hl7.org/fhir/SearchParameter/Condition-evidence, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?evidence=manifestation`

**Notes:**
Searches on `Condition.evidence`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(evidence-detail, http://hl7.org/fhir/SearchParameter/Condition-evidence-detail, #reference, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?evidence-detail=Observation/mii-exa-person-observation-vitalstatus`
`GET [base]/Condition?evidence-detail=mii-exa-person-observation-vitalstatus`

**Notes:**
Searches on `Condition.evidence.detail`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."""
* insert SupportSearchParam(identifier, http://hl7.org/fhir/SearchParameter/clinical-identifier, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?identifier=diagnose-1`

**Notes:**
Searches on `Condition.identifier`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(onset-age, http://hl7.org/fhir/SearchParameter/Condition-onset-age, #quantity, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?onset-age=20|http://unitsofmeasure.org|a`

**Notes:**
Searches on `Condition.onset.ofType(Age)`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#quantity)."""
* insert SupportSearchParam(onset-date, http://hl7.org/fhir/SearchParameter/Condition-onset-date, #date, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?onset-date=2020-01-08`

**Notes:**
Searches on `Condition.onset.ofType(dateTime)`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#date)."""
* insert SupportSearchParam(onset-info, http://hl7.org/fhir/SearchParameter/Condition-onset-info, #string, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?onset-info=2019-09-26`

**Notes:**
Searches on `Condition.onset.ofType(string)`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."""
* insert SupportSearchParam(patient, http://hl7.org/fhir/SearchParameter/clinical-patient, #reference, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?patient=Patient/mii-exa-person-patient-1`
`GET [base]/Condition?patient=mii-exa-person-patient-1`

**Notes:**
Searches on `Condition.subject` where the subject is a Patient. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."""
* insert SupportSearchParam(recorded-date, http://hl7.org/fhir/SearchParameter/Condition-recorded-date, #date, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?recorded-date=2020-01-08`

**Notes:**
Searches on `Condition.recordedDate`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#date)."""
* insert SupportSearchParam(severity, http://hl7.org/fhir/SearchParameter/Condition-severity, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?severity=moderate`

**Notes:**
Searches on `Condition.severity`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(stage, http://hl7.org/fhir/SearchParameter/Condition-stage, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?stage=initial`

**Notes:**
Searches on `Condition.stage`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(subject, http://hl7.org/fhir/SearchParameter/Condition-subject, #reference, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?subject=Patient/mii-exa-person-patient-1`
`GET [base]/Condition?subject=mii-exa-person-patient-1`

**Notes:**
Searches on `Condition.subject`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."""
* insert SupportSearchParam(verification-status, http://hl7.org/fhir/SearchParameter/Condition-verification-status, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?verification-status=confirmed`

**Notes:**
Searches on `Condition.verificationStatus`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(icd10gm-diagnosesicherheit, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-icd10gm-diagnosesicherheit, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?icd10gm-diagnosesicherheit=https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_DIAGNOSESICHERHEIT|G`

**Notes:**
Searches on `Condition.code.coding.extension.where(url='http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit').value`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(icd10gm-mehrfachcodierung, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-icd10gm-mehrfachcodierung, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?icd10gm-mehrfachcodierung=http://fhir.de/CodeSystem/icd-10-gm-mehrfachcodierungs-kennzeichen|†`

**Notes:**
Searches on `Condition.code.coding.extension.where(url='http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen').value`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(icd10gm-seitenlokalisation, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-icd10gm-seitenlokalisation, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Condition?icd10gm-seitenlokalisation=https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_SEITENLOKALISATION|L`

**Notes:**
Searches on `Condition.code.coding.extension.where(url='http://fhir.de/StructureDefinition/seitenlokalisation').value`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
