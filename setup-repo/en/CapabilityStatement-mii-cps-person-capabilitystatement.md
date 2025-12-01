# MII CPS Person CapabilityStatement - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## CapabilityStatement: MII CPS Person CapabilityStatement 

 
Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss um das Modul Person der Medizininformatik Initiative zu implementieren. 

 [Raw OpenAPI-Swagger Definition file](../mii-cps-person-capabilitystatement.openapi.json) | [Download](../mii-cps-person-capabilitystatement.openapi.json) 

-------

**English**

-------

## MII CPS Person CapabilityStatement

* Implementation Guide Version: 2026.0.0-dev.1 
* FHIR Version: 4.0.1 
* Supported Formats: `xml`, `json`
* Published on: 2025-02-28 
* Published by: Medical Informatics Initiative (MII) 

> **Note to Implementers: FHIR Capabilities**Any FHIR capability may be 'allowed' by the system unless explicitly marked as 'SHALL NOT'. A few items are marked as MAY in the Implementation Guide to highlight their potential relevance to the use case.

## FHIR RESTful Capabilities

### Mode: server

### Capabilities by Resource/Profile

#### Summary

The summary table lists the resources that are part of this configuration, and for each resource it lists:

* The relevant profiles (if any)
* The interactions supported by each resource (**R**ead, **S**earch, **U**pdate, and **C**reate, are always shown, while **VR**ead, **P**atch, **D**elete, **H**istory on **I**nstance, or **H**istory on **T**ype are only present if at least one of the resources has support for them.
* The required, recommended, and some optional search parameters (if any).
* The linked resources enabled for `_include`
* The other resources enabled for `_revinclude`
* The operations on the resource (if any)

| | | | | | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| [Patient](#Patient1-1) | Supported Profiles  [MII PR Person Patientversion: 2026.0.0-dev.1)](StructureDefinition-mii-pr-person-patient.md)  [MII PR Person Patient (Pseudonymisiert)version: 2026.0.0-dev.1)](StructureDefinition-mii-pr-person-patient-pseudonymisiert.md) | **Y** | **Y** |  |  | _count, _summary, _id, _profile, identifier, assigner-pid, given, family, name, prefix, prefix-qualifier, gender, other-amtlich, birthdate, death-date, deceased, address, address-city, address-postalcode, address-country, gemeindeschluessel, strasse, hausnummer, adresszusatz, postfach, stadtteil, link |  |  |  |
| [Observation](#Observation1-2) | Supported Profiles  [MII PR Person Vitalstatusversion: 2026.0.0-dev.1)](StructureDefinition-mii-pr-person-vitalstatus.md) | **Y** | **Y** |  |  | _count, _summary, _id, _profile, status, code, subject, patient, date, value-concept, code-value-concept |  |  |  |
| [Condition](#Condition1-3) | Supported Profiles  [MII PR Person Todesursacheversion: 2026.0.0-dev.1)](StructureDefinition-mii-pr-person-todesursache.md) | **Y** | **Y** |  |  | _count, _summary, _id, _profile, category, code, subject, patient |  |  |  |

-------

#### Resource Conformance: SHALL Patient

Core FHIR Resource

[Patient](http://hl7.org/fhir/R4/patient.html)

Reference Policy

Interaction summary

* **SHALL** support `read`, `search-type`.

Supported Profiles
[MII PR Person Patientversion: 2026.0.0-dev.1)](StructureDefinition-mii-pr-person-patient.md)
[MII PR Person Patient (Pseudonymisiert)version: 2026.0.0-dev.1)](StructureDefinition-mii-pr-person-patient-pseudonymisiert.md)

Search Parameters


 

#### Resource Conformance: SHALL Observation

Core FHIR Resource

[Observation](http://hl7.org/fhir/R4/observation.html)

Reference Policy

Interaction summary

* **SHALL** support `read`, `search-type`.

Supported Profiles
[MII PR Person Vitalstatusversion: 2026.0.0-dev.1)](StructureDefinition-mii-pr-person-vitalstatus.md)

Search Parameters


 

#### Resource Conformance: SHALL Condition

Core FHIR Resource

[Condition](http://hl7.org/fhir/R4/condition.html)

Reference Policy

Interaction summary

* **SHALL** support `read`, `search-type`.

Supported Profiles
[MII PR Person Todesursacheversion: 2026.0.0-dev.1)](StructureDefinition-mii-pr-person-todesursache.md)

Search Parameters


 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "mii-cps-person-capabilitystatement",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/CapabilityStatement/metadata",
  "version" : "2026.0.0-dev.1",
  "name" : "MII_CPS_Person_CapabilityStatement",
  "title" : "MII CPS Person CapabilityStatement",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-02-28",
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
  "description" : "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss um das Modul Person der Medizininformatik Initiative zu implementieren.",
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
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["xml", "json"],
  "rest" : [
    {
      "mode" : "server",
      "resource" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
              "valueCode" : "SHALL"
            }
          ],
          "type" : "Patient",
          "supportedProfile" : [
            "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient|2026.0.0-dev.1",
            "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert|2026.0.0-dev.1"
          ],
          "interaction" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "code" : "read"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "code" : "search-type"
            }
          ],
          "searchParam" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_count",
              "type" : "special"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_summary",
              "type" : "special"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_id",
              "definition" : "http://hl7.org/fhir/SearchParameter/Resource-id",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_profile",
              "definition" : "http://hl7.org/fhir/SearchParameter/Resource-profile",
              "type" : "uri"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "identifier",
              "definition" : "http://hl7.org/fhir/SearchParameter/Patient-identifier",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "assigner-pid",
              "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-assignerpid",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "given",
              "definition" : "http://hl7.org/fhir/SearchParameter/individual-given",
              "type" : "string"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "family",
              "definition" : "http://hl7.org/fhir/SearchParameter/individual-family",
              "type" : "string"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "name",
              "definition" : "http://hl7.org/fhir/SearchParameter/Patient-name",
              "type" : "string"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "prefix",
              "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-prefix",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "prefix-qualifier",
              "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-prefixqualifier",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "gender",
              "definition" : "http://hl7.org/fhir/SearchParameter/individual-gender",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "other-amtlich",
              "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-otheramtlich",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "birthdate",
              "definition" : "http://hl7.org/fhir/SearchParameter/individual-birthdate",
              "type" : "date"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "death-date",
              "definition" : "http://hl7.org/fhir/SearchParameter/Patient-death-date",
              "type" : "date"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "deceased",
              "definition" : "http://hl7.org/fhir/SearchParameter/Patient-deceased",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "address",
              "definition" : "http://hl7.org/fhir/SearchParameter/individual-address",
              "type" : "string"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "address-city",
              "definition" : "http://hl7.org/fhir/SearchParameter/individual-address-city",
              "type" : "string"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "address-postalcode",
              "definition" : "http://hl7.org/fhir/SearchParameter/individual-address-postalcode",
              "type" : "string"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "address-country",
              "definition" : "http://hl7.org/fhir/SearchParameter/individual-address-country",
              "type" : "string"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "gemeindeschluessel",
              "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-gemeindeschluessel",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "strasse",
              "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-strasse",
              "type" : "string"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "hausnummer",
              "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-hausnummer",
              "type" : "string"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "adresszusatz",
              "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-adresszusatz",
              "type" : "string"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "postfach",
              "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-postfach",
              "type" : "string"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "stadtteil",
              "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-stadtteil",
              "type" : "string"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "link",
              "definition" : "http://hl7.org/fhir/SearchParameter/Patient-link",
              "type" : "reference"
            }
          ]
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
              "valueCode" : "SHALL"
            }
          ],
          "type" : "Observation",
          "supportedProfile" : [
            "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Vitalstatus|2026.0.0-dev.1"
          ],
          "interaction" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "code" : "read"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "code" : "search-type"
            }
          ],
          "searchParam" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_count",
              "type" : "special"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_summary",
              "type" : "special"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_id",
              "definition" : "http://hl7.org/fhir/SearchParameter/Resource-id",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_profile",
              "definition" : "http://hl7.org/fhir/SearchParameter/Resource-profile",
              "type" : "uri"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "status",
              "definition" : "http://hl7.org/fhir/SearchParameter/Observation-status",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "code",
              "definition" : "http://hl7.org/fhir/SearchParameter/clinical-code",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "subject",
              "definition" : "http://hl7.org/fhir/SearchParameter/Observation-subject",
              "type" : "reference"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "patient",
              "definition" : "http://hl7.org/fhir/SearchParameter/clinical-patient",
              "type" : "reference"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "date",
              "definition" : "http://hl7.org/fhir/SearchParameter/clinical-date",
              "type" : "date"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "value-concept",
              "definition" : "http://hl7.org/fhir/SearchParameter/Observation-value-concept",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "code-value-concept",
              "definition" : "http://hl7.org/fhir/SearchParameter/Observation-code-value-concept",
              "type" : "composite"
            }
          ]
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
              "valueCode" : "SHALL"
            }
          ],
          "type" : "Condition",
          "supportedProfile" : [
            "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Todesursache|2026.0.0-dev.1"
          ],
          "interaction" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "code" : "read"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "code" : "search-type"
            }
          ],
          "searchParam" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_count",
              "type" : "special"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_summary",
              "type" : "special"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_id",
              "definition" : "http://hl7.org/fhir/SearchParameter/Resource-id",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_profile",
              "definition" : "http://hl7.org/fhir/SearchParameter/Resource-profile",
              "type" : "uri"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "category",
              "definition" : "http://hl7.org/fhir/SearchParameter/Condition-category",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "code",
              "definition" : "http://hl7.org/fhir/SearchParameter/clinical-code",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "subject",
              "definition" : "http://hl7.org/fhir/SearchParameter/Condition-subject",
              "type" : "reference"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "patient",
              "definition" : "http://hl7.org/fhir/SearchParameter/clinical-patient",
              "type" : "reference"
            }
          ]
        }
      ]
    }
  ]
}

```
