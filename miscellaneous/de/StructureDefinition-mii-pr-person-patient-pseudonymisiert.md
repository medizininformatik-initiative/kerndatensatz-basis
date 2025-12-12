# MII PR Person Patient (Pseudonymisiert) - MII Implementation Guide Core Dataset Base v2026.0.0

## Ressourcenprofil: MII PR Person Patient (Pseudonymisiert) 

 
Demografische und andere administrative Informationen über eine Patientin oder einen Patienten. 

**Beispielhafte Anwendungsszenarien:**

* Bereitstellung pseudonymisierter Patientendaten für die Sekundärnutzung in Forschungskontexten unter Wahrung der Patientenidentität
* Unterstützung föderierter Analysen über mehrere MII-Standorte hinweg ohne Offenlegung identifizierender Patienteninformationen
* Ermöglichung krankenkassenbasierter Analysen (z.B. NUM-CON-MON Use Case) mittels IK-Nummern ohne Offenlegung individueller Versicherten-IDs
* Aufrechterhaltung grober demografischer Granularität für die Bildung von Forschungskohorten unter Vermeidung von Re-Identifikation

##### ⚠️ Wichtig: Einschränkungen bei der Pseudonymisierungs-Validierung

Dieses Profil **enthält keine Regeln zur Prüfung der korrekten Pseudonymisierung**. Ein erfolgreiches Validieren gegen dieses Profil bedeutet daher **nicht**, dass eine fachlich oder datenschutzrechtlich korrekte Pseudonymisierung erfolgt ist.

