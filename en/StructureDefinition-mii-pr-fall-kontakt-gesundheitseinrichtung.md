# MII PR Fall Kontakt mit einer Gesundheitseinrichtung - MII Implementation Guide Core Dataset Base v2026.0.0

## Resource Profile: MII PR Fall Kontakt mit einer Gesundheitseinrichtung 

 
Kontakt zu einer Einrichtung, Abteilung oder Versorgungsstelle 

**Example Usage Scenarios:**

* Document a patient's facility contact (Einrichtungskontakt) representing the overall stay at a healthcare institution from admission to discharge, including admission reason and discharge disposition
* Track department contacts (Abteilungskontakt) when a patient is transferred between different departments within the same facility stay, capturing department codes and timing
* Record care unit contacts (Versorgungsstellenkontakt) for specific care locations such as normal ward, intensive care unit, or operating room within a department
* Model hierarchical encounter structures using `partOf` to link Versorgungsstellenkontakt → Abteilungskontakt → Einrichtungskontakt
* Support feasibility queries by counting encounters/cases with specific characteristics (e.g., inpatient cases, intensive care stays, emergency admissions)
* Document planned encounters with expected admission and discharge dates for pre-admission planning

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the MII Kontakt Gesundheitseinrichtung Profile.

#### Encounter Hierarchies and Contact Levels

The MII Fall module distinguishes three levels of encounters using `Encounter.type:Kontaktebene`:

* **Einrichtungskontakt (Facility Contact)**: Top-level encounter representing the entire stay/visit at a healthcare facility
* **Abteilungskontakt (Department Contact)**: Encounter at a specific department within the facility
* **Versorgungsstellenkontakt (Care Unit Contact)**: Encounter at a specific care unit or ward

These levels are linked using `Encounter.partOf` to create a hierarchical structure.

**Example Encounter Hierarchy:**

The following diagram illustrates how different encounter levels are linked together using `partOf` references, along with optional connections to EpisodeOfCare and Account resources:

```
%%{init: {'flowchart': {'htmlLabels': false}, 'theme': 'base', 'themeVariables': {'primaryColor': '#E8F4F8', 'primaryBorderColor': '#406A99', 'primaryTextColor': '#000000', 'lineColor': '#5C8DB3', 'fontSize': '14px'}}}%%
graph BT

  %% TOP LAYER
  EP1["`**EpisodeOfCare EP1**
       Appendizitis`"]
  
  A1["`**Account A1**
      DRG G23B
      Appendektomie ohne schwere CC`"]

  %% FACILITY LEVEL
  E0["`**Encounter E0**
      _(Einrichtungskontakt)_`"]

  E0 -->|episodeOfCare| EP1
  E0 -->|account| A1

  %% DEPARTMENT LEVEL
  A1E["`**Encounter A1**
       _(Abteilungskontakt)_
       Notaufnahme`"]
  
  A2E["`**Encounter A2**
       _(Abteilungskontakt)_
       Allgemeinchirurgie`"]

  A1E -->|partOf| E0
  A2E -->|partOf| E0

  %% CARE UNIT LEVEL
  VS1["`**Encounter VS1**
       Notaufnahme
       Behandlungsraum 3`"]
  
  VS2["`**Encounter VS2**
       Radiologie
       CT Abdomen`"]
  
  VS3["`**Encounter VS3**
       OP-Saal 4
       Laparoskopische Appendektomie`"]
  
  VS4["`**Encounter VS4**
       Aufwachraum PACU`"]
  
  VS5["`**Encounter VS5**
       Chirurgische Station C3`"]

  VS1 -->|partOf| A1E
  VS2 -->|partOf| A2E
  VS3 -->|partOf| A2E
  VS4 -->|partOf| A2E
  VS5 -->|partOf| A2E

```

In this example:

* **E0** represents the overall facility contact (Einrichtungskontakt) for the hospital stay
* **A1E** is the department contact (Abteilungskontakt) for the Emergency Department (Notaufnahme)
* **A2E** is the department contact (Abteilungskontakt) for General Surgery (Allgemeinchirurgie)
* **VS1-VS5** are care unit contacts (Versorgungsstellenkontakte) for specific locations: Emergency treatment room 3, Radiology CT, OR 4 (laparoscopic appendectomy), PACU, and Surgical Ward C3
* The hierarchy is established through `partOf` references pointing upward from care units to departments to facility
* **EP1** (EpisodeOfCare) and **A1** (Account) are shown for completeness but are not currently part of the MII Kerndatensatz specification. Note that for simplicity, only E0 is shown referencing these resources, but in practice any encounter in the hierarchy can reference the EpisodeOfCare and Account it belongs to.

#### Representation of Encounter Types in FHIR

##### Primary Encounters

