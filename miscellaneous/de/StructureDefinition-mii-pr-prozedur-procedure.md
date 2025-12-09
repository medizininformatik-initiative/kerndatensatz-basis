# MII PR Prozedur Procedure - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Ressourcenprofil: MII PR Prozedur Procedure 

 
Eine Prozedur, die an oder für einen Patienten durchgeführt wird oder wurde. 

**Beispielhafte Anwendungsszenarien:**

* Dokumentation von bei PatientInnen durchgeführten Prozeduren mittels OPS-Codierung (Operationen- und Prozedurenschlüssel) für Abrechnungs- und Verwaltungszwecke
* Erfassung chirurgischer Eingriffe, diagnostischer Prozeduren und therapeutischer Behandlungen in der klinischen Versorgung
* Unterstützung von Qualitätsmanagement und klinischer Forschung durch standardisierte Prozedurdokumentation
* Ermöglichung prozedurbasierter Analysen und Outcome-Forschung über Gesundheitseinrichtungen hinweg
* Darstellung von Prozeduren mittels SNOMED CT für semantische Interoperabilität neben OPS-Codierung
* Verknüpfung von Prozeduren mit spezifischen Behandlungsfällen zur zeitlichen und kontextuellen Dokumentation

### Profilspezifische Implementierungshinweise

Dieser Abschnitt enthält detaillierte Implementierungshinweise für das MII-Prozedur-Profil.

#### Codierungsanforderungen

**Verpflichtende Codierung:**

* **`Procedure.code`**: VERPFLICHTEND Kodierung entweder per OPS oder SNOMED CT
* Mindestens eine kodierte Prozedur MUSS vorhanden sein
* Weitere Kodierungen aus anderen Terminologien sind OPTIONAL

**OPS-Kodierung:**

* **`Procedure.code:ops`**: OPS (Operationen- und Prozedurenschlüssel) ist das primäre Codiersystem für Prozeduren in Deutschland
* Siehe [OPS-Kodierung - Deutsche Basisprofile] für detaillierte OPS-Codierungsanforderungen
* OPS-Codes umfassen: 
* `Procedure.code:ops.coding.code`: Vollständiger Prozedurenkode
* `Procedure.code:ops.coding.system`: Codesystem (`http://fhir.de/CodeSystem/bfarm/ops`)
* `Procedure.code:ops.coding.version`: OPS-Versionsjahr
* `Procedure.code:ops.extension:seitenlokalisation`: Seitenlokalisation-Extension
 

**SNOMED-CT-Kodierung:**

* **`Procedure.code:sct`**: SNOMED-CT-Codierung
* Kann als primäre Codierung oder neben OPS verwendet werden

#### Kategorisierung

##### Best Practice - SNOMED-CT-Kategorisierung

**Verpflichtende Kategorisierung:** `Procedure.category` SNOMED-CT-Kategorisierung auf Basis des Prozedurenkodes.

**Mapping von OPS-Klassentiteln:** Wenn die Prozedur per OPS kodiert wird, **SOLLTE** die Kategorie durch Mapping von OPS-Kapitel-/Klassentiteln auf SNOMED-CT-Konzepte abgeleitet werden. Siehe Abschnitt Terminologien in diesem IG für OPS-zu-SNOMED-CT-Kategorie-Mappings.

**Constraint proc-mii-1:** Diese Anforderung ist nur relevant, wenn die Prozedur per OPS kodiert wird.

**Zweck:** Die Kategorisierung ermöglicht:

* Hochstufige Prozedur-Gruppierung für epidemiologische Analysen
* Filterung und Durchsuchen von Prozeduren nach breiten klinischen Kategorien
* Semantische Konsistenz über unterschiedlich kodierte Prozeduren hinweg

#### Zeitliche Informationen

**`Procedure.performed[x]`:**

* Dokumentiert, wann die Prozedur durchgeführt wurde
* **KANN** als `performedDateTime` (einzelner Zeitpunkt) oder `performedPeriod` (Start- und Endzeitpunkt) angegeben werden
* Verwenden Sie `performedPeriod`, wenn sowohl Start- als auch Endzeitpunkt bekannt sind (z.B. chirurgische Eingriffe mit dokumentiertem Start/Ende)
* Verwenden Sie `performedDateTime` für zeitpunktbezogene Prozeduren oder wenn nur ein einzelner Zeitstempel verfügbar ist

**`Procedure.extension:Dokumentationsdatum`:**

* MII-spezifische Extension für das Dokumentationsdatum
* Repräsentiert, wann die Prozedur im System dokumentiert/erfasst wurde
* Unterscheidet sich von `performed[x]`, welches repräsentiert, wann die Prozedur tatsächlich durchgeführt wurde
* Nützlich für Auditing und zeitliche Einordnung der Dokumentation

#### Dokumentation der Körperstelle

##### Best Practice - Körperstelle vs. Seitenlokalisation

**Zweck von bodySite:** `Procedure.bodySite` bietet detaillierte Kodierung der anatomischen Lokalisation für die Prozedur mittels SNOMED CT.

