# MII PR Person Todesursache - MII Implementation Guide Core Dataset Base v2026.0.0

## Ressourcenprofil: MII PR Person Todesursache 

 
Todesursache der verstorbenen Patientin oder des verstorbenen Patienten. 

**Beispielhafte Anwendungsszenarien:**

* Dokumentation der Todesursache für verstorbene PatientInnen für klinische Dokumentation und Mortalitätsstatistiken
* Unterstützung epidemiologischer Forschung und öffentlicher Gesundheitsüberwachung durch standardisierte Todesursachen-Codierung
* Ermöglichung von Mortalitätsanalysen über Gesundheitseinrichtungen hinweg mittels international vergleichbarer ICD-10-WHO-Codes
* Verknüpfung von Todesursachen-Informationen mit Vitalstatus-Observationen und Patient.deceased[x]-Dokumentation

### Profilspezifische Implementierungshinweise

Dieser Abschnitt enthält detaillierte Implementierungshinweise für das MII-Todesursachen-Profil.

#### ICD-10-WHO-Codierungsanforderung

##### Best Practice - ICD-10-WHO vs. ICD-10-GM

**Verpflichtendes Codiersystem:** Die Todesursache **MUSS** mittels ICD-10-WHO (`http://hl7.org/fhir/sid/icd-10`) codiert werden.

**Abweichung vom Diagnose-Modul:** Das Condition-Profil für die Todesursache unterscheidet sich an der Stelle `Condition.code` bewusst vom Condition-Profil im Modul Diagnose. Das Diagnose-Modul verwendet die ICD-10-GM (deutsche Modifikation), während Todesursache die ICD-10-WHO (internationale Version) verwendet.

