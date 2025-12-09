# MII VS Prozedur Durchführungsabsicht [SNOMED CT] - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## ValueSet: MII VS Prozedur Durchführungsabsicht [SNOMED CT] 

 
Durchführungsabsicht / Intention mit der Prozedur ausgeführt wird 

 **References** 

* [MII EX Prozedur Durchführungsabsicht](StructureDefinition-mii-ex-prozedur-durchfuehrungsabsicht.md)

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
  "id" : "mii-vs-prozedur-durchfuehrungsabsicht-snomedct",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-intend",
  "version" : "2026.0.0-dev.1",
  "name" : "MII_VS_Prozedur_Durchfuehrungsabsicht_SNOMEDCT",
  "title" : "MII VS Prozedur Durchführungsabsicht [SNOMED CT]",
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
  "description" : "Durchführungsabsicht / Intention mit der Prozedur ausgeführt wird",
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
            "code" : "262202000",
            "display" : "Therapeutic"
          },
          {
            "code" : "363676003",
            "display" : "Palliative intent"
          },
          {
            "code" : "261004008",
            "display" : "Diagnostic intent"
          },
          {
            "code" : "264931009",
            "display" : "Symptomatic"
          },
          {
            "code" : "255231005",
            "display" : "Revision - value"
          },
          {
            "code" : "255302009",
            "display" : "Complicated"
          },
          {
            "code" : "129428001",
            "display" : "Preventive intent"
          },
          {
            "code" : "394602003",
            "display" : "Rehabilitation - speciality"
          },
          {
            "code" : "74964007",
            "display" : "Other"
          }
        ]
      }
    ]
  }
}

```
