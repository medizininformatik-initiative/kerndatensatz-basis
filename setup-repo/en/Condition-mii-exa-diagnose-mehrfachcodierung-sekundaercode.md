# MII EXA Diagnose Mehrfachcodierung Sekundaercode - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Example Condition: MII EXA Diagnose Mehrfachcodierung Sekundaercode

-------

**English**

-------

Language: en

Profile: [MII PR Diagnose Conditionversion: null2026.0.0-dev.1)](StructureDefinition-mii-pr-diagnose-condition.md)

Security Label: test health data (Details: ActReason code HTEST = 'test health data')

**Condition Related**: [Condition Gonokokkeninfektion des Muskel-Skelett-Systems](Condition-mii-exa-diagnose-mehrfachcodierung-primaercode.md)

**clinicalStatus**: Active

**verificationStatus**: Confirmed

**code**: Bursitis gonorrhoica: Hand

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1998-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-person-patient-1.md)

**encounter**: [Encounter: identifier = Visit number; status = finished; class = ambulatory (ActCode#AMB); period = 2019-09-26 10:00:00+0200 --> 2019-09-26 12:00:00+0200](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-8.md)

**onset**: 2019-09-26

**recordedDate**: 2019-09-26 11:30:00+0200



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "mii-exa-diagnose-mehrfachcodierung-sekundaercode",
  "meta" : {
    "profile" : [
      "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose|2026.0.0-dev.1"
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
      "url" : "http://hl7.org/fhir/StructureDefinition/condition-related",
      "valueReference" : {
        "reference" : "Condition/mii-exa-diagnose-mehrfachcodierung-primaercode"
      }
    }
  ],
  "clinicalStatus" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
        "code" : "active"
      }
    ]
  },
  "verificationStatus" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/condition-ver-status",
        "code" : "confirmed"
      }
    ]
  },
  "code" : {
    "coding" : [
      {
        "extension" : [
          {
            "url" : "http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen",
            "valueCoding" : {
              "system" : "http://fhir.de/CodeSystem/icd-10-gm-mehrfachcodierungs-kennzeichen",
              "code" : "*"
            }
          }
        ],
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2020",
        "code" : "M73.04",
        "display" : "Bursitis gonorrhoica: Hand"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-person-patient-1"
  },
  "encounter" : {
    "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-8"
  },
  "onsetDateTime" : "2019-09-26",
  "recordedDate" : "2019-09-26T11:30:00+02:00"
}

```
