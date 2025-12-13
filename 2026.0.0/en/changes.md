# Changelog - MII Implementation Guide Core Dataset Base v2026.0.0

## Changelog

This page documents the changes and updates across versions of the MII Implementation Guide Kerndatensatz Basis. This consolidated changelog combines release notes from four base modules: Person, Treatment Case, Diagnosis, and Procedure.

-------

### Version 2026.0.0

**Date:** 2026-12-11

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
* **Changed**: ValueSet MII_VS_Person_ICD10WHO was [retired](http://hl7.org/fhir/R4/codesystem-publication-status.html#publication-status-retired) as redundant. The ICD-10-WHO CodeSystem already references an implicit ICD-10-WHO ValueSet via `CodeSystem.valueSet`. See: https://github.com/medizininformatik-initiative/kerndatensatzmodul-person/issues/86
* **Changed**: Dependency updated to [de.basisprofil.r4 1.5.4](https://simplifier.net/packages/de.basisprofil.r4/1.5.4). This release of the FHIR Base Profiles contains a fix for the kvid-2 invariant applied to `Patient.identifier:versichertenId.type` in the Patient profile

#### Treatment Case Module

**Date:** 2025-10-28

* **Changed**: `Encounter.location` now allows specification of former encounter locations. See: https://github.com/medizininformatik-initiative/kerndatensatzmodul-fall/issues/79

#### Diagnosis Module

**Date:** 2025-10-20

* **Added**: `Condition.onsetAge` - The data type `Age` can now be used under `Condition.onset[x]`. See: https://github.com/medizininformatik-initiative/kerndatensatzmodul-diagnose/issues/78
* **Changed**: `Condition.bodySite` - Cardinality of the SNOMED-Coding slice changed from 1..1 to 0..1. See: https://github.com/medizininformatik-initiative/kerndatensatzmodul-diagnose/issues/75
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
* **Changed**: Cardinality of `Encounter.period` in the [Encounter](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md) profile from 1..1 to 0..1 to represent planned encounters where the actual time period is still unknown. See: https://github.com/medizininformatik-initiative/kerndatensatzmodul-fall/issues/56
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
* **Added**: `Condition.verificationStatus` now has MustSupport label. See: https://github.com/medizininformatik-initiative/kerndatensatzmodul-diagnose/issues/64

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

* **Fixed**: Correction of version parameters in conformance resources. In the previously published package, `StructureDefinition.version` did not uniformly match the package version. See: https://github.com/medizininformatik-initiative/kerndatensatzmodul-fall/issues/51

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

