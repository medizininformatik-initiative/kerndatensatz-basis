# MII VS Diagnose BodyStructure SNOMED - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## ValueSet: MII VS Diagnose BodyStructure SNOMED (Experimentell) 

 
Enthaelt alle SNOMED Body structure codes 

 **References** 

* [MII PR Diagnose Condition](StructureDefinition-mii-pr-diagnose-condition.md)

**Changes since version {current}:**

* New Content

### Logical Definition (CLD)

Profile: [Shareable ValueSet](http://hl7.org/fhir/R4/shareablevalueset.html)

* Include codes from[`http://snomed.info/sct`](http://www.snomed.org/)version 📍 where concept descends from 123037004 (Body structure)

 

### Expansion

Expansion from 127.0.0.1 based on SNOMED CT International edition 01-Jul 2024

This value set has >1000 codes in it. In order to keep the publication size manageable, only a selection (1000 codes) of the whole set of codes is shown

-------

 [Beschreibung der obigen Tabelle(n)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-diagnose-bodystructure-snomed",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-bodystructure-snomed",
  "version" : "2026.0.0-dev.1",
  "name" : "MII_VS_Diagnose_BodyStructure_SNOMED",
  "title" : "MII VS Diagnose BodyStructure SNOMED",
  "status" : "active",
  "experimental" : true,
  "date" : "2024-12-09",
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
  "description" : "Enthaelt alle SNOMED Body structure codes",
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
  "copyright" : "This material includes SNOMED Clinical Terms® (SNOMED CT®) which is used by permission of SNOMED International. All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists. SNOMED and SNOMED CT are registered trademarks of SNOMED International. Implementers of these artefacts must have the appropriate SNOMED CT Affiliate license.",
  "compose" : {
    "include" : [
      {
        "system" : "http://snomed.info/sct",
        "version" : "http://snomed.info/sct/900000000000207008/version/20240701",
        "filter" : [
          {
            "property" : "concept",
            "op" : "descendent-of",
            "value" : "123037004"
          }
        ]
      }
    ]
  }
}

```
