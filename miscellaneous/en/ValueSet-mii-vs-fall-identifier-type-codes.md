# MII VS Fall Identifier Type Codes - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## ValueSet: MII VS Fall Identifier Type Codes 

 
A coded type for an identifier that can be used to determine which identifier to use for a specific purpose. 

 **References** 

* [MII PR Fall Kontakt mit einer Gesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md)

**Changes since version {current}:**

* New Content

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-fall-identifier-type-codes",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/identifier-type-codes",
  "version" : "2026.0.0-dev.1",
  "name" : "MII_VS_Fall_IdentifierTypeCodes",
  "title" : "MII VS Fall Identifier Type Codes",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-12-10",
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
  "description" : "A coded type for an identifier that can be used to determine which identifier to use for a specific purpose.",
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
  "compose" : {
    "include" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "concept" : [
          {
            "code" : "DL"
          },
          {
            "code" : "PPN"
          },
          {
            "code" : "BRN"
          },
          {
            "code" : "MR"
          },
          {
            "code" : "MCN"
          },
          {
            "code" : "EN"
          },
          {
            "code" : "TAX"
          },
          {
            "code" : "NIIP"
          },
          {
            "code" : "PRN"
          },
          {
            "code" : "MD"
          },
          {
            "code" : "DR"
          },
          {
            "code" : "ACSN"
          },
          {
            "code" : "UDI"
          },
          {
            "code" : "SNO"
          },
          {
            "code" : "SB"
          },
          {
            "code" : "PLAC"
          },
          {
            "code" : "FILL"
          },
          {
            "code" : "JHN"
          },
          {
            "code" : "VN"
          }
        ]
      }
    ]
  }
}

```
