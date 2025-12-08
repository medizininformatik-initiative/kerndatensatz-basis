# MII VS Fall Diagnosis Use - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## ValueSet: MII VS Fall Diagnosis Use 

 
Diagnosetyp 

 **References** 

* [MII PR Fall Kontakt mit einer Gesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md)

**Changes since version {current}:**

* New Content

### Logical Definition (CLD)

Profile: [Shareable ValueSet](http://hl7.org/fhir/R4/shareablevalueset.html)

This value set includes codes based on the following rules:

* Import all the codes that are contained in [DiagnoseTyp ValueSet](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/ValueSet/DiagnoseTyp)
* Import all the codes that are contained in [Diagnosesubtyp ValueSet](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/ValueSet/Diagnosesubtyp)
* Import all the codes that are contained in [DiagnosisRole](http://hl7.org/fhir/R4/valueset-diagnosis-role.html)

 

### Expansion

This value set contains 13 concepts

-------

 [Beschreibung der obigen Tabelle(n)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-fall-diagnosis-use",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/mii-vs-fall-diagnosis-use",
  "version" : "2026.0.0-dev.1",
  "name" : "MII_VS_Fall_Diagnosis_Use",
  "title" : "MII VS Fall Diagnosis Use",
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
  "description" : "Diagnosetyp",
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
        "valueSet" : ["http://fhir.de/ValueSet/DiagnoseTyp"]
      },
      {
        "valueSet" : ["http://fhir.de/ValueSet/Diagnosesubtyp"]
      },
      {
        "valueSet" : ["http://hl7.org/fhir/ValueSet/diagnosis-role"]
      }
    ]
  }
}

```
