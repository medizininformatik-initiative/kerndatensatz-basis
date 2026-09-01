# Artefaktübersicht - MII Implementation Guide Core Dataset Base v2027.0.0-dev

* [**Inhaltsverzeichnis**](toc.md)
* **Artefaktübersicht**

## Artefaktübersicht

 Für die aktuelle Seite ist keine Übersetzung verfügbar, daher wurde sie in der Standardsprache dargestellt. 

Diese Seite bietet eine Liste der FHIR-Artefakte, die in diesem Implementierungsleitfaden definiert sind.

### Verhalten: CapabilityStatements 

Die folgenden Artefakte definieren die spezifischen Fähigkeiten, die verschiedene Systemtypen haben müssen, um diesem Implementierungsleitfaden zu entsprechen. Von Systemen, die mit dem Implementierungsleitfaden konform sind, wird erwartet, dass sie die Konformität mit einem oder mehreren der folgenden Capability Statements deklarieren.

| | |
| :--- | :--- |
| [ MII CPS Diagnose CapabilityStatement  ](CapabilityStatement-mii-cps-diagnose-capabilitystatement.md) | Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss, um das Modul Diagnose der Medizininformatik Initiative zu implementieren. |
| [ MII CPS Fall CapabilityStatement  ](CapabilityStatement-mii-cps-fall-capabilitystatement.md) | Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss, um das Modul Fall der Medizininformatik Initiative zu implementieren. |
| [ MII CPS Person CapabilityStatement  ](CapabilityStatement-mii-cps-person-capabilitystatement.md) | Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss um das Modul Person der Medizininformatik Initiative zu implementieren. |
| [ MII CPS Prozedur CapabilityStatement  ](CapabilityStatement-mii-cps-prozedur-capabilitystatement.md) | Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss um das Modul Prozedur der Medizininformatik Initiative zu implementieren. |

### Strukturen: Logische Modelle 

Diese definieren Datenmodelle, die den von diesem Implementierungsleitfaden abgedeckten Bereich in geschäftsfreundlicheren Begriffen darstellen als die zugrunde liegenden FHIR-Ressourcen.

| | |
| :--- | :--- |
| [ MII LM Diagnose  ](StructureDefinition-mii-lm-diagnose.md) | Logische Repräsentation des Basismoduls Diagnose |
| [ MII LM Fall  ](StructureDefinition-mii-lm-fall.md) | Logische Repräsentation des Basismoduls Fall |
| [ MII LM Person  ](StructureDefinition-mii-lm-person.md) | Logische Repräsentation des Basismoduls Person |
| [ MII LM Prozedur  ](StructureDefinition-mii-lm-prozedur.md) | Logische Repräsentation des Basismoduls Prozedur |

### Strukturen: Ressourcenprofile 

Diese definieren Einschränkungen für FHIR-Ressourcen für Systeme, die mit dem Implementierungsleitfaden konform sind.

| | |
| :--- | :--- |
| [ MII PR Diagnose Condition  ](StructureDefinition-mii-pr-diagnose-condition.md) | Dieses Profil beschreibt eine Diagnose der Medizininformatik Initiative |
| [ MII PR Fall Kontakt mit einer Gesundheitseinrichtung  ](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md) | Kontakt zu einer Einrichtung, Abteilung oder Versorgungsstelle |
| [ MII PR Person Patient  ](StructureDefinition-mii-pr-person-patient.md) | Dieses Profil beschreibt eine Patient*in in der Medizininformatik-Initiative. |
| [ MII PR Person Patient (Pseudonymisiert)  ](StructureDefinition-mii-pr-person-patient-pseudonymisiert.md) | Dieses Profil beschreibt eine**n pseudonymisierte**n Patient*in in der Medizininformatik-Initiative. |
| [ MII PR Person Todesursache  ](StructureDefinition-mii-pr-person-todesursache.md) | Dieses Profil beschreibt den Todesursache der Patient*in als Element des Kerndatensatzes Medizininformatik-Initiative |
| [ MII PR Person Vitalstatus  ](StructureDefinition-mii-pr-person-vitalstatus.md) | Dieses Profil beschreibt den Vitalstatus der Patient*in in der Medizininformatik-Initiative. |
| [ MII PR Prozedur Procedure  ](StructureDefinition-mii-pr-prozedur-procedure.md) | Dieses Profil beschreibt eine Prozedur in der Medizininformatik-Initiative. |

### Strukturen: Extension-Definitionen 

Diese definieren Einschränkungen für FHIR-Datentypen für Systeme, die mit diesem Implementierungsleitfaden konform sind.

| | |
| :--- | :--- |
| [ MII EX Prozedur Durchführungsabsicht  ](StructureDefinition-mii-ex-prozedur-durchfuehrungsabsicht.md) | Intention der Prozedur |

### Terminologie: ValueSets 

