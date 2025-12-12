# MII VS Person ICD-10-WHO - MII Implementation Guide Core Dataset Base v2026.0.0

## ValueSet: MII VS Person ICD-10-WHO (Experimental) 

 
MII VS Person ICD-10-WHO 

 **References** 

* [MII PR Person Todesursache](StructureDefinition-mii-pr-person-todesursache.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-person-icd10who",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/ValueSet/mii-vs-person-icd10who",
  "version" : "2026.0.0",
  "name" : "MII_VS_Person_ICD10WHO",
  "title" : "MII VS Person ICD-10-WHO",
  "status" : "active",
  "experimental" : true,
  "date" : "2025-12-08",
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
  "description" : "MII VS Person ICD-10-WHO",
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
  "copyright" : "BfArM - Bundesinstitut für Arzneimittel und Medizinprodukte",
  "compose" : {
    "include" : [
      {
        "system" : "http://hl7.org/fhir/sid/icd-10",
        "version" : "2011"
      },
      {
        "system" : "http://hl7.org/fhir/sid/icd-10",
        "version" : "2013"
      },
      {
        "system" : "http://hl7.org/fhir/sid/icd-10",
        "version" : "2016"
      },
      {
        "system" : "http://hl7.org/fhir/sid/icd-10",
        "version" : "2019"
      }
    ]
  }
}

```
