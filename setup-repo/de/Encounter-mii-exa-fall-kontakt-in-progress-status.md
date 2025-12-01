# MII EXA Fall Kontakt Gesundheitseinrichtung (Status in-progress) - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Beispiel Encounter: MII EXA Fall Kontakt Gesundheitseinrichtung (Status in-progress)

-------

**German**

-------

Language: en

Profile: [MII PR Fall Kontakt mit einer Gesundheitseinrichtungversion: null2026.0.0-dev.1)](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md)

Security Label: test health data (Details: ActReason code HTEST = 'test health data')

**status**: In Progress

**class**: [ActCode: IMP](http://terminology.hl7.org/7.0.0/CodeSystem-v3-ActCode.html#v3-ActCode-IMP) (inpatient encounter)

**type**: Abteilungskontakt

**serviceType**: Orthopädie/Schwerpunkt Chirurgie

**subject**: [Anonymous Patient Female, DoB: 1998 ( Krankenversichertennummer (use: official, ))](Patient-mii-exa-person-patient-pseudonymisiert.md)

**period**: 2024-06-14 --> (ongoing)



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "mii-exa-fall-kontakt-in-progress-status",
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
  "status" : "in-progress",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "IMP",
    "display" : "inpatient encounter"
  },
  "type" : [
    {
      "coding" : [
        {
          "system" : "http://fhir.de/CodeSystem/Kontaktebene",
          "code" : "abteilungskontakt"
        }
      ]
    }
  ],
  "serviceType" : {
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel-erweitert",
        "code" : "2315",
        "display" : "Orthopädie/Schwerpunkt Chirurgie"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-person-patient-pseudonymisiert"
  },
  "period" : {
    "start" : "2024-06-14"
  }
}

```
