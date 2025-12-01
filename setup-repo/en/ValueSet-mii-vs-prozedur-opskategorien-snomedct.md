# MII VS Prozedur OPS Kategorien [SNOMED CT] - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## ValueSet: MII VS Prozedur OPS Kategorien [SNOMED CT] 

 
Enthaelt alle SNOMED CT Codes für ein Mapping der OPS Klassentitel 

 **References** 

* [MII PR Prozedur Procedure](StructureDefinition-mii-pr-prozedur-procedure.md)

**Changes since version {current}:**

* New Content

### Logical Definition (CLD)

 

### Expansion

No Expansion for this valueset (not supported by Publication Tooling)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-prozedur-opskategorien-snomedct",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-category-sct",
  "version" : "2026.0.0-dev.1",
  "name" : "MII_VS_Prozedur_OpsKategorien_SNOMEDCT",
  "title" : "MII VS Prozedur OPS Kategorien [SNOMED CT]",
  "status" : "active",
  "experimental" : false,
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
  "description" : "Enthaelt alle SNOMED CT Codes für ein Mapping der OPS Klassentitel",
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
        "concept" : [
          {
            "code" : "165197003",
            "display" : "Diagnostic assessment"
          },
          {
            "code" : "363679005",
            "display" : "Imaging"
          },
          {
            "code" : "387713003",
            "display" : "Surgical procedure"
          },
          {
            "code" : "18629005",
            "display" : "Administration of drug or medicament"
          },
          {
            "code" : "277132007",
            "display" : "Therapeutic procedure"
          },
          {
            "code" : "394841004",
            "display" : "Other category"
          }
        ]
      }
    ]
  }
}

```
