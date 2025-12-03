# MII VS Diagnose ICD-10-GM - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## ValueSet: MII VS Diagnose ICD-10-GM 

 
Enthaelt ICD-10-GM-Codes der Versionen 2009 bis 2025 

 **References** 

* [MII PR Diagnose Condition](StructureDefinition-mii-pr-diagnose-condition.md)

**Changes since version {current}:**

* New Content

### Logical Definition (CLD)

Profile: [Shareable ValueSet](http://hl7.org/fhir/R4/shareablevalueset.html)

This value set includes codes based on the following rules:

* Include all codes defined in `http://fhir.de/CodeSystem/bfarm/icd-10-gm`version 📍
* Include all codes defined in `http://fhir.de/CodeSystem/bfarm/icd-10-gm`version 📍
* Include all codes defined in `http://fhir.de/CodeSystem/bfarm/icd-10-gm`version 📍
* Include all codes defined in `http://fhir.de/CodeSystem/bfarm/icd-10-gm`version 📍
* Include all codes defined in `http://fhir.de/CodeSystem/bfarm/icd-10-gm`version 📍
* Include all codes defined in `http://fhir.de/CodeSystem/bfarm/icd-10-gm`version 📍
* Include all codes defined in `http://fhir.de/CodeSystem/bfarm/icd-10-gm`version 📍
* Include all codes defined in `http://fhir.de/CodeSystem/bfarm/icd-10-gm`version 📍
* Include all codes defined in `http://fhir.de/CodeSystem/bfarm/icd-10-gm`version 📍
* Include all codes defined in `http://fhir.de/CodeSystem/bfarm/icd-10-gm`version 📍
* Include all codes defined in `http://fhir.de/CodeSystem/bfarm/icd-10-gm`version 📍
* Include all codes defined in `http://fhir.de/CodeSystem/bfarm/icd-10-gm`version 📍
* Include all codes defined in `http://fhir.de/CodeSystem/bfarm/icd-10-gm`version 📍
* Include all codes defined in `http://fhir.de/CodeSystem/bfarm/icd-10-gm`version 📍
* Include all codes defined in `http://fhir.de/CodeSystem/bfarm/icd-10-gm`version 📍
* Include all codes defined in `http://fhir.de/CodeSystem/bfarm/icd-10-gm`version 📍
* Include all codes defined in `http://fhir.de/CodeSystem/bfarm/icd-10-gm`version 📍

 

### Expansion

Expansion from 127.0.0.1 based on:

* codesystem ICD-10-GM version 2023
* codesystem ICD-10-GM version 2012
* codesystem ICD-10-GM version 2022
* codesystem ICD-10-GM version 2011
* codesystem ICD-10-GM version 2021
* codesystem ICD-10-GM version 2010
* codesystem ICD-10-GM version 2020
* codesystem ICD-10-GM version 2009
* codesystem ICD-10-GM version 2019
* codesystem ICD-10-GM version 2018
* codesystem ICD-10-GM version 2017
* codesystem ICD-10-GM version 2016
* codesystem ICD-10-GM version 2015
* codesystem ICD-10-GM version 2025
* codesystem ICD-10-GM version 2014
* codesystem ICD-10-GM version 2024
* codesystem ICD-10-GM version 2013

This value set has 263,015 codes in it. In order to keep the publication size manageable, only a selection (1,000 codes) of the whole set of codes is shown.

-------

 [Beschreibung der obigen Tabelle(n)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-diagnose-icd10gm",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/StructureDefinition/shareablevalueset"]
  },
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-icd10gm",
  "version" : "2026.0.0-dev.1",
  "name" : "MII_VS_Diagnose_ICD10GM",
  "title" : "MII VS Diagnose ICD-10-GM",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-03-04",
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
  "description" : "Enthaelt ICD-10-GM-Codes der Versionen 2009 bis 2025",
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
  "copyright" : "WHO, BfArM 1994 - 2025 - Die Erstellung erfolgt unter Verwendung der maschinenlesbaren Fassung des Bundesinstituts für Arzneimittel und Medizinprodukte (BfArM).",
  "compose" : {
    "include" : [
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2025"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2024"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2023"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2022"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2021"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2020"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2019"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2018"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2017"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2016"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2015"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2014"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2013"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2012"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2011"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2010"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2009"
      }
    ]
  }
}

```
