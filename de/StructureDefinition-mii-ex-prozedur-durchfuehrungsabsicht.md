# MII EX Prozedur Durchführungsabsicht - MII Implementation Guide Core Dataset Base v2026.0.0

## Extension: MII EX Prozedur Durchführungsabsicht 

Intention der Prozedur

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [MII PR Prozedur Procedure](StructureDefinition-mii-pr-prozedur-procedure.md)
* Examples for this Extension: [Bundle/mii-exa-base-test-data-bundle-1](Bundle-mii-exa-base-test-data-bundle-1.md), [Procedure/mii-exa-prozedur-imaging](Procedure-mii-exa-prozedur-imaging.md), [Procedure/mii-exa-prozedur-procedure-2](Procedure-mii-exa-prozedur-procedure-2.md) and [Procedure/mii-exa-prozedur-procedure](Procedure-mii-exa-prozedur-procedure.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.medizininformatikinitiative.kerndatensatz.base|current/StructureDefinition/mii-ex-prozedur-durchfuehrungsabsicht)

### Formale Ansichten des Extension-Inhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

#### Terminology Bindings (Differential)

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

**Summary**

Simple Extension with the type Coding: Intention der Prozedur

 **Differential-AnsichtDifferential View** 

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

#### Terminology Bindings (Differential)

 **Snapshot-Ansicht** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

**Summary**

Simple Extension with the type Coding: Intention der Prozedur

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-mii-ex-prozedur-durchfuehrungsabsicht.csv), [Excel](../StructureDefinition-mii-ex-prozedur-durchfuehrungsabsicht.xlsx), [Schematron](../StructureDefinition-mii-ex-prozedur-durchfuehrungsabsicht.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-ex-prozedur-durchfuehrungsabsicht",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht",
  "version" : "2026.0.0",
  "name" : "MII_EX_Prozedur_Durchfuehrungsabsicht",
  "title" : "MII EX Prozedur Durchführungsabsicht",
  "status" : "active",
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
  "description" : "Intention der Prozedur",
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
      "expression" : "Procedure"
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
        "short" : "MII EX Prozedur Durchführungsabsicht",
        "definition" : "Intention der Prozedur"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "Coding"
          }
        ],
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-intend"
        }
      },
      {
        "id" : "Extension.value[x].system",
        "path" : "Extension.value[x].system",
        "min" : 1,
        "fixedUri" : "http://snomed.info/sct"
      },
      {
        "id" : "Extension.value[x].code",
        "path" : "Extension.value[x].code",
        "min" : 1
      }
    ]
  }
}

```
