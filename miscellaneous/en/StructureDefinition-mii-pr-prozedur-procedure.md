# MII PR Prozedur Procedure - MII Implementation Guide Core Dataset Base v2026.0.0

## Resource Profile: MII PR Prozedur Procedure 

 
A procedure that is or was performed on or for a patient. 

**Example Usage Scenarios:**

* Document procedures performed on patients using OPS (Operationen- und Prozedurenschlüssel) coding for billing and administrative purposes
* Record surgical interventions, diagnostic procedures, and therapeutic treatments in clinical care
* Support quality management and clinical research through standardized procedure documentation
* Enable procedure-based analyses and outcome research across healthcare facilities
* Represent procedures using SNOMED CT for semantic interoperability alongside OPS coding
* Link procedures to specific encounters for temporal and contextual documentation

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the MII Procedure (Prozedur) Profile.

#### Coding Requirements

**Mandatory Coding:**

* **`Procedure.code`**: [Mandatory](general-requirements.md) coding using either OPS or SNOMED CT
* At least one coded procedure **MUST** be present
* Additional codings from other terminologies are OPTIONAL

**OPS Coding:**

* **`Procedure.code:ops`**: OPS (Operationen- und Prozedurenschlüssel) is the primary coding system for procedures in Germany
* See [OPS Coding - German Base Profiles](https://ig.fhir.de/basisprofile-de/1.5.4/ig-markdown-Ressourcen-ProzedurenProcedure.html#ig-markdown-Ressourcen-Procedure-OPS) for detailed OPS coding requirements
* OPS codes include: 
* `Procedure.code:ops.coding.code`: Complete procedure code
* `Procedure.code:ops.coding.system`: Code system (`http://fhir.de/CodeSystem/bfarm/ops`)
* `Procedure.code:ops.coding.version`: OPS version year
* `Procedure.code:ops.extension:seitenlokalisation`: Laterality extension
 

**SNOMED CT Coding:**

* **`Procedure.code:sct`**: SNOMED CT coding
* Can be used as primary coding or alongside OPS

#### Category Classification

##### Best Practice - SNOMED CT Categorization

**Mandatory Categorization:** `Procedure.category` SNOMED CT categorization based on the procedure code.

**OPS Class Title Mapping:** When the procedure is coded using OPS, the category **SHOULD** be derived by mapping OPS chapter/class titles to SNOMED CT concepts. See the Terminologies section in this IG for OPS-to-SNOMED CT category mappings.

**Constraint proc-mii-1:** This requirement is only relevant when the procedure is coded using OPS.

**Purpose:** Category classification enables:

* High-level procedure grouping for epidemiological analyses
* Filtering and browsing procedures by broad clinical categories
* Semantic consistency across differently coded procedures

#### Temporal Information

**`Procedure.performed[x]`:**

* Documents when the procedure was performed
* **MAY** be specified as `performedDateTime` (single point in time) or `performedPeriod` (start and end times)
* Use `performedPeriod` when both start and end times are known (e.g., surgical procedures with documented start/end)
* Use `performedDateTime` for point-in-time procedures or when only a single timestamp is available

**`Procedure.extension:Dokumentationsdatum`:**

* MII-specific extension for documentation date
* Represents when the procedure was documented/recorded in the system
* Distinct from `performed[x]` which represents when the procedure actually occurred
* Useful for auditing and temporal ordering of documentation

#### Body Site Documentation

##### Best Practice - Body Site vs. Laterality

**Body Site Purpose:** `Procedure.bodySite` provides detailed anatomical location coding for the procedure using SNOMED CT.

**NOT for Laterality:** `Procedure.bodySite` **SHOULD NOT** be used to represent laterality (left/right/bilateral). Laterality is a property of the procedure code itself.

**Laterality Representation:**

* For OPS codes: Use `Procedure.code:ops.extension:seitenlokalisation`
* For SNOMED CT: Laterality is inherent in the procedure concept (e.g., "Appendectomy of right appendix")

**When to Use bodySite:**

* To provide additional anatomical detail beyond what the code specifies
* To specify precise anatomical structures using SNOMED CT anatomy concepts

#### Procedure Intent

**`Procedure.extension:Durchfuehrungsabsicht`:**

* MII-specific extension for procedure intent/purpose
* Uses SNOMED CT codes to classify the clinical intent: 
* Therapeutic procedures
* Diagnostic procedures
* Prophylactic procedures
* Palliative procedures
* etc.
 
* Provides clinical context for the procedure beyond the procedural code itself

#### Encounter Context

##### Best Practice - Procedure-Encounter Relationships

**Recommended Implementation:**

Use `Procedure.encounter` to reference from the Procedure to the Encounter of type **Abteilungskontakt (Department Contact)**. This approach establishes the general encounter context for the procedure, providing temporal and organizational context.

#### Status and Workflow

**`Procedure.status`:**

* No restrictions on status values (preparation, in-progress, on-hold, stopped, completed, entered-in-error, unknown)
* Most procedures in retrospective documentation will have `status='completed'`

#### Patient Reference

**`Procedure.subject`:**

* Reference to Patient **MUST** always be provided
* Procedures are inherently patient-specific and cannot exist without this reference

**Usages:**

* Examples for this Profile: [Procedure/mii-exa-prozedur-imaging](Procedure-mii-exa-prozedur-imaging.md), [Procedure/mii-exa-prozedur-procedure-2](Procedure-mii-exa-prozedur-procedure-2.md) and [Procedure/mii-exa-prozedur-procedure](Procedure-mii-exa-prozedur-procedure.md)
* CapabilityStatements using this Profile: [MII CPS Prozedur CapabilityStatement](CapabilityStatement-mii-cps-prozedur-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.medizininformatikinitiative.kerndatensatz.base|current/StructureDefinition/mii-pr-prozedur-procedure)

**Changes since version {current}:**

* New Content

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-pr-prozedur-procedure.csv), [Excel](../StructureDefinition-mii-pr-prozedur-procedure.xlsx), [Schematron](../StructureDefinition-mii-pr-prozedur-procedure.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-prozedur-procedure",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure",
  "version" : "2026.0.0",
  "name" : "MII_PR_Prozedur_Procedure",
  "title" : "MII PR Prozedur Procedure",
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
            "valueString" : "Prozedur"
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
            "valueString" : "Procedure"
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
  "description" : "Dieses Profil beschreibt eine Prozedur in der Medizininformatik-Initiative.",
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
            "valueString" : "Eine Prozedur, die an oder für einen Patienten durchgeführt wird oder wurde."
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
            "valueString" : "A procedure that is or was performed on or for a patient."
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
  "type" : "Procedure",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Procedure",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Procedure",
        "path" : "Procedure",
        "constraint" : [
          {
            "key" : "proc-mii-1",
            "severity" : "error",
            "human" : "Falls die Prozedur per OPS kodiert wird, MUSS eine SNOMED-CT kodierte Category abgebildet werden",
            "expression" : "code.coding.where(system = 'http://fhir.de/CodeSystem/bfarm/ops').exists() implies category.coding.where(system = 'http://snomed.info/sct').exists()",
            "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure"
          }
        ]
      },
      {
        "id" : "Procedure.id",
        "path" : "Procedure.id",
        "mustSupport" : true
      },
      {
        "id" : "Procedure.meta",
        "path" : "Procedure.meta",
        "mustSupport" : true
      },
      {
        "id" : "Procedure.meta.source",
        "path" : "Procedure.meta.source",
        "mustSupport" : true
      },
      {
        "id" : "Procedure.meta.profile",
        "path" : "Procedure.meta.profile",
        "mustSupport" : true
      },
      {
        "id" : "Procedure.extension",
        "path" : "Procedure.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "rules" : "open"
        },
        "mustSupport" : true
      },
      {
        "id" : "Procedure.extension:Dokumentationsdatum",
        "path" : "Procedure.extension",
        "sliceName" : "Dokumentationsdatum",
        "short" : "Dokumentationsdatum",
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
                  "valueString" : "Dokumentationsdatum"
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
        "definition" : "Dokumentationsdatum der Prozedur, falls abweichend vom Durchführungsdatum",
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
                  "valueString" : "Dokumentationsdatum der Prozedur, falls abweichend vom Durchführungsdatum"
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
                  "valueString" : "The date the procedure was documented, if different from the performed date"
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
              "http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Procedure.extension:durchfuehrungsabsicht",
        "path" : "Procedure.extension",
        "sliceName" : "durchfuehrungsabsicht",
        "short" : "Durchführungsabsicht",
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
                  "valueString" : "Durchführungsabsicht"
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
                  "valueString" : "Intention"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "therapeutisch | palliativ | diagnostisch | präventiv | rehabilitativ | andere",
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
                  "valueString" : "therapeutisch | palliativ | diagnostisch | präventiv | rehabilitativ | andere"
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
                  "valueString" : "therapeutic | palliative | diagnostic | preventive | rehabilitative | other"
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
              "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Procedure.status",
        "path" : "Procedure.status",
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
                  "valueString" : "Status"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Vorbereitung | in Arbeit | nicht durchgeführt | pausiert | abgebrochen | abgeschlossen | Eingabe fehlerhaft | unbekannt",
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
                  "valueString" : "Vorbereitung | in Arbeit | nicht durchgeführt | pausiert | abgebrochen | abgeschlossen | Eingabe fehlerhaft | unbekannt"
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
                  "valueString" : "preparation | in-progress | not-done | on-hold | stopped | completed | entered-in-error | unknown"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Procedure.category",
        "path" : "Procedure.category",
        "short" : "Kategorie",
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
                  "valueString" : "Kategorie"
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
                  "valueString" : "Category"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Diagnostische Maßnahmen | Bildgebende Diagnostik | Operationen | Medikamente | Nichtoperative therapeutische Maßnahmen | Ergänzende Maßnahmen",
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
                  "valueString" : "Diagnostische Maßnahmen | Bildgebende Diagnostik | Operationen | Medikamente | Nichtoperative therapeutische Maßnahmen | Ergänzende Maßnahmen"
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
                  "valueString" : "Diagnostic procedures | Imaging procedures | Operations | Medications | Non-operative therapeutic procedures | Other procedures"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Procedure.category.coding",
        "path" : "Procedure.category.coding",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "Procedure.category.coding:sct",
        "path" : "Procedure.category.coding",
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
          "strength" : "preferred",
          "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-category-sct"
        }
      },
      {
        "id" : "Procedure.category.coding:sct.system",
        "path" : "Procedure.category.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Procedure.category.coding:sct.code",
        "path" : "Procedure.category.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Procedure.code",
        "path" : "Procedure.code",
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
        "definition" : "Code aus OPS - Operationen- und Prozedurenschlüssel, SNOMED CT oder andere.",
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
                  "valueString" : "Code aus OPS - Operationen- und Prozedurenschlüssel, SNOMED CT oder andere."
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
                  "valueString" : "Code from OPS - Operationen- und Prozedurenschlüssel, SNOMED CT or other."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "min" : 1,
        "constraint" : [
          {
            "key" : "sct-ops-1",
            "severity" : "error",
            "human" : "Eine Prozedur MUSS mit OPS oder SNOMED-CT kodiert werden.",
            "expression" : "coding.where(system = 'http://snomed.info/sct').exists() or coding.where(system = 'http://fhir.de/CodeSystem/bfarm/ops').exists()",
            "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Procedure.code.coding",
        "path" : "Procedure.code.coding",
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
        "id" : "Procedure.code.coding:ops",
        "path" : "Procedure.code.coding",
        "sliceName" : "ops",
        "short" : "Operationen- und Prozedurenschlüssel (OPS) Code",
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
                  "valueString" : "OPS Code"
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
                  "valueString" : "OPS code"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Ein Verweis auf einen vom Operationen- und Prozedurenschlüssel (OPS) definierten Code",
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
                  "valueString" : "Ein Verweis auf einen vom Operationen- und Prozedurenschlüssel definierten Code"
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
                  "valueString" : "A reference to a code defined by the German Procedure Classification OPS"
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
            "profile" : ["http://fhir.de/StructureDefinition/CodingOPS"]
          }
        ],
        "patternCoding" : {
          "system" : "http://fhir.de/CodeSystem/bfarm/ops"
        },
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/mii-vs-prozedur-ops"
        }
      },
      {
        "id" : "Procedure.code.coding:ops.extension:Seitenlokalisation",
        "path" : "Procedure.code.coding.extension",
        "sliceName" : "Seitenlokalisation",
        "mustSupport" : true
      },
      {
        "id" : "Procedure.code.coding:ops.system",
        "path" : "Procedure.code.coding.system",
        "mustSupport" : true
      },
      {
        "id" : "Procedure.code.coding:ops.version",
        "path" : "Procedure.code.coding.version",
        "mustSupport" : true
      },
      {
        "id" : "Procedure.code.coding:ops.code",
        "path" : "Procedure.code.coding.code",
        "mustSupport" : true
      },
      {
        "id" : "Procedure.code.coding:sct",
        "path" : "Procedure.code.coding",
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
          "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-sct"
        }
      },
      {
        "id" : "Procedure.code.coding:sct.system",
        "path" : "Procedure.code.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Procedure.code.coding:sct.code",
        "path" : "Procedure.code.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Procedure.subject",
        "path" : "Procedure.subject",
        "mustSupport" : true
      },
      {
        "id" : "Procedure.encounter",
        "path" : "Procedure.encounter",
        "short" : "Kontakt (Aufenthaltsbezug)",
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
                  "valueString" : "Kontakt"
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
        "definition" : "Kontakt, während dem die Prozedur durchgeführt wurde oder mit dem die Prozedur in Zusammenhang steht.",
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
                  "valueString" : "Kontakt, während dem die Prozedur durchgeführt wurde oder mit dem die Prozedur in Zusammenhang steht."
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
                  "valueString" : "The Encounter during which this Procedure was performed or to which the creation of this record is tightly associated."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Procedure.performed[x]",
        "path" : "Procedure.performed[x]",
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
        "short" : "Durchführungsdatum",
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
                  "valueString" : "Durchführungsdatum"
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
                  "valueString" : "Performed date"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Durchführungsdatum oder -zeitraum der Prozedur.",
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
                  "valueString" : "Durchführungsdatum oder -zeitraum der Prozedur."
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
                  "valueString" : "The date or period of time the procedure was performed."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "min" : 1,
        "type" : [
          {
            "code" : "dateTime"
          },
          {
            "code" : "Period"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Procedure.performed[x]:performedDateTime",
        "path" : "Procedure.performed[x]",
        "sliceName" : "performedDateTime",
        "definition" : "Durchführungsdatum der Prozedur.",
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
                  "valueString" : "Durchführungsdatum der Prozedur."
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
                  "valueString" : "The date the procedure was performed."
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
            "code" : "dateTime"
          }
        ]
      },
      {
        "id" : "Procedure.performed[x]:performedPeriod",
        "path" : "Procedure.performed[x]",
        "sliceName" : "performedPeriod",
        "short" : "Durchführungszeitraum",
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
                  "valueString" : "Durchführungszeitraum"
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
                  "valueString" : "Performed period"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Zeitraum, in dem die Prozedur durchgeführt wurde.",
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
                  "valueString" : "Zeitraum, in dem die Prozedur durchgeführt wurde."
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
                  "valueString" : "The period of time the procedure was performed."
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
            "code" : "Period"
          }
        ]
      },
      {
        "id" : "Procedure.bodySite",
        "path" : "Procedure.bodySite",
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
        "definition" : "Körperstelle der Prozedur mittels SNOMED CT inklusive Lateralität.",
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
                  "valueString" : "Körperstelle der Prozedur mittels SNOMED CT inklusive Lateralität."
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
                  "valueString" : "The body site of the procedure using SNOMED CT including laterality."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Procedure.bodySite.coding",
        "path" : "Procedure.bodySite.coding",
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
        "id" : "Procedure.bodySite.coding:snomed-ct",
        "path" : "Procedure.bodySite.coding",
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
        "mustSupport" : true
      },
      {
        "id" : "Procedure.bodySite.coding:snomed-ct.system",
        "path" : "Procedure.bodySite.coding.system",
        "min" : 1,
        "patternUri" : "http://snomed.info/sct",
        "mustSupport" : true
      },
      {
        "id" : "Procedure.bodySite.coding:snomed-ct.version",
        "path" : "Procedure.bodySite.coding.version",
        "mustSupport" : true
      },
      {
        "id" : "Procedure.bodySite.coding:snomed-ct.code",
        "path" : "Procedure.bodySite.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Procedure.note",
        "path" : "Procedure.note",
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
        "definition" : "Zusätzliche Informationen zur Prozedur als Freitext.",
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
                  "valueString" : "Zusätzliche Informationen zur Prozedur als Freitext."
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
                  "valueString" : "Additional information about the procedure as free text."
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
