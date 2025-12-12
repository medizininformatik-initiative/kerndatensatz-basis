# MII CS Fall Supplement PatientClass - MII Implementation Guide Core Dataset Base v2026.0.0

## CodeSystem: MII CS Fall Supplement PatientClass 

 
CodeSystem Supplement für v2-0004 

This Code system is referenced in the definition of the following value sets:

* This CodeSystem Supplement is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "mii-cs-fall-supplement-patient-class",
  "meta" : {
    "profile" : [
      "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
    ]
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/CodeSystem/SupplementPatientClass",
  "version" : "2026.0.0",
  "name" : "MII_CS_Fall_SupplementPatientClass",
  "title" : "MII CS Fall Supplement PatientClass",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-12T18:00:23+00:00",
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
  "description" : "CodeSystem Supplement für v2-0004",
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
  "content" : "supplement",
  "supplements" : "http://terminology.hl7.org/CodeSystem/v2-0004",
  "concept" : [
    {
      "code" : "R",
      "display" : "recurring patient",
      "designation" : [
        {
          "language" : "de-DE",
          "value" : "Wiederholungspatient"
        }
      ]
    },
    {
      "code" : "B",
      "display" : "Obstetrics",
      "designation" : [
        {
          "language" : "de-DE",
          "value" : "Geburtshilfe"
        }
      ]
    }
  ]
}

```
