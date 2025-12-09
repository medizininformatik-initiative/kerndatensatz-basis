# MII EXA Diagnose Condition Appendicitis - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Example Condition: MII EXA Diagnose Condition Appendicitis

-------

**English**

-------

Language: en

Profile: [MII PR Diagnose Conditionversion: null2026.0.0-dev.1)](StructureDefinition-mii-pr-diagnose-condition.md)

Security Label: test health data (Details: ActReason code HTEST = 'test health data')

**Condition Asserted Date**: 2020-01-08 07:30:00+0100

**clinicalStatus**: Resolved

**verificationStatus**: Confirmed

**code**: Akute Appendizitis

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1998-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-person-patient-1.md)

**encounter**: [Encounter: identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt; serviceType = Allgemeine Chirurgie; period = 2020-01-08 09:00:00+0100 --> 2020-01-11 23:59:00+0100](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-2.md)

**onset**: 2020-01-08 04:00:00+0100

**recordedDate**: 2020-01-08 09:00:00+0100



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "mii-exa-diagnose-appendicitis",
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
      "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
      "valueDateTime" : "2020-01-08T07:30:00+01:00"
    }
  ],
  "clinicalStatus" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
        "code" : "resolved"
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
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2020",
        "code" : "K35.8"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "85189001",
        "display" : "Acute appendicitis"
      }
    ],
    "text" : "Akute Appendizitis"
  },
  "subject" : {
    "reference" : "Patient/mii-exa-person-patient-1"
  },
  "encounter" : {
    "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-2"
  },
  "onsetDateTime" : "2020-01-08T04:00:00+01:00",
  "recordedDate" : "2020-01-08T09:00:00+01:00"
}

```
