# MII VS Fall Location Physical Type - MII Implementation Guide Core Dataset Base v2026.0.0

## ValueSet: MII VS Fall Location Physical Type 

 
A coded type for the physical type of the location. 

 **References** 

* [MII PR Fall Kontakt mit einer Gesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-fall-location-physical-type",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/location-physical-type",
  "version" : "2026.0.0",
  "name" : "MII_VS_Fall_LocationPhysicalType",
  "title" : "MII VS Fall Location Physical Type",
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
  "description" : "A coded type for the physical type of the location.",
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
        "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
        "concept" : [
          {
            "code" : "bd",
            "display" : "Bed"
          },
          {
            "code" : "ro",
            "display" : "Room"
          },
          {
            "code" : "wa",
            "display" : "Ward"
          }
        ]
      }
    ]
  }
}

```
