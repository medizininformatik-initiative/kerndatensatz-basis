# MII CPS Prozedur CapabilityStatement - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## CapabilityStatement: MII CPS Prozedur CapabilityStatement 

 
Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss um das Modul Prozedur der Medizininformatik Initiative zu implementieren. 

 [Raw OpenAPI-Swagger Definition file](../mii-cps-prozedur-capabilitystatement.openapi.json) | [Download](../mii-cps-prozedur-capabilitystatement.openapi.json) 

-------

**English**

-------

## MII CPS Prozedur CapabilityStatement

* Implementation Guide Version: 2026.0.0-dev.1 
* FHIR Version: 4.0.1 
* Supported Formats: `xml`, `json`
* Published on: 2025-10-21 
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
| [Procedure](#Procedure1-1) | [http://hl7.org/fhir/StructureDefinition/Procedure](http://hl7.org/fhir/R4/procedure.html)**Additional supported profiles:**  [MII PR Prozedur Procedureversion: 2026.0.0-dev.1)](StructureDefinition-mii-pr-prozedur-procedure.md) | **Y** | **Y** |  |  | _count, _summary, _id, _lastUpdated, _profile, status, category, code, date, patient, subject, bodySite, dokumentationsdatum, durchfuehrungsabsicht, ops-seitenlokalisation |  |  |  |

-------

#### Resource Conformance: SHALL Procedure

Base System Profile

[Procedure](http://hl7.org/fhir/R4/procedure.html)

Profile Conformance

**SHALL**

Reference Policy

Supported Profiles
[MII PR Prozedur Procedureversion: 2026.0.0-dev.1)](StructureDefinition-mii-pr-prozedur-procedure.md)

Interaction summary

* **SHALL** support `read`, `search-type`.

Search Parameters


 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "mii-cps-prozedur-capabilitystatement",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/CapabilityStatement/metadata",
  "version" : "2026.0.0-dev.1",
  "name" : "MII_CPS_Prozedur_CapabilityStatement",
  "title" : "MII CPS Prozedur CapabilityStatement",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-21",
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
  "description" : "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss um das Modul Prozedur der Medizininformatik Initiative zu implementieren.",
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
          "type" : "Procedure",
          "profile" : "http://hl7.org/fhir/StructureDefinition/Procedure",
          "supportedProfile" : [
            "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure|2026.0.0-dev.1"
          ],
          "_supportedProfile" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ]
            }
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
              "name" : "_lastUpdated",
              "definition" : "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated",
              "type" : "date"
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
              "definition" : "http://hl7.org/fhir/SearchParameter/Procedure-status",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "category",
              "definition" : "http://hl7.org/fhir/SearchParameter/Procedure-category",
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
              "name" : "subject",
              "definition" : "http://hl7.org/fhir/SearchParameter/Procedure-subject",
              "type" : "reference"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "bodySite",
              "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-bodysite",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "dokumentationsdatum",
              "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-dokumentationsdatum",
              "type" : "date"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "durchfuehrungsabsicht",
              "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-durchfuehrungsabsicht",
              "type" : "token"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "ops-seitenlokalisation",
              "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-ops-seitenlokalisation",
              "type" : "token"
            }
          ]
        }
      ]
    }
  ]
}

```
