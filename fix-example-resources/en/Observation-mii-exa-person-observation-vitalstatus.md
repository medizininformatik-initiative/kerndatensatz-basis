# MII EXA Person Observation Vitalstatus - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Example Observation: MII EXA Person Observation Vitalstatus

-------

**English**

-------

Language: en

Profile: [MII PR Person Vitalstatusversion: null2026.0.0-dev.1)](StructureDefinition-mii-pr-person-vitalstatus.md)

Security Label: test health data (Details: ActReason code HTEST = 'test health data')

**status**: Final

**category**: Survey

**code**: Patient Disposition

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1998-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-person-patient-1.md)

**encounter**: [Encounter: extension = ; identifier = Visit number; status = finished; class = ambulatory (ActCode#AMB); type = Abteilungskontakt; priority = emergency; period = 2020-01-08 07:00:00+0100 --> 2020-01-08 09:00:00+0100](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-9.md)

**effective**: 2020-01-08 07:00:00+0100

**value**: Patient lebt



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-person-observation-vitalstatus",
  "meta" : {
    "profile" : [
      "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Vitalstatus|2026.0.0-dev.1"
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
  "status" : "final",
  "category" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
          "code" : "survey"
        }
      ]
    }
  ],
  "code" : {
    "coding" : [
      {
        "system" : "http://loinc.org",
        "code" : "67162-8"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-person-patient-1"
  },
  "encounter" : {
    "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-9"
  },
  "effectiveDateTime" : "2020-01-08T07:00:00+01:00",
  "valueCodeableConcept" : {
    "coding" : [
      {
        "system" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/CodeSystem/Vitalstatus",
        "code" : "L",
        "display" : "Patient lebt"
      }
    ]
  }
}

```
