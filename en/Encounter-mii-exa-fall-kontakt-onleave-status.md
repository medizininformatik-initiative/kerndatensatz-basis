# MII EXA Fall Kontakt Gesundheitseinrichtung (Status onleave) - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Example Encounter: MII EXA Fall Kontakt Gesundheitseinrichtung (Status onleave)

-------

**English**

-------

Language: en

Profile: [MII PR Fall Kontakt mit einer Gesundheitseinrichtungversion: null2026.0.0-dev.1)](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md)

Security Label: test health data (Details: ActReason code HTEST = 'test health data')

**status**: On Leave

**class**: [ActCode: IMP](http://terminology.hl7.org/7.0.0/CodeSystem-v3-ActCode.html#v3-ActCode-IMP) (inpatient encounter)

**subject**: [Anonymous Patient Female, DoB: 1998 ( Krankenversichertennummer (use: official, ))](Patient-mii-exa-person-patient-pseudonymisiert.md)

**period**: 2024-06-14 --> (ongoing)



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "mii-exa-fall-kontakt-onleave-status",
  "meta" : {
    "profile" : [
      "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung|2026.0.0-dev.1"
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
  "status" : "onleave",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "IMP",
    "display" : "inpatient encounter"
  },
  "subject" : {
    "reference" : "Patient/mii-exa-person-patient-pseudonymisiert"
  },
  "period" : {
    "start" : "2024-06-14"
  }
}

```
