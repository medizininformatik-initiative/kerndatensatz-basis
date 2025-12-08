# MII PR Person Patient - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Resource Profile: MII PR Person Patient 

 
Demographics and other administrative information about a patient. 

**Example Usage Scenarios:**

* Document patient demographics including name, gender, birth date, and address for clinical care and research
* Record health insurance information for administrative purposes
* Maintain organizational patient identifiers (PID) for linking patient data across systems within a healthcare organization
* Enable pseudonymized patient representations for research use cases while preserving essential demographic characteristics

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the MII Patient Profile.

#### Patient Identification

Patient identification uses multiple identifier types depending on the context:

* **`Patient.identifier:versichertenId`**: Lebenslange Krankenversicherten-ID (10-stellige KVID) for all health insurance types (GKV, PKV, Sonderkostenträger) 
* **IMPORTANT**: The Assigner element **MUST** contain the IKNR (Institutionskennzeichen) of the issuing institution
* Always represents the current insurance number of the patient
* Use `Identifier.type` code `KVZ10` from `http://fhir.de/CodeSystem/identifier-type-de-basis`
* Codes `GKV` and `PKV` have status `retired` and should not be used
 
* **`Patient.identifier:pid`**: Organisationsinterner Patienten-Identifier - the leading (MPI) ID of the patient 
* A reference to the issuing Organization in `Patient.identifier:pid.assigner` is **RECOMMENDED**
* Logical reference via IK-Nummer or IHE Affinity Domain OID is permitted
* The CodeSystem [Core-Location-Identifier](https://simplifier.net/packages/de.medizininformatikinitiative.kerndatensatz.meta/2025.0.0/files/2678530) for all MII sites can be used
 
* **`Patient.identifier`**: Any other identifiers when GKV/PKV/PID are not applicable

##### Best Practice - Krankenversicherten-ID Changes

Compared to previous versions, the Krankenversicherten-ID in `Patient.identifier` is no longer distinguished between GKV and PKV. `Patient.identifier:versichertenId` applies to all health insurance numbers, regardless of whether GKV, PKV, or special insurance carriers.

Use the code `KVZ10` from `http://fhir.de/CodeSystem/identifier-type-de-basis` as `Identifier.type`. The codes `GKV` and `PKV` have retired status. See constraint **kvid-2** in the profile [IdentifierKvid10](https://simplifier.net/packages/de.basisprofil.r4/1.5.4/files/2879564) in the German FHIR Base Profiles.

#### Patient Name

Patient names follow the [German Base Profile for HumanName](https://ig.fhir.de/basisprofile-de/1.5.4/ig-markdown-Ressourcen-Patient-Name.html):

* **Name Components**: The breakdown of the complete name into components (e.g., Vorsatzwort, Namenszusatz, Nachname) **SHOULD** only be performed if this information is explicitly available at this granularity (e.g., through direct import based on a VSDM dataset)
* **Birth Name**: By general convention, the birth name (`name.use = maiden`) contains only the family name
* **Multiple Names**: Multiple name entries are permitted for different use cases (official, maiden, etc.)

#### Gender

Gender documentation follows the [German Base Profile for Gender](https://ig.fhir.de/basisprofile-de/1.5.4/ig-markdown-Ressourcen-Patient.html#ig-markdown-Ressourcen-Patient-Geschlecht):

* **`Patient.gender`**: Administrative gender (required)
* **`Patient.gender.extension:other-amtlich`**: Official gender codes according to German regulations for cases beyond male/female/unknown

#### Birth Date and Vital Status

* **`Patient.birthDate`**: Full birth date when available. See [German Base Profile - Geburtsdatum](https://ig.fhir.de/basisprofile-de/1.5.4/ig-markdown-Ressourcen-Patient.html#ig-markdown-Ressourcen-Patient-Geburtsdatum)
* **`Patient.deceased[x]`**: 
* `deceasedBoolean` **SHOULD** be replaced by `deceasedDateTime` when the patient is deceased and the datetime is known
 

#### Address Information

Address details follow the [German Base Profile - Adresse](https://ig.fhir.de/basisprofile-de/1.5.4/ig-markdown-Ressourcen-Patient.html#ig-markdown-Ressourcen-Patient-Addresse):

* **Multiple Addresses**: Multiple addresses are permitted
* **Address History**: Systems **SHOULD** mark former addresses appropriately so that the current address of the patient is identifiable
* **Address Components**: 
* `address.line` with extensions for Straße, Hausnummer, Adresszusatz, Postfach
* `address.city` with extension for Gemeindeschlüssel and Stadtteil (for city-states)
* `address.postalCode` for PLZ
* `address.country` for Land
 

##### Best Practice - Address Components

**Stadtteil (District):** The Stadtteil is not part of the [VSDM dataset](https://fachportal.gematik.de/anwendungen/versichertenstammdatenmanagement) from Gematik. Other sources conforming to §21 KHEntgG may need to be consulted for this information.

**Address Structure:** For city-states (Stadtstaaten), use `Patient.address.city` combined with `Patient.address.extension.Stadtteil` to represent `Person.Demographie.Adresse.Wohnort`.

**Usages:**

* Examples for this Profile: [Patient/mii-exa-person-patient-1](Patient-mii-exa-person-patient-1.md)
* CapabilityStatements using this Profile: [MII CPS Person CapabilityStatement](CapabilityStatement-mii-cps-person-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.medizininformatikinitiative.kerndatensatz.base|current/StructureDefinition/mii-pr-person-patient)

**Changes since version {current}:**

* New Content

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-pr-person-patient.csv), [Excel](../StructureDefinition-mii-pr-person-patient.xlsx), [Schematron](../StructureDefinition-mii-pr-person-patient.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-person-patient",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient",
  "version" : "2026.0.0-dev.1",
  "name" : "MII_PR_Person_Patient",
  "title" : "MII PR Person Patient",
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
            "valueString" : "Patient / Patientin"
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
            "valueString" : "Patient"
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
  "description" : "Dieses Profil beschreibt eine Patient*in in der Medizininformatik-Initiative.",
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
            "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient"
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
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:versichertenId",
        "path" : "Patient.identifier",
        "sliceName" : "versichertenId",
        "short" : "Krankenversichertennummer",
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
                  "valueString" : "Krankenversichertennummer"
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
                  "valueString" : "Health insurance number"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Krankenversichertennummer, unabhängig, ob GKV, PKV oder Sonderkostenträger",
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
                  "valueString" : "10-stellige KVID"
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
                  "valueString" : "10-digit health insurance number"
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
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:versichertenId.type",
        "path" : "Patient.identifier.type",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:versichertenId.system",
        "path" : "Patient.identifier.system",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:versichertenId.value",
        "path" : "Patient.identifier.value",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:versichertenId.assigner",
        "path" : "Patient.identifier.assigner",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:versichertenId.assigner.identifier",
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
        "id" : "Patient.identifier:versichertenId.assigner.identifier.type",
        "path" : "Patient.identifier.assigner.identifier.type",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:versichertenId.assigner.identifier.system",
        "path" : "Patient.identifier.assigner.identifier.system",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:versichertenId.assigner.identifier.value",
        "path" : "Patient.identifier.assigner.identifier.value",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:pid",
        "path" : "Patient.identifier",
        "sliceName" : "pid",
        "short" : "Patientenidentifikation",
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
                  "valueString" : "Organisationsinterner Patienten-Identifikator"
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
                  "valueString" : "Organization-internal patient identifier"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Patientenidentifikator innerhalb einer Organisation",
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
                  "valueString" : "Führende ID der Patient*in in der Organisation"
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
                  "valueString" : "Medical record number of the patient in the organization"
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
            "code" : "Identifier",
            "profile" : ["http://fhir.de/StructureDefinition/identifier-pid"]
          }
        ],
        "patternIdentifier" : {
          "type" : {
            "coding" : [
              {
                "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
                "code" : "MR"
              }
            ]
          }
        },
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:pid.type",
        "path" : "Patient.identifier.type",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:pid.system",
        "path" : "Patient.identifier.system",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:pid.value",
        "path" : "Patient.identifier.value",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:pid.assigner",
        "path" : "Patient.identifier.assigner",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:pid.assigner.identifier.type",
        "path" : "Patient.identifier.assigner.identifier.type",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
              "code" : "XX"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:pid.assigner.identifier.system",
        "path" : "Patient.identifier.assigner.identifier.system",
        "constraint" : [
          {
            "key" : "mii-pat-2",
            "severity" : "error",
            "human" : "Entweder IKNR oder MII Core Location Identifier muss verwendet werden",
            "expression" : "$this = 'http://fhir.de/sid/arge-ik/iknr' or $this = 'https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier'",
            "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient"
          }
        ]
      },
      {
        "id" : "Patient.name",
        "path" : "Patient.name",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "short" : "Name",
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
                  "valueString" : "Name"
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
                  "valueString" : "Name"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Name der Patientin oder des Patienten",
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
                  "valueString" : "Name der Patientin oder des Patienten"
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
                  "valueString" : "A name associated with the patient"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:name",
        "path" : "Patient.name",
        "sliceName" : "name",
        "short" : "Personenname",
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
                  "valueString" : "Personenname"
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
                  "valueString" : "Person's name"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Personenname mit in Deutschland üblichen Namensbestandteilen",
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
                  "valueString" : "Personenname mit in Deutschland üblichen Namensbestandteilen"
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
                  "valueString" : "A person's name with components typically used in Germany"
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
            "code" : "HumanName",
            "profile" : ["http://fhir.de/StructureDefinition/humanname-de-basis"]
          }
        ],
        "patternHumanName" : {
          "use" : "official"
        },
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:name.use",
        "path" : "Patient.name.use",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:name.family",
        "path" : "Patient.name.family",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:name.family.extension:namenszusatz",
        "path" : "Patient.name.family.extension",
        "sliceName" : "namenszusatz",
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:name.family.extension:nachname",
        "path" : "Patient.name.family.extension",
        "sliceName" : "nachname",
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:name.family.extension:vorsatzwort",
        "path" : "Patient.name.family.extension",
        "sliceName" : "vorsatzwort",
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:name.given",
        "path" : "Patient.name.given",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:name.prefix",
        "path" : "Patient.name.prefix",
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:name.prefix.extension:prefix-qualifier",
        "path" : "Patient.name.prefix.extension",
        "sliceName" : "prefix-qualifier",
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:geburtsname",
        "path" : "Patient.name",
        "sliceName" : "geburtsname",
        "short" : "Geburtsname",
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
                  "valueString" : "Geburtsname"
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
                  "valueString" : "Maiden name"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Name, der vor einer Namensänderung aufgrund von Heirat verwendet wurde",
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
                  "valueString" : "Name, der vor einer Namensänderung aufgrund von Heirat verwendet wurde."
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
                  "valueString" : "A name used prior to changing name because of marriage."
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
            "code" : "HumanName",
            "profile" : ["http://fhir.de/StructureDefinition/humanname-de-basis"]
          }
        ],
        "patternHumanName" : {
          "use" : "maiden"
        },
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:geburtsname.use",
        "path" : "Patient.name.use",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:geburtsname.family",
        "path" : "Patient.name.family",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:geburtsname.family.extension:namenszusatz",
        "path" : "Patient.name.family.extension",
        "sliceName" : "namenszusatz",
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:geburtsname.family.extension:nachname",
        "path" : "Patient.name.family.extension",
        "sliceName" : "nachname",
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:geburtsname.family.extension:vorsatzwort",
        "path" : "Patient.name.family.extension",
        "sliceName" : "vorsatzwort",
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:geburtsname.given",
        "path" : "Patient.name.given",
        "max" : "0"
      },
      {
        "id" : "Patient.name:geburtsname.prefix",
        "path" : "Patient.name.prefix",
        "max" : "0"
      },
      {
        "id" : "Patient.name:geburtsname.prefix.extension:prefix-qualifier",
        "path" : "Patient.name.prefix.extension",
        "sliceName" : "prefix-qualifier",
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
        "id" : "Patient.birthDate.extension",
        "path" : "Patient.birthDate.extension",
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
        "id" : "Patient.birthDate.extension:data-absent-reason",
        "path" : "Patient.birthDate.extension",
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
        "id" : "Patient.deceased[x]",
        "path" : "Patient.deceased[x]",
        "short" : "Verstorben",
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
                  "valueString" : "Verstorben"
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
                  "valueString" : "Deceased"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Gibt an, ob die Person verstorben ist oder nicht",
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
                  "valueString" : "Gibt an, ob die Person verstorben ist oder nicht"
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
                  "valueString" : "Indicates if the individual is deceased or not"
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
            "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.extension:Stadtteil",
        "path" : "Patient.address.extension",
        "sliceName" : "Stadtteil",
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.type",
        "path" : "Patient.address.type",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.line",
        "path" : "Patient.address.line",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.line.extension:Strasse",
        "path" : "Patient.address.line.extension",
        "sliceName" : "Strasse",
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.line.extension:Hausnummer",
        "path" : "Patient.address.line.extension",
        "sliceName" : "Hausnummer",
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.line.extension:Adresszusatz",
        "path" : "Patient.address.line.extension",
        "sliceName" : "Adresszusatz",
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.line.extension:Postfach",
        "path" : "Patient.address.line.extension",
        "sliceName" : "Postfach",
        "max" : "0",
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.city",
        "path" : "Patient.address.city",
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
      },
      {
        "id" : "Patient.address:Postfach",
        "path" : "Patient.address",
        "sliceName" : "Postfach",
        "short" : "Postfach",
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
                  "valueString" : "Postfach"
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
                  "valueString" : "Postbox"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Eine Postfachanschrift der Patientin oder des Patienten",
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
                  "valueString" : "Eine Postfachanschrift der Patientin oder des Patienten"
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
                  "valueString" : "A postbox address for the individual"
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
          "type" : "postal"
        },
        "constraint" : [
          {
            "key" : "pat-cnt-2or3-char",
            "severity" : "warning",
            "human" : "The content of the country element (if present) SHALL be selected EITHER from ValueSet ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2 OR MAY be selected from ISO Country Alpha-3 Value Set http://hl7.org/fhir/ValueSet/iso3166-1-3, IF the country is not specified in value Set ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2.",
            "expression" : "country.empty() or (country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-2') or country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-3'))",
            "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Postfach.extension:Stadtteil",
        "path" : "Patient.address.extension",
        "sliceName" : "Stadtteil",
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Postfach.type",
        "path" : "Patient.address.type",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Postfach.line",
        "path" : "Patient.address.line",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Postfach.line.extension:Strasse",
        "path" : "Patient.address.line.extension",
        "sliceName" : "Strasse",
        "max" : "0"
      },
      {
        "id" : "Patient.address:Postfach.line.extension:Hausnummer",
        "path" : "Patient.address.line.extension",
        "sliceName" : "Hausnummer",
        "max" : "0"
      },
      {
        "id" : "Patient.address:Postfach.line.extension:Adresszusatz",
        "path" : "Patient.address.line.extension",
        "sliceName" : "Adresszusatz",
        "max" : "0"
      },
      {
        "id" : "Patient.address:Postfach.line.extension:Postfach",
        "path" : "Patient.address.line.extension",
        "sliceName" : "Postfach",
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Postfach.city",
        "path" : "Patient.address.city",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Postfach.city.extension",
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
        "id" : "Patient.address:Postfach.city.extension:gemeindeschluessel",
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
        "id" : "Patient.address:Postfach.postalCode",
        "path" : "Patient.address.postalCode",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Postfach.country",
        "path" : "Patient.address.country",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.link",
        "path" : "Patient.link",
        "short" : "Verweis",
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
                  "valueString" : "Verweis"
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
                  "valueString" : "Link"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "definition" : "Verweis auf eine andere Patientenressource, die die gleiche tatsächliche Person betrifft",
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
                  "valueString" : "Verweis auf eine andere Patientenressource, die die gleiche tatsächliche Person betrifft"
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
                  "valueString" : "Link to another patient resource that concerns the same actual person"
                }
              ],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Patient.link.other",
        "path" : "Patient.link.other",
        "mustSupport" : true
      },
      {
        "id" : "Patient.link.type",
        "path" : "Patient.link.type",
        "mustSupport" : true
      }
    ]
  }
}

```