Diese definieren Wertemengen, die von Systemen verwendet werden, die mit dem Implementierungsleitfaden konform sind.

| | |
| :--- | :--- |
| [ MII VS Diagnose Alpha-ID  ](ValueSet-mii-vs-diagnose-alphaid.md) | Enthaelt Alpha-ID-Codes der Versionen 2018 bis 2025 |
| [ MII VS Diagnose BodyStructure SNOMED  ](ValueSet-mii-vs-diagnose-bodystructure-snomed.md) | Enthaelt alle SNOMED Body structure codes |
| [ MII VS Diagnose Diagnose-Codes SNOMED  ](ValueSet-mii-vs-diagnose-diagnosecodes-snomed.md) | Enthaelt alle SNOMED Clinical finding, Event und Situation with explicit context codes |
| [ MII VS Diagnose ICD-10-GM  ](ValueSet-mii-vs-diagnose-icd10gm.md) | Enthaelt ICD-10-GM-Codes der Versionen 2009 bis 2025 |
| [ MII VS Diagnose Orphanet  ](ValueSet-mii-vs-diagnose-orphanet.md) | Enthaelt alle Orpha-Kennnummern (ORPHAcodes) |
| [ MII VS Fall Diagnosis Use  ](ValueSet-mii-vs-fall-diagnosis-use.md) | Diagnosetyp |
| [ MII VS Fall Identifier Type Codes  ](ValueSet-mii-vs-fall-identifier-type-codes.md) | A coded type for an identifier that can be used to determine which identifier to use for a specific purpose. |
| [ MII VS Fall Location Physical Type  ](ValueSet-mii-vs-fall-location-physical-type.md) | A coded type for the physical type of the location. |
| [ MII VS Person ICD-10-WHO  ](ValueSet-mii-vs-person-icd10who.md) | MII VS Person ICD-10-WHO |
| [ MII VS Person Vitalstatus  ](ValueSet-mii-vs-person-vitalstatus.md) | Enthält alle Werte, die den Vitalstatus einer Person beschreiben. |
| [ MII VS Prozedur Durchführungsabsicht [SNOMED CT]  ](ValueSet-mii-vs-prozedur-durchfuehrungsabsicht-snomedct.md) | Durchführungsabsicht / Intention mit der Prozedur ausgeführt wird |
| [ MII VS Prozedur OPS  ](ValueSet-mii-vs-prozedur-ops.md) | Enthaelt OPS-Codes der Versionen 2010 bis 2025 |
| [ MII VS Prozedur OPS Kategorien [SNOMED CT]  ](ValueSet-mii-vs-prozedur-opskategorien-snomedct.md) | Enthaelt alle SNOMED CT Codes für ein Mapping der OPS Klassentitel |
| [ MII VS Prozedur Prozeduren [SNOMED CT]  ](ValueSet-mii-vs-prozedur-prozeduren-snomedct.md) | Enthaelt alle SNOMED CT Procedure Codes |

### Terminologie: CodeSysteme 

Diese definieren neue CodeSysteme, die von Systemen verwendet werden, die mit diesem Implementierungsleitfaden konform sind.

| | |
| :--- | :--- |
| [ MII CS Diagnose Lebensphase Supplement SNOMED  ](CodeSystem-mii-cs-diagnose-lebensphase-supplement-snomed.md) | CodeSystem Supplement mit Definitionen zu den SNOMED-Konzepten für Lebensphasen. |
| [ MII CS Fall Supplement ActEncounterCode  ](CodeSystem-mii-cs-fall-supplement-act-encounter-code.md) | CodeSystem Supplement für ActEncounterCode |
| [ MII CS Fall Supplement PatientClass  ](CodeSystem-mii-cs-fall-supplement-patient-class.md) | CodeSystem Supplement für v2-0004 |
| [ MII CS Person Vitalstatus  ](CodeSystem-mii-cs-person-vitalstatus.md) | Vitalstatus des Patienten |

### Beispiel: Beispielinstanzen 

Dies sind Beispielinstanzen, die zeigen, wie Daten aussehen könnten, die von Systemen produziert und konsumiert werden, die mit diesem Implementierungsleitfaden konform sind.

