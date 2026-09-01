# Changelog - MII Implementation Guide Core Dataset Base v2027.0.0-dev

* [**Table of Contents**](toc.md)
* [**Versioning**](version-history.md)
* **Changelog**

## Changelog

This page documents the changes and updates across versions of the MII Implementation Guide Kerndatensatz Basis. This consolidated changelog combines release notes from four base modules: Person, Treatment Case, Diagnosis, and Procedure.

-------

### Version 2027.0.0

**Date:** 2026-XX-XX

#### Documentation

* **Changed:** Dependency updates to `de.basisprofil.r4` 1.6.0, `de.medizininformatikinitiative.kerndatensatz.meta` 2027.0.0-ballot.rc3, `hl7.terminology.r4` 7.1.0, and `hl7.fhir.uv.extensions.r4` 5.2.0.

#### Person Module

* **Added:** The Patient profile now includes the FHIR core extensions `patient-birthPlace`, `patient-citizenship`, and `patient-nationality` to represent place of birth, legal citizenship, and nationality in the Person module. See: [#86](https://github.com/medizininformatik-initiative/kerndatensatz-basis/issues/86)

#### Diagnosis Module

* **Added:** The `Condition.bodySite` element now includes the FHIR core extension `http://hl7.org/fhir/StructureDefinition/bodySite` to support a detailed anatomic reference such as a `BodyStructure`. See: [#85](https://github.com/medizininformatik-initiative/kerndatensatz-basis/issues/85)

#### Procedure Module

* **Added:** The `Procedure.bodySite` element now includes the FHIR core extension `http://hl7.org/fhir/StructureDefinition/bodySite` to support a detailed anatomic reference such as a `BodyStructure`. See: [#85](https://github.com/medizininformatik-initiative/kerndatensatz-basis/issues/85)

#### Treatment Case Module

* **Changed:** Updated the Treatment Case UML model to represent the organizational assignment between care units and departments as an optional many-to-many association.
* **Changed:** Updated the relationships between diagnoses and contacts in the Treatment Case and Diagnosis UML diagrams to show the department contact as the currently recommended contact level while retaining the possibility of other contact levels.

#### Procedure Module

* **Changed:** Updated the Procedure UML diagram to show the department contact as the currently recommended contact context while retaining the possibility of other contact levels.

-------

### Version 2026.0.1

**Date:** 2026-07-20

#### Documentation

* **Added:** A list of conformance statements is available via the [List of Conformance Statements](conformance.md#list-of-conformance-statements)
* **Added:** CapabilityStatements now document example FHIR search queries for supported SearchParameters
* **Added:** Logical model pages now include mapping tables to the corresponding FHIR target structures
* **Added:** CRMI dependency to STU 2 release 2.0.0
* **Added:** Metadata documentation describing the CRMI-based artifact metadata, versioning and package provenance, manifest parameters, and relationship to FAIR Data Maturity Indicators
* **Added:** ImplementationGuide documentation now describes IG parameter settings and expansion parameters
* **Changed:** Must Support flags are applied consistently to relevant sub-elements across profiles, and the [Must Support](must-support.md) documentation now clarifies how complex elements and their marked sub-elements define concrete Server and Client support expectations.
* **Changed:** Improved German wording for conformance verbs and aligned English and German pages for consistent use of RFC 2119 conformance keywords.
* **Changed:** Versioning documentation now clarifies the Calendar Versioning scheme as a SemVer-compatible `YYYY.MINOR.PATCH[-label]` format and documents that published artifacts use the same version as the IG package

#### Terminology Updates

* **Added:** ICD-10-GM 2026, OPS 2026, and Alpha-ID 2026 versions to respective ValueSet definitions [#67](https://github.com/medizininformatik-initiative/kerndatensatz-basis/issues/67), [#66](https://github.com/medizininformatik-initiative/kerndatensatz-basis/issues/66)

#### Person Module

* **Added:** Profile [Patient Pseudonymized](StructureDefinition-mii-pr-person-patient-pseudonymisiert.md): Added optional `type.coding` sub-slice `mr` (`http://terminology.hl7.org/CodeSystem/v2-0203|MR`) to `PseudonymisierterIdentifier`. When the pseudonym replaces a Medical Record Number, this code SHOULD be set to allow site-independent discovery of the pseudonymized identifier. See: [#63](https://github.com/medizininformatik-initiative/kerndatensatz-basis/issues/63)

#### Treatment Case Module

* **Added:** Clarified `Encounter.location` slicing and semantics in the documentation. See: [#62](https://github.com/medizininformatik-initiative/kerndatensatzmodul-fall/issues/62)
* **Added:** Documented that servers SHOULD support the `account:identifier` search modifier to enable searching all Encounters belonging to a billing case by Fallnummer. See: [#68](https://github.com/medizininformatik-initiative/kerndatensatz-basis/issues/68)
* **Removed:** Self-published R5 backport extensions for planned encounter start and end dates (previously `mii-ex-fall-planned-start-date` and `mii-ex-fall-planned-end-date`). These extensions are now provided by the official `hl7.fhir.uv.xver-r5.r4` dependency

-------

### Version 2026.0.0

**Date:** 2025-12-13

#### Module Consolidation

* **Consolidated Implementation Guide:** The four base modules (Person, Treatment Case, Diagnosis, and Procedure) have been consolidated into a single Implementation Guide
* **Package ID:** `de.medizininformatikinitiative.kerndatensatz.base`

#### Terminology Updates

* **Updated:** Resources use SNOMED CT version `http://snomed.info/sct/900000000000207008/version/20250701` (July 2025) across modules to ensure stable [ValueSet expansion](http://hl7.org/fhir/R4/valueset.html#expansion)

#### Example Consolidation

* **Unified Test Data Bundle:** Example resources have been consolidated into a comprehensive test data bundle
* **Cross-Module Examples:** Examples now demonstrate relationships and references across all four modules

#### Diagnosis Module

* **Changed:** Updated guidance on Condition.encounter usage to align with gematik ISiK recommendations (Information Systems in Hospitals)
* **Changed:** Condition.encounter SHOULD now reference an Encounter at the "Abteilungskontakt" (department contact) level
* **Note:** This represents a change from previous versions where Encounter.diagnosis was the primary linkage method

#### Treatment Case Module

* **Changed:** Updated guidance on billing case context (Abrechnungsfallkontext) and Account references based on gematik ISiK specification
* **Changed:** Enhanced documentation differentiating between Aufnahmenummer (admission number) and Fallnummer (case number)
* **Changed:** Clarified that Fallnummer identifies the billing case (Account) and should be provided as logical reference in `Encounter.account.identifier`
* **Changed:** Each Encounter SHOULD have its own unique Aufnahmenummer in `Encounter.identifier:Aufnahmenummer`

#### Procedure Module

* **Changed:** Added guidance recommending use of `Procedure.encounter` to establish encounter context, aligned with Condition module recommendations

#### Person Module

* **Added:** ValueSet MII VS Person ICD-10-WHO published under MII Canonical URL for causes of death coding

-------

### Version 2025.0.1

#### Person Module

**Date:** 2025-10-08

* **Added**: Profile [Patient Pseudonymized](StructureDefinition-mii-pr-person-patient-pseudonymisiert.md) now contains an optional identifier for masked health insurance ID under `Patient.identifier`
* **Changed**: ValueSet MII_VS_Person_ICD10WHO was [retired](http://hl7.org/fhir/R4/codesystem-publication-status.html#publication-status-retired) as redundant. The ICD-10-WHO CodeSystem already references an implicit ICD-10-WHO ValueSet via `CodeSystem.valueSet`. See: [#86](https://github.com/medizininformatik-initiative/kerndatensatzmodul-person/issues/86)
* **Changed**: Dependency updated to [de.basisprofil.r4 1.5.4](https://simplifier.net/packages/de.basisprofil.r4/1.5.4). This release of the FHIR Base Profiles contains a fix for the kvid-2 invariant applied to `Patient.identifier:versichertenId.type` in the Patient profile

#### Treatment Case Module

**Date:** 2025-10-28

* **Changed**: `Encounter.location` now allows specification of former encounter locations. See: [#79](https://github.com/medizininformatik-initiative/kerndatensatzmodul-fall/issues/79)

#### Diagnosis Module

**Date:** 2025-10-20

* **Added**: `Condition.onsetAge` - The data type `Age` can now be used under `Condition.onset[x]`. See: [#78](https://github.com/medizininformatik-initiative/kerndatensatzmodul-diagnose/issues/78)
* **Changed**: `Condition.bodySite` - Cardinality of the SNOMED-Coding slice changed from 1..1 to 0..1. See: [#75](https://github.com/medizininformatik-initiative/kerndatensatzmodul-diagnose/issues/75)
* **Added**: New ValueSets and bindings for ICD-10-GM (Canonical URL: `https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-icd10gm`) and AlphaID (Canonical URL: `https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-alphaid`), which can be expanded using the MII terminology server (https://www.ontoserver.mii-termserv.de/) enabling enhanced validation
* **Updated**: CapabilityStatement now contains requirement documentation for search parameters `_count` and `_summary`

#### Procedure Module

**Date:** 2025-10-22

* **Added**: `Procedure.bodySite` - Now contains optional SNOMED-Coding slice, adopting the modeling from the Diagnosis module's `Condition.bodySite`
* **Added**: ValueSet and binding for OPS (Canonical URL: `https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/mii-vs-prozedur-ops`). This can be expanded using the MII terminology server (https://www.ontoserver.mii-termserv.de/) enabling enhanced validation
* **Added**: CapabilityStatement now contains requirement documentation for search parameters `_count` and `_summary`

-------

### Version 2025.0.0

#### Person Module

**Date:** 2024-12-06

* **Updated**: Dependency on de.basisprofil.r4 updated to version 1.5.0 
* This changes the [Patient](StructureDefinition-mii-pr-person-patient.md) profile in the `Patient.identifier` element: Statutory and private health insurance numbers now use a unified identifier profile [IdentifierKvid10](https://simplifier.net/packages/de.basisprofil.r4/1.5.0/files/2461154). `Patient.identifier.type` MUST be changed to `KVZ10` for health insurance numbers. The previously used codes `GKV` and `PKV` for `Patient.identifier.type` have the status `retired` (see [CodeSystem IdentifierTypeDeBasis](https://simplifier.net/packages/de.basisprofil.r4/1.5.0/files/2461165)). Patient resources from version 2024 remain valid but SHOULD switch to the new identifier
 
* **Retired**: The ResearchSubject profile was [retired](http://hl7.org/fhir/R4/codesystem-publication-status.html#publication-status-retired). Starting with version 2025.0.0, this profile is published and developed in the Study module. Implementations SHOULD switch to the modeling from the Study module
* **Removed**: CodeSystem ICD-10-WHO v2019 and v2016 were removed. These can now be obtained via the MII Terminology Service (SU-TermServ): https://www.ontoserver.mii-termserv.de/
* **Removed**: Search parameters from this module were removed. SearchParameter resources are now centrally managed in the Meta module
* **Enhanced**: Profiles contain additional descriptions and translations for implementers and the Research Data Portal for Health (FDPG)

#### Treatment Case Module

**Date:** 2024-12-10

* **Updated**: Dependency on de.basisprofil.r4 updated to version 1.5.0. This change has no impact on implementations of this module
* **Enhanced**: Profiles contain additional descriptions and translations for implementers and the Research Data Portal for Health (FDPG)
* **Removed**: Search parameters from this module removed. SearchParameter resources are now centrally managed in the Meta module
* **Changed**: Cardinality of `Encounter.period` in the [Encounter](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md) profile from 1..1 to 0..1 to represent planned encounters where the actual time period is still unknown. See: [#56](https://github.com/medizininformatik-initiative/kerndatensatzmodul-fall/issues/56)
* **Added**: Constraints now check the presence of start and end times (`Encounter.period`) depending on the status of an encounter
* **Added**: Extension of the Encounter profile with two extensions for planned start and end dates in `Encounter.extension`
* **Fixed**: Correction of ValueSet binding on element `Encounter.serviceType.coding:ErweiterterFachabteilungsschluessel` to [http://fhir.de/ValueSet/dkgev/Fachabteilungsschluessel-erweitert](https://simplifier.net/packages/de.basisprofil.r4/1.4.0/files/656779)
* **Enhanced**: Must-Support FHIR data elements in the Encounter profile now contain extended descriptions under 'Short description' and 'Definition'
* **Added**: `Encounter.diagnosis.use` now has ValueSet binding to `https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/mii-vs-fall-diagnosis-use`
* **Changed**: In `Encounter.location` slices for room, bed, station - cardinality of elements `Encounter.location.location.identifier` and `Encounter.location.location.display` changed from 1..1 to 0..1
* **Removed**: MustSupport labels removed from `Encounter.location` and `Encounter.serviceProvider`

#### Diagnosis Module

**Date:** 2024-12-09

* **Updated**: Dependency on de.basisprofil.r4 updated to [version 1.5.0](https://simplifier.net/packages/de.basisprofil.r4/1.5.0). This change has no impact on implementations of this module
* **Removed**: `Condition.code` and `Condition.bodySite` ICD-O-3 slices removed. These are now defined by the Oncology module
* **Enhanced**: Profiles contain additional descriptions and translations for implementers and the Research Data Portal for Health (FDPG)
* **Removed**: Search parameters from this module removed. SearchParameter resources are now centrally managed in the Meta module
* **Updated**: Resources use SNOMED CT version `http://snomed.info/sct/900000000000207008/version/20240701` across modules to ensure stable [ValueSet expansion](http://hl7.org/fhir/R4/valueset.html#expansion)
* **Added**: `Condition.verificationStatus` now has MustSupport label. See: [#64](https://github.com/medizininformatik-initiative/kerndatensatzmodul-diagnose/issues/64)

#### Procedure Module

**Date:** 2024-12-09

* **Updated**: Dependency on de.basisprofil.r4 updated to [version 1.5.0](https://simplifier.net/packages/de.basisprofil.r4/1.5.0). This change has no impact on implementations of this module
* **Enhanced**: Profiles contain additional descriptions and translations for implementers and the Research Data Portal for Health (FDPG)
* **Removed**: Search parameters from this module removed. SearchParameter resources are now centrally managed in the Meta module
* **Removed**: CodeSystem resources for Operations and Procedure Code (OPS) were removed. These can now be obtained via the MII Terminology Service (SU-TermServ): https://www.ontoserver.mii-termserv.de/
* **Updated**: Resources use SNOMED CT version `http://snomed.info/sct/900000000000207008/version/20240701` across modules to ensure stable [ValueSet expansion](http://hl7.org/fhir/R4/valueset.html#expansion)

-------

### Version 2024.0.1

#### Treatment Case Module

**Date:** 2024-04-17

* **Fixed**: Correction of version parameters in conformance resources. In the previously published package, `StructureDefinition.version` did not uniformly match the package version. See: [#51](https://github.com/medizininformatik-initiative/kerndatensatzmodul-fall/issues/51)

-------

### Version 2024.0.0

All modules adopted [Calendar Versioning (CalVer)](https://calver.org/) following the YYYY.MINOR.PATCH scheme, establishing an annual release cycle.

#### Person Module

**Date:** 2024-04-16

* **Changed**: Versioning scheme changed to [Calendar Versioning (CalVer)](https://calver.org/) with schema YYYY.MINOR.PATCH
* **Standardized**: Naming of conformance resources and example instances follows uniform [MII naming conventions](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Namenskonventionen-f%C3%BCr-FHIR%E2%80%90Ressourcen-in-der-MII)
* **Updated**: Resources use SNOMED CT version `http://snomed.info/sct/900000000000207008/version/20230731` across modules to ensure stable ValueSet expansion
* **Changed**: In the [Patient](StructureDefinition-mii-pr-person-patient.md) profile, all min 1.. cardinalities were removed
* **Added**: Profile [Patient Pseudonymized](StructureDefinition-mii-pr-person-patient-pseudonymisiert.md) is new since version 1.0. Compared to previously published versions, all 0..0 cardinalities were removed. Also, no pseudonymization rules are prescribed by the profile anymore. The exact pseudonymization rules within the Medical Informatics Initiative are still being developed and may be applied in a later version of the profile. Consequently, the following invariants were removed: 
* 'GeburtsdatumRundenAufQuartal' on **Patient.birthDate**
* 'TodesdatumKeineZeitangabe' on **Patient.deceasedDateTime**
* 'PostleitzahlEinschraenkung' on **Patient.address.postalCode**
 
* **Added**: New profile [Cause of Death](StructureDefinition-mii-pr-person-todesursache.md) for representing cause of death using ICD-10-WHO
* **Changed**: Data types in the logical model were adjusted to match the data types of elements in the FHIR profile to which they are mapped

#### Treatment Case Module

**Date:** 2024-03-28

* **Changed**: Versioning scheme changed to [Calendar Versioning (CalVer)](https://calver.org/)
* **Standardized**: Naming of conformance resources and example instances follows uniform MII naming conventions
* **Updated**: Requirement documentation now uses keywords according to [RFC-2119](https://datatracker.ietf.org/doc/html/rfc2119)
* **Updated**: Dependency changed from [version 0.9.13](https://simplifier.net/packages/de.basisprofil.r4/0.9.13) to [version 1.4.0](https://simplifier.net/packages/de.basisprofil.r4/1.4.0) of the FHIR Base Profiles
* **Breaking Changes** when switching from version 1.0 to version 2.0 (2024.0.0): 
* Admission reason was specified under `Encounter.reasonCode` in version 1.0. Now recorded via [Extension from German FHIR Base Profiles](https://simplifier.net/packages/de.basisprofil.r4/1.4.0/files/656695) in element `Encounter.extension:Aufnahmegrund`
* ValueSet binding on element `Encounter.identifier.type` for admission number extended with code [v2-0203#VN](https://simplifier.net/resolve?scope=hl7.fhir.r4.core@4.0.1&filepath=package/CodeSystem-v2-0203.json)
* Under `Encounter.location` there is now a specification of how information about room, bed and station locations can OPTIONALLY be represented
* In version 1.0, `Encounter.diagnosis.use` was OPTIONAL when specifying a diagnosis. New in this version is the division of `Encounter.diagnosis.use.coding` into diagnosis type and diagnosis subtype, of which at least one MUST be present
* In version 1.0, `Encounter.serviceType` only contained a specification for the department code. This has been extended in this version to include the extended department code
 

#### Diagnosis Module

**Date:** 2024-04-16

* **Changed**: Versioning scheme changed to [Calendar Versioning (CalVer)](https://calver.org/)
* **Standardized**: Naming of conformance resources and example instances follows uniform MII naming conventions
* **Updated**: Resources use SNOMED CT version `http://snomed.info/sct/900000000000207008/version/20230731` for stable ValueSet expansion
* **Updated**: Requirement documentation now uses keywords according to [RFC-2119](https://datatracker.ietf.org/doc/html/rfc2119)
* **Updated**: Dependency changed from [version 0.9.13](https://simplifier.net/packages/de.basisprofil.r4/0.9.13) to [version 1.4.0](https://simplifier.net/packages/de.basisprofil.r4/1.4.0) of the FHIR Base Profiles
* **Breaking Changes** when switching from version 1.0 to version 2.0 (2024.0.0): 
* For double/multiple coded ICD codes, representation of code components MUST be done via separate Condition resources
* Linking of Condition resources MUST be done via the [Extension: Condition Related](http://hl7.org/fhir/StructureDefinition/condition-related)
* Any present multiple coding indicator (`*`, `†`, `!`) MUST be separated from the ICD code and recorded in the [Extension: Multiple Coding Indicator for ICD-10-GM](https://simplifier.net/packages/de.basisprofil.r4/1.4.0/files/656614)
* The canonical URL for the ICD-10-GM CodeSystem was changed from `http://fhir.de/CodeSystem/dimdi/icd-10-gm` to `http://fhir.de/CodeSystem/bfarm/icd-10-gm`. The current canonical URL MUST be used in the `Condition.code.coding.system` element for ICD-10-GM codes
 
* **Added**: In the [Diagnosis](StructureDefinition-mii-pr-diagnose-condition.md) profile, elements `Condition.code.coding` and `Condition.bodySite.coding` were each extended with an OPTIONAL slice for ICD-O-3
* **Added**: In the profile under `Condition.extension('http://hl7.org/fhir/StructureDefinition/condition-assertedDate')` there is now an extension for specifying the assertion date of a diagnosis
* **Added**: In the profile under `Condition.onsetPeriod.(start|end).extension` there is now OPTIONALLY a specification for indicating the life phase as a code via extension, from which a patient has or no longer has a disease
* **Added**: Module was extended with SearchParameter resources enabling search for ICD-10-GM codes in combination with multiple coding indicators, laterality and diagnostic certainty

#### Procedure Module

**Date:** 2024-04-16

* **Changed**: Versioning scheme changed to [Calendar Versioning (CalVer)](https://calver.org/)
* **Standardized**: Naming of conformance resources and example instances follows uniform MII naming conventions
* **Updated**: Resources use SNOMED CT version `http://snomed.info/sct/900000000000207008/version/20230731` for stable ValueSet expansion
* **Updated**: Requirement documentation now uses keywords according to [RFC-2119](https://datatracker.ietf.org/doc/html/rfc2119)
* **Updated**: Dependency changed from [version 0.9.13](https://simplifier.net/packages/de.basisprofil.r4/0.9.13) to [version 1.4.0](https://simplifier.net/packages/de.basisprofil.r4/1.4.0) of the FHIR Base Profiles
* **Breaking Changes** when switching from version 1.0 to version 2.0 (2024.0.0): 
* The canonical URL for the OPS CodeSystem was changed from `http://fhir.de/CodeSystem/dimdi/ops` to `http://fhir.de/CodeSystem/bfarm/ops`. The current canonical URL MUST be used in the `Procedure.code.coding.system` element for OPS codes
 
* **Breaking Change**: In ValueSet MII_VS_Prozedur_OpsKategorien_SNOMEDCT, an inactive SNOMED code `103693007 |Diagnostic procedure (procedure)|` was replaced by `165197003 |Diagnostic assessment (procedure)|`. The ValueSet is used on `Procedure.category.coding`. If the inactive code was previously implemented in version 1.0 of this module, this code MUST be changed when switching to version 2.0 (2024.0.0) of the Procedure module

-------

### Versioning Scheme

Starting with version 2024.0.0, all modules use [Calendar Versioning (CalVer)](https://calver.org/) following the YYYY.MINOR.PATCH scheme:

* **YYYY** (Year version): Indicates the year in which the core dataset module is applied
* **MINOR**: Released when introducing new features, extensions or substantial changes
* **PATCH**: Includes bugfixes or textual corrections

This establishes an annual release cycle aligned across all base modules.

