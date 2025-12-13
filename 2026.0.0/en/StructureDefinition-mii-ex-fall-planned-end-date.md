# MII EX Fall Planned End Date - MII Implementation Guide Core Dataset Base v2026.0.0

## Extension: MII EX Fall Planned End Date 

The planned end date/time (or discharge date) of the encounter

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [MII PR Fall Kontakt mit einer Gesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md)
* Examples for this Extension: [Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-3](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-3.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.medizininformatikinitiative.kerndatensatz.base|current/StructureDefinition/mii-ex-fall-planned-end-date)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-ex-fall-planned-end-date.csv), [Excel](../StructureDefinition-mii-ex-fall-planned-end-date.xlsx), [Schematron](../StructureDefinition-mii-ex-fall-planned-end-date.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-ex-fall-planned-end-date",
  "extension" : [
    {
      "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-ex-meta-license-codeable",
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://hl7.org/fhir/spdx-license",
            "code" : "CC0-1.0",
            "display" : "Creative Commons Zero v1.0 Universal"
          }
        ]
      }
    },
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg",
      "valueCode" : "pa"
    }
  ],
  "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedEndDate",
  "version" : "2026.0.0",
  "name" : "MII_EX_Fall_Planned_End_Date",
  "title" : "MII EX Fall Planned End Date",
  "status" : "active",
  "date" : "2025-12-13T17:19:48+00:00",
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
  "description" : "The planned end date/time (or discharge date) of the encounter",
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
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "Encounter"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension",
        "short" : "MII EX Fall Planned End Date",
        "definition" : "The planned end date/time (or discharge date) of the encounter"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedEndDate"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "type" : [
          {
            "code" : "dateTime"
          }
        ]
      }
    ]
  }
}

```