**Gesetzliche Anforderung:** In Deutschland ist die ICD-10-WHO als Grundlage für die Todesursachenstatistik vom Gesetzgeber vorgeschrieben. Siehe [BfArM ICD-10-WHO](https://www.bfarm.de/DE/Kodiersysteme/Klassifikationen/ICD/ICD-10-WHO/Todesursachenstatistik/_node.html) für Details zu den Anforderungen der deutschen Todesursachenstatistik.

**Zusätzliche Codierungen:** Während die ICD-10-WHO-Codierung verpflichtend ist, sind zusätzliche Codierungen (z.B. SNOMED CT) OPTIONAL und können zur Bereitstellung ergänzender semantischer Informationen hinzugefügt werden.

#### Verpflichtende Elemente

**Feste Category-Werte:**

* **`Condition.category`**: Fester LOINC-Code `79378-6` (Cause of death) und SNOMED-CT-Code `16100001` (Death diagnosis) **MÜSSEN** vorhanden sein
* Weitere Category-Codings sind OPTIONAL
* Diese festen Codes stellen sicher, dass die Condition eindeutig als Todesursache identifiziert wird

**Code-Element:**

* **`Condition.code`**: ICD-10-WHO-Codierung ist VERPFLICHTEND 
* Verwenden Sie das Codesystem `http://hl7.org/fhir/sid/icd-10` (ICD-10-WHO)
* Weitere Codierungen aus anderen Terminologien (SNOMED CT, etc.) sind OPTIONAL
* Weitere Informationen siehe [BfArM ICD-10-WHO](https://www.bfarm.de/DE/Kodiersysteme/Klassifikationen/ICD/ICD-10-WHO/Todesursachenstatistik/_node.html) für offizielle Codierungshinweise und Anforderungen der Todesursachenstatistik
 

**Patientenbezug:**

* **`Condition.subject`**: Referenz auf Patient **MUSS** stets gegeben sein
* Die Todesursache ist inhärent patientenspezifisch und kann ohne diese Referenz nicht existieren
* Die referenzierte PatientIn **SOLLTE** `Patient.deceased[x]` ausgefüllt haben, um den Tod anzuzeigen

**Usages:**

* Examples for this Profile: [Condition/mii-exa-person-condition-todesursache](Condition-mii-exa-person-condition-todesursache.md)
* CapabilityStatements using this Profile: [MII CPS Person CapabilityStatement](CapabilityStatement-mii-cps-person-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.medizininformatikinitiative.kerndatensatz.base|current/StructureDefinition/mii-pr-person-todesursache)

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

Diese Struktur ist abgeleitet von [Condition](http://hl7.org/fhir/R4/condition.html) 

#### Terminology Bindings (Differential)

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Condition](http://hl7.org/fhir/R4/condition.html) 

**Summary**

Mandatory: 10 elements
 Must-Support: 21 elements

**Slices**

This structure defines the following [Slices](http://hl7.org/fhir/R4/profiling.html#slices):

* The element 1 is sliced based on the value of Condition.category
* The element 1 is sliced based on the value of Condition.category.coding
* The element 1 is sliced based on the value of Condition.code.coding

 **Schlüsselelemente-Ansicht** 

#### Terminology Bindings

#### Constraints

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [Condition](http://hl7.org/fhir/R4/condition.html) 

#### Terminology Bindings (Differential)

 **Snapshot-AnsichtView** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Condition](http://hl7.org/fhir/R4/condition.html) 

**Summary**

Mandatory: 10 elements
 Must-Support: 21 elements

**Slices**

This structure defines the following [Slices](http://hl7.org/fhir/R4/profiling.html#slices):

* The element 1 is sliced based on the value of Condition.category
* The element 1 is sliced based on the value of Condition.category.coding
* The element 1 is sliced based on the value of Condition.code.coding

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-mii-pr-person-todesursache.csv), [Excel](../StructureDefinition-mii-pr-person-todesursache.xlsx), [Schematron](../StructureDefinition-mii-pr-person-todesursache.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-person-todesursache",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Todesursache",
  "version" : "2026.0.0",
  "name" : "MII_PR_Person_Todesursache",
  "title" : "MII PR Person Todesursache",
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
            "valueString" : "Todesursache"
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
            "valueString" : "Cause of Death"
          }
        ],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }
    ]
  },
  "status" : "active",
  "date" : "2024-12-04",
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
  "description" : "Dieses Profil beschreibt den Todesursache der Patient*in als Element des Kerndatensatzes Medizininformatik-Initiative",
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
            "valueString" : "Todesursache der verstorbenen Patientin oder des verstorbenen Patienten."
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
            "valueString" : "Cause of death of the deceased patient."
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
        "id" : "Condition.meta.profile",
        "path" : "Condition.meta.profile",
        "mustSupport" : true
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
        "mustSupport" : true
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
        "id" : "Condition.category",
        "path" : "Condition.category",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
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
        "definition" : "Eine Kategorie, die der Diagnose zugeordnet ist.",
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
                  "valueString" : "Eine Kategorie, die der Diagnose zugeordnet ist."
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
                  "valueString" : "A category assigned to the condition."
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
        "id" : "Condition.category:todesDiagnose",
        "path" : "Condition.category",
        "sliceName" : "todesDiagnose",
        "min" : 1,
        "max" : "1",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://snomed.info/sct",
              "code" : "16100001"
            },
            {
              "system" : "http://loinc.org",
              "code" : "79378-6"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Condition.category:todesDiagnose.coding",
        "path" : "Condition.category.coding",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "min" : 2,
        "mustSupport" : true
      },
      {
        "id" : "Condition.category:todesDiagnose.coding:snomed",
        "path" : "Condition.category.coding",
        "sliceName" : "snomed",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "16100001"
        },
        "mustSupport" : true
      },
      {
        "id" : "Condition.category:todesDiagnose.coding:loinc",
        "path" : "Condition.category.coding",
        "sliceName" : "loinc",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://loinc.org",
          "code" : "79378-6"
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
        "definition" : "Ein ICD-10-WHO Code, der die Todesursache identifiziert.",
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
                  "valueString" : "Ein ICD-10-WHO Code, der die Todesursache identifiziert."
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
                  "valueString" : "An ICD-10-WHO code identifying the cause of death."
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
        "mustSupport" : true
      },
      {
        "id" : "Condition.code.coding:icd10-who",
        "path" : "Condition.code.coding",
        "sliceName" : "icd10-who",
        "short" : "ICD-10-WHO",
        "definition" : "Ein ICD-10-WHO Code, der die Todesursache identifiziert.",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://hl7.org/fhir/sid/icd-10"
        },
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/ValueSet/mii-vs-person-icd10who"
        }
      },
      {
        "id" : "Condition.code.coding:icd10-who.system",
        "path" : "Condition.code.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Condition.code.coding:icd10-who.version",
        "path" : "Condition.code.coding.version",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Condition.code.coding:icd10-who.code",
        "path" : "Condition.code.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Condition.code.text",
        "path" : "Condition.code.text",
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
        "definition" : "Fall oder Kontakt, bei dem die Todesursache festgestellt wurde.",
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
                  "valueString" : "Fall oder Kontakt, bei dem die Todesursache festgestellt wurde."
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
                  "valueString" : "Encounter during which the cause of death was determined."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
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
        "definition" : "Datum, an dem die Todesursache erstmals dokumentiert wurde.",
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
                  "valueString" : "Datum, an dem die Todesursache erstmals dokumentiert wurde."
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
                  "valueString" : "Date when the cause of death was first recorded."
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
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
        "definition" : "Zusätzliche Informationen zur Todesursache als Freitext.",
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
                  "valueString" : "Zusätzliche Informationen zur Todesursache als Freitext."
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
                  "valueString" : "Additional information about the cause of death as free text."
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
