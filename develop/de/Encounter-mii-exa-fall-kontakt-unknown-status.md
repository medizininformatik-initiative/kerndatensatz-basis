# MII EXA Fall Kontakt Gesundheitseinrichtung (Status unknown) - MII Implementation Guide Core Dataset Base v2026.0.0

## Beispiel Encounter: MII EXA Fall Kontakt Gesundheitseinrichtung (Status unknown)

-------

**German**

-------

Profile: [MII PR Fall Kontakt mit einer Gesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md) version: 2026.0.0

Security Label: [test health data (Details: v3 Code System ActReason code HTEST = 'test health data')](http://hl7.org/fhir/R4/v3/ActReason/cs.html)

**status**: Unknown

**class**: [v3 Code System ActCode: IMP](http://hl7.org/fhir/R4/v3/ActCode/cs.html#v3-ActCode-IMP) (inpatient encounter)

**subject**: [Anonymous Patient Female, DoB: 1998 ( Krankenversichertennummer (use: official, ))](Patient-mii-exa-person-patient-pseudonymisiert.md)

**period**: 2024-06-14 --> (ongoing)



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "mii-exa-fall-kontakt-unknown-status",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung|2026.0.0"],
    "security" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-ActReason",
      "code" : "HTEST",
      "display" : "test health data"
    }]
  },
  "status" : "unknown",
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
