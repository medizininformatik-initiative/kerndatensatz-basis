Instance: mii-cps-fall-capabilitystatement
InstanceOf: CapabilityStatement
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/CapabilityStatement/metadata"
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
* insert CRMIArtifactTopicInstance(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C154624)
* insert CRMIArtifactContributorsInstance
* name = "MII_CPS_Fall_CapabilityStatement"
* title = "MII CPS Fall CapabilityStatement"
* status = #active
* experimental = false
* date = "2026-09-01"
* description = "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss, um das Modul Fall der Medizininformatik Initiative zu implementieren."
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* purpose = "Define the minimum capabilities a system must support to implement and claim conformance to the MII Encounter module."
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #xml
* format[+] = #json
* rest.mode = #server

// Condition requirements
* insert SupportResource(Encounter, #SHALL)
* insert Profile(http://hl7.org/fhir/StructureDefinition/Encounter)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung, #SHALL)
* insert SupportInteraction(#read, #SHALL)
* insert SupportInteraction(#search-type, #SHALL)
* insert SupportSpecialSearchParam(_count, #special, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Encounter?_count=10`

**Notes:**
For further details see FHIR core specification, section [Page Count](https://www.hl7.org/fhir/R4/search.html#count)."""
* insert SupportSpecialSearchParam(_summary, #special, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Encounter?_summary=count`

**Notes:**
For further details see FHIR core specification, section [Summary](https://www.hl7.org/fhir/R4/search.html#summary)."""
* insert SupportSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Encounter?_id=mii-exa-fall-kontakt-gesundheitseinrichtung-1`

**Notes:**
Searches on `Encounter.id`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Encounter?_lastUpdated=ge2026-05-05`

**Notes:**
Searches on `Encounter.meta.lastUpdated`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#date)."""
* insert SupportSearchParam(_profile, http://hl7.org/fhir/SearchParameter/Resource-profile, #uri, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Encounter?_profile=https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung`

**Notes:**
Searches on `Encounter.meta.profile`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#uri)."""
* insert SupportSearchParam(identifier, http://hl7.org/fhir/SearchParameter/clinical-identifier, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Encounter?identifier=https://www.charite.de/fhir/sid/aufnahmenummer|E0`
`GET [base]/Encounter?identifier=E0`

**Notes:**
Searches on `Encounter.identifier`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(status, http://hl7.org/fhir/SearchParameter/Encounter-status, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Encounter?status=finished`

**Notes:**
Searches on `Encounter.status`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(class, http://hl7.org/fhir/SearchParameter/Encounter-class, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Encounter?class=http://terminology.hl7.org/CodeSystem/v3-ActCode|IMP`
`GET [base]/Encounter?class=IMP`

**Notes:**
Searches on `Encounter.class`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(type, http://hl7.org/fhir/SearchParameter/clinical-type, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Encounter?type=http://fhir.de/CodeSystem/Kontaktebene|einrichtungskontakt`
`GET [base]/Encounter?type=einrichtungskontakt`

**Notes:**
Searches on `Encounter.type`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(category, http://hl7.org/fhir/SearchParameter/Condition-category, #token, #SHALL)
* insert SupportSearchParam(subject, http://hl7.org/fhir/SearchParameter/Encounter-subject, #reference, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Encounter?subject=Patient/DHPYT7SPMZBGZE46`
`GET [base]/Encounter?subject=DHPYT7SPMZBGZE46`

**Notes:**
Searches on `Encounter.subject`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."""
* insert SupportSearchParam(date, http://hl7.org/fhir/SearchParameter/clinical-date, #date, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Encounter?date=2020-01-08`

**Notes:**
Searches on `Encounter.period`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#date)."""
* insert SupportSearchParam(diagnosis, http://hl7.org/fhir/SearchParameter/Encounter-diagnosis, #reference, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Encounter?diagnosis=Condition/DHPYT7SPS2RNMVLB`
`GET [base]/Encounter?diagnosis=DHPYT7SPS2RNMVLB`

**Notes:**
Searches on `Encounter.diagnosis.condition`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."""
* insert SupportSearchParam(location, http://hl7.org/fhir/SearchParameter/Encounter-location, #reference, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Encounter?location:identifier=https://www.charite.de/fhir/sid/Zimmernummern|RHC-06-210b`

**Notes:**
Searches on `Encounter.location.location.identifier`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."""
* insert SupportSearchParam(service-provider, http://hl7.org/fhir/SearchParameter/Encounter-service-provider, #reference, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Encounter?service-provider=Organization/DHPYT7SPMZBGZE5W`
`GET [base]/Encounter?service-provider=DHPYT7SPMZBGZE5W`

**Notes:**
Searches on `Encounter.serviceProvider`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."""
* insert SupportSearchParam(part-of, http://hl7.org/fhir/SearchParameter/Encounter-part-of, #reference, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Encounter?part-of=Encounter/DHPYT7SPS2RNMVLD`
`GET [base]/Encounter?part-of=DHPYT7SPS2RNMVLD`

**Notes:**
Searches on `Encounter.partOf`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."""
* insert SupportSearchParam(service-type, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-servicetype, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Encounter?service-type=http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel|1500`
`GET [base]/Encounter?service-type=1500`

**Notes:**
Searches on `Encounter.serviceType`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(diagnosis-use, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-diagnosis-use, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Encounter?diagnosis-use=http://terminology.hl7.org/CodeSystem/diagnosis-role|AD`
`GET [base]/Encounter?diagnosis-use=AD`

**Notes:**
Searches on `Encounter.diagnosis.use`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(hospitalization-admitsource, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-hospitalization-admitsource, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Encounter?hospitalization-admitsource=http://fhir.de/CodeSystem/dgkev/Aufnahmeanlass|N`
`GET [base]/Encounter?hospitalization-admitsource=N`

**Notes:**
Searches on `Encounter.hospitalization.admitSource`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
//* insert SupportSearchParam(hospitalization-discharge-reason-12, https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-hospitalization-dischargeReason-12, #token, #SHALL)
//* insert SupportSearchParam(hospitalization-discharge-reason-3, https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-hospitalization-dischargeReason-3, #token, #SHALL)
//* insert SupportSearchParam(hospitalization-discharge-reason, https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-hospitalization-dischargeReason, #composite, #SHALL)
* insert SupportSearchParam(location-physical-type, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-location-physical-type, #token, #SHALL)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Encounter?location-physical-type=http://terminology.hl7.org/CodeSystem/location-physical-type|ro`
`GET [base]/Encounter?location-physical-type=ro`

**Notes:**
Searches on `Encounter.location.physicalType`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."""
* insert SupportSearchParam(account, http://hl7.org/fhir/SearchParameter/Encounter-account, #reference, #SHOULD)
* rest.resource[=].searchParam[=].documentation = """**Example:**
`GET [base]/Encounter?account:identifier=https://www.charite.de/fhir/sid/fallnummer|F-2020-000123`

**Notes:**
Searches on `Encounter.account`. Use the `:identifier` modifier to search by Fallnummer stored as a logical reference in `Encounter.account.identifier`, without requiring the Account resource to be present. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."""
