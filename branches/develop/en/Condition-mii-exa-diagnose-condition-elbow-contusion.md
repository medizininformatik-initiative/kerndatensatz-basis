# MII EXA Diagnose Condition Contusion Elbow - MII Implementation Guide Core Dataset Base v2027.0.0-dev

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII EXA Diagnose Condition Contusion Elbow**

## Example Condition: MII EXA Diagnose Condition Contusion Elbow

-------

**English**

-------

Profile: [MII PR Diagnose Condition](StructureDefinition-mii-pr-diagnose-condition.md) version: 2027.0.0-dev

Security Label: [test health data (Details: ActReason code HTEST = 'test health data')](http://terminology.hl7.org/7.2.0/CodeSystem-v3-ActReason.html)

**Condition Asserted Date**: 2020-01-08 08:00:00+0100

**clinicalStatus**: Resolved

**verificationStatus**: Confirmed

**code**: Prellung des Ellenbogens

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1998-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-person-patient-1.md)

**encounter**: [Encounter: identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt; serviceType = Allgemeine Chirurgie; period = 2020-01-08 09:00:00+0100 --> 2020-01-11 23:59:00+0100](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-2.md)

**onset**: 2020-01-08 06:00:00+0100

**recordedDate**: 2020-01-08 09:00:00+0100



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "mii-exa-diagnose-condition-elbow-contusion",
  "meta" : {
    "extension" : [{
      "extension" : [{
        "url" : "packageId",
        "valueId" : "de.medizininformatikinitiative.kerndatensatz.base"
      },
      {
        "url" : "version",
        "valueString" : "2027.0.0-dev"
      },
      {
        "url" : "uri",
        "valueUri" : "https://www.medizininformatik-initiative.de/fhir/modul-base"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/package-source"
    }],
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose|2027.0.0-dev"],
    "security" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-ActReason",
      "code" : "HTEST",
      "display" : "test health data"
    }]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
    "valueDateTime" : "2020-01-08T08:00:00+01:00"
  }],
  "clinicalStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
      "code" : "resolved"
    }]
  },
  "verificationStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-ver-status",
      "code" : "confirmed"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "version" : "2020",
      "code" : "S50.0",
      "display" : "Prellung des Ellenbogens"
    },
    {
      "system" : "http://snomed.info/sct",
      "code" : "91613004",
      "display" : "Contusion of elbow"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-person-patient-1"
  },
  "encounter" : {
    "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-2"
  },
  "onsetDateTime" : "2020-01-08T06:00:00+01:00",
  "recordedDate" : "2020-01-08T09:00:00+01:00"
}

```
