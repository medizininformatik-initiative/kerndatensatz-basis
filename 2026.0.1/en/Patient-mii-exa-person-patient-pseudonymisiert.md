# MII EXA Person Patient Pseudonymisiert - MII Implementation Guide Core Dataset Base v2026.0.1

## Example Patient: MII EXA Person Patient Pseudonymisiert

-------

**English**

-------

Profile: [MII PR Person Patient (Pseudonymisiert)](StructureDefinition-mii-pr-person-patient-pseudonymisiert.md) version: 2026.0.1

Security Label: [test health data (Details: ActReason code HTEST = 'test health data')](http://terminology.hl7.org/7.2.0/CodeSystem-v3-ActReason.html)

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
    "extension" : [{
      "extension" : [{
        "url" : "packageId",
        "valueId" : "de.medizininformatikinitiative.kerndatensatz.base"
      },
      {
        "url" : "version",
        "valueString" : "2026.0.1"
      },
      {
        "url" : "uri",
        "valueUri" : "https://www.medizininformatik-initiative.de/fhir/modul-base"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/package-source"
    }],
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert|2026.0.1"],
    "security" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-ActReason",
      "code" : "HTEST",
      "display" : "test health data"
    }]
  },
  "identifier" : [{
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationValue",
        "code" : "PSEUDED"
      }]
    },
    "system" : "https://www.medizininformatik-initiative.de/fhir/sid/pseudonym",
    "value" : "1234567890"
  },
  {
    "use" : "official",
    "type" : {
      "coding" : [{
        "system" : "http://fhir.de/CodeSystem/identifier-type-de-basis",
        "code" : "KVZ10"
      }]
    },
    "system" : "http://fhir.de/sid/gkv/kvid-10",
    "_value" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
        "valueCode" : "masked"
      }]
    },
    "assigner" : {
      "identifier" : {
        "use" : "official",
        "system" : "http://fhir.de/sid/arge-ik/iknr",
        "value" : "260326822"
      }
    }
  }],
  "gender" : "female",
  "birthDate" : "1998",
  "address" : [{
    "type" : "both",
    "postalCode" : "10",
    "country" : "DE"
  }]
}

```
