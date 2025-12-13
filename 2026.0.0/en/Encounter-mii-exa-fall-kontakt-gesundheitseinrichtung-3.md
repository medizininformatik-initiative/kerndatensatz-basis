# MII EXA Fall Kontakt Gesundheitseinrichtung (Planned Encounter) - MII Implementation Guide Core Dataset Base v2026.0.0

## Example Encounter: MII EXA Fall Kontakt Gesundheitseinrichtung (Planned Encounter)

-------

**English**

-------

Language: en

Profile: [MII PR Fall Kontakt mit einer Gesundheitseinrichtungversion: null2026.0.0)](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md)

Security Label: test health data (Details: ActReason code HTEST = 'test health data')

**MII EX Fall Planned Start Date**: 2024-06-14

**MII EX Fall Planned End Date**: 2024-06-17

**identifier**: Visit number/F_20240614_001

**status**: Planned

**class**: [ActCode: IMP](http://terminology.hl7.org/7.0.1/CodeSystem-v3-ActCode.html#v3-ActCode-IMP) (inpatient encounter)

**type**: Einrichtungskontakt

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1998-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-person-patient-1.md)

**serviceProvider**: Identifier: `http://fhir.de/sid/dkgev/iknr`/260950472



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "mii-exa-fall-kontakt-gesundheitseinrichtung-3",
  "meta" : {
    "profile" : [
      "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung|2026.0.0"
    ],
    "security" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/v3-ActReason",
        "code" : "HTEST",
        "display" : "test health data"
      }
    ]
  },
  "language" : "en",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedStartDate",
      "valueDateTime" : "2024-06-14"
    },
    {
      "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedEndDate",
      "valueDateTime" : "2024-06-17"
    }
  ],
  "identifier" : [
    {
      "type" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code" : "VN"
          }
        ]
      },
      "system" : "https://www.charite.de/fhir/sid/aufnahmenummer",
      "value" : "F_20240614_001"
    }
  ],
  "status" : "planned",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "IMP"
  },
  "type" : [
    {
      "coding" : [
        {
          "system" : "http://fhir.de/CodeSystem/Kontaktebene",
          "code" : "einrichtungskontakt"
        }
      ]
    }
  ],
  "subject" : {
    "reference" : "Patient/mii-exa-person-patient-1"
  },
  "serviceProvider" : {
    "identifier" : {
      "system" : "http://fhir.de/sid/dkgev/iknr",
      "value" : "260950472"
    }
  }
}

```
