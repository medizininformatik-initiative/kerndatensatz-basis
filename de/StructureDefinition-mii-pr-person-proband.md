# MII PR Person Proband - MII Implementation Guide Core Dataset Base v2026.0.0

## Ressourcenprofil: MII PR Person Proband 

 
Dieses Profil beschreibt eine Proband*in in der Medizininformatik-Initiative. 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.medizininformatikinitiative.kerndatensatz.base|current/StructureDefinition/mii-pr-person-proband)

**Changes since version {current}:**

* New Content

### Formale Ansichten des Profilinhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Schlüsselelemente-Tabelle](#tabs-key) 
*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [ResearchSubject](http://hl7.org/fhir/R4/researchsubject.html) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [ResearchSubject](http://hl7.org/fhir/R4/researchsubject.html) 

**Summary**

Mandatory: 7 elements
 Must-Support: 15 elements

**Slices**

This structure defines the following [Slices](http://hl7.org/fhir/R4/profiling.html#slices):

* The element 1 is sliced based on the value of ResearchSubject.identifier

 **Schlüsselelemente-Ansicht** 

#### Terminology Bindings

#### Constraints

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [ResearchSubject](http://hl7.org/fhir/R4/researchsubject.html) 

 **Snapshot-AnsichtView** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [ResearchSubject](http://hl7.org/fhir/R4/researchsubject.html) 

**Summary**

Mandatory: 7 elements
 Must-Support: 15 elements

**Slices**

This structure defines the following [Slices](http://hl7.org/fhir/R4/profiling.html#slices):

* The element 1 is sliced based on the value of ResearchSubject.identifier

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-mii-pr-person-proband.csv), [Excel](../StructureDefinition-mii-pr-person-proband.xlsx), [Schematron](../StructureDefinition-mii-pr-person-proband.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-person-proband",
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/ResearchSubject",
  "version" : "2026.0.0",
  "name" : "MII_PR_Person_Proband",
  "title" : "MII PR Person Proband",
  "status" : "retired",
  "date" : "2024-11-11",
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
  "description" : "Dieses Profil beschreibt eine Proband*in in der Medizininformatik-Initiative.",
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
      "identity" : "BRIDG5.1",
      "uri" : "https://bridgmodel.nci.nih.gov",
      "name" : "BRIDG 5.1 Mapping"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "ResearchSubject",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/ResearchSubject",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "ResearchSubject",
        "path" : "ResearchSubject"
      },
      {
        "id" : "ResearchSubject.id",
        "path" : "ResearchSubject.id",
        "mustSupport" : true
      },
      {
        "id" : "ResearchSubject.meta",
        "path" : "ResearchSubject.meta",
        "mustSupport" : true
      },
      {
        "id" : "ResearchSubject.meta.profile",
        "path" : "ResearchSubject.meta.profile",
        "mustSupport" : true
      },
      {
        "id" : "ResearchSubject.identifier",
        "path" : "ResearchSubject.identifier",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "ResearchSubject.identifier:subjectIdentificationCode",
        "path" : "ResearchSubject.identifier",
        "sliceName" : "subjectIdentificationCode",
        "min" : 1,
        "max" : "1",
        "patternIdentifier" : {
          "type" : {
            "coding" : [
              {
                "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
                "code" : "ANON"
              }
            ]
          }
        },
        "mustSupport" : true
      },
      {
        "id" : "ResearchSubject.identifier:subjectIdentificationCode.type",
        "path" : "ResearchSubject.identifier.type",
        "mustSupport" : true
      },
      {
        "id" : "ResearchSubject.identifier:subjectIdentificationCode.system",
        "path" : "ResearchSubject.identifier.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "ResearchSubject.identifier:subjectIdentificationCode.value",
        "path" : "ResearchSubject.identifier.value",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "ResearchSubject.status",
        "path" : "ResearchSubject.status",
        "mustSupport" : true
      },
      {
        "id" : "ResearchSubject.period",
        "path" : "ResearchSubject.period",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "ResearchSubject.period.start",
        "path" : "ResearchSubject.period.start",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "ResearchSubject.period.end",
        "path" : "ResearchSubject.period.end",
        "mustSupport" : true
      },
      {
        "id" : "ResearchSubject.study",
        "path" : "ResearchSubject.study",
        "mustSupport" : true
      },
      {
        "id" : "ResearchSubject.individual",
        "path" : "ResearchSubject.individual",
        "mustSupport" : true
      },
      {
        "id" : "ResearchSubject.consent",
        "path" : "ResearchSubject.consent",
        "min" : 1,
        "mustSupport" : true
      }
    ]
  }
}

```
