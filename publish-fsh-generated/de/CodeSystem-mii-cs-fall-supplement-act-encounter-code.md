# MII CS Fall Supplement ActEncounterCode - MII Implementation Guide Core Dataset Base v2026.0.0

## CodeSystem: MII CS Fall Supplement ActEncounterCode 

 
CodeSystem Supplement für ActEncounterCode 

Dieses CodeSystem wird in der Definition der folgenden ValueSets referenziert:

* This CodeSystem Supplement is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

**Changes since version {current}:**

* New Content

-------

 [Beschreibung der obigen Tabelle(n)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "mii-cs-fall-supplement-act-encounter-code",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/CodeSystem/SupplementActEncounterCode",
  "version" : "2026.0.0",
  "name" : "MII_CS_Fall_SupplementActEncounterCode",
  "title" : "MII CS Fall Supplement ActEncounterCode",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-11T15:36:33+00:00",
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
  "description" : "CodeSystem Supplement für ActEncounterCode",
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
  "supplements" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
  "concept" : [
    {
      "code" : "AMB",
      "display" : "ambulatory",
      "definition" : "Umfasst ambulante Operationen nach § 115b SGB V und eine ambulante spezialfachärztliche Versorgung nach § 116b SGB V",
      "designation" : [
        {
          "language" : "de-DE",
          "value" : "teilstationäre Behandlung"
        }
      ]
    },
    {
      "code" : "EMER",
      "display" : "emergency",
      "designation" : [
        {
          "language" : "de-DE",
          "value" : "Notfall"
        }
      ]
    },
    {
      "code" : "IMP",
      "display" : "inpatient encounter",
      "designation" : [
        {
          "language" : "de-DE",
          "value" : "stationär"
        }
      ]
    }
  ]
}

```
