# MII EXA Diagnose Mehrfachcodierung Primaercode - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Beispiel Condition: MII EXA Diagnose Mehrfachcodierung Primaercode

-------

**German**

-------

Language: en

Profile: [MII PR Diagnose Conditionversion: null2026.0.0-dev.1)](StructureDefinition-mii-pr-diagnose-condition.md)

Security Label: test health data (Details: ActReason code HTEST = 'test health data')

**clinicalStatus**: Active

**verificationStatus**: Confirmed

**code**: Gonokokkeninfektion des Muskel-Skelett-Systems

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1998-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-person-patient-1.md)

**encounter**: [Encounter: identifier = Fallnummer; status = finished; class = ambulatory (ActCode#AMB); period = 2019-09-26 10:00:00+0200 --> 2019-09-26 12:00:00+0200](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-8.md)

**onset**: 2019-09-26

**recordedDate**: 2019-09-26 11:30:00+0200



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "mii-exa-diagnose-mehrfachcodierung-primaercode",
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
              "code" : "†"
            }
          },
          {
            "url" : "http://fhir.de/StructureDefinition/seitenlokalisation",
            "valueCoding" : {
              "system" : "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_SEITENLOKALISATION",
              "code" : "L",
              "display" : "links"
            }
          },
          {
            "url" : "http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit",
            "valueCoding" : {
              "system" : "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_DIAGNOSESICHERHEIT",
              "code" : "G",
              "display" : "Gesicherte Diagnose"
            }
          }
        ],
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2020",
        "code" : "A54.4",
        "display" : "Gonokokkeninfektion des Muskel-Skelett-Systems"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/alpha-id",
        "version" : "2020",
        "code" : "I97525"
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
