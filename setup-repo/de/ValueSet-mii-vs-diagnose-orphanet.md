# MII VS Diagnose Orphanet - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## ValueSet: MII VS Diagnose Orphanet (Experimentell) 

 
Enthaelt alle Orpha-Kennnummern (ORPHAcodes) 

 **References** 

* [MII PR Diagnose Condition](StructureDefinition-mii-pr-diagnose-condition.md)

**Changes since version {current}:**

* New Content

### Logical Definition (CLD)

Profile: [Shareable ValueSet](http://hl7.org/fhir/R4/shareablevalueset.html)

* Include all codes defined in `http://www.orpha.net`version Not Stated (use latest from terminology server)

 

### Expansion

Expansion from 127.0.0.1 based on codesystem www.orpha.net version 2025

This value set has 11,239 codes in it. In order to keep the publication size manageable, only a selection (1,000 codes) of the whole set of codes is shown.

-------

 [Beschreibung der obigen Tabelle(n)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-diagnose-orphanet",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-orphanet",
  "version" : "2026.0.0-dev.1",
  "name" : "MII_VS_Diagnose_Orphanet",
  "title" : "MII VS Diagnose Orphanet",
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
  "description" : "Enthaelt alle Orpha-Kennnummern (ORPHAcodes)",
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
  "copyright" : "INSERM US14 (Institut national de la santé et de la recherche médicale)",
  "compose" : {
    "include" : [
      {
        "system" : "http://www.orpha.net"
      }
    ]
  }
}

```
