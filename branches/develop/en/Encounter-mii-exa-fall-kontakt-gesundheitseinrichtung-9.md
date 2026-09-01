# MII EXA Fall Kontakt Gesundheitseinrichtung (Abteilungskontakt Notaufnahme A1E) - MII Implementation Guide Core Dataset Base v2027.0.0-dev

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII EXA Fall Kontakt Gesundheitseinrichtung (Abteilungskontakt Notaufnahme A1E)**

## Example Encounter: MII EXA Fall Kontakt Gesundheitseinrichtung (Abteilungskontakt Notaufnahme A1E)

-------

**English**

-------

Profile: [MII PR Fall Kontakt mit einer Gesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md) version: 2027.0.0-dev

Security Label: [test health data (Details: ActReason code HTEST = 'test health data')](http://terminology.hl7.org/7.2.0/CodeSystem-v3-ActReason.html)

> **ExtensionAufnahmegrund**
* VierteStelle: [AufnahmegrundVierteStelle: 7](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.de/CodeSystem/dkgev/AufnahmegrundVierteStelle#AufnahmegrundVierteStelle-7) (Notfall)

**identifier**: Visit number/A1E

**status**: Finished

**class**: [ActCode: AMB](http://terminology.hl7.org/7.2.0/CodeSystem-v3-ActCode.html#v3-ActCode-AMB) (ambulatory)

**type**: Abteilungskontakt

**priority**: emergency

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1998-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-person-patient-1.md)

**period**: 2020-01-08 07:00:00+0100 --> 2020-01-08 09:00:00+0100

**account**: Account A1 - DRG G23B Appendektomie ohne schwere CC (Identifier: `https://www.charite.de/fhir/sid/fallnummer`/F-2020-000123)

**serviceProvider**: Identifier: `http://fhir.de/sid/dkgev/iknr`/260950472

**partOf**: [Encounter: identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Einrichtungskontakt; period = 2020-01-08 07:00:00+0100 --> 2020-01-17 18:00:00+0100](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-1.md)



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "mii-exa-fall-kontakt-gesundheitseinrichtung-9",
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
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung|2027.0.0-dev"],
    "security" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-ActReason",
      "code" : "HTEST",
      "display" : "test health data"
    }]
  },
  "extension" : [{
    "extension" : [{
      "url" : "VierteStelle",
      "valueCoding" : {
        "system" : "http://fhir.de/CodeSystem/dkgev/AufnahmegrundVierteStelle",
        "code" : "7",
        "display" : "Notfall"
      }
    }],
    "url" : "http://fhir.de/StructureDefinition/Aufnahmegrund"
  }],
  "identifier" : [{
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "VN"
      }]
    },
    "system" : "https://www.charite.de/fhir/sid/aufnahmenummer",
    "value" : "A1E"
  }],
  "status" : "finished",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "AMB"
  },
  "type" : [{
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/Kontaktebene",
      "code" : "abteilungskontakt"
    }]
  }],
  "priority" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-ActPriority",
      "code" : "EM"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-person-patient-1"
  },
  "period" : {
    "start" : "2020-01-08T07:00:00+01:00",
    "end" : "2020-01-08T09:00:00+01:00"
  },
  "account" : [{
    "identifier" : {
      "system" : "https://www.charite.de/fhir/sid/fallnummer",
      "value" : "F-2020-000123"
    },
    "display" : "Account A1 - DRG G23B Appendektomie ohne schwere CC"
  }],
  "serviceProvider" : {
    "identifier" : {
      "system" : "http://fhir.de/sid/dkgev/iknr",
      "value" : "260950472"
    }
  },
  "partOf" : {
    "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-1"
  }
}

```
