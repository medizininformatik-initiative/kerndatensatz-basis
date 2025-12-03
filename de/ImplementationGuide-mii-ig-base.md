# MII ImplementationGuide Ressource - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## MII ImplementationGuide Ressource

 
Diese Seite enthält Übersetzungen aus der Originalsprache, in der der Leitfaden verfasst wurde. Informationen zu diesen Übersetzungen und Anweisungen zum Abgeben von Feedback zu den Übersetzungen finden Sie[hier](translationinfo.md). 

Diese ImplementationGuide-Ressource definiert die technischen Details dieser Publikation, einschließlich Abhängigkeiten und Veröffentlichungsparametern.

* [XML](ImplementationGuide-.xml)
* [JSON](ImplementationGuide-.json)
* [TTL](ImplementationGuide-.ttl)

### Versionsübergreifende Analyse

Der IG kann nur mit FHIR R4 Systemen verwendet werden.

### IG-Abhängigkeiten

Dieser IG enthält die folgenden Abhängigkeiten von anderen IGs.





### Globale Profile

*There are no Global profiles defined*

### Urheberrechte

This publication includes IP covered under the following statements.

* BfArM 1994 - 2024 - Die Erstellung erfolgt unter Verwendung der maschinenlesbaren Fassung des Bundesinstituts für Arzneimittel und Medizinprodukte (BfArM)

* [Alpha-ID](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/CodeSystem/bfarm/alpha-id): [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md), [Condition/mii-exa-diagnose-condition-multiple-codings](Condition-mii-exa-diagnose-condition-multiple-codings.md), [Condition/mii-exa-diagnose-mehrfachcodierung-primaercode](Condition-mii-exa-diagnose-mehrfachcodierung-primaercode.md), [MII_PR_Diagnose_Condition](StructureDefinition-mii-pr-diagnose-condition.md) and [MII_VS_Diagnose_AlphaID](ValueSet-mii-vs-diagnose-alphaid.md)
* [OPS](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/CodeSystem/bfarm/ops): [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md), [MII_PR_Prozedur_Procedure](StructureDefinition-mii-pr-prozedur-procedure.md)...Show 4 more,[MII_VS_Prozedur_OPS](ValueSet-mii-vs-prozedur-ops.md),[Procedure/mii-exa-prozedur-imaging](Procedure-mii-exa-prozedur-imaging.md),[Procedure/mii-exa-prozedur-procedure](Procedure-mii-exa-prozedur-procedure.md)and[Procedure/mii-exa-prozedur-procedure-2](Procedure-mii-exa-prozedur-procedure-2.md)


* HL7 Deutschland e.V.

* [KontaktDiagnoseProzedur](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/CodeSystem/KontaktDiagnoseProzedur): [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md), [Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-2](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-2.md), [Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-7](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-7.md) and [MII_PR_Fall_KontaktGesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md)
* [CodeSystemAufnahmeanlass](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/CodeSystem/dgkev/Aufnahmeanlass): [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md), [Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-1](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-1.md) and [MII_PR_Fall_KontaktGesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md)
* [AufnahmegrundVierteStelle](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/CodeSystem/dkgev/AufnahmegrundVierteStelle): [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md) and [Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-9](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-9.md)
* [EntlassungsgrundDritteStelle](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/CodeSystem/dkgev/EntlassungsgrundDritteStelle): [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md) and [Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-1](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-1.md)
* [EntlassungsgrundErsteUndZweiteStelle](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/CodeSystem/dkgev/EntlassungsgrundErsteUndZweiteStelle): [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md) and [Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-1](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-1.md)
* [Fachabteilungsschluessel](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel): [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md), [Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-2](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-2.md), [Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-7](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-7.md) and [MII_PR_Fall_KontaktGesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md)
* [Fachabteilungsschluessel Erweitert](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel-erweitert): [Encounter/mii-exa-fall-kontakt-in-progress-status](Encounter-mii-exa-fall-kontakt-in-progress-status.md) and [MII_PR_Fall_KontaktGesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md)
* [Identifier Type De Basis](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/CodeSystem/identifier-type-de-basis): [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md), [MII_PR_Person_Patient](StructureDefinition-mii-pr-person-patient.md), [MII_PR_Person_PatientPseudonymisiert](StructureDefinition-mii-pr-person-patient-pseudonymisiert.md), [Patient/mii-exa-person-patient-1](Patient-mii-exa-person-patient-1.md) and [Patient/mii-exa-person-patient-pseudonymisiert](Patient-mii-exa-person-patient-pseudonymisiert.md)


