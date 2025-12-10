This page lists all ValueSets and CodeSystems defined as part of the MII Implementation Guide Kerndatensatz Basis. For more information on using codes in this guide, see the [FHIR Terminology](http://hl7.org/fhir/R4/terminologies.html) section in the FHIR specification.

{:.bg-info}
**Important Note:** CodeSystem resources for external terminologies (ICD-10-GM, OPS) are not published in this module but should be obtained from the MII Terminology Service (SU-TermServ): [https://www.ontoserver.mii-termserv.de/](https://www.ontoserver.mii-termserv.de/)

### Value Sets

Most value sets used in this guide reference external code systems such as ICD-10-GM, OPS, SNOMED CT, and Orphanet. The following sections list the value sets defined and used in this implementation guide, organized by module.

{:.bg-info}
**Note:** The following ValueSets do not include expansions. For validation purposes, expansions MUST be created via a FHIR terminology server.

#### Person Module Value Sets

* [MII VS Person Vitalstatus](ValueSet-mii-vs-person-vitalstatus.html) - Vital status codes
* [MII VS Person ICD-10-WHO](ValueSet-mii-vs-person-icd10who.html) - ICD-10 WHO codes for causes of death

#### Treatment Case Module Value Sets

* [MII VS Fall Identifier Type Codes](ValueSet-mii-vs-fall-identifier-type-codes.html) - Identifier types for encounter numbers
* [MII VS Fall Diagnosis Use](ValueSet-mii-vs-fall-diagnosis-use.html) - Diagnosis role in encounter context
* [MII VS Fall Location Physical Type](ValueSet-mii-vs-fall-location-physical-type.html) - Physical types of locations

#### Diagnosis Module Value Sets

* [MII VS Diagnose ICD10GM](ValueSet-mii-vs-diagnose-icd10gm.html) - ICD-10-GM codes for diagnoses (legally required in Germany per § 301 and § 295 SGB V)
* [MII VS Diagnose DiagnoseCodes SNOMED](ValueSet-mii-vs-diagnose-diagnosecodes-snomed.html) - SNOMED CT codes for diagnoses
* [MII VS Diagnose Orphanet](ValueSet-mii-vs-diagnose-orphanet.html) - Orphanet codes for rare diseases
* [MII VS Diagnose AlphaID](ValueSet-mii-vs-diagnose-alphaid.html) - Alpha-ID codes based on ICD-10-GM alphabetical index
* [MII VS Diagnose BodyStructure SNOMED](ValueSet-mii-vs-diagnose-bodystructure-snomed.html) - SNOMED CT codes for body structures/sites

#### Procedure Module Value Sets

* [MII VS Prozedur OPS](ValueSet-mii-vs-prozedur-ops.html) - OPS codes for procedures (German classification system)
* [MII VS Prozedur Prozeduren SNOMEDCT](ValueSet-mii-vs-prozedur-prozeduren-snomedct.html) - SNOMED CT codes for procedures
* [MII VS Prozedur OpsKategorien SNOMEDCT](ValueSet-mii-vs-prozedur-opskategorien-snomedct.html) - SNOMED CT codes for procedure categories
* [MII VS Prozedur Durchfuehrungsabsicht SNOMEDCT](ValueSet-mii-vs-prozedur-durchfuehrungsabsicht-snomedct.html) - SNOMED CT codes for procedure intent

---

### Code Systems

See the [FHIR terminology section](http://hl7.org/fhir/R4/terminologies-systems.html) for a complete discussion on code systems and a list of code system names used in FHIR. Most code systems used in this guide are defined in external standards or the base FHIR specification. However, the following code systems are unique to this guide or provide supplements to external code systems.

#### MII Defined Code Systems

* [MII CS Person Vitalstatus](CodeSystem-mii-cs-person-vitalstatus.html) - Code system for vital status
* [MII CS Diagnose Lebensphase Supplement SNOMED](CodeSystem-mii-cs-diagnose-lebensphase-supplement-snomed.html) - Supplement for SNOMED CT life phase concepts with German descriptions
* [MII CS Fall Supplement ActEncounterCode](CodeSystem-mii-cs-fall-supplement-act-encounter-code.html) - Supplement for HL7 V3 ActEncounterCode
* [MII CS Fall Supplement PatientClass](CodeSystem-mii-cs-fall-supplement-patient-class.html) - Supplement for encounter class codes

#### External Code Systems Used

The following external code systems are referenced in this implementation guide:

| Code System | URI | Note |
|-------------|-----|------|
| ICD-10-GM | `http://fhir.de/CodeSystem/bfarm/icd-10-gm` | German modification of ICD-10 for diagnoses |
| ICD-10 WHO | `http://hl7.org/fhir/sid/icd-10` | WHO International Classification of Diseases |
| OPS | `http://fhir.de/CodeSystem/bfarm/ops` | German classification for operations and procedures |
| SNOMED CT | `http://snomed.info/sct` | International clinical terminology |
| Orphanet | `http://www.orpha.net` | Rare disease codes |
| Alpha-ID | `http://fhir.de/CodeSystem/bfarm/alpha-id` | ICD-10-GM alphabetical index |
| HL7 V2 Table 0203 | `http://terminology.hl7.org/CodeSystem/v2-0203` | Identifier types |
| HL7 V3 ActCode | `http://terminology.hl7.org/CodeSystem/v3-ActCode` | Encounter classes |
| Diagnosis Role | `http://terminology.hl7.org/CodeSystem/diagnosis-role` | Diagnosis use codes |

---

### German Base Profiles Terminology

This implementation guide builds upon the [German Base Profiles (Basisprofil DE R4)](https://ig.fhir.de/basisprofile-de/) and reuses several value sets and code systems defined there, including:

* **Kontaktebene** (`http://fhir.de/ValueSet/Kontaktebene`) - Contact level hierarchy
* **Kontaktart** (`http://fhir.de/ValueSet/kontaktart-de`) - Contact type
* **EncounterClassDE** (`http://fhir.de/ValueSet/EncounterClassDE`) - German encounter class codes
* **Lebensphase** (`http://fhir.de/ValueSet/lebensphase-de`) - Life phase codes

For detailed mappings and additional terminology resources, please refer to the [German Base Profiles Terminology section](https://ig.fhir.de/basisprofile-de/1.5.0/ig-markdown-Terminologie-ConceptMaps.html).

---

### MII Terminology Service

The Medical Informatics Initiative operates a central terminology service (SU-TermServ) that provides:

* FHIR-based terminology services
* ValueSet expansions
* CodeSystem lookups
* ConceptMap translations

**Access:** [https://www.ontoserver.mii-termserv.de/](https://www.ontoserver.mii-termserv.de/)

This service should be used to obtain expansions of ValueSets and access to external code systems like ICD-10-GM and OPS.

---

### Classification Systems Context

#### ICD-10-GM

According to [§ 301](https://www.sozialgesetzbuch-sgb.de/sgbv/301.html) and [§ 295](https://www.sozialgesetzbuch-sgb.de/sgbv/295.html) SGB V, coding with the International Statistical Classification (ICD-10-GM) is legally required for billing in the German healthcare system.

However, since ICD-10-GM is not sufficiently expressive for many research questions, the MII core dataset also enables coding with additional terminologies and classifications (such as Alpha-ID, SNOMED CT, and Orphanet codes).

#### OPS

The OPS (Operationen- und Prozedurenschlüssel) is the proprietary German classification for operations and procedures. While legally required for billing, SNOMED CT coding is also supported for international interoperability and more detailed documentation.

#### SNOMED CT

SNOMED CT is used throughout this implementation guide to enable:
* International interoperability
* More granular clinical documentation
* Semantic interoperability across systems
* Research use cases requiring detailed clinical concepts

---

For a complete listing of all terminology resources, see the [Artifacts Overview](artifacts.html).
