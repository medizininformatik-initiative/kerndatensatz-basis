# MII EXA Person Condition (Todesursache) - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Beispiel Condition: MII EXA Person Condition (Todesursache)

-------

**German**

-------

Language: en

Profile: [MII PR Person Todesursacheversion: null2026.0.0-dev.1)](StructureDefinition-mii-pr-person-todesursache.md)

Security Label: test health data (Details: ActReason code HTEST = 'test health data')

**category**: 16100001

**code**: Death occurring less than 24 hours from onset of symptoms, not otherwise explained

**subject**: [Anonymous Patient Female, DoB: 1998 ( Krankenversichertennummer (use: official, ))](Patient-mii-exa-person-patient-pseudonymisiert.md)



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "mii-exa-person-condition-todesursache",
  "meta" : {
    "profile" : [
      "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Todesursache|2026.0.0-dev.1"
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
  "category" : [
    {
      "coding" : [
        {
          "system" : "http://snomed.info/sct",
          "code" : "16100001"
        },
        {
          "system" : "http://loinc.org",
          "code" : "79378-6"
        }
      ]
    }
  ],
  "code" : {
    "coding" : [
      {
        "system" : "http://hl7.org/fhir/sid/icd-10",
        "version" : "2019",
        "code" : "R96.1"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-person-patient-pseudonymisiert"
  }
}

```