* This material contains content from [LOINC](http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the [license](http://loinc.org/license). LOINC® is a registered United States trademark of Regenstrief Institute, Inc.

* LOINC: [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md), [Condition/mii-exa-person-condition-todesursache](Condition-mii-exa-person-condition-todesursache.md)...Show 4 more,[MII_PR_Person_Todesursache](StructureDefinition-mii-pr-person-todesursache.md),[MII_PR_Person_Vitalstatus](StructureDefinition-mii-pr-person-vitalstatus.md),[Observation/mii-exa-person-observation-vitalstatus](Observation-mii-exa-person-observation-vitalstatus.md)and[Observation/mii-exa-person-observation-vitalstatus-discharge](Observation-mii-exa-person-observation-vitalstatus-discharge.md)


* This material contains content that is copyright of SNOMED International. Implementers of these specifications must have the appropriate SNOMED CT Affiliate license - for more information contact [https://www.snomed.org/get-snomed](https://www.snomed.org/get-snomed) or [info@snomed.org](mailto:info@snomed.org).

* [SNOMED Clinical Terms&reg; (SNOMED CT&reg;)](http://hl7.org/fhir/R4/codesystem-snomedct.html): [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md), [Condition/mii-exa-diagnose-appendicitis](Condition-mii-exa-diagnose-appendicitis.md)...Show 15 more,[Condition/mii-exa-diagnose-condition-elbow-contusion](Condition-mii-exa-diagnose-condition-elbow-contusion.md),[Condition/mii-exa-person-condition-todesursache](Condition-mii-exa-person-condition-todesursache.md),[MII_CS_Diagnose_Lebensphase_Supplement_SNOMED](CodeSystem-mii-cs-diagnose-lebensphase-supplement-snomed.md),[MII_EX_Prozedur_Durchfuehrungsabsicht](StructureDefinition-mii-ex-prozedur-durchfuehrungsabsicht.md),[MII_PR_Diagnose_Condition](StructureDefinition-mii-pr-diagnose-condition.md),[MII_PR_Person_Todesursache](StructureDefinition-mii-pr-person-todesursache.md),[MII_PR_Prozedur_Procedure](StructureDefinition-mii-pr-prozedur-procedure.md),[MII_VS_Diagnose_BodyStructure_SNOMED](ValueSet-mii-vs-diagnose-bodystructure-snomed.md),[MII_VS_Diagnose_DiagnoseCodes_SNOMED](ValueSet-mii-vs-diagnose-diagnosecodes-snomed.md),[MII_VS_Prozedur_Durchfuehrungsabsicht_SNOMEDCT](ValueSet-mii-vs-prozedur-durchfuehrungsabsicht-snomedct.md),[MII_VS_Prozedur_OpsKategorien_SNOMEDCT](ValueSet-mii-vs-prozedur-opskategorien-snomedct.md),[MII_VS_Prozedur_Prozeduren_SNOMEDCT](ValueSet-mii-vs-prozedur-prozeduren-snomedct.md),[Procedure/mii-exa-prozedur-imaging](Procedure-mii-exa-prozedur-imaging.md),[Procedure/mii-exa-prozedur-procedure](Procedure-mii-exa-prozedur-procedure.md)and[Procedure/mii-exa-prozedur-procedure-2](Procedure-mii-exa-prozedur-procedure-2.md)


* This material derives from the HL7 Terminology (THO). THO is copyright ©1989+ Health Level Seven International and is made available under the CC0 designation. For more licensing information see: [https://terminology.hl7.org/license.html](https://terminology.hl7.org/license.html)

* [Condition Clinical Status Codes](http://terminology.hl7.org/7.0.0/CodeSystem-condition-clinical.html): [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md), [Condition/mii-exa-diagnose-appendicitis](Condition-mii-exa-diagnose-appendicitis.md)...Show 4 more,[Condition/mii-exa-diagnose-condition-elbow-contusion](Condition-mii-exa-diagnose-condition-elbow-contusion.md),[Condition/mii-exa-diagnose-condition-multiple-codings](Condition-mii-exa-diagnose-condition-multiple-codings.md),[Condition/mii-exa-diagnose-mehrfachcodierung-primaercode](Condition-mii-exa-diagnose-mehrfachcodierung-primaercode.md)and[Condition/mii-exa-diagnose-mehrfachcodierung-sekundaercode](Condition-mii-exa-diagnose-mehrfachcodierung-sekundaercode.md)
* [ConditionVerificationStatus](http://terminology.hl7.org/7.0.0/CodeSystem-condition-ver-status.html): [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md), [Condition/mii-exa-diagnose-appendicitis](Condition-mii-exa-diagnose-appendicitis.md)...Show 4 more,[Condition/mii-exa-diagnose-condition-elbow-contusion](Condition-mii-exa-diagnose-condition-elbow-contusion.md),[Condition/mii-exa-diagnose-condition-multiple-codings](Condition-mii-exa-diagnose-condition-multiple-codings.md),[Condition/mii-exa-diagnose-mehrfachcodierung-primaercode](Condition-mii-exa-diagnose-mehrfachcodierung-primaercode.md)and[Condition/mii-exa-diagnose-mehrfachcodierung-sekundaercode](Condition-mii-exa-diagnose-mehrfachcodierung-sekundaercode.md)
* [Diagnosis Role](http://terminology.hl7.org/7.0.0/CodeSystem-diagnosis-role.html): [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md), [Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-2](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-2.md), [Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-7](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-7.md) and [MII_PR_Fall_KontaktGesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md)
* [Location type](http://terminology.hl7.org/7.0.0/CodeSystem-location-physical-type.html): [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md), [Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-10](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-10.md)...Show 6 more,[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-11](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-11.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-4](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-4.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-5](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-5.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-6](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-6.md),[MII_PR_Fall_KontaktGesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md)and[MII_VS_Fall_LocationPhysicalType](ValueSet-mii-vs-fall-location-physical-type.md)
* [Observation Category Codes](http://terminology.hl7.org/7.0.0/CodeSystem-observation-category.html): [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md), [MII_PR_Person_Vitalstatus](StructureDefinition-mii-pr-person-vitalstatus.md), [Observation/mii-exa-person-observation-vitalstatus](Observation-mii-exa-person-observation-vitalstatus.md) and [Observation/mii-exa-person-observation-vitalstatus-discharge](Observation-mii-exa-person-observation-vitalstatus-discharge.md)
* [patientClass](http://terminology.hl7.org/7.0.0/CodeSystem-v2-0004.html): [MII_CS_Fall_SupplementPatientClass](CodeSystem-mii-cs-fall-supplement-patient-class.md)
* [identifierType](http://terminology.hl7.org/7.0.0/CodeSystem-v2-0203.html): [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md), [Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-1](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-1.md)...Show 16 more,[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-10](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-10.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-11](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-11.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-2](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-2.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-3](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-3.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-4](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-4.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-5](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-5.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-6](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-6.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-7](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-7.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-8](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-8.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-9](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-9.md),[MII_PR_Fall_KontaktGesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md),[MII_PR_Person_Patient](StructureDefinition-mii-pr-person-patient.md),[MII_PR_Person_PatientPseudonymisiert](StructureDefinition-mii-pr-person-patient-pseudonymisiert.md),[MII_PR_Person_Proband](StructureDefinition-mii-pr-person-proband.md),[MII_VS_Fall_IdentifierTypeCodes](ValueSet-mii-vs-fall-identifier-type-codes.md)and[Patient/mii-exa-person-patient-1](Patient-mii-exa-person-patient-1.md)
* [ActCode](http://terminology.hl7.org/7.0.0/CodeSystem-v3-ActCode.html): [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md), [Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-1](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-1.md)...Show 15 more,[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-10](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-10.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-11](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-11.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-2](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-2.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-3](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-3.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-4](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-4.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-5](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-5.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-6](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-6.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-7](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-7.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-8](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-8.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-9](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-9.md),[Encounter/mii-exa-fall-kontakt-in-progress-status](Encounter-mii-exa-fall-kontakt-in-progress-status.md),[Encounter/mii-exa-fall-kontakt-onleave-status](Encounter-mii-exa-fall-kontakt-onleave-status.md),[Encounter/mii-exa-fall-kontakt-unknown-status](Encounter-mii-exa-fall-kontakt-unknown-status.md),[MII_CS_Fall_SupplementActEncounterCode](CodeSystem-mii-cs-fall-supplement-act-encounter-code.md)and[MII_PR_Fall_KontaktGesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md)
* [ActPriority](http://terminology.hl7.org/7.0.0/CodeSystem-v3-ActPriority.html): [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md) and [Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-9](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-9.md)
* [ActReason](http://terminology.hl7.org/7.0.0/CodeSystem-v3-ActReason.html): [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md), [Condition/mii-exa-diagnose-appendicitis](Condition-mii-exa-diagnose-appendicitis.md)...Show 26 more,[Condition/mii-exa-diagnose-condition-elbow-contusion](Condition-mii-exa-diagnose-condition-elbow-contusion.md),[Condition/mii-exa-diagnose-condition-multiple-codings](Condition-mii-exa-diagnose-condition-multiple-codings.md),[Condition/mii-exa-diagnose-mehrfachcodierung-primaercode](Condition-mii-exa-diagnose-mehrfachcodierung-primaercode.md),[Condition/mii-exa-diagnose-mehrfachcodierung-sekundaercode](Condition-mii-exa-diagnose-mehrfachcodierung-sekundaercode.md),[Condition/mii-exa-person-condition-todesursache](Condition-mii-exa-person-condition-todesursache.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-1](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-1.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-10](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-10.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-11](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-11.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-2](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-2.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-3](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-3.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-4](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-4.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-5](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-5.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-6](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-6.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-7](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-7.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-8](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-8.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-9](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-9.md),[Encounter/mii-exa-fall-kontakt-in-progress-status](Encounter-mii-exa-fall-kontakt-in-progress-status.md),[Encounter/mii-exa-fall-kontakt-onleave-status](Encounter-mii-exa-fall-kontakt-onleave-status.md),[Encounter/mii-exa-fall-kontakt-unknown-status](Encounter-mii-exa-fall-kontakt-unknown-status.md),[Observation/mii-exa-person-observation-vitalstatus](Observation-mii-exa-person-observation-vitalstatus.md),[Observation/mii-exa-person-observation-vitalstatus-discharge](Observation-mii-exa-person-observation-vitalstatus-discharge.md),[Patient/mii-exa-person-patient-1](Patient-mii-exa-person-patient-1.md),[Patient/mii-exa-person-patient-pseudonymisiert](Patient-mii-exa-person-patient-pseudonymisiert.md),[Procedure/mii-exa-prozedur-imaging](Procedure-mii-exa-prozedur-imaging.md),[Procedure/mii-exa-prozedur-procedure](Procedure-mii-exa-prozedur-procedure.md)and[Procedure/mii-exa-prozedur-procedure-2](Procedure-mii-exa-prozedur-procedure-2.md)
* [ObservationValue](http://terminology.hl7.org/7.0.0/CodeSystem-v3-ObservationValue.html): [MII_PR_Person_PatientPseudonymisiert](StructureDefinition-mii-pr-person-patient-pseudonymisiert.md) and [Patient/mii-exa-person-patient-pseudonymisiert](Patient-mii-exa-person-patient-pseudonymisiert.md)


* WHO, BfArM 1994 - 2024 - Die Erstellung erfolgt unter Verwendung der maschinenlesbaren Fassung des Bundesinstituts für Arzneimittel und Medizinprodukte (BfArM)

* [ICD-10-GM](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/CodeSystem/bfarm/icd-10-gm): [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md), [Condition/mii-exa-diagnose-appendicitis](Condition-mii-exa-diagnose-appendicitis.md)...Show 6 more,[Condition/mii-exa-diagnose-condition-elbow-contusion](Condition-mii-exa-diagnose-condition-elbow-contusion.md),[Condition/mii-exa-diagnose-condition-multiple-codings](Condition-mii-exa-diagnose-condition-multiple-codings.md),[Condition/mii-exa-diagnose-mehrfachcodierung-primaercode](Condition-mii-exa-diagnose-mehrfachcodierung-primaercode.md),[Condition/mii-exa-diagnose-mehrfachcodierung-sekundaercode](Condition-mii-exa-diagnose-mehrfachcodierung-sekundaercode.md),[MII_PR_Diagnose_Condition](StructureDefinition-mii-pr-diagnose-condition.md)and[MII_VS_Diagnose_ICD10GM](ValueSet-mii-vs-diagnose-icd10gm.md)




## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "mii-ig-base",
  "language" : "en",
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-base/ImplementationGuide/mii-ig-base",
  "version" : "2026.0.0-dev.1",
  "name" : "MII_IG_Base",
  "_name" : {
    "extension" : [
      {
        "extension" : [
          {
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "MII_IG_Base"
          }
        ],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }
    ]
  },
  "title" : "MII Implementation Guide Core Dataset Base",
  "_title" : {
    "extension" : [
      {
        "extension" : [
          {
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "MII Implementierungsleitfaden Kerndatensatz Basis"
          }
        ],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }
    ]
  },
  "status" : "active",
  "date" : "2025-11-24",
  "publisher" : "Medical Informatics Initiative (MII)",
  "_publisher" : {
    "extension" : [
      {
        "extension" : [
          {
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Medizininformatik-Initiative (MII)"
          }
        ],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }
    ]
  },
  "contact" : [
    {
      "name" : "Medical Informatics Initiative (MII)",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.medizininformatik-initiative.de/en"
        }
      ]
    }
  ],
  "description" : "Implementation Guide for the Core Dataset Base Modules Person, Diagnosis, Procedure, and Treatment Case",
  "_description" : {
    "extension" : [
      {
        "extension" : [
          {
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Implementierungsleitfaden für die Kerndatensatz Basismodule Person, Diagnose, Prozedur, und Fall"
          }
        ],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }
    ]
  },
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "DE",
          "display" : "Germany"
        }
      ]
    }
  ],
  "packageId" : "de.medizininformatikinitiative.kerndatensatz.base",
  "license" : "CC-BY-4.0",
  "fhirVersion" : ["4.0.1"],
  "dependsOn" : [
    {
      "id" : "hl7tx",
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
          "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
        }
      ],
      "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
      "packageId" : "hl7.terminology.r4",
      "version" : "7.0.0"
    },
    {
      "id" : "hl7ext",
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
          "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
        }
      ],
      "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
      "packageId" : "hl7.fhir.uv.extensions.r4",
      "version" : "5.2.0"
    },
    {
      "id" : "de_basisprofil_r4",
      "uri" : "http://fhir.org/packages/de.basisprofil.r4/ImplementationGuide/de.basisprofil.r4",
      "packageId" : "de.basisprofil.r4",
      "version" : "1.5.x"
    },
    {
      "id" : "de_medizininformatikinitiative_kerndatensatz_meta",
      "uri" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/ImplementationGuide/mii-ig-meta",
      "packageId" : "de.medizininformatikinitiative.kerndatensatz.meta",
      "version" : "2026.0.x"
    }
  ],
  "definition" : {
    "extension" : [
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "copyrightyear"
          },
          {
            "url" : "value",
            "valueString" : "2019+"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "releaselabel"
          },
          {
            "url" : "value",
            "valueString" : "ci-build"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "i18n-default-lang"
          },
          {
            "url" : "value",
            "valueString" : "en"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "i18n-lang"
          },
          {
            "url" : "value",
            "valueString" : "de"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "translation-sources"
          },
          {
            "url" : "value",
            "valueString" : "input/translations/de"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "igs-logo"
          },
          {
            "url" : "value",
            "valueString" : "MII_Logo_rgb.jpg"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "excludexml"
          },
          {
            "url" : "value",
            "valueString" : "false"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "excludejson"
          },
          {
            "url" : "value",
            "valueString" : "false"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "excludettl"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "excludemap"
          },
          {
            "url" : "value",
            "valueString" : "false"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "version-comparison-master"
          },
          {
            "url" : "value",
            "valueString" : "{current}"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "version-comparison"
          },
          {
            "url" : "value",
            "valueString" : "{current}"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/CapabilityStatement/metadata"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/CapabilityStatement/metadata"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/CapabilityStatement/metadata"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/CapabilityStatement/metadata"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/CodeSystem/SupplementActEncounterCode"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/CodeSystem/SupplementPatientClass"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/CodeSystem/Vitalstatus"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedEndDate"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedStartDate"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/LogicalModel/Diagnose"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/LogicalModel/Fall"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/LogicalModel/Prozedur"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/ResearchSubject"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Todesursache"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Vitalstatus"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-alphaid"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-bodystructure-snomed"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/diagnoses-sct"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-icd10gm"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-orphanet"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/CodeSystem/mii-cs-diagnose-lebensphase-supplement-snomed"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/mii-vs-fall-diagnosis-use"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/identifier-type-codes"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/location-physical-type"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/ValueSet/Vitalstatus"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-intend"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/mii-vs-prozedur-ops"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-category-sct"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-sct"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/LogicalModel/Person"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "autoload-resources"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-liquid"
          },
          {
            "url" : "value",
            "valueString" : "template/liquid"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-liquid"
          },
          {
            "url" : "value",
            "valueString" : "input/liquid"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-qa"
          },
          {
            "url" : "value",
            "valueString" : "temp/qa"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-temp"
          },
          {
            "url" : "value",
            "valueString" : "temp/pages"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-output"
          },
          {
            "url" : "value",
            "valueString" : "output"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-suppressed-warnings"
          },
          {
            "url" : "value",
            "valueString" : "input/ignoreWarnings.txt"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-history"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/modul-base/history.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "template-html"
          },
          {
            "url" : "value",
            "valueString" : "template-page.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "template-md"
          },
          {
            "url" : "value",
            "valueString" : "template-page-md.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-contact"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-context"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-copyright"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-jurisdiction"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-license"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-publisher"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-version"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-wg"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "active-tables"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "fmm-definition"
          },
          {
            "url" : "value",
            "valueString" : "http://hl7.org/fhir/versions.html#maturity"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "propagate-status"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "excludelogbinaryformat"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "tabbed-snapshots"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "wantGen-ttl"
          },
          {
            "url" : "value",
            "valueString" : "false"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "wantGen-ttl-html"
          },
          {
            "url" : "value",
            "valueString" : "false"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
        "valueCode" : "hl7.fhir.uv.tools.r4#0.8.0"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "copyrightyear"
          },
          {
            "url" : "value",
            "valueString" : "2019+"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "releaselabel"
          },
          {
            "url" : "value",
            "valueString" : "ci-build"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "i18n-default-lang"
          },
          {
            "url" : "value",
            "valueString" : "en"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "i18n-lang"
          },
          {
            "url" : "value",
            "valueString" : "de"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "translation-sources"
          },
          {
            "url" : "value",
            "valueString" : "input/translations/de"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "igs-logo"
          },
          {
            "url" : "value",
            "valueString" : "MII_Logo_rgb.jpg"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "excludexml"
          },
          {
            "url" : "value",
            "valueString" : "false"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "excludejson"
          },
          {
            "url" : "value",
            "valueString" : "false"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "excludettl"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "excludemap"
          },
          {
            "url" : "value",
            "valueString" : "false"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "version-comparison-master"
          },
          {
            "url" : "value",
            "valueString" : "{current}"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "version-comparison"
          },
          {
            "url" : "value",
            "valueString" : "{current}"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/CapabilityStatement/metadata"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/CapabilityStatement/metadata"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/CapabilityStatement/metadata"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/CapabilityStatement/metadata"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/CodeSystem/SupplementActEncounterCode"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/CodeSystem/SupplementPatientClass"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/CodeSystem/Vitalstatus"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedEndDate"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedStartDate"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/LogicalModel/Diagnose"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/LogicalModel/Fall"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/LogicalModel/Prozedur"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/ResearchSubject"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Todesursache"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Vitalstatus"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-alphaid"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-bodystructure-snomed"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/diagnoses-sct"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-icd10gm"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-orphanet"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/CodeSystem/mii-cs-diagnose-lebensphase-supplement-snomed"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/mii-vs-fall-diagnosis-use"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/identifier-type-codes"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/location-physical-type"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/ValueSet/Vitalstatus"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-intend"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/mii-vs-prozedur-ops"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-category-sct"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-sct"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "special-url"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/LogicalModel/Person"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "autoload-resources"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-liquid"
          },
          {
            "url" : "value",
            "valueString" : "template/liquid"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-liquid"
          },
          {
            "url" : "value",
            "valueString" : "input/liquid"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-qa"
          },
          {
            "url" : "value",
            "valueString" : "temp/qa"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-temp"
          },
          {
            "url" : "value",
            "valueString" : "temp/pages"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-output"
          },
          {
            "url" : "value",
            "valueString" : "output"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-suppressed-warnings"
          },
          {
            "url" : "value",
            "valueString" : "input/ignoreWarnings.txt"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-history"
          },
          {
            "url" : "value",
            "valueString" : "https://www.medizininformatik-initiative.de/fhir/modul-base/history.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "template-html"
          },
          {
            "url" : "value",
            "valueString" : "template-page.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "template-md"
          },
          {
            "url" : "value",
            "valueString" : "template-page-md.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-contact"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-context"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-copyright"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-jurisdiction"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-license"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-publisher"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-version"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-wg"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "active-tables"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "fmm-definition"
          },
          {
            "url" : "value",
            "valueString" : "http://hl7.org/fhir/versions.html#maturity"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "propagate-status"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "excludelogbinaryformat"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "tabbed-snapshots"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "wantGen-ttl"
          },
          {
            "url" : "value",
            "valueString" : "false"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "wantGen-ttl-html"
          },
          {
            "url" : "value",
            "valueString" : "false"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      }
    ],
    "resource" : [
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CapabilityStatement"
          }
        ],
        "reference" : {
          "reference" : "CapabilityStatement/mii-cps-diagnose-capabilitystatement"
        },
        "name" : "MII CPS Diagnose CapabilityStatement",
        "_name" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de"
                },
                {
                  "url" : "content",
                  "valueString" : "MII CPS Diagnose CapabilityStatement"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "description" : "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss, um das Modul Diagnose der Medizininformatik Initiative zu implementieren.",
        "_description" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de"
                },
                {
                  "url" : "content",
                  "valueString" : "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss, um das Modul Diagnose der Medizininformatik Initiative zu implementieren."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CapabilityStatement"
          }
        ],
        "reference" : {
          "reference" : "CapabilityStatement/mii-cps-fall-capabilitystatement"
        },
        "name" : "MII CPS Fall CapabilityStatement",
        "_name" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de"
                },
                {
                  "url" : "content",
                  "valueString" : "MII CPS Fall CapabilityStatement"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "description" : "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss, um das Modul Fall der Medizininformatik Initiative zu implementieren.",
        "_description" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de"
                },
                {
                  "url" : "content",
                  "valueString" : "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss, um das Modul Fall der Medizininformatik Initiative zu implementieren."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CapabilityStatement"
          }
        ],
        "reference" : {
          "reference" : "CapabilityStatement/mii-cps-person-capabilitystatement"
        },
        "name" : "MII CPS Person CapabilityStatement",
        "_name" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de"
                },
                {
                  "url" : "content",
                  "valueString" : "MII CPS Person CapabilityStatement"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "description" : "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss um das Modul Person der Medizininformatik Initiative zu implementieren.",
        "_description" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de"
                },
                {
                  "url" : "content",
                  "valueString" : "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss um das Modul Person der Medizininformatik Initiative zu implementieren."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CapabilityStatement"
          }
        ],
        "reference" : {
          "reference" : "CapabilityStatement/mii-cps-prozedur-capabilitystatement"
        },
        "name" : "MII CPS Prozedur CapabilityStatement",
        "_name" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de"
                },
                {
                  "url" : "content",
                  "valueString" : "MII CPS Prozedur CapabilityStatement"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "description" : "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss um das Modul Prozedur der Medizininformatik Initiative zu implementieren.",
        "_description" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de"
                },
                {
                  "url" : "content",
                  "valueString" : "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss um das Modul Prozedur der Medizininformatik Initiative zu implementieren."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/mii-cs-diagnose-lebensphase-supplement-snomed"
        },
        "name" : "MII CS Diagnose Lebensphase Supplement SNOMED",
        "description" : "CodeSystem Supplement mit Definitionen zu den SNOMED-Konzepten für Lebensphasen.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/mii-cs-fall-supplement-act-encounter-code"
        },
        "name" : "MII CS Fall Supplement ActEncounterCode",
        "description" : "CodeSystem Supplement für ActEncounterCode",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/mii-cs-fall-supplement-patient-class"
        },
        "name" : "MII CS Fall Supplement PatientClass",
        "description" : "CodeSystem Supplement für v2-0004",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/mii-cs-person-vitalstatus"
        },
        "name" : "MII CS Person Vitalstatus",
        "description" : "Vitalstatus des Patienten",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/mii-ex-fall-planned-end-date"
        },
        "name" : "MII EX Fall Planned End Date",
        "description" : "The planned end date/time (or discharge date) of the encounter",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/mii-ex-fall-planned-start-date"
        },
        "name" : "MII EX Fall Planned Start Date",
        "description" : "The planned start date/time (or admission date) of the encounter",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/mii-ex-prozedur-durchfuehrungsabsicht"
        },
        "name" : "MII EX Prozedur Durchführungsabsicht",
        "description" : "Intention der Prozedur",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Bundle"
          }
        ],
        "reference" : {
          "reference" : "Bundle/mii-exa-base-test-data-bundle-1"
        },
        "name" : "MII EXA Base Test Data Bundle 1",
        "description" : "Bundle: collection of example scenario resources as transaction bundle",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/mii-exa-diagnose-appendicitis"
        },
        "name" : "MII EXA Diagnose Condition Appendicitis",
        "description" : "Condition: Acute appendicitis diagnosis as admission diagnosis",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/mii-exa-diagnose-condition-elbow-contusion"
        },
        "name" : "MII EXA Diagnose Condition Contusion Elbow",
        "description" : "Condition: Elbow contusion diagnosis",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/mii-exa-diagnose-mehrfachcodierung-primaercode"
        },
        "name" : "MII EXA Diagnose Mehrfachcodierung Primaercode",
        "description" : "Condition: Primary code (†) - gonococcal bursitis etiology",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/mii-exa-diagnose-mehrfachcodierung-sekundaercode"
        },
        "name" : "MII EXA Diagnose Mehrfachcodierung Sekundaercode",
        "description" : "Condition: Secondary code (*) - bursitis manifestation",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/mii-exa-diagnose-condition-multiple-codings"
        },
        "name" : "MII EXA Diagnose Multiple Codings",
        "description" : "Condition: Multiple coding systems - ICD-10-GM, Alpha-ID, and Orphanet",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-2"
        },
        "name" : "MII EXA Fall Kontakt Gesundheitseinrichtung (Abteilungskontakt Chirurgie A2E)",
        "description" : "Encounter: Department-level encounter (Abteilungskontakt) for surgical care",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-7"
        },
        "name" : "MII EXA Fall Kontakt Gesundheitseinrichtung (Abteilungskontakt Innere Medizin)",
        "description" : "Encounter: Department-level encounter (Abteilungskontakt) for Internal Medicine ward care",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-9"
        },
        "name" : "MII EXA Fall Kontakt Gesundheitseinrichtung (Abteilungskontakt Notaufnahme A1E)",
        "description" : "Encounter: Emergency department encounter as entry point for hospital admission",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-8"
        },
        "name" : "MII EXA Fall Kontakt Gesundheitseinrichtung (Ambulanter Kontakt)",
        "description" : "Encounter: Example demonstrating an outpatient rheumatology encounter for initial bursitis diagnosis",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-1"
        },
        "name" : "MII EXA Fall Kontakt Gesundheitseinrichtung (Einrichtungskontakt E0)",
        "description" : "Encounter: Facility-level encounter (Einrichtungskontakt) for entire hospital stay",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-3"
        },
        "name" : "MII EXA Fall Kontakt Gesundheitseinrichtung (Planned Encounter)",
        "description" : "Encounter: Planned encounter with future dates",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/mii-exa-fall-kontakt-in-progress-status"
        },
        "name" : "MII EXA Fall Kontakt Gesundheitseinrichtung (Status in-progress)",
        "description" : "Encounter: Status 'in-progress'",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/mii-exa-fall-kontakt-onleave-status"
        },
        "name" : "MII EXA Fall Kontakt Gesundheitseinrichtung (Status onleave)",
        "description" : "Encounter: Status 'onleave'",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/mii-exa-fall-kontakt-unknown-status"
        },
        "name" : "MII EXA Fall Kontakt Gesundheitseinrichtung (Status unknown)",
        "description" : "Encounter: Status 'unknown'",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-11"
        },
        "name" : "MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt ED Treatment Room VS1)",
        "description" : "Encounter: Care unit encounter (Versorgungsstellenkontakt) for ED treatment room",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-5"
        },
        "name" : "MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt OR VS3)",
        "description" : "Encounter: Care unit encounter (Versorgungsstellenkontakt) for operating room",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-6"
        },
        "name" : "MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt PACU VS4)",
        "description" : "Encounter: Care unit encounter (Versorgungsstellenkontakt) for post-anesthesia care unit",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-4"
        },
        "name" : "MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt Radiology VS2)",
        "description" : "Encounter: Care unit encounter (Versorgungsstellenkontakt) for radiology CT procedure",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-10"
        },
        "name" : "MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt Surgical Ward VS5)",
        "description" : "Encounter: Care unit encounter (Versorgungsstellenkontakt) for surgical ward post-operative care",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/mii-exa-person-condition-todesursache"
        },
        "name" : "MII EXA Person Condition (Todesursache)",
        "description" : "Condition: Cause of Death (Todesursache)",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Todesursache"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/mii-exa-person-observation-vitalstatus"
        },
        "name" : "MII EXA Person Observation Vitalstatus",
        "description" : "Observation: Vital status at hospital admission",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Vitalstatus"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/mii-exa-person-observation-vitalstatus-discharge"
        },
        "name" : "MII EXA Person Observation Vitalstatus Discharge",
        "description" : "Observation: Vital status observation at hospital discharge",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Vitalstatus"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Patient"
          }
        ],
        "reference" : {
          "reference" : "Patient/mii-exa-person-patient-1"
        },
        "name" : "MII EXA Person Patient",
        "description" : "Patient: with insurance identifier, name and address",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Patient"
          }
        ],
        "reference" : {
          "reference" : "Patient/mii-exa-person-patient-pseudonymisiert"
        },
        "name" : "MII EXA Person Patient Pseudonymisiert",
        "description" : "Patient: with pseudonym and masked insurance identifier (maskierter Versichertenidentifer)",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Procedure"
          }
        ],
        "reference" : {
          "reference" : "Procedure/mii-exa-prozedur-procedure"
        },
        "name" : "MII EXA Prozedur Procedure Appendectomy",
        "description" : "Procedure: Surgical procedure (appendectomy)",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Procedure"
          }
        ],
        "reference" : {
          "reference" : "Procedure/mii-exa-prozedur-imaging"
        },
        "name" : "MII EXA Prozedur Procedure Imaging CT Abdomen",
        "description" : "Procedure: Diagnostic imaging procedure (CT abdomen) for appendicitis workup",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Procedure"
          }
        ],
        "reference" : {
          "reference" : "Procedure/mii-exa-prozedur-procedure-2"
        },
        "name" : "MII EXA Prozedur Procedure Physiotherapy",
        "description" : "Procedure: Physiotherapy procedure for bursitis treatment",
        "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:logical"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/mii-lm-diagnose"
        },
        "name" : "MII LM Diagnose",
        "description" : "Logische Repräsentation des Basismoduls Diagnose",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:logical"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/mii-lm-fall"
        },
        "name" : "MII LM Fall",
        "description" : "Logische Repräsentation des Basismoduls Fall",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:logical"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/mii-lm-person"
        },
        "name" : "MII LM Person",
        "description" : "Logische Repräsentation des Basismoduls Person",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:logical"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/mii-lm-prozedur"
        },
        "name" : "MII LM Prozedur",
        "description" : "Logische Repräsentation des Basismoduls Prozedur",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/mii-pr-diagnose-condition"
        },
        "name" : "MII PR Diagnose Condition",
        "description" : "Dieses Profil beschreibt eine Diagnose der Medizininformatik Initiative",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/mii-pr-fall-kontakt-gesundheitseinrichtung"
        },
        "name" : "MII PR Fall Kontakt mit einer Gesundheitseinrichtung",
        "description" : "Kontakt zu einer Einrichtung, Abteilung oder Versorgungsstelle",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/mii-pr-person-patient"
        },
        "name" : "MII PR Person Patient",
        "description" : "Dieses Profil beschreibt eine Patient*in in der Medizininformatik-Initiative.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/mii-pr-person-patient-pseudonymisiert"
        },
        "name" : "MII PR Person Patient (Pseudonymisiert)",
        "description" : "Dieses Profil beschreibt eine*n pseudonymisierte*n Patient*in in der Medizininformatik-Initiative.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/mii-pr-person-proband"
        },
        "name" : "MII PR Person Proband",
        "description" : "Dieses Profil beschreibt eine Proband*in in der Medizininformatik-Initiative.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/mii-pr-person-todesursache"
        },
        "name" : "MII PR Person Todesursache",
        "description" : "Dieses Profil beschreibt den Todesursache der Patient*in als Element des Kerndatensatzes Medizininformatik-Initiative",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/mii-pr-person-vitalstatus"
        },
        "name" : "MII PR Person Vitalstatus",
        "description" : "Dieses Profil beschreibt den Vitalstatus der Patient*in in der Medizininformatik-Initiative.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/mii-pr-prozedur-procedure"
        },
        "name" : "MII PR Prozedur Procedure",
        "description" : "Dieses Profil beschreibt eine Prozedur in der Medizininformatik-Initiative.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/mii-vs-diagnose-alphaid"
        },
        "name" : "MII VS Diagnose Alpha-ID",
        "description" : "Enthaelt Alpha-ID-Codes der Versionen 2018 bis 2025",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/mii-vs-diagnose-bodystructure-snomed"
        },
        "name" : "MII VS Diagnose BodyStructure SNOMED",
        "description" : "Enthaelt alle SNOMED Body structure codes",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/mii-vs-diagnose-diagnosecodes-snomed"
        },
        "name" : "MII VS Diagnose Diagnose-Codes SNOMED",
        "description" : "Enthaelt alle SNOMED Clinical finding, Event und Situation with explicit context codes",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/mii-vs-diagnose-icd10gm"
        },
        "name" : "MII VS Diagnose ICD-10-GM",
        "description" : "Enthaelt ICD-10-GM-Codes der Versionen 2009 bis 2025",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/mii-vs-diagnose-orphanet"
        },
        "name" : "MII VS Diagnose Orphanet",
        "description" : "Enthaelt alle Orpha-Kennnummern (ORPHAcodes)",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/mii-vs-fall-diagnosis-use"
        },
        "name" : "MII VS Fall Diagnosis Use",
        "description" : "Diagnosetyp",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/mii-vs-fall-identifier-type-codes"
        },
        "name" : "MII VS Fall Identifier Type Codes",
        "description" : "A coded type for an identifier that can be used to determine which identifier to use for a specific purpose.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/mii-vs-fall-location-physical-type"
        },
        "name" : "MII VS Fall Location Physical Type",
        "description" : "A coded type for the physical type of the location.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/mii-vs-person-vitalstatus"
        },
        "name" : "MII VS Person Vitalstatus",
        "description" : "Enthält alle Werte, die den Vitalstatus einer Person beschreiben.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/mii-vs-prozedur-durchfuehrungsabsicht-snomedct"
        },
        "name" : "MII VS Prozedur Durchführungsabsicht [SNOMED CT]",
        "description" : "Durchführungsabsicht / Intention mit der Prozedur ausgeführt wird",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/mii-vs-prozedur-ops"
        },
        "name" : "MII VS Prozedur OPS",
        "description" : "Enthaelt OPS-Codes der Versionen 2010 bis 2025",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/mii-vs-prozedur-opskategorien-snomedct"
        },
        "name" : "MII VS Prozedur OPS Kategorien [SNOMED CT]",
        "description" : "Enthaelt alle SNOMED CT Codes für ein Mapping der OPS Klassentitel",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/mii-vs-prozedur-prozeduren-snomedct"
        },
        "name" : "MII VS Prozedur Prozeduren [SNOMED CT]",
        "description" : "Enthaelt alle SNOMED CT Procedure Codes",
        "exampleBoolean" : false
      }
    ],
    "page" : {
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "toc.html"
        }
      ],
      "nameUrl" : "toc.html",
      "title" : "Table of Contents",
      "_title" : {
        "extension" : [
          {
            "extension" : [
              {
                "url" : "lang",
                "valueCode" : "de"
              },
              {
                "url" : "content",
                "valueString" : "Inhaltsverzeichnis"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "generation" : "html",
      "page" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "index.html"
            }
          ],
          "nameUrl" : "index.html",
          "title" : "Home",
          "_title" : {
            "extension" : [
              {
                "extension" : [
                  {
                    "url" : "lang",
                    "valueCode" : "de"
                  },
                  {
                    "url" : "content",
                    "valueString" : "Start"
                  }
                ],
                "url" : "http://hl7.org/fhir/StructureDefinition/translation"
              }
            ]
          },
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "guidance.html"
            }
          ],
          "nameUrl" : "guidance.html",
          "title" : "Guidance",
          "_title" : {
            "extension" : [
              {
                "extension" : [
                  {
                    "url" : "lang",
                    "valueCode" : "de"
                  },
                  {
                    "url" : "content",
                    "valueString" : "Hinweise"
                  }
                ],
                "url" : "http://hl7.org/fhir/StructureDefinition/translation"
              }
            ]
          },
          "generation" : "markdown",
          "page" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "researcher-guidance.html"
                }
              ],
              "nameUrl" : "researcher-guidance.html",
              "title" : "Guidance for Researchers",
              "_title" : {
                "extension" : [
                  {
                    "extension" : [
                      {
                        "url" : "lang",
                        "valueCode" : "de"
                      },
                      {
                        "url" : "content",
                        "valueString" : "Orientierungshilfe für Forschende"
                      }
                    ],
                    "url" : "http://hl7.org/fhir/StructureDefinition/translation"
                  }
                ]
              },
              "generation" : "markdown"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "implementer-guidance.html"
                }
              ],
              "nameUrl" : "implementer-guidance.html",
              "title" : "Guidance for Implementers",
              "_title" : {
                "extension" : [
                  {
                    "extension" : [
                      {
                        "url" : "lang",
                        "valueCode" : "de"
                      },
                      {
                        "url" : "content",
                        "valueString" : "Anleitung für Implementierer"
                      }
                    ],
                    "url" : "http://hl7.org/fhir/StructureDefinition/translation"
                  }
                ]
              },
              "generation" : "markdown"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "datasets-and-descriptions.html"
                }
              ],
              "nameUrl" : "datasets-and-descriptions.html",
              "title" : "Datasets and Descriptions",
              "_title" : {
                "extension" : [
                  {
                    "extension" : [
                      {
                        "url" : "lang",
                        "valueCode" : "de"
                      },
                      {
                        "url" : "content",
                        "valueString" : "Datensätze und Beschreibungen"
                      }
                    ],
                    "url" : "http://hl7.org/fhir/StructureDefinition/translation"
                  }
                ]
              },
              "generation" : "markdown"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "uml-diagrams.html"
                }
              ],
              "nameUrl" : "uml-diagrams.html",
              "title" : "UML Diagrams",
              "_title" : {
                "extension" : [
                  {
                    "extension" : [
                      {
                        "url" : "lang",
                        "valueCode" : "de"
                      },
                      {
                        "url" : "content",
                        "valueString" : "UML Diagramme"
                      }
                    ],
                    "url" : "http://hl7.org/fhir/StructureDefinition/translation"
                  }
                ]
              },
              "generation" : "markdown"
            }
          ]
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "conformance.html"
            }
          ],
          "nameUrl" : "conformance.html",
          "title" : "Conformance",
          "_title" : {
            "extension" : [
              {
                "extension" : [
                  {
                    "url" : "lang",
                    "valueCode" : "de"
                  },
                  {
                    "url" : "content",
                    "valueString" : "Konformität"
                  }
                ],
                "url" : "http://hl7.org/fhir/StructureDefinition/translation"
              }
            ]
          },
          "generation" : "markdown",
          "page" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "general-requirements.html"
                }
              ],
              "nameUrl" : "general-requirements.html",
              "title" : "General Requirements",
              "_title" : {
                "extension" : [
                  {
                    "extension" : [
                      {
                        "url" : "lang",
                        "valueCode" : "de"
                      },
                      {
                        "url" : "content",
                        "valueString" : "Allgemeine Anforderungen"
                      }
                    ],
                    "url" : "http://hl7.org/fhir/StructureDefinition/translation"
                  }
                ]
              },
              "generation" : "markdown"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "must-support.html"
                }
              ],
              "nameUrl" : "must-support.html",
              "title" : "Must Support",
              "_title" : {
                "extension" : [
                  {
                    "extension" : [
                      {
                        "url" : "lang",
                        "valueCode" : "de"
                      },
                      {
                        "url" : "content",
                        "valueString" : "Must Support"
                      }
                    ],
                    "url" : "http://hl7.org/fhir/StructureDefinition/translation"
                  }
                ]
              },
              "generation" : "markdown"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "missing-data.html"
                }
              ],
              "nameUrl" : "missing-data.html",
              "title" : "Handling Missing Data",
              "_title" : {
                "extension" : [
                  {
                    "extension" : [
                      {
                        "url" : "lang",
                        "valueCode" : "de"
                      },
                      {
                        "url" : "content",
                        "valueString" : "Umgang mit fehlenden Daten"
                      }
                    ],
                    "url" : "http://hl7.org/fhir/StructureDefinition/translation"
                  }
                ]
              },
              "generation" : "markdown"
            }
          ]
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "profiles-and-extensions.html"
            }
          ],
          "nameUrl" : "profiles-and-extensions.html",
          "title" : "Profiles and Extensions",
          "_title" : {
            "extension" : [
              {
                "extension" : [
                  {
                    "url" : "lang",
                    "valueCode" : "de"
                  },
                  {
                    "url" : "content",
                    "valueString" : "Profile und Extensions"
                  }
                ],
                "url" : "http://hl7.org/fhir/StructureDefinition/translation"
              }
            ]
          },
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "search-parameters-and-operations.html"
            }
          ],
          "nameUrl" : "search-parameters-and-operations.html",
          "title" : "Search Parameters and Operations",
          "_title" : {
            "extension" : [
              {
                "extension" : [
                  {
                    "url" : "lang",
                    "valueCode" : "de"
                  },
                  {
                    "url" : "content",
                    "valueString" : "Suchparameter und Operations"
                  }
                ],
                "url" : "http://hl7.org/fhir/StructureDefinition/translation"
              }
            ]
          },
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "terminology.html"
            }
          ],
          "nameUrl" : "terminology.html",
          "title" : "Terminology",
          "_title" : {
            "extension" : [
              {
                "extension" : [
                  {
                    "url" : "lang",
                    "valueCode" : "de"
                  },
                  {
                    "url" : "content",
                    "valueString" : "Terminologie"
                  }
                ],
                "url" : "http://hl7.org/fhir/StructureDefinition/translation"
              }
            ]
          },
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "capability-statements.html"
            }
          ],
          "nameUrl" : "capability-statements.html",
          "title" : "Capability Statements",
          "_title" : {
            "extension" : [
              {
                "extension" : [
                  {
                    "url" : "lang",
                    "valueCode" : "de"
                  },
                  {
                    "url" : "content",
                    "valueString" : "Capability Statements"
                  }
                ],
                "url" : "http://hl7.org/fhir/StructureDefinition/translation"
              }
            ]
          },
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "logical-models.html"
            }
          ],
          "nameUrl" : "logical-models.html",
          "title" : "Logical Models",
          "_title" : {
            "extension" : [
              {
                "extension" : [
                  {
                    "url" : "lang",
                    "valueCode" : "de"
                  },
                  {
                    "url" : "content",
                    "valueString" : "Logische Modelle"
                  }
                ],
                "url" : "http://hl7.org/fhir/StructureDefinition/translation"
              }
            ]
          },
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "examples.html"
            }
          ],
          "nameUrl" : "examples.html",
          "title" : "Examples",
          "_title" : {
            "extension" : [
              {
                "extension" : [
                  {
                    "url" : "lang",
                    "valueCode" : "de"
                  },
                  {
                    "url" : "content",
                    "valueString" : "Beispiele"
                  }
                ],
                "url" : "http://hl7.org/fhir/StructureDefinition/translation"
              }
            ]
          },
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "downloads.html"
            }
          ],
          "nameUrl" : "downloads.html",
          "title" : "Downloads",
          "_title" : {
            "extension" : [
              {
                "extension" : [
                  {
                    "url" : "lang",
                    "valueCode" : "de"
                  },
                  {
                    "url" : "content",
                    "valueString" : "Downloads"
                  }
                ],
                "url" : "http://hl7.org/fhir/StructureDefinition/translation"
              }
            ]
          },
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "version-history.html"
            }
          ],
          "nameUrl" : "version-history.html",
          "title" : "Version History",
          "_title" : {
            "extension" : [
              {
                "extension" : [
                  {
                    "url" : "lang",
                    "valueCode" : "de"
                  },
                  {
                    "url" : "content",
                    "valueString" : "Versionshistorie"
                  }
                ],
                "url" : "http://hl7.org/fhir/StructureDefinition/translation"
              }
            ]
          },
          "generation" : "markdown",
          "page" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "changes.html"
                }
              ],
              "nameUrl" : "changes.html",
              "title" : "Changelog",
              "_title" : {
                "extension" : [
                  {
                    "extension" : [
                      {
                        "url" : "lang",
                        "valueCode" : "de"
                      },
                      {
                        "url" : "content",
                        "valueString" : "Changelog"
                      }
                    ],
                    "url" : "http://hl7.org/fhir/StructureDefinition/translation"
                  }
                ]
              },
              "generation" : "markdown"
            }
          ]
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "ImplementationGuide-mii-ig-base.html"
            }
          ],
          "nameUrl" : "ImplementationGuide-mii-ig-base.html",
          "title" : "MII ImplementationGuide Resource",
          "_title" : {
            "extension" : [
              {
                "extension" : [
                  {
                    "url" : "lang",
                    "valueCode" : "de"
                  },
                  {
                    "url" : "content",
                    "valueString" : "MII ImplementationGuide Ressource"
                  }
                ],
                "url" : "http://hl7.org/fhir/StructureDefinition/translation"
              }
            ]
          },
          "generation" : "markdown"
        }
      ]
    },
    "parameter" : [
      {
        "code" : "path-resource",
        "value" : "input/predefined-resources"
      },
      {
        "code" : "path-pages",
        "value" : "input/intro-notes"
      },
      {
        "code" : "path-resource",
        "value" : "input/capabilities"
      },
      {
        "code" : "path-resource",
        "value" : "input/examples"
      },
      {
        "code" : "path-resource",
        "value" : "input/extensions"
      },
      {
        "code" : "path-resource",
        "value" : "input/models"
      },
      {
        "code" : "path-resource",
        "value" : "input/operations"
      },
      {
        "code" : "path-resource",
        "value" : "input/profiles"
      },
      {
        "code" : "path-resource",
        "value" : "input/resources"
      },
      {
        "code" : "path-resource",
        "value" : "input/vocabulary"
      },
      {
        "code" : "path-resource",
        "value" : "input/testing"
      },
      {
        "code" : "path-resource",
        "value" : "input/history"
      },
      {
        "code" : "path-resource",
        "value" : "fsh-generated/resources"
      },
      {
        "code" : "path-pages",
        "value" : "template/config"
      },
      {
        "code" : "path-pages",
        "value" : "input/assets"
      },
      {
        "code" : "path-pages",
        "value" : "input/images"
      },
      {
        "code" : "path-tx-cache",
        "value" : "input-cache/txcache"
      }
    ]
  }
}

```