| | |
| :--- | :--- |
| [ MII EXA Base Test Data Bundle 1  ](Bundle-mii-exa-base-test-data-bundle-1.md) | Bundle: collection of example scenario resources as transaction bundle |
| [ MII EXA Diagnose Condition Appendicitis  ](Condition-mii-exa-diagnose-appendicitis.md) | Condition: Acute appendicitis diagnosis as admission diagnosis |
| [ MII EXA Diagnose Condition Contusion Elbow  ](Condition-mii-exa-diagnose-condition-elbow-contusion.md) | Condition: Elbow contusion diagnosis |
| [ MII EXA Diagnose Mehrfachcodierung Primaercode  ](Condition-mii-exa-diagnose-mehrfachcodierung-primaercode.md) | Condition: Primary code (†) - gonococcal bursitis etiology |
| [ MII EXA Diagnose Mehrfachcodierung Sekundaercode  ](Condition-mii-exa-diagnose-mehrfachcodierung-sekundaercode.md) | Condition: Secondary code (*) - bursitis manifestation |
| [ MII EXA Diagnose Multiple Codings  ](Condition-mii-exa-diagnose-condition-multiple-codings.md) | Condition: Multiple coding systems - ICD-10-GM, Alpha-ID, and Orphanet |
| [ MII EXA Fall Kontakt Gesundheitseinrichtung (Abteilungskontakt Chirurgie A2E)  ](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-2.md) | Encounter: Department-level encounter (Abteilungskontakt) for surgical care |
| [ MII EXA Fall Kontakt Gesundheitseinrichtung (Abteilungskontakt Innere Medizin)  ](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-7.md) | Encounter: Department-level encounter (Abteilungskontakt) for Internal Medicine ward care |
| [ MII EXA Fall Kontakt Gesundheitseinrichtung (Abteilungskontakt Notaufnahme A1E)  ](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-9.md) | Encounter: Emergency department encounter as entry point for hospital admission |
| [ MII EXA Fall Kontakt Gesundheitseinrichtung (Ambulanter Kontakt)  ](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-8.md) | Encounter: Example demonstrating an outpatient rheumatology encounter for initial bursitis diagnosis |
| [ MII EXA Fall Kontakt Gesundheitseinrichtung (Einrichtungskontakt E0)  ](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-1.md) | Encounter: Facility-level encounter (Einrichtungskontakt) for entire hospital stay |
| [ MII EXA Fall Kontakt Gesundheitseinrichtung (Planned Encounter)  ](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-3.md) | Encounter: Planned encounter with future dates |
| [ MII EXA Fall Kontakt Gesundheitseinrichtung (Status in-progress)  ](Encounter-mii-exa-fall-kontakt-in-progress-status.md) | Encounter: Status 'in-progress' |
| [ MII EXA Fall Kontakt Gesundheitseinrichtung (Status onleave)  ](Encounter-mii-exa-fall-kontakt-onleave-status.md) | Encounter: Status 'onleave' |
| [ MII EXA Fall Kontakt Gesundheitseinrichtung (Status unknown)  ](Encounter-mii-exa-fall-kontakt-unknown-status.md) | Encounter: Status 'unknown' |
| [ MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt ED Treatment Room VS1)  ](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-11.md) | Encounter: Care unit encounter (Versorgungsstellenkontakt) for ED treatment room |
| [ MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt OR VS3)  ](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-5.md) | Encounter: Care unit encounter (Versorgungsstellenkontakt) for operating room |
| [ MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt PACU VS4)  ](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-6.md) | Encounter: Care unit encounter (Versorgungsstellenkontakt) for post-anesthesia care unit |
| [ MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt Radiology VS2)  ](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-4.md) | Encounter: Care unit encounter (Versorgungsstellenkontakt) for radiology CT procedure |
| [ MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt Surgical Ward VS5)  ](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-10.md) | Encounter: Care unit encounter (Versorgungsstellenkontakt) for surgical ward post-operative care |
| [ MII EXA Person Condition (Todesursache)  ](Condition-mii-exa-person-condition-todesursache.md) | Condition: Cause of Death (Todesursache) |
| [ MII EXA Person Observation Vitalstatus  ](Observation-mii-exa-person-observation-vitalstatus.md) | Observation: Vital status at hospital admission |
| [ MII EXA Person Observation Vitalstatus Discharge  ](Observation-mii-exa-person-observation-vitalstatus-discharge.md) | Observation: Vital status observation at hospital discharge |
| [ MII EXA Person Patient  ](Patient-mii-exa-person-patient-1.md) | Patient: with insurance identifier, name and address |
| [ MII EXA Person Patient Pseudonymisiert  ](Patient-mii-exa-person-patient-pseudonymisiert.md) | Patient: with pseudonym and masked insurance identifier (maskierter Versichertenidentifer) |
| [ MII EXA Prozedur Procedure Appendectomy  ](Procedure-mii-exa-prozedur-procedure.md) | Procedure: Surgical procedure (appendectomy) |
| [ MII EXA Prozedur Procedure Imaging CT Abdomen  ](Procedure-mii-exa-prozedur-imaging.md) | Procedure: Diagnostic imaging procedure (CT abdomen) for appendicitis workup |
| [ MII EXA Prozedur Procedure Physiotherapy  ](Procedure-mii-exa-prozedur-procedure-2.md) | Procedure: Physiotherapy procedure for bursitis treatment |

### Sonstige 

Dies sind Ressourcen, die in diesem Implementierungsleitfaden verwendet werden, die in keine der anderen Kategorien passen.

| |
| :--- |
| [ mii-param-base-manifest  ](Parameters-mii-param-base-manifest.md) |

