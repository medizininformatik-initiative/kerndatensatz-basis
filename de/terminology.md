# Terminologie - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Terminologie

 
Diese Seite enthält Übersetzungen aus der Originalsprache, in der der Leitfaden verfasst wurde. Informationen zu diesen Übersetzungen und Anweisungen zum Abgeben von Feedback zu den Übersetzungen finden Sie[hier](translationinfo.md). 

Diese Seite listet alle ValueSets und CodeSystems auf, die als Teil des MII-Implementierungsleitfadens Kerndatensatz Basis definiert sind. Weitere Informationen zur Verwendung von Codes in diesem Leitfaden finden Sie im Abschnitt [FHIR Terminology](http://hl7.org/fhir/R4/terminologies.html) der FHIR-Spezifikation.

**Wichtiger Hinweis:** CodeSystem-Ressourcen für externe Terminologien (ICD-10-GM, OPS) werden in diesem Modul nicht veröffentlicht, sondern sollten vom MII-Terminologieservice (SU-TermServ) bezogen werden: [https://www.ontoserver.mii-termserv.de/](https://www.ontoserver.mii-termserv.de/)

### ValueSets

Die meisten in diesem Leitfaden verwendeten ValueSets verweisen auf externe Codesysteme wie ICD-10-GM, OPS, SNOMED CT und Orphanet. Die folgenden Abschnitte listen die in diesem Implementierungsleitfaden definierten und verwendeten ValueSets auf, organisiert nach Modulen.

**Hinweis:** Die folgenden ValueSets enthalten keine Expansionen. Für Validierungszwecke MÜSSEN Expansionen über einen FHIR-Terminologieserver erstellt werden.

#### Modul Person ValueSets

* [MII VS Person Vitalstatus](ValueSet-mii-vs-person-vitalstatus.md) - Vitalstatus-Codes

#### Modul Fall ValueSets

* [MII VS Fall Identifier Type Codes](ValueSet-mii-vs-fall-identifier-type-codes.md) - Identifikatortypen für Encounter-Ressourcen
* [MII VS Fall Diagnosis Use](ValueSet-mii-vs-fall-diagnosis-use.md) - Diagnose-Rolle im Behandlungsfallkontext
* [MII VS Fall Location Physical Type](ValueSet-mii-vs-fall-location-physical-type.md) - Physische Typen von Standorten

#### Modul Diagnose ValueSets

* [MII VS Diagnose ICD10GM](ValueSet-mii-vs-diagnose-icd10gm.md) - ICD-10-GM-Codes für Diagnosen (gesetzlich vorgeschrieben in Deutschland gemäß § 301 und § 295 SGB V)
* [MII VS Diagnose DiagnoseCodes SNOMED](ValueSet-mii-vs-diagnose-diagnosecodes-snomed.md) - SNOMED CT-Codes für Diagnosen
* [MII VS Diagnose Orphanet](ValueSet-mii-vs-diagnose-orphanet.md) - Orphanet-Codes für seltene Erkrankungen
* [MII VS Diagnose AlphaID](ValueSet-mii-vs-diagnose-alphaid.md) - Alpha-ID-Codes basierend auf dem ICD-10-GM-alphabetischen Verzeichnis
* [MII VS Diagnose BodyStructure SNOMED](ValueSet-mii-vs-diagnose-bodystructure-snomed.md) - SNOMED CT-Codes für Körperstrukturen/-stellen

#### Modul Prozedur ValueSets

* [MII VS Prozedur OPS](ValueSet-mii-vs-prozedur-ops.md) - OPS-Codes für Prozeduren (deutsches Klassifikationssystem)
* [MII VS Prozedur Prozeduren SNOMEDCT](ValueSet-mii-vs-prozedur-prozeduren-snomedct.md) - SNOMED CT-Codes für Prozeduren
* [MII VS Prozedur OpsKategorien SNOMEDCT](ValueSet-mii-vs-prozedur-opskategorien-snomedct.md) - SNOMED CT-Codes für Prozedur-Kategorien
* [MII VS Prozedur Durchfuehrungsabsicht SNOMEDCT](ValueSet-mii-vs-prozedur-durchfuehrungsabsicht-snomedct.md) - SNOMED CT-Codes für Durchführungsabsicht

-------

### CodeSystems

Eine vollständige Diskussion über Codesysteme und eine Liste der in FHIR verwendeten Codesystemnamen finden Sie im [FHIR Terminologie-Abschnitt](http://hl7.org/fhir/R4/terminologies-systems.html). Die meisten in diesem Leitfaden verwendeten Codesysteme sind in externen Standards oder der FHIR-Basisspezifikation definiert. Die folgenden Codesysteme sind jedoch spezifisch für diesen Leitfaden oder bieten Ergänzungen zu externen Codesystemen.

#### Von der MII definierte CodeSystems

* [MII CS Person Vitalstatus](CodeSystem-mii-cs-person-vitalstatus.md) - Codesystem für Vitalstatus
* [MII CS Diagnose Lebensphase Supplement SNOMED](CodeSystem-mii-cs-diagnose-lebensphase-supplement-snomed.md) - Supplement für SNOMED CT-Lebensphasen-Konzepte mit deutschen Beschreibungen
* [MII CS Fall Supplement ActEncounterCode](CodeSystem-mii-cs-fall-supplement-actencountercode.md) - Ergänzung für HL7 V3 ActEncounterCode
* [MII CS Fall Supplement PatientClass](CodeSystem-mii-cs-fall-supplement-patientclass.md) - Supplement für Behandlungsfall-Klassen-Codes

#### Verwendete externe CodeSystems

Die folgenden externen Codesysteme werden in diesem Implementierungsleitfaden referenziert:

| | | |
| :--- | :--- | :--- |
| ICD-10-GM | `http://fhir.de/CodeSystem/bfarm/icd-10-gm` | Verfügbar über MII TermServ |
| OPS | `http://fhir.de/CodeSystem/bfarm/ops` | Verfügbar über MII TermServ |
| SNOMED CT | `http://snomed.info/sct` | Internationale klinische Terminologie |
| Orphanet | `http://www.orpha.net` | Codes für seltene Erkrankungen |
| Alpha-ID | `http://fhir.de/CodeSystem/bfarm/alpha-id` | ICD-10-GM-alphabetisches Verzeichnis |
| HL7 V2 Table 0203 | `http://terminology.hl7.org/CodeSystem/v2-0203` | Identifikatortypen |
| HL7 V3 ActCode | `http://terminology.hl7.org/CodeSystem/v3-ActCode` | Behandlungsfall-Klassen |
| Diagnosis Role | `http://terminology.hl7.org/CodeSystem/diagnosis-role` | Diagnose-Verwendungscodes |

-------

### German Base Profiles Terminologie

Dieser Implementierungsleitfaden baut auf den [Deutschen FHIR-Basisprofilen](https://ig.fhir.de/basisprofile-de/) auf und verwendet mehrere dort definierte ValueSets und CodeSystems wieder, einschließlich:

* **Kontaktebene** (`http://fhir.de/ValueSet/Kontaktebene`) - Kontaktebenen-Hierarchie
* **Kontaktart** (`http://fhir.de/ValueSet/kontaktart-de`) - Kontaktart
* **EncounterClassDE** (`http://fhir.de/ValueSet/EncounterClassDE`) - Deutsche Behandlungsfall-Klassen-Codes
* **Lebensphase** (`http://fhir.de/ValueSet/lebensphase-de`) - Lebensphasen-Codes

Für detaillierte Mappings und zusätzliche Terminologieressourcen siehe den [Deutsche FHIR-Basisprofile Terminologie-Abschnitt](https://ig.fhir.de/basisprofile-de/1.5.0/ig-markdown-Terminologie-ConceptMaps.html).

-------

### MII-Terminologieservice

Die Medizininformatik-Initiative betreibt einen zentralen Terminologieservice (SU-TermServ), der Folgendes bereitstellt:

* FHIR-basierte Terminologiedienste
* ValueSet-Expansionen
* CodeSystem-Lookups
* ConceptMap-Übersetzungen

**Zugriff:** [https://www.ontoserver.mii-termserv.de/](https://www.ontoserver.mii-termserv.de/)

Dieser Service sollte verwendet werden, um Expansionen von ValueSets zu erhalten und auf externe Codesysteme wie ICD-10-GM und OPS zuzugreifen.

-------

### Kontext der Klassifikationssysteme

#### ICD-10-GM

Gemäß [§ 301](https://www.sozialgesetzbuch-sgb.de/sgbv/301.html) und [§ 295](https://www.sozialgesetzbuch-sgb.de/sgbv/295.html) SGB V ist die Kodierung mit der Internationalen statistischen Klassifikation (ICD-10-GM) für die Abrechnung im deutschen Gesundheitswesen gesetzlich vorgeschrieben.

However, since ICD-10-GM is not sufficiently expressive for many research questions, the MII core dataset also enables coding with additional terminologies and classifications (such as Alpha-ID, SNOMED CT, and Orphanet codes).

#### OPS

The OPS (Operationen- und Prozedurenschlüssel) is the proprietary German classification for operations and procedures. While legally required for billing, SNOMED CT coding is also supported for international interoperability and more detailed documentation.

#### SNOMED CT

SNOMED CT is used throughout this implementation guide to enable:

* International interoperability
* More granular clinical documentation
* Semantic interoperability across systems
* Research use cases requiring detailed clinical concepts

-------

For a complete listing of all terminology resources, see the [Artifacts Overview](artifacts.md).