Based on the [FHIR DE Basisprofile guidance](https://ig.fhir.de/basisprofile-de/1.4.0/Ressourcen-AmbulanterStationaererFall.html):

| | | |
| :--- | :--- | :--- |
| Ambulant (Outpatient) | O | `Encounter.class = AMB` |
| Ambulantes Operieren (Outpatient Surgery) | O | `Encounter.class = AMB``Encounter.type = operation` |
| Stationär (Inpatient) | I | `Encounter.class = IMP` |
| Normalstationär (Normal Ward) | I | `Encounter.class = IMP``Encounter.type = normalstationaer` |
| Intensivstationär (Intensive Care) | I | `Encounter.class = IMP``Encounter.type = intensivstationaer` |
| Wiederaufnahme (Readmission) | R | `Encounter.class = IMP``Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle = 07` |
| Voraufnahme (Pre-admission) | P | `Encounter.class = PRENC` |
| Virtuell (Virtual) | - | `Encounter.class = VR` |
| Vorstationär (Pre-inpatient) | V | `Encounter.class = AMB``Encounter.type = vorstationaer` |
| Nachstationär (Post-inpatient) | NS | `Encounter.class = AMB``Encounter.type = nachstationaer` |
| Teilstationär (Partial Inpatient) | TS | `Encounter.class = IMP`or`SS``Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle = 03``Encounter.type = teilstationaer | tagesklinik | nachtklinik` |
| Begleitperson (Accompanying Person) | H | `Encounter.class = IMP``Encounter.type = begleitperson` |
| Stationsäquivalent (Hospital-equivalent Home Care) | - | `Encounter.class = HH``Encounter.type = stationsaequivalent``Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle = 10` |
| Entbindung (Delivery) | - | `Encounter.class = IMP``Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle = 05` |
| Notfall (Emergency) | - | `Encounter.class = AMB``Encounter.extension:Aufnahmegrund.VierteStelle = 7`If subsequent inpatient admission occurs:`Encounter.hospitalization.admitSource = "N"`To emphasize treatment urgency:`Encounter.priority = http://terminology.hl7.org/CodeSystem/v3-ActPriority|EM` |

##### Secondary Encounters During Inpatient Stay

| | | |
| :--- | :--- | :--- |
| Untersuchung und Behandlung (Examination and Treatment) | - | `Encounter.class = IMP``Encounter.type = ub` |
| Konsil (Consultation) | - | `Encounter.class = IMP``Encounter.type = konsil` |
| Operation (Surgery) | - | `Encounter.class = IMP``Encounter.type = operation` |

#### Encounter Diagnosis

The `Encounter.diagnosis` element establishes the relationship between encounters and diagnoses/procedures, specifying their role within the encounter context.

##### Best Practice - Diagnosis-Encounter Relationships

The reference from `Encounter.diagnosis` to `Condition` should be used when the Condition has a specific role during the Encounter (e.g., primary diagnosis, secondary diagnosis).

**Recommended Implementation:**

Use `Condition.encounter` to reference from the Condition to the Encounter of type **Abteilungskontakt (Department Contact)**. This approach establishes the general encounter context for the diagnosis, while `Encounter.diagnosis` can be used to specify particular diagnosis roles when needed.

##### Best Practice - Encounter.diagnosis.use

Since `Encounter.diagnosis.use` has cardinality 1..1, a diagnosis with multiple roles within an encounter requires multiple `Encounter.diagnosis` entries, each with a different `use` value.

**Example:** If a Condition serves as both a Diagnosetyp and a Diagnosesubtyp (or additional roles such as CC/CM), create separate `Encounter.diagnosis` references for each role, all pointing to the same Condition resource. A single Condition can be referenced multiple times with different `use` values.

**Note on CC/CM Classification:** If you want to classify a diagnosis as CC (Complication or Comorbidity) or CM (Comorbidity), this is typically billing-related information and should be placed in the Account resource rather than in `Encounter.diagnosis`. The Account resource is the appropriate location for billing case context and DRG-relevant classifications.

#### Encounter Location

* Location details (room, bed, ward) can be specified using `Encounter.location`.
* The physical type **SHOULD** use the MII-specific ValueSet for location physical types.
* Location details are primarily relevant for Versorgungsstellenkontakt (care unit contacts).

#### Planned Encounters

Planned encounters are represented with `Encounter.status = planned` and **SHOULD** include:

* `Encounter.extension:plannedStartDate` for the planned start date
* `Encounter.extension:plannedEndDate` for the planned end date

#### Admission and Discharge

* **Admission source** (Aufnahmeanlass) is mandatory when hospitalization data is provided and uses codes from § 301 SGB V.
* **Admission reason** (Aufnahmegrund) with four-part structure (erste und zweite Stelle, dritte Stelle, vierte Stelle) according to § 301 SGB V.
* **Discharge disposition** with Entlassungsgrund extension provides detailed discharge/transfer reasons.

#### Encounter Identification

Each Encounter **SHOULD** have a unique identifier. When encounters are organized in a hierarchy:

* Ensure correct encounter linking via `Encounter.partOf`
* Each encounter **SHOULD** have a distinct identifier with different systems or values

**Case Number Representation:**

The "Fallnummer" (case number) is frequently used in inpatient care to establish the case context for medical documentation, particularly in HL7 V2 communication.

In most cases, the "Fallnummer" is a unique identifier for the billing case (Account). Therefore, the Fallnummer should be seen as an identifier of the Account and is not suitable for uniquely identifying an Encounter. To find the correct Encounter, additional criteria such as period (`Encounter.period`), class (`Encounter.class`), or status (`Encounter.status`) must be considered.

**Previous Recommendation:**

Previously, it was recommended that the Aufnahmenummer (admission number) should be provided across all Encounter resources regardless of contact level and type. However, this recommendation did not clearly distinguish between Aufnahmenummer and Fallnummer.

##### Best Practice - Aufnahmenummer vs. Fallnummer

**Note: This guidance is based on the[ISiK specification](https://simplifier.net/packages/de.gematik.isik/5.1.0/files/3020028).**

It is important to distinguish between:

* **Aufnahmenummer (Admission Number):** A unique identifier assigned to a patient during admission planning or at admission itself. Each Encounter **SHOULD** have its own unique Aufnahmenummer in `Encounter.identifier:Aufnahmenummer` where applicable.
* **Fallnummer (Case Number):** Typically identifies the billing case (Account), not individual encounters.

**Account References and Billing Context:**

The reference to an Account establishes the billing context for one or more Encounters. Using the Account reference, multiple encounters can be grouped together into a single billing case (e.g., a "DRG-Fall" comprising pre-inpatient, inpatient, and post-inpatient visits).

**Note:** If you want to implement the billing case (Abrechnungsfall), it is recommended to use the [ISiK Account profile](https://simplifier.net/packages/de.gematik.isik/5.1.0/files/3019857).

**Important Note for Implementers:** In German healthcare terminology, the term "Fall" (case) usually refers to the billing context, not individual encounters. Therefore, the "Fallnummer" is not the identifier of the Encounter, but rather the identifier of the Account that the Encounter references. This enables multiple encounters to be associated with a single Fallnummer.

**Logical References for Search:**

Since the Fallnummer is a frequently used search criterion, it **SHOULD** be provided as a logical reference (`account.identifier`) in the Encounter. This ensures that the Fallnummer is available as a search parameter for finding Encounters, even when:

* Individual systems do not support chaining
* Individual users lack viewing permissions for billing data
* Users in the care context need to search for Encounters using the associated Fallnummer

**Usages:**

* Examples for this Profile: [Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-1](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-1.md), [Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-10](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-10.md), [Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-11](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-11.md), [Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-2](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-2.md)...Show 10 more,[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-3](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-3.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-4](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-4.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-5](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-5.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-6](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-6.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-7](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-7.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-8](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-8.md),[Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-9](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-9.md),[Encounter/mii-exa-fall-kontakt-in-progress-status](Encounter-mii-exa-fall-kontakt-in-progress-status.md),[Encounter/mii-exa-fall-kontakt-onleave-status](Encounter-mii-exa-fall-kontakt-onleave-status.md)and[Encounter/mii-exa-fall-kontakt-unknown-status](Encounter-mii-exa-fall-kontakt-unknown-status.md)
* CapabilityStatements using this Profile: [MII CPS Fall CapabilityStatement](CapabilityStatement-mii-cps-fall-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.medizininformatikinitiative.kerndatensatz.base|current/StructureDefinition/mii-pr-fall-kontakt-gesundheitseinrichtung)

**Changes since version {current}:**

* New Content

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.csv), [Excel](../StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.xlsx), [Schematron](../StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-fall-kontakt-gesundheitseinrichtung",
  "extension" : [
    {
      "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-ex-meta-license-codeable",
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://hl7.org/fhir/spdx-license",
            "code" : "CC-BY-4.0",
            "display" : "Creative Commons Attribution 4.0 International"
          }
        ]
      }
    }
  ],
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung",
  "version" : "2026.0.0",
  "name" : "MII_PR_Fall_KontaktGesundheitseinrichtung",
  "title" : "MII PR Fall Kontakt mit einer Gesundheitseinrichtung",
  "_title" : {
    "extension" : [
      {
        "extension" : [
          {
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Fall - Kontakt mit einer Gesundheitseinrichtung"
          }
        ],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      },
      {
        "extension" : [
          {
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Treatment case - Encounter with Health Care Facility"
          }
        ],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }
    ]
  },
  "status" : "active",
  "date" : "2025-12-12",
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
  "description" : "Kontakt zu einer Einrichtung, Abteilung oder Versorgungsstelle",
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
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Encounter",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Encounter",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Encounter",
        "path" : "Encounter",
        "constraint" : [
          {
            "key" : "mii-enc-1",
            "severity" : "error",
            "human" : "Falls der Encounter abgeschlossen wurde, MUSS ein Enddatum bekannt sein",
            "expression" : "status = 'finished' implies period.end.exists()",
            "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
          },
          {
            "key" : "mii-enc-2",
            "severity" : "error",
            "human" : "Abgeschlossene, stationäre Kontakte MÜSSEN einen Start- und End-Zeitpunkt angeben",
            "expression" : "status = 'finished' and class = 'IMP' implies period.start.exists() and period.end.exists()",
            "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
          },
          {
            "key" : "mii-enc-3",
            "severity" : "error",
            "human" : "Geplante Kontakte DÜRFEN NICHT einen Start- oder End-Zeitpunkt angeben",
            "expression" : "status = 'planned' implies period.exists().not()",
            "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
          },
          {
            "key" : "mii-enc-4",
            "severity" : "warning",
            "human" : "Geplante Kontakte SOLLTEN die Extensions für den geplanten Start- oder End-Zeitpunkt verwenden",
            "expression" : "status = 'planned' implies extension.where(url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedStartDate').exists()",
            "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
          },
          {
            "key" : "mii-enc-5",
            "severity" : "error",
            "human" : "In-Durchführung befindliche Kontakte MÜSSEN einen Start-Zeitpunkt angeben",
            "expression" : "status = 'in-progress' implies period.start.exists()",
            "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
          },
          {
            "key" : "mii-enc-6",
            "severity" : "error",
            "human" : "Kontakte mit Abwesenheitsstatus MÜSSEN einen Start-Zeitpunkt angeben",
            "expression" : "status = 'onleave' implies period.start.exists()",
            "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
          },
          {
            "key" : "mii-enc-7",
            "severity" : "warning",
            "human" : "Kontakte mit unbekannten Status SOLLTEN einen Start-Zeitpunkt angeben",
            "expression" : "status = 'unknown' implies period.start.exists()",
            "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
          }
        ]
      },
      {
        "id" : "Encounter.id",
        "path" : "Encounter.id",
        "definition" : "Angabe OPTIONAL, vom Server automatisch vergebene system-abhängige ID",
        "mustSupport" : true
      },
      {
        "id" : "Encounter.meta",
        "path" : "Encounter.meta",
        "definition" : "Angabe OPTIONAL zur Provenance und zum Profil",
        "mustSupport" : true
      },
      {
        "id" : "Encounter.meta.source",
        "path" : "Encounter.meta.source",
        "mustSupport" : true
      },
      {
        "id" : "Encounter.meta.profile",
        "path" : "Encounter.meta.profile",
        "mustSupport" : true
      },
      {
        "id" : "Encounter.extension",
        "path" : "Encounter.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "Encounter.extension:Aufnahmegrund",
        "path" : "Encounter.extension",
        "sliceName" : "Aufnahmegrund",
        "short" : "Aufnahmegrund",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Aufnahmegrund"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Admission reason"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "OPTIONAL, Aufnahmegrund entsprechend Schlüssel 1 der Anlage 2 der Datenübermittlung nach § 301 Abs. 3 SGB V",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Aufnahmegrund nach Schlüssel 1, Anlage 2, Datenübermittlung nach § 301 Abs. 3 SGB V"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Admission reason according to key 1, appendix 2, data transmission according to § 301 para. 3 SGB V"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://fhir.de/StructureDefinition/Aufnahmegrund"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle",
        "path" : "Encounter.extension.extension",
        "sliceName" : "ErsteUndZweiteStelle",
        "short" : "1. und 2. Stelle",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "1. und 2. Stelle"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "1st and 2nd position"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "OPTIONAL, Aufnahmegrund (1. und 2. Stelle), Datenübermittlung nach § 301 Abs. 3 SGB V.",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Aufnahmegrund 1. und 2. Stelle"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Admission reason 1st and 2nd position"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Encounter.extension:Aufnahmegrund.extension:DritteStelle",
        "path" : "Encounter.extension.extension",
        "sliceName" : "DritteStelle",
        "short" : "3. Stelle",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "3. Stelle"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "3rd position"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "OPTIONAL, Aufnahmegrund (3. Stelle), Datenübermittlung nach § 301 Abs. 3 SGB V.",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Aufnahmegrund 3. Stelle"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Admission reason 3rd position"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Encounter.extension:Aufnahmegrund.extension:VierteStelle",
        "path" : "Encounter.extension.extension",
        "sliceName" : "VierteStelle",
        "short" : "4. Stelle",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "4. Stelle"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "4th position"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "OPTIONAL, Aufnahmegrund (4. Stelle), Datenübermittlung nach § 301 Abs. 3 SGB V.",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Aufnahmegrund 4. Stelle"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Admission reason 4th position"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Encounter.extension:plannedStartDate",
        "path" : "Encounter.extension",
        "sliceName" : "plannedStartDate",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedStartDate"
            ]
          }
        ]
      },
      {
        "id" : "Encounter.extension:plannedEndDate",
        "path" : "Encounter.extension",
        "sliceName" : "plannedEndDate",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedEndDate"
            ]
          }
        ]
      },
      {
        "id" : "Encounter.identifier",
        "path" : "Encounter.identifier",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "short" : "Identifikator",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Identifikator"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Identifier"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Kennung/en, unter der/denen dieser Kontakt bekannt ist.",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Kennung/en, unter der/denen dieser Kontakt bekannt ist."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Identifier/s by which this encounter is known."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Encounter.identifier:Aufnahmenummer",
        "path" : "Encounter.identifier",
        "sliceName" : "Aufnahmenummer",
        "short" : "Aufnahmenummer",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Aufnahmenummer"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Admission number"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "OPTIONAL, Ein eindeutiger Identifier, der einem Patienten bei der Aufnahmeplanung oder bei der Aufnahme selbst zugewiesen wird.\nJeder Encounter SOLLTE seine eigene eindeutige Aufnahmenummer haben. Die Aufnahmenummer ist nicht die Fallnummer, \nwelche sich auf den kompletten Abrechnungsfall bezieht. Hier wird ein Identifier angegeben, der den Kontakt eindeutig identifiziert.",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Aufnahmenummer/Fallnummer, die Patient:in bei einer Aufnahme bekommt."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Admission number, the patient receives during an admission."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "min" : 0,
        "max" : "1",
        "patternIdentifier" : {
          "type" : {
            "coding" : [
              {
                "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
                "code" : "VN"
              }
            ]
          }
        },
        "mustSupport" : true
      },
      {
        "id" : "Encounter.identifier:Aufnahmenummer.type",
        "path" : "Encounter.identifier.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
              "code" : "VN"
            }
          ]
        },
        "mustSupport" : true,
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/identifier-type-codes"
        }
      },
      {
        "id" : "Encounter.identifier:Aufnahmenummer.type.coding",
        "path" : "Encounter.identifier.type.coding",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Encounter.identifier:Aufnahmenummer.type.coding:vn-type",
        "path" : "Encounter.identifier.type.coding",
        "sliceName" : "vn-type",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
          "code" : "VN"
        },
        "mustSupport" : true
      },
      {
        "id" : "Encounter.identifier:Aufnahmenummer.type.coding:vn-type.system",
        "path" : "Encounter.identifier.type.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Encounter.identifier:Aufnahmenummer.type.coding:vn-type.code",
        "path" : "Encounter.identifier.type.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Encounter.identifier:Aufnahmenummer.system",
        "path" : "Encounter.identifier.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Encounter.identifier:Aufnahmenummer.value",
        "path" : "Encounter.identifier.value",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Encounter.status",
        "path" : "Encounter.status",
        "short" : "Status",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Status"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "status"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "VERPFLICHTEND, required Binding auf http://fhir.de/ValueSet/EncounterStatusDe",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "geplant | im Gange | beurlaubt | abgeschlossen | abgebrochen | fehlerhafte Eingabe | unbekannt"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "planned | in-progress | onleave | finished | cancelled | entered-in-error | unknown"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.de/ValueSet/EncounterStatusDe"
        }
      },
      {
        "id" : "Encounter.class",
        "path" : "Encounter.class",
        "short" : "Kontaktklasse",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Kontaktklasse"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Classification of patient encounter"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "VERPFLICHTEND, Kontaktklasse. Required Binding auf http://fhir.de/ValueSet/EncounterClassDE. \nKlassifizierung des Kontaktes in stationär, ambulant, teilstationär oder andere.",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "ambulant | stationär | vorstationär | virtuell | teilstationär | häusliche Pflege"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "ambulatory | inpatient encounter | pre-admission | virtual | short stay | home health"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.de/ValueSet/EncounterClassDE"
        }
      },
      {
        "id" : "Encounter.type",
        "path" : "Encounter.type",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "short" : "Kontakttyp",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Typ des Kontaktes"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Type of encounter"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Spezifischer Typ des Kontaktes",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Spezifischer Typ des Kontaktes"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Specific type of encounter"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Encounter.type:Kontaktebene",
        "path" : "Encounter.type",
        "sliceName" : "Kontaktebene",
        "short" : "Kontaktebene",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Kontaktebene"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Level of encounter"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "OPTIONAL, Unterscheidung der Kontakt-Hierarchieebenen Einrichtungskontakt, Abteilungskontakt, Versorgungsstellenkontakt. \nDie Gliederung gilt für stationäre Kontakte. Required Binding auf http://fhir.de/ValueSet/kontaktebene-de",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Unterscheidung der Kontakt-Hierarchieebenen: Einrichtungskontakt | Abteilungskontakt | Versorgungsstellenkontakt"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Differentiation of the encounter hierarchy levels: facility contact | department contact | care provider contact"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "min" : 0,
        "max" : "1",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.de/CodeSystem/Kontaktebene"
            }
          ]
        },
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "description" : "Kontaktebene",
          "valueSet" : "http://fhir.de/ValueSet/kontaktebene-de"
        }
      },
      {
        "id" : "Encounter.type:KontaktArt",
        "path" : "Encounter.type",
        "sliceName" : "KontaktArt",
        "short" : "Kontaktart",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Kontaktart"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Type of encounter"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "OPTIONAL, Differenzierung zwischen verschiedenen Arten von Kontakten (z.B. vorstationär, nachstationär, intensivstationär). \nRequired Binding auf http://fhir.de/ValueSet/kontaktart-de",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Kontaktarten wie vorstationär | nachstationär | intensivstationär"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Type of encounter such as pre-admission | post-admission | intensive care"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "min" : 0,
        "max" : "1",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.de/CodeSystem/kontaktart-de"
            }
          ]
        },
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.de/ValueSet/kontaktart-de"
        }
      },
      {
        "id" : "Encounter.serviceType",
        "path" : "Encounter.serviceType",
        "short" : "Fachabteilung",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Fachabteilung"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Department"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Die Fachdisziplin bzw. Fachabteilung wird durch einen vierstelligen Fachabteilungsschlüssel klassifiziert.",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Fachabteilung Klassifizierung durch Fachabteilungsschlüssel"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Department classification by department key"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Encounter.serviceType.coding",
        "path" : "Encounter.serviceType.coding",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "mustSupport" : true
      },
      {
        "id" : "Encounter.serviceType.coding:Fachabteilungsschluessel",
        "path" : "Encounter.serviceType.coding",
        "sliceName" : "Fachabteilungsschluessel",
        "short" : "Fachabteilungsschlüssel",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Fachabteilungsschlüssel"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Department key"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "OPTIONAL, required Binding auf http://fhir.de/ValueSet/dkgev/Fachabteilungsschluessel\nFachabteilungen gemäß Anhang 1 der BPflV in der am 31.12.2003 geltenden Fassung",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Fachabteilungen gemäß Anhang 1 der Bundespflegesatzverordnung"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Departments according to appendix 1 of the Bundespflegesatzverordnung"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "min" : 0,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel"
        },
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.de/ValueSet/dkgev/Fachabteilungsschluessel"
        }
      },
      {
        "id" : "Encounter.serviceType.coding:Fachabteilungsschluessel.system",
        "path" : "Encounter.serviceType.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Encounter.serviceType.coding:Fachabteilungsschluessel.code",
        "path" : "Encounter.serviceType.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Encounter.serviceType.coding:ErweiterterFachabteilungsschluessel",
        "path" : "Encounter.serviceType.coding",
        "sliceName" : "ErweiterterFachabteilungsschluessel",
        "short" : "Erweiterter Fachabteilungsschlüssel",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Erweiterter Fachabteilungsschlüssel"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Extended department key"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "OPTIONAL, required Binding auf http://fhir.de/ValueSet/dkgev/Fachabteilungsschluessel-erweitert\nFachabteilungen gemäß Anhang 1 der BPflV in der am 31.12.2003 geltenden Fassung inkl. Spezialisierungen.",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Fachabteilungen gemäß Anhang 1 der Bundespflegesatzverordnung"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Departments according to appendix 1 of the Bundespflegesatzverordnung"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "min" : 0,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel-erweitert"
        },
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.de/ValueSet/dkgev/Fachabteilungsschluessel-erweitert"
        }
      },
      {
        "id" : "Encounter.serviceType.coding:ErweiterterFachabteilungsschluessel.system",
        "path" : "Encounter.serviceType.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Encounter.serviceType.coding:ErweiterterFachabteilungsschluessel.code",
        "path" : "Encounter.serviceType.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Encounter.subject",
        "path" : "Encounter.subject",
        "short" : "Patientenidentifikator",
        "definition" : "VERPFLICHTEND, Referenz auf Patient:in.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Encounter.period",
        "path" : "Encounter.period",
        "short" : "Zeitraum des Kontaktes",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Zeitraum des Kontaktes"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Period of encounter"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Beginn- und Endzeitpunkt des Kontaktes. \n    DARF NICHT vorhanden sein, kann OPTIONAL oder VERPFLICHTEND sein, \n    abhängig vom Status des Kontaktes - siehe Invarianten auf Ebene Encounter.",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Beginn- und Endzeitpunkt des Kontaktes."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Start and end time of the encounter."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Encounter.period.start",
        "path" : "Encounter.period.start",
        "short" : "Beginndatum",
        "definition" : "Start des Kontaktzeitraums. DARF NICHT vorhanden sein, kann OPTIONAL oder VERPFLICHTEND sein, \nabhängig vom Status des Kontaktes - siehe Invarianten auf Ebene Encounter.",
        "mustSupport" : true
      },
      {
        "id" : "Encounter.period.end",
        "path" : "Encounter.period.end",
        "short" : "Enddatum",
        "definition" : "Ende des Kontaktzeitraums. DARF NICHT vorhanden sein, kann OPTIONAL oder VERPFLICHTEND sein, \nabhängig vom Status des Kontaktes - siehe Invarianten auf Ebene Encounter.",
        "mustSupport" : true
      },
      {
        "id" : "Encounter.diagnosis",
        "path" : "Encounter.diagnosis",
        "short" : "Diagnosen",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Diagnosen"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Diagnoses"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "OPTIONAL, Verweis auf Diagnosen/Prozeduren, die eine besondere Rolle im Kontext eines Encounters haben.\nDer Fallbezug von Diagnosen und Prozeduren wird über das jeweilige encounter-Element der Condition bzw. Procedure-Ressource hinreichend etabliert. \nDie zusätzliche Rückverlinkung von Encounter.diagnosis auf Condition/Procedure wird nur dann verwendet, \nwenn einer Diagnose bzw. Prozedur im Kontext eines Aufenthaltes eine besondere Rolle zugewiesen werden soll, \nz.B. Haupt-/Neben-/Aufnahme- oder Überweisungsdiagnose).",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Angaben zu für den Kontakt relevanten Diagnosen"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Information about diagnoses relevant for the encounter"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Encounter.diagnosis.condition",
        "path" : "Encounter.diagnosis.condition",
        "short" : "Referenz zu Diagnose-Ressource",
        "definition" : "VERPFLICHTEND, wenn Diagnosedaten angegeben werden, dann MUSS diese referenziert werden. \nBei ICD-10 Primär- und Sekundärcodes SOLLTE nur die Primärdiagnose referenziert werden.",
        "mustSupport" : true
      },
      {
        "id" : "Encounter.diagnosis.use",
        "path" : "Encounter.diagnosis.use",
        "short" : "Diagnosetyp",
        "definition" : "Attribute wie Aufnahme- oder Entlassdiagnose sind immer im Kontext eines stationären Aufenthaltes zu betrachten\nund werden daher als Eigenschaft des Encounters modelliert. \nVERPFLICHTEND mindestens die Angabe eines Codings. EMPFOHLEN ist die Angabe mittels Diagnosetyp- und DiagnosesubTyp-Coding. \nWeitere Codings OPTIONAL. Extensible Binding auf `http://hl7.org/fhir/ValueSet/diagnosis-role`",
        "min" : 1,
        "mustSupport" : true,
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/mii-vs-fall-diagnosis-use"
        }
      },
      {
        "id" : "Encounter.diagnosis.use.coding",
        "path" : "Encounter.diagnosis.use.coding",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Encounter.diagnosis.use.coding:Diagnosetyp",
        "path" : "Encounter.diagnosis.use.coding",
        "sliceName" : "Diagnosetyp",
        "short" : "Diagnosetyp",
        "definition" : "Einweisungs-/Überweisungsdiagnose | Behandlungsrelevante Diagnosen",
        "min" : 0,
        "max" : "1",
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.de/ValueSet/DiagnoseTyp"
        }
      },
      {
        "id" : "Encounter.diagnosis.use.coding:DiagnosesubTyp",
        "path" : "Encounter.diagnosis.use.coding",
        "sliceName" : "DiagnosesubTyp",
        "short" : "Diagnosesubtyp",
        "definition" : "Operationsdiagnose | Abteilung Hauptdiagnose | Todesursache | Infektionsschutzdiagnose +",
        "min" : 0,
        "max" : "1",
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.de/ValueSet/Diagnosesubtyp"
        }
      },
      {
        "id" : "Encounter.diagnosis.rank",
        "path" : "Encounter.diagnosis.rank",
        "short" : "Rangfolge",
        "definition" : "OPTIONAL, Rangfolge der Diagnose",
        "mustSupport" : true
      },
      {
        "id" : "Encounter.account",
        "path" : "Encounter.account",
        "short" : "Abrechnungskontext",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Abrechnungskontext"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Billing Context"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "OPTIONAL. Referenz auf den Abrechnungsfall. Eine logische Referenz ist ausreichend zur Abbildung des Abrechnungskontextes.",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Referenz auf den Abrechnungsfall."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Reference to the billing case."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Encounter.hospitalization",
        "path" : "Encounter.hospitalization",
        "short" : "Klinikaufenthalt",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Klinikaufenthalt"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Hospitalization"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Klinikaufenthalt"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Hospitalization"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "OPTIONAL, Details zur Aufnahme und Entlassung",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Details zur Aufnahme und Entlassung"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Details about admission and discharge"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Encounter.hospitalization.admitSource",
        "path" : "Encounter.hospitalization.admitSource",
        "short" : "Aufnahmeanlass",
        "definition" : "VERPFLICHTEND, Aufnahmeanlass. Preferred Binding auf http://fhir.de/ValueSet/dgkev/Aufnahmeanlass",
        "min" : 1,
        "mustSupport" : true,
        "binding" : {
          "strength" : "preferred",
          "valueSet" : "http://fhir.de/ValueSet/dgkev/Aufnahmeanlass"
        }
      },
      {
        "id" : "Encounter.hospitalization.dischargeDisposition",
        "path" : "Encounter.hospitalization.dischargeDisposition",
        "short" : "Entlassung",
        "definition" : "OPTIONAL Daten zur Entlassung",
        "mustSupport" : true
      },
      {
        "id" : "Encounter.hospitalization.dischargeDisposition.extension:Entlassungsgrund",
        "path" : "Encounter.hospitalization.dischargeDisposition.extension",
        "sliceName" : "Entlassungsgrund",
        "short" : "Entlassungsgrund",
        "definition" : "OPTIONAL, Entlassungs-/Verlegungsgrund nach § 301 Abs. 3 SGB V",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://fhir.de/StructureDefinition/Entlassungsgrund"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Encounter.location",
        "path" : "Encounter.location",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "physicalType"
            },
            {
              "type" : "pattern",
              "path" : "status"
            }
          ],
          "rules" : "open"
        },
        "short" : "Kontaktort",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Kontaktort"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Location"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "OPTIONAL, Details zum Kontaktort wie Zimmer, Bett, Station",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Details zum Kontaktort wie Zimmer, Bett, Station"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Details about location such as room, bed, ward"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        }
      },
      {
        "id" : "Encounter.location.physicalType",
        "path" : "Encounter.location.physicalType",
        "short" : "Kontaktorttyp",
        "definition" : "SOLL, extensible Binding auf https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/location-physical-type",
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/location-physical-type"
        }
      },
      {
        "id" : "Encounter.location:Zimmer",
        "path" : "Encounter.location",
        "sliceName" : "Zimmer",
        "short" : "Zimmer",
        "definition" : "Von Patient oder Patientin während des Kontaktes belegtes Zimmer auf einer Station.",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Encounter.location:Zimmer.status",
        "path" : "Encounter.location.status",
        "min" : 1,
        "patternCode" : "active",
        "mustSupport" : true
      },
      {
        "id" : "Encounter.location:Zimmer.physicalType",
        "path" : "Encounter.location.physicalType",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
              "code" : "ro"
            }
          ]
        }
      },
      {
        "id" : "Encounter.location:Bett",
        "path" : "Encounter.location",
        "sliceName" : "Bett",
        "short" : "Bett",
        "definition" : "Von Patient oder Patientin während des Kontaktes belegter Bettenstellplatz.",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Encounter.location:Bett.status",
        "path" : "Encounter.location.status",
        "min" : 1,
        "patternCode" : "active",
        "mustSupport" : true
      },
      {
        "id" : "Encounter.location:Bett.physicalType",
        "path" : "Encounter.location.physicalType",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
              "code" : "bd"
            }
          ]
        }
      },
      {
        "id" : "Encounter.location:Station",
        "path" : "Encounter.location",
        "sliceName" : "Station",
        "short" : "Station",
        "definition" : "Die Station, auf welcher der Patient oder die Patientin während des Kontaktes behandelt wurde.",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Encounter.location:Station.status",
        "path" : "Encounter.location.status",
        "min" : 1,
        "patternCode" : "active",
        "mustSupport" : true
      },
      {
        "id" : "Encounter.location:Station.physicalType",
        "path" : "Encounter.location.physicalType",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
              "code" : "wa"
            }
          ]
        }
      },
      {
        "id" : "Encounter.serviceProvider",
        "path" : "Encounter.serviceProvider",
        "short" : "Leistungserbringer",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Leistungserbringer"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Service Provider"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "OPTIONAL. Leistungserbringer, der für den Kontakt verantwortlich ist. \nReferenz auf eine Organisation",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Leistungserbringer, der für den Kontakt verantwortlich ist."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Service provider responsible for the encounter."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        }
      },
      {
        "id" : "Encounter.partOf",
        "path" : "Encounter.partOf",
        "short" : "Teil von Kontakt",
        "_short" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Teil von Kontakt"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Part of encounter"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "OPTIONAL. Abbildung der Hierarchie zwischen Kontaktebenen durch Referenz auf weitere Kontakte, \nwenn bspw. ein Versorgungsstellenkontakt Teil eines Abteilungskontaktes \noder ein Abteilungskontakt Teil eines Einrichtungskontaktes ist.",
        "_definition" : {
          "extension" : [
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "de-DE"
                },
                {
                  "url" : "content",
                  "valueString" : "Abbildung der Hierarchie zwischen Kontaktebenen durch Referenz auf weitere Kontakte."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            },
            {
              "extension" : [
                {
                  "url" : "lang",
                  "valueCode" : "en-US"
                },
                {
                  "url" : "content",
                  "valueString" : "Hierarchy between encounter levels by referencing further encounters."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      }
    ]
  }
}

```