**NICHT für Seitenlokalisation:** `Procedure.bodySite` **SOLLTE NICHT** verwendet werden, um die Seitenlokalisation (links/rechts/beidseitig) abzubilden. Die Seitenlokalisation ist eine Eigenschaft des Prozedurenkodes selbst.

**Darstellung der Seitenlokalisation:**

* Für OPS-Codes: Verwenden Sie `Procedure.code:ops.extension:seitenlokalisation`
* Für SNOMED CT: Seitenlokalisation ist im Prozedurkonzept inhärent enthalten (z.B. "Appendektomie des rechten Appendix")

**Wann bodySite zu verwenden ist:**

* Um zusätzliche anatomische Details bereitzustellen, die über das hinausgehen, was der Code spezifiziert
* Um präzise anatomische Strukturen mittels SNOMED-CT-Anatomiekonzepten zu spezifizieren

#### Durchführungsabsicht

**`Procedure.extension:Durchfuehrungsabsicht`:**

* MII-spezifische Extension für die Durchführungsabsicht/den Zweck der Prozedur
* Verwendet SNOMED-CT-Codes zur Klassifizierung der klinischen Absicht: 
* Therapeutische Prozeduren
* Diagnostische Prozeduren
* Prophylaktische Prozeduren
* Palliative Prozeduren
* etc.
 
* Bietet klinischen Kontext für die Prozedur über den Prozedurenkode hinaus

#### Status und Workflow

**`Procedure.status`:**

* Keine Einschränkungen bezüglich des gewählten Status (preparation, in-progress, on-hold, stopped, completed, entered-in-error, unknown)
* Die meisten Prozeduren in der retrospektiven Dokumentation haben `status='completed'`

#### Patientenbezug

**`Procedure.subject`:**

* Referenz auf Patient MUSS stets gegeben sein
* Prozeduren sind inhärent patientenspezifisch und können ohne diese Referenz nicht existieren

**Usages:**

* Examples for this Profile: [Procedure/mii-exa-prozedur-imaging](Procedure-mii-exa-prozedur-imaging.md), [Procedure/mii-exa-prozedur-procedure-2](Procedure-mii-exa-prozedur-procedure-2.md) and [Procedure/mii-exa-prozedur-procedure](Procedure-mii-exa-prozedur-procedure.md)
* CapabilityStatements using this Profile: [MII CPS Prozedur CapabilityStatement](CapabilityStatement-mii-cps-prozedur-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.medizininformatikinitiative.kerndatensatz.base|current/StructureDefinition/mii-pr-prozedur-procedure)

**Changes since version {current}:**

* New Content

### Formale Ansichten des Profilinhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Schlüsselelemente-Tabelle](#tabs-key) 
*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Procedure](http://hl7.org/fhir/R4/procedure.html) 

#### Terminology Bindings (Differential)

#### Constraints

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Procedure](http://hl7.org/fhir/R4/procedure.html) 

**Summary**

Mandatory: 3 elements(6 nested mandatory elements)
 Must-Support: 31 elements

**Structures**

This structure refers to these other structures:

* [Coding-Profil für OPS(http://fhir.de/StructureDefinition/CodingOPS)](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/StructureDefinition/CodingOPS)

**Extensions**

This structure refers to these extensions:

* [http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum)
* [https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht](StructureDefinition-mii-ex-prozedur-durchfuehrungsabsicht.md)

**Slices**

This structure defines the following [Slices](http://hl7.org/fhir/R4/profiling.html#slices):

* The element 1 is sliced based on the value of Procedure.category.coding
* The element 1 is sliced based on the value of Procedure.code.coding
* The element 1 is sliced based on the value of Procedure.performed[x]
* The element 1 is sliced based on the value of Procedure.bodySite.coding

 **Schlüsselelemente-Ansicht** 

#### Terminology Bindings

#### Constraints

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [Procedure](http://hl7.org/fhir/R4/procedure.html) 

#### Terminology Bindings (Differential)

#### Constraints

 **Snapshot-AnsichtView** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Procedure](http://hl7.org/fhir/R4/procedure.html) 

**Summary**

Mandatory: 3 elements(6 nested mandatory elements)
 Must-Support: 31 elements

**Structures**

This structure refers to these other structures:

* [Coding-Profil für OPS(http://fhir.de/StructureDefinition/CodingOPS)](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/StructureDefinition/CodingOPS)

**Extensions**

This structure refers to these extensions:

* [http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum)
* [https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht](StructureDefinition-mii-ex-prozedur-durchfuehrungsabsicht.md)

**Slices**

This structure defines the following [Slices](http://hl7.org/fhir/R4/profiling.html#slices):

* The element 1 is sliced based on the value of Procedure.category.coding
* The element 1 is sliced based on the value of Procedure.code.coding
* The element 1 is sliced based on the value of Procedure.performed[x]
* The element 1 is sliced based on the value of Procedure.bodySite.coding

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-mii-pr-prozedur-procedure.csv), [Excel](../StructureDefinition-mii-pr-prozedur-procedure.xlsx), [Schematron](../StructureDefinition-mii-pr-prozedur-procedure.sch) 



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
  "version" : "2026.0.0-dev.1",
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
  "date" : "2025-04-08",
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
