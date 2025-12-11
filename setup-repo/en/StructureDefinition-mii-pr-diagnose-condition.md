# MII PR Diagnose Condition - MII Implementation Guide Core Dataset Base v2026.0.0

## Resource Profile: MII PR Diagnose Condition 

 
A clinical diagnosis of a patient. 

**Example Usage Scenarios:**

* Document diagnoses for patients in clinical care using ICD-10-GM coding
* Support billing and administrative processes with coded diagnosis information
* Enable epidemiological research and disease surveillance through standardized diagnosis coding
* Represent rare diseases using Alpha-ID or Orphanet codes alongside ICD-10-GM
* Link diagnoses to specific encounters for temporal and contextual documentation

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the MII Diagnose (Diagnosis) Profile.

#### Coding Requirements

**Mandatory Coding:**

* **`Condition.code`**: At least one coded diagnosis **MUST** be present
* Code system may be freely selected from: ICD-10-GM, Alpha-ID, SNOMED CT, or Orphanet
* ICD-10-GM coding is the primary coding system for diagnoses in Germany

**Multiple Code Systems:**

* Multiple codings from different terminologies are permitted and encouraged where applicable
* Example: ICD-10-GM for billing/administrative purposes + SNOMED CT for semantic interoperability + Alpha-ID/Orphanet for rare diseases

#### ICD-10-GM Specific Extensions

##### Best Practice - ICD-10-GM Extensions and Special Characters

**Separation of Special Characters:** The element `Condition.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').code` **SHOULD NOT** contain multi-coding markers or additional markers (e.g., laterality or diagnostic certainty).

**Extension Usage:**

* **Mehrfachcodierungs-Kennzeichen:** Multi-coding markers (`*`, `†`, `!`) **SHOULD** be separated from ICD-10-GM codes and captured in the "Mehrfachcodierungs-Kennzeichen" extension
* **Seitenlokalisation:** The "Seitenlokalisation" extension **SHOULD** be used to specify laterality in ICD-10-GM coding
* **Diagnosesicherheit:** The "Diagnosesicherheit" extension **SHOULD** be used to specify diagnostic certainty in ICD-10-GM coding

