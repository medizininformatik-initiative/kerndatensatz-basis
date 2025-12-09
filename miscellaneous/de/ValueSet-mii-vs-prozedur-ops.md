# MII VS Prozedur OPS - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## ValueSet: MII VS Prozedur OPS 

 
Enthaelt OPS-Codes der Versionen 2010 bis 2025 

 **References** 

* [MII PR Prozedur Procedure](StructureDefinition-mii-pr-prozedur-procedure.md)

**Changes since version {current}:**

* New Content

### Logical Definition (CLD)

 

### Expansion

-------

 [Beschreibung der obigen Tabelle(n)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-prozedur-ops",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/mii-vs-prozedur-ops",
  "version" : "2026.0.0-dev.1",
  "name" : "MII_VS_Prozedur_OPS",
  "title" : "MII VS Prozedur OPS",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-03-17",
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
  "description" : "Enthaelt OPS-Codes der Versionen 2010 bis 2025",
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
        "system" : "http://fhir.de/CodeSystem/bfarm/ops",
        "version" : "2025"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/ops",
        "version" : "2024"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/ops",
        "version" : "2023"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/ops",
        "version" : "2022"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/ops",
        "version" : "2021"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/ops",
        "version" : "2020"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/ops",
        "version" : "2019"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/ops",
        "version" : "2018"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/ops",
        "version" : "2017"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/ops",
        "version" : "2016"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/ops",
        "version" : "2015"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/ops",
        "version" : "2014"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/ops",
        "version" : "2013"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/ops",
        "version" : "2012"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/ops",
        "version" : "2011"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/ops",
        "version" : "2010"
      }
    ]
  }
}

```
