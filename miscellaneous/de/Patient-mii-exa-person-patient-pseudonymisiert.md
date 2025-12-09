# MII EXA Person Patient Pseudonymisiert - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Beispiel Patient: MII EXA Person Patient Pseudonymisiert

-------

**German**

-------

Language: en

Profile: [MII PR Person Patient (Pseudonymisiert)version: null2026.0.0-dev.1)](StructureDefinition-mii-pr-person-patient-pseudonymisiert.md)

Security Label: test health data (Details: ActReason code HTEST = 'test health data')

Anonymous Patient Female, DoB: 1998 ( Krankenversichertennummer (use: official, ))

-------

| | |
| :--- | :--- |
| Other Id: | pseudonymized/1234567890 |
| Contact Detail | 10 DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "mii-exa-person-patient-pseudonymisiert",
  "meta" : {
    "profile" : [
      "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert|2026.0.0-dev.1"
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
  "identifier" : [
    {
      "type" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationValue",
            "code" : "PSEUDED"
          }
        ]
      },
      "system" : "https://www.medizininformatik-initiative.de/fhir/sid/pseudonym",
      "value" : "1234567890"
    },
    {
      "use" : "official",
      "type" : {
        "coding" : [
          {
            "system" : "http://fhir.de/CodeSystem/identifier-type-de-basis",
            "code" : "KVZ10"
          }
        ]
      },
      "system" : "http://fhir.de/sid/gkv/kvid-10",
      "_value" : {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
            "valueCode" : "masked"
          }
        ]
      },
      "assigner" : {
        "identifier" : {
          "use" : "official",
          "system" : "http://fhir.de/sid/arge-ik/iknr",
          "value" : "260326822"
        }
      }
    }
  ],
  "gender" : "female",
  "birthDate" : "1998",
  "address" : [
    {
      "type" : "both",
      "postalCode" : "10",
      "country" : "DE"
    }
  ]
}

```