Anforderungen an die Pseudonymisierung können je nach Projektkontext variieren und lassen sich nicht vollständig in einem einzigen FHIR-Profil abbilden. Für umfassende Hinweise zur Pseudonymisierung konsultieren Sie das [MII Pseudonymization Interface](https://medizininformatik-initiative.github.io/mii-interface-module-pseudonymization/).

### Profilspezifische Implementierungshinweise

Dieser Abschnitt enthält detaillierte Implementierungshinweise für das MII-Profil für pseudonymisierte Patientendaten.

#### Pseudonymisierungs-Identifier

Das pseudonymisierte Patientenprofil verwendet spezialisierte Identifier-Typen:

* **`Patient.identifier:pseudonymisierterIdentifier`**: Pseudonymisierter Identifier für die PatientIn 
* **MUSS** entsprechend typisiert werden, falls der Identifier ein abgeleitetes Pseudonym ist
* Zu verwenden, wenn der Identifier durch einen kontrollierten Prozess mit den originalen Patientendaten verknüpft werden kann
* Typischerweise in Forschungsszenarien verwendet, in denen eine De-Pseudonymisierung für spezifische Zwecke notwendig sein kann
 
* **`Patient.identifier:anonymisierterIdentifier`**: Anonymisierter Identifier für die PatientIn 
* **SOLLTE** nur verwendet werden, wenn keinerlei Rückschlüsse auf den originalen Datensatz möglich sind
* Repräsentiert irreversible Anonymisierung, bei der eine Re-Identifikation nicht möglich ist
 
* **`Patient.identifier:maskierterVersichertenIdentifier`**: Maskierter Krankenversicherten-Identifier 
* Für krankenkassenbasierte Analysen ohne Offenlegung der tatsächlichen Versicherten-ID verwendet
* Siehe [Best Practice - Maskierte Versicherten-ID mit IK-Nummer](#best-practice---maskierte-versicherten-id-mit-ik-nummer) für Implementierungsdetails
 

##### Best Practice - Maskierte Versicherten-ID mit IK-Nummer

Für Use Cases, die eine Krankenkassen-Analyse erfordern (z.B. NUM-CON-MON), ist es notwendig, die IK-Nummer (Institutionskennzeichen) der Krankenkasse im pseudonymisierten Patientenprofil mitzuführen, ohne die tatsächliche Versicherten-ID offenzulegen.

Dies wird erreicht, indem:

1. Ein`Identifier`mit dem Typ`KVZ10`(10-stellige Krankenversicherten-ID) erstellt wird
1. Das Element`Identifier.value`durch die Extension [Data Absent Reason] mit dem Code`masked`ersetzt wird
1. Die IK-Nummer der Krankenkasse in`Identifier.assigner.identifier`angegeben wird

Ein Beispiel für diese Modellierung findet sich in der Beispielressource.

**Usages:**

* Examples for this Profile: [Patient/mii-exa-person-patient-pseudonymisiert](Patient-mii-exa-person-patient-pseudonymisiert.md)
* CapabilityStatements using this Profile: [MII CPS Person CapabilityStatement](CapabilityStatement-mii-cps-person-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.medizininformatikinitiative.kerndatensatz.base|current/StructureDefinition/mii-pr-person-patient-pseudonymisiert)

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

Diese Struktur ist abgeleitet von [Patient](http://hl7.org/fhir/R4/patient.html) 

#### Constraints

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Patient](http://hl7.org/fhir/R4/patient.html) 

**Summary**

Mandatory: 1 element(6 nested mandatory elements)
 Must-Support: 26 elements

**Structures**

This structure refers to these other structures:

* [Identifier-Profil für die 10-stellige Krankenversichertennummer(http://fhir.de/StructureDefinition/identifier-kvid-10)](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/StructureDefinition/identifier-kvid-10)
* [Identifier-Profil für die Abbildung eines Institutionskennzeichens (IKNR)(http://fhir.de/StructureDefinition/identifier-iknr)](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/StructureDefinition/identifier-iknr)
* [Adresse, deutsches Basisprofil(http://fhir.de/StructureDefinition/address-de-basis)](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/StructureDefinition/address-de-basis)

**Extensions**

This structure refers to these extensions:

* [http://hl7.org/fhir/StructureDefinition/data-absent-reason](http://hl7.org/fhir/extensions/5.2.0/StructureDefinition-data-absent-reason.html)
* [http://fhir.de/StructureDefinition/gender-amtlich-de](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/StructureDefinition/gender-amtlich-de)
* [http://fhir.de/StructureDefinition/destatis/ags](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/StructureDefinition/destatis/ags)

**Slices**

This structure defines the following [Slices](http://hl7.org/fhir/R4/profiling.html#slices):

* The element 1 is sliced based on the value of Patient.identifier
* The element 1 is sliced based on the value of Patient.address

 **Schlüsselelemente-Ansicht** 

#### Terminology Bindings

#### Constraints

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [Patient](http://hl7.org/fhir/R4/patient.html) 

#### Constraints

 **Snapshot-AnsichtView** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Patient](http://hl7.org/fhir/R4/patient.html) 

**Summary**

Mandatory: 1 element(6 nested mandatory elements)
 Must-Support: 26 elements

**Structures**

This structure refers to these other structures:

* [Identifier-Profil für die 10-stellige Krankenversichertennummer(http://fhir.de/StructureDefinition/identifier-kvid-10)](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/StructureDefinition/identifier-kvid-10)
* [Identifier-Profil für die Abbildung eines Institutionskennzeichens (IKNR)(http://fhir.de/StructureDefinition/identifier-iknr)](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/StructureDefinition/identifier-iknr)
* [Adresse, deutsches Basisprofil(http://fhir.de/StructureDefinition/address-de-basis)](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/StructureDefinition/address-de-basis)

**Extensions**

This structure refers to these extensions:

* [http://hl7.org/fhir/StructureDefinition/data-absent-reason](http://hl7.org/fhir/extensions/5.2.0/StructureDefinition-data-absent-reason.html)
* [http://fhir.de/StructureDefinition/gender-amtlich-de](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/StructureDefinition/gender-amtlich-de)
* [http://fhir.de/StructureDefinition/destatis/ags](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/StructureDefinition/destatis/ags)

**Slices**

This structure defines the following [Slices](http://hl7.org/fhir/R4/profiling.html#slices):

* The element 1 is sliced based on the value of Patient.identifier
* The element 1 is sliced based on the value of Patient.address

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-mii-pr-person-patient-pseudonymisiert.csv), [Excel](../StructureDefinition-mii-pr-person-patient-pseudonymisiert.xlsx), [Schematron](../StructureDefinition-mii-pr-person-patient-pseudonymisiert.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-person-patient-pseudonymisiert",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert",
  "version" : "2026.0.0",
  "name" : "MII_PR_Person_PatientPseudonymisiert",
  "title" : "MII PR Person Patient (Pseudonymisiert)",
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
            "valueString" : "Patient / Patientin pseudonymisiert"
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
            "valueString" : "Patient pseudonymized"
          }
        ],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }
    ]
  },
  "status" : "active",
  "date" : "2025-07-22",
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
  "description" : "Dieses Profil beschreibt eine*n pseudonymisierte*n Patient*in in der Medizininformatik-Initiative.",
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
            "valueString" : "Demografische und andere administrative Informationen über eine Patientin oder einen Patienten."
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
            "valueString" : "Demographics and other administrative information about a patient."
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
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "cda",
      "uri" : "http://hl7.org/v3/cda",
      "name" : "CDA (R2)"
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
    },
    {
      "identity" : "loinc",
      "uri" : "http://loinc.org",
      "name" : "LOINC code for the element"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Patient",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Patient",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Patient",
        "path" : "Patient",
        "constraint" : [
          {
            "key" : "mii-pat-1",
            "severity" : "error",
            "human" : "Falls die Geschlechtsangabe 'other' gewählt wird, muss die amtliche Differenzierung per Extension angegeben werden",
            "expression" : "gender.exists() and gender='other' implies gender.extension('http://fhir.de/StructureDefinition/gender-amtlich-de').exists()",
            "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert"
          }
        ]
      },
      {
        "id" : "Patient.id",
        "path" : "Patient.id",
        "mustSupport" : true
      },
      {
        "id" : "Patient.meta",
        "path" : "Patient.meta",
        "mustSupport" : true
      },
      {
        "id" : "Patient.meta.profile",
        "path" : "Patient.meta.profile",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier",
        "path" : "Patient.identifier",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "short" : "Patienten-Identifikator",
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
        "definition" : "Ein Identifikator für den/die Patient*in",
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
                  "valueString" : "Ein Identifikator für den/die Patient*in"
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
                  "valueString" : "An identifier for this patient"
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
        "id" : "Patient.identifier:PseudonymisierterIdentifier",
        "path" : "Patient.identifier",
        "sliceName" : "PseudonymisierterIdentifier",
        "short" : "Pseudonymisierter Identifikator",
        "definition" : "Ein Pseudonym ersetzt einen Originalwert. \nDie Verarbeitung ist umkehrbar. Zusätzliche Informationen sind erforderlich, um den Originalwert zu rekonstruieren, bspw. eine Trusted Third Party.",
        "min" : 0,
        "max" : "*",
        "patternIdentifier" : {
          "type" : {
            "coding" : [
              {
                "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationValue",
                "code" : "PSEUDED"
              }
            ]
          }
        },
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:AnonymisierterIdentifier",
        "path" : "Patient.identifier",
        "sliceName" : "AnonymisierterIdentifier",
        "short" : "Anonymisierter Identifikator",
        "definition" : "Ein Anonymisierter Identifikator ersetzt einen Originalwert. \nDie Verarbeitung ist unumkehrbar. Der Originalwert kann nicht oder nur mit unverhältnismäßigem Aufwand rekonstruiert werden.",
        "min" : 0,
        "max" : "*",
        "patternIdentifier" : {
          "type" : {
            "coding" : [
              {
                "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationValue",
                "code" : "ANONYED"
              }
            ]
          }
        },
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:MaskierterVersichertenIdentifer",
        "path" : "Patient.identifier",
        "sliceName" : "MaskierterVersichertenIdentifer",
        "short" : "Maskierter Identifier der Krankenversicherten-ID",
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
                  "valueString" : "Maskierter Identifier der Krankenversicherten-ID"
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
                  "valueString" : "Masked identifier of the health insurance ID"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Identifier der Krankenversichertennummer, bei dem der Wert maskiert wurde.",
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
                  "valueString" : "Identifier der Krankenversichertennummer, bei dem der Wert maskiert wurde."
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
                  "valueString" : "Health insurance number identifier with masked value."
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
            "code" : "Identifier",
            "profile" : ["http://fhir.de/StructureDefinition/identifier-kvid-10"]
          }
        ],
        "patternIdentifier" : {
          "type" : {
            "coding" : [
              {
                "system" : "http://fhir.de/CodeSystem/identifier-type-de-basis",
                "code" : "KVZ10"
              }
            ]
          }
        },
        "constraint" : [
          {
            "key" : "ide-masked-1",
            "severity" : "warning",
            "human" : "Identifier.value SOLLTE keinen Wert und SOLLTE die Extension Data Absent Reason mit Code 'masked' enthalten.",
            "expression" : "value.hasValue().not() and value.extension.where(url='http://hl7.org/fhir/StructureDefinition/data-absent-reason' and value='masked').exists()",
            "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:MaskierterVersichertenIdentifer.type",
        "path" : "Patient.identifier.type",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:MaskierterVersichertenIdentifer.system",
        "path" : "Patient.identifier.system",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:MaskierterVersichertenIdentifer.value",
        "path" : "Patient.identifier.value",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:MaskierterVersichertenIdentifer.value.extension",
        "path" : "Patient.identifier.value.extension",
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
        "id" : "Patient.identifier:MaskierterVersichertenIdentifer.value.extension:data-absent-reason",
        "path" : "Patient.identifier.value.extension",
        "sliceName" : "data-absent-reason",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://hl7.org/fhir/StructureDefinition/data-absent-reason"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:MaskierterVersichertenIdentifer.value.extension:data-absent-reason.value[x]",
        "path" : "Patient.identifier.value.extension.value[x]",
        "patternCode" : "masked"
      },
      {
        "id" : "Patient.identifier:MaskierterVersichertenIdentifer.assigner",
        "path" : "Patient.identifier.assigner",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:MaskierterVersichertenIdentifer.assigner.identifier",
        "path" : "Patient.identifier.assigner.identifier",
        "min" : 1,
        "type" : [
          {
            "code" : "Identifier",
            "profile" : ["http://fhir.de/StructureDefinition/identifier-iknr"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:MaskierterVersichertenIdentifer.assigner.identifier.type",
        "path" : "Patient.identifier.assigner.identifier.type",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:MaskierterVersichertenIdentifer.assigner.identifier.system",
        "path" : "Patient.identifier.assigner.identifier.system",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:MaskierterVersichertenIdentifer.assigner.identifier.value",
        "path" : "Patient.identifier.assigner.identifier.value",
        "mustSupport" : true
      },
      {
        "id" : "Patient.active",
        "path" : "Patient.active",
        "short" : "Aktiv",
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
                  "valueString" : "Aktiv"
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
                  "valueString" : "Active"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Gibt an, ob diese Patient-Ressource aktiv verwendet wird.",
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
                  "valueString" : "Gibt an, ob diese Patient-Ressource aktiv verwendet wird."
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
                  "valueString" : "Whether this patient's record is in active use"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Patient.gender",
        "path" : "Patient.gender",
        "short" : "Administratives Geschlecht",
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
                  "valueString" : "Administratives Geschlecht"
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
                  "valueString" : "Administrative gender"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "männlich | weiblich | andere | unbekannt | unbestimmt | divers",
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
                  "valueString" : "männlich | weiblich | andere | unbekannt | unbestimmt | divers"
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
                  "valueString" : "male | female | other | unknown | undetermined | diverse"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Patient.gender.extension",
        "path" : "Patient.gender.extension",
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
        "id" : "Patient.gender.extension:other-amtlich",
        "path" : "Patient.gender.extension",
        "sliceName" : "other-amtlich",
        "short" : "Extension Administratives Geschlecht",
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
                  "valueString" : "Extension Administratives Geschlecht"
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
                  "valueString" : "Extension administrative gender"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Extension zur genaueren Differenzierung des administrativen Geschlechts",
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
                  "valueString" : "Extension zur genaueren Differenzierung des administrativen Geschlechts"
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
                  "valueString" : "Extension for detailed differentiation of administrative gender"
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
            "profile" : ["http://fhir.de/StructureDefinition/gender-amtlich-de"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Patient.birthDate",
        "path" : "Patient.birthDate",
        "short" : "Geburtsdatum",
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
                  "valueString" : "Geburtsdatum"
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
                  "valueString" : "Date of birth"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Das Geburtsdatum der Patientin oder des Patienten",
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
                  "valueString" : "Das Geburtsdatum der Patientin oder des Patienten"
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
                  "valueString" : "The date of birth for the individual"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Patient.address",
        "path" : "Patient.address",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "short" : "Adresse",
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
                  "valueString" : "Adresse"
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
                  "valueString" : "Address"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Eine Adresse der Patientin oder des Patienten",
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
                  "valueString" : "Eine Adresse der Patientin oder des Patienten"
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
                  "valueString" : "An address for the individual"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift",
        "path" : "Patient.address",
        "sliceName" : "Strassenanschrift",
        "short" : "Straßenanschrift",
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
                  "valueString" : "Straßenanschrift"
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
                  "valueString" : "Street address"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Eine Straßenanschrift der Patientin oder des Patienten",
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
                  "valueString" : "Eine Straßenanschrift der Patientin oder des Patienten"
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
                  "valueString" : "A street address for the individual"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Address",
            "profile" : ["http://fhir.de/StructureDefinition/address-de-basis"]
          }
        ],
        "patternAddress" : {
          "type" : "both"
        },
        "constraint" : [
          {
            "key" : "pat-cnt-2or3-char",
            "severity" : "warning",
            "human" : "The content of the country element (if present) SHALL be selected EITHER from ValueSet ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2 OR MAY be selected from ISO Country Alpha-3 Value Set http://hl7.org/fhir/ValueSet/iso3166-1-3, IF the country is not specified in value Set ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2.",
            "expression" : "country.empty() or (country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-2') or country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-3'))",
            "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.type",
        "path" : "Patient.address.type",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.city.extension",
        "path" : "Patient.address.city.extension",
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
        "id" : "Patient.address:Strassenanschrift.city.extension:gemeindeschluessel",
        "path" : "Patient.address.city.extension",
        "sliceName" : "gemeindeschluessel",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://fhir.de/StructureDefinition/destatis/ags"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.postalCode",
        "path" : "Patient.address.postalCode",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.country",
        "path" : "Patient.address.country",
        "min" : 1,
        "mustSupport" : true
      }
    ]
  }
}

```