**Reference:** See [ICD-10-GM Coding Profile](https://ig.fhir.de/basisprofile-de/1.5.4/ig-markdown-Datentypen-Coding.html#ig-markdown-Datentypen-ICD-10GM-Coding) and [Diagnosesicherheit Extension](https://ig.fhir.de/basisprofile-de/1.5.4/ig-markdown-ExtensionsfrCondition.html) in the German Base Profiles for detailed constraints.

#### Multi-Coding with ICD-10-GM Cross-Dagger System

##### Best Practice - Cross-Dagger (Kreuz-Stern) System Implementation

**Multiple Condition Instances:** When using ICD-10-GM codes with the cross-dagger system (Kreuz-Stern), create a **separate Condition instance for each ICD-10 code** (etiology, manifestation, additional information).

**Linking Secondary to Primary:**

* The primary diagnosis Condition (etiology/Ätiologie with † marker) is the main instance
* Secondary diagnosis Conditions (manifestation/Manifestation with * marker, additional information with ! marker) use the [Condition Related Extension](http://hl7.org/fhir/R4/extension-condition-related.html) to reference the primary diagnosis
* This creates an explicit relationship chain: manifestation → etiology

**Alpha-ID and Orphanet Codes:**

* When Alpha-ID or Orphanet codes are mapped to combined ICD-10-GM codes, include them **only in the primary diagnosis Condition instance**
* Do not duplicate Alpha-ID/Orphanet codes in secondary Condition instances

**Diagnostic Certainty Considerations:**

* If diagnostic certainty differs between primary and secondary diagnoses, ensure the certainty of the primary Condition applies to the associated Alpha-ID
* This prevents inconsistencies when rare disease codes (Alpha-ID/Orphanet) are associated with uncertain etiological diagnoses

**Example:** See example resources for Alpha-ID `I97525` with ICD-10-GM `A54.4†` (etiology) and `M73.09*` (manifestation).

#### Body Site Documentation

**`Condition.bodySite`:**

* OPTIONAL element
* If used, body site **SHOULD** be coded with at least one SNOMED CT code
* **DO NOT** include laterality in `bodySite` - use the Seitenlokalisation extension on `Condition.code.coding:icd10-gm` instead

#### Encounter Linkage

##### Best Practice - Diagnosis-Encounter Relationships

**Change from Previous Version:** In previous versions of this implementation guide, it was recommended to use `Encounter.diagnosis` to link diagnoses to encounters. This guidance has been updated to align with gematik ISiK (Informationssysteme im Krankenhaus) recommendations.

**Current Recommendation - Condition.encounter:**

* The link to an Encounter resource documents the reference to a hospital stay and enables important API functions such as chained search, (reverse) include, etc.
* **Department Contact Level:** The reference **SHOULD** be to an Encounter at the "Abteilungskontakt" (department contact) level.
* When selecting the Encounter, note that multiple Encounters may be grouped under a single (billing) case number (`Encounter.account`), such as an inpatient visit with multiple pre- and post-hospitalization contacts

**Assessment Date Mapping:**

* The logical data element "Feststellungsdatum" (assessment/determination date) maps to `Encounter.period.start`, NOT to an element in the Condition resource
* Therefore, the Encounter reference represents both the technical documentation context and the temporal context of when the diagnosis was established

#### Temporal Information

**`Condition.onset[x]`:**

* **MAY** be captured as Period or dateTime
* OPTIONAL: Use the extension to specify life phase as code when exact timepoints are unknown
* Represents when the condition began or was first noticed

**`Condition.recordedDate`:**

* Represents when the diagnosis was recorded in the system

**Usages:**

* Examples for this Profile: [Condition/mii-exa-diagnose-appendicitis](Condition-mii-exa-diagnose-appendicitis.md), [Condition/mii-exa-diagnose-condition-elbow-contusion](Condition-mii-exa-diagnose-condition-elbow-contusion.md), [Condition/mii-exa-diagnose-condition-multiple-codings](Condition-mii-exa-diagnose-condition-multiple-codings.md), [Condition/mii-exa-diagnose-mehrfachcodierung-primaercode](Condition-mii-exa-diagnose-mehrfachcodierung-primaercode.md) and [Condition/mii-exa-diagnose-mehrfachcodierung-sekundaercode](Condition-mii-exa-diagnose-mehrfachcodierung-sekundaercode.md)
* CapabilityStatements using this Profile: [MII CPS Diagnose CapabilityStatement](CapabilityStatement-mii-cps-diagnose-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.medizininformatikinitiative.kerndatensatz.base|current/StructureDefinition/mii-pr-diagnose-condition)

**Changes since version {current}:**

* New Content

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-pr-diagnose-condition.csv), [Excel](../StructureDefinition-mii-pr-diagnose-condition.xlsx), [Schematron](../StructureDefinition-mii-pr-diagnose-condition.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-diagnose-condition",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose",
  "version" : "2026.0.0",
  "name" : "MII_PR_Diagnose_Condition",
  "title" : "MII PR Diagnose Condition",
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
            "valueString" : "Diagnose"
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
            "valueString" : "Diagnosis"
          }
        ],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }
    ]
  },
  "status" : "active",
  "date" : "2025-03-31",
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
  "description" : "Dieses Profil beschreibt eine Diagnose der Medizininformatik Initiative",
  "_description" : {
    "extension" : [
      {
        "extension" : [
          {
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Eine klinische Diagnose der Patientin oder des Patienten."
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
            "valueString" : "A clinical diagnosis of a patient."
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
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "LogicalModel",
      "name" : "FHIR-Profil zu LogicalModel Mapping"
    },
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "sct-concept",
      "uri" : "http://snomed.info/conceptdomain",
      "name" : "SNOMED CT Concept Domain Binding"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
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
      "identity" : "sct-attr",
      "uri" : "http://snomed.org/attributebinding",
      "name" : "SNOMED CT Attribute Binding"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Condition",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Condition",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Condition",
        "path" : "Condition"
      },
      {
        "id" : "Condition.id",
        "path" : "Condition.id",
        "mustSupport" : true
      },
      {
        "id" : "Condition.meta",
        "path" : "Condition.meta",
        "mustSupport" : true
      },
      {
        "id" : "Condition.meta.source",
        "path" : "Condition.meta.source",
        "mustSupport" : true
      },
      {
        "id" : "Condition.meta.profile",
        "path" : "Condition.meta.profile",
        "mustSupport" : true
      },
      {
        "id" : "Condition.extension",
        "path" : "Condition.extension",
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
        "id" : "Condition.extension:ReferenzPrimaerdiagnose",
        "path" : "Condition.extension",
        "sliceName" : "ReferenzPrimaerdiagnose",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://hl7.org/fhir/StructureDefinition/condition-related"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Condition.extension:Feststellungsdatum",
        "path" : "Condition.extension",
        "sliceName" : "Feststellungsdatum",
        "short" : "Feststellungsdatum",
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
                  "valueString" : "Feststellungsdatum"
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
                  "valueString" : "Asserted date"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Datum, an dem die Diagnose erstmals festgestellt wurde",
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
                  "valueString" : "Datum, an dem die Diagnose erstmals festgestellt wurde"
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
                  "valueString" : "Date the condition was first asserted"
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
            "profile" : [
              "http://hl7.org/fhir/StructureDefinition/condition-assertedDate"
            ]
          }
        ],
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "Feststellungsdatum"
          }
        ]
      },
      {
        "id" : "Condition.clinicalStatus",
        "path" : "Condition.clinicalStatus",
        "short" : "Klinischer Status",
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
                  "valueString" : "Klinischer Status"
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
                  "valueString" : "Clinical status"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "aktiv | Rezidiv | Rückfall | inaktiv | Remission | abgeklungen",
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
                  "valueString" : "aktiv | Rezidiv | Rückfall | inaktiv | Remission | abgeklungen"
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
                  "valueString" : "active | recurrence | relapse | inactive | remission | resolved"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "KlinischerStatus"
          }
        ]
      },
      {
        "id" : "Condition.verificationStatus",
        "path" : "Condition.verificationStatus",
        "short" : "Verifizierungsstatus",
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
                  "valueString" : "Verifizierungsstatus"
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
                  "valueString" : "Verification status"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "unbestätigt | vorläufig | differential | bestätigt | widerlegt | fehlerhafte Eingabe",
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
                  "valueString" : "unbestätigt | vorläufig | differential | bestätigt | widerlegt | fehlerhafte Eingabe"
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
                  "valueString" : "unconfirmed | provisional | differential | confirmed | refuted | entered-in-error"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Condition.code",
        "path" : "Condition.code",
        "short" : "Code",
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
                  "valueString" : "Code"
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
                  "valueString" : "Code"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Ein ICD-10-, Alpha-ID-, SNOMED-, Orpha- oder anderer Code, der die Diagnose identifiziert.",
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
                  "valueString" : "Ein ICD-10-, Alpha-ID-, SNOMED-, Orpha- oder anderer Code, der die Diagnose identifiziert."
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
                  "valueString" : "An ICD-10-, Alpha-ID-, SNOMED-, Orpha- or other code that identifies the diagnosis."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Condition.code.coding",
        "path" : "Condition.code.coding",
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
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "WeitereKodiersysteme"
          }
        ]
      },
      {
        "id" : "Condition.code.coding.code",
        "path" : "Condition.code.coding.code",
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "WeitereKodiersysteme.Diagnosecode"
          }
        ]
      },
      {
        "id" : "Condition.code.coding:icd10-gm",
        "path" : "Condition.code.coding",
        "sliceName" : "icd10-gm",
        "short" : "ICD-10-GM Code",
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
                  "valueString" : "ICD-10-GM Code"
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
                  "valueString" : "ICD-10-GM code"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Ein Verweis auf einen von der ICD-10-GM definierten Code",
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
                  "valueString" : "Ein Verweis auf einen von der ICD-10-GM definierten Code"
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
                  "valueString" : "A reference to a code defined by the ICD-10-GM"
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
            "code" : "Coding",
            "profile" : ["http://fhir.de/StructureDefinition/CodingICD10GM"]
          }
        ],
        "patternCoding" : {
          "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
        },
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-icd10gm"
        },
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "ICD10GMDiagnoseKodiert"
          }
        ]
      },
      {
        "id" : "Condition.code.coding:icd10-gm.system",
        "path" : "Condition.code.coding.system",
        "mustSupport" : true
      },
      {
        "id" : "Condition.code.coding:icd10-gm.version",
        "path" : "Condition.code.coding.version",
        "mustSupport" : true
      },
      {
        "id" : "Condition.code.coding:icd10-gm.code",
        "path" : "Condition.code.coding.code",
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "ICD10GMDiagnoseKodiert.Diagnosecode"
          }
        ]
      },
      {
        "id" : "Condition.code.coding:alpha-id",
        "path" : "Condition.code.coding",
        "sliceName" : "alpha-id",
        "short" : "Alpha-ID Code",
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
                  "valueString" : "Alpha-ID Code"
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
                  "valueString" : "Alpha-ID code"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Ein Verweis auf einen von der Alpha-ID definierten Code",
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
                  "valueString" : "Ein Verweis auf einen von der Alpha-ID definierten Code"
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
                  "valueString" : "A reference to a code defined by the Alpha-ID"
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
            "code" : "Coding",
            "profile" : ["http://fhir.de/StructureDefinition/CodingAlphaID"]
          }
        ],
        "patternCoding" : {
          "system" : "http://fhir.de/CodeSystem/bfarm/alpha-id"
        },
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-alphaid"
        },
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "ALPHAIDKodiert"
          }
        ]
      },
      {
        "id" : "Condition.code.coding:alpha-id.system",
        "path" : "Condition.code.coding.system",
        "mustSupport" : true
      },
      {
        "id" : "Condition.code.coding:alpha-id.code",
        "path" : "Condition.code.coding.code",
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "ALPHAIDKodiert.Diagnosecode"
          }
        ]
      },
      {
        "id" : "Condition.code.coding:sct",
        "path" : "Condition.code.coding",
        "sliceName" : "sct",
        "short" : "SNOMED CT Code",
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
                  "valueString" : "SNOMED CT Code"
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
                  "valueString" : "SNOMED CT code"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Ein Verweis auf einen von SNOMED CT definierten Code",
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
                  "valueString" : "Ein Verweis auf einen von SNOMED CT definierten Code"
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
                  "valueString" : "A reference to a code defined by SNOMED CT"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "min" : 0,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://snomed.info/sct"
        },
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/diagnoses-sct"
        },
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "SNOMEDDiagnoseKodiert"
          }
        ]
      },
      {
        "id" : "Condition.code.coding:sct.system",
        "path" : "Condition.code.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Condition.code.coding:sct.version",
        "path" : "Condition.code.coding.version",
        "mustSupport" : true
      },
      {
        "id" : "Condition.code.coding:sct.code",
        "path" : "Condition.code.coding.code",
        "min" : 1,
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "SNOMEDDiagnoseKodiert.Diagnosecode"
          }
        ]
      },
      {
        "id" : "Condition.code.coding:orphanet",
        "path" : "Condition.code.coding",
        "sliceName" : "orphanet",
        "short" : "ORPHAcode",
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
                  "valueString" : "ORPHAcode"
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
                  "valueString" : "ORPHAcode"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Ein Verweis auf einen von der Orphanet Nomenklatur der Seltenen Krankheiten definierten Code",
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
                  "valueString" : "Ein Verweis auf einen von der Orphanet Nomenklatur der Seltenen Krankheiten definierten Code"
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
                  "valueString" : "A reference to a code defined by the Orphanet nomenclature of rare diseases"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "min" : 0,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://www.orpha.net"
        },
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-orphanet"
        },
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "ORPHANETDiagnoseKodiert"
          }
        ]
      },
      {
        "id" : "Condition.code.coding:orphanet.system",
        "path" : "Condition.code.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Condition.code.coding:orphanet.code",
        "path" : "Condition.code.coding.code",
        "min" : 1,
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "ORPHANETDiagnoseKodiert.Diagnosecode"
          }
        ]
      },
      {
        "id" : "Condition.code.text",
        "path" : "Condition.code.text",
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "Freitextbeschreibung"
          }
        ]
      },
      {
        "id" : "Condition.bodySite",
        "path" : "Condition.bodySite",
        "short" : "Körperstelle",
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
                  "valueString" : "Körperstelle"
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
                  "valueString" : "Body site"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Die Körperstelle der Diagnose mittels SNOMED oder anderem Code.",
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
                  "valueString" : "Körperstelle der Diagnose mittels SNOMED oder anderem Code."
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
                  "valueString" : "The body site of the diagnosis using SNOMED or other systems."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "Koerperstelle"
          }
        ]
      },
      {
        "id" : "Condition.bodySite.coding",
        "path" : "Condition.bodySite.coding",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "system"
            }
          ],
          "rules" : "open"
        },
        "mustSupport" : true
      },
      {
        "id" : "Condition.bodySite.coding:snomed-ct",
        "path" : "Condition.bodySite.coding",
        "sliceName" : "snomed-ct",
        "short" : "SNOMED CT Code",
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
                  "valueString" : "SNOMED CT Code"
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
                  "valueString" : "SNOMED CT code"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Ein Verweis auf einen von SNOMED CT definierten Code",
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
                  "valueString" : "Ein Verweis auf einen von SNOMED CT definierten Code"
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
                  "valueString" : "A reference to a code defined by SNOMED CT"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "min" : 0,
        "max" : "1",
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-bodystructure-snomed"
        }
      },
      {
        "id" : "Condition.bodySite.coding:snomed-ct.system",
        "path" : "Condition.bodySite.coding.system",
        "min" : 1,
        "patternUri" : "http://snomed.info/sct",
        "mustSupport" : true
      },
      {
        "id" : "Condition.bodySite.coding:snomed-ct.version",
        "path" : "Condition.bodySite.coding.version",
        "mustSupport" : true
      },
      {
        "id" : "Condition.bodySite.coding:snomed-ct.code",
        "path" : "Condition.bodySite.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Condition.subject",
        "path" : "Condition.subject",
        "mustSupport" : true
      },
      {
        "id" : "Condition.encounter",
        "path" : "Condition.encounter",
        "short" : "Fall oder Kontakt",
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
                  "valueString" : "Fall oder Kontakt"
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
                  "valueString" : "Encounter"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Fall oder Kontakt, bei dem die Diagnose festgestellt wurde.",
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
                  "valueString" : "Fall oder Kontakt, bei dem die Diagnose festgestellt wurde."
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
                  "valueString" : "Encounter during which the diagnosis was determined."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Condition.onset[x]",
        "path" : "Condition.onset[x]",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "type",
              "path" : "$this"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "short" : "Beginn",
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
                  "valueString" : "Beginn"
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
                  "valueString" : "Onset"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Geschätztes oder tatsächliches Datum oder Zeitraum, an dem die Erkrankung begonnen hat, nach Meinung des Klinikers.",
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
                  "valueString" : "Geschätztes oder tatsächliches Datum oder Zeitraum, an dem die Erkrankung begonnen hat, nach Meinung des Klinikers."
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
                  "valueString" : "Estimated or actual date or date-time the condition began, in the opinion of the clinician."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "type" : [
          {
            "code" : "dateTime"
          },
          {
            "code" : "Age"
          },
          {
            "code" : "Period"
          }
        ],
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "KlinischRelevanterZeitraum"
          }
        ]
      },
      {
        "id" : "Condition.onset[x]:onsetPeriod",
        "path" : "Condition.onset[x]",
        "sliceName" : "onsetPeriod",
        "short" : "Beginn Zeitraum",
        "definition" : "Der Zeitraum, in dem die Erkrankung begonnen hat, nach Meinung des Klinikers.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Period"
          }
        ],
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "KlinischRelevanterZeitraum.Zeitraum"
          }
        ]
      },
      {
        "id" : "Condition.onset[x]:onsetPeriod.start",
        "path" : "Condition.onset[x].start",
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "KlinischRelevanterZeitraum.Zeitraum.von"
          }
        ]
      },
      {
        "id" : "Condition.onset[x]:onsetPeriod.start.extension",
        "path" : "Condition.onset[x].start.extension",
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
        "id" : "Condition.onset[x]:onsetPeriod.start.extension:lebensphase-von",
        "path" : "Condition.onset[x].start.extension",
        "sliceName" : "lebensphase-von",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://fhir.de/StructureDefinition/lebensphase"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Condition.onset[x]:onsetPeriod.start.extension:lebensphase-von.value[x]",
        "path" : "Condition.onset[x].start.extension.value[x]",
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "KlinischRelevanterZeitraum.Lebensphase.von"
          }
        ]
      },
      {
        "id" : "Condition.onset[x]:onsetPeriod.end",
        "path" : "Condition.onset[x].end",
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "KlinischRelevanterZeitraum.Zeitraum.bis"
          }
        ]
      },
      {
        "id" : "Condition.onset[x]:onsetPeriod.end.extension",
        "path" : "Condition.onset[x].end.extension",
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
        "id" : "Condition.onset[x]:onsetPeriod.end.extension:lebensphase-bis",
        "path" : "Condition.onset[x].end.extension",
        "sliceName" : "lebensphase-bis",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://fhir.de/StructureDefinition/lebensphase"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Condition.onset[x]:onsetPeriod.end.extension:lebensphase-bis.value[x]",
        "path" : "Condition.onset[x].end.extension.value[x]",
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "KlinischRelevanterZeitraum.Lebensphase.bis"
          }
        ]
      },
      {
        "id" : "Condition.onset[x]:onsetDateTime",
        "path" : "Condition.onset[x]",
        "sliceName" : "onsetDateTime",
        "short" : "Beginn Datum",
        "definition" : "Das Datum, an dem die Erkrankung begonnen hat, nach Meinung des Klinikers.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "dateTime"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Condition.onset[x]:onsetAge",
        "path" : "Condition.onset[x]",
        "sliceName" : "onsetAge",
        "short" : "Erkrankungsbeginn als Alter",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Age"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Condition.onset[x]:onsetAge.extension:Lebensphase-Beginn",
        "path" : "Condition.onset[x].extension",
        "sliceName" : "Lebensphase-Beginn",
        "short" : "Lebensphase des Erkrankungsbeginns",
        "comment" : "Alternative Angabe, wenn genauere Eingrenzungen des Zeitraums nicht möglich sind, insbesondere im Kontext anamnestischer Diagnosen",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://fhir.de/StructureDefinition/lebensphase"]
          }
        ]
      },
      {
        "id" : "Condition.recordedDate",
        "path" : "Condition.recordedDate",
        "short" : "Aufzeichnungsdatum",
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
                  "valueString" : "Aufzeichnungsdatum"
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
                  "valueString" : "Recorded date"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Datum, an dem die Diagnose erstmals dokumentiert wurde.",
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
                  "valueString" : "Datum, an dem die Diagnose erstmals dokumentiert wurde."
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
                  "valueString" : "Date when the diagnosis was first recorded."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "min" : 1,
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "Dokumentationsdatum"
          }
        ]
      },
      {
        "id" : "Condition.note",
        "path" : "Condition.note",
        "short" : "Hinweis",
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
                  "valueString" : "Hinweis"
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
                  "valueString" : "Note"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Zusätzliche Informationen zur Diagnose als Freitext.",
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
                  "valueString" : "Zusätzliche Informationen zur Diagnose als Freitext."
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
                  "valueString" : "Additional information about the diagnosis as free text."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "LogicalModel",
            "map" : "Diagnoseerlaeuterung"
          }
        ]
      }
    ]
  }
}

```
