# MII EXA Diagnose Mehrfachcodierung Sekundaercode - MII Implementation Guide Core Dataset Base v2027.0.0-dev

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **MII EXA Diagnose Mehrfachcodierung Sekundaercode**

## Beispiel Condition: MII EXA Diagnose Mehrfachcodierung Sekundaercode

-------

**German**

-------

Profile: [MII PR Diagnose Condition](StructureDefinition-mii-pr-diagnose-condition.md) version: 2027.0.0-dev

Security Label: [test health data (Details: ActReason code HTEST = 'test health data')](http://terminology.hl7.org/7.2.0/CodeSystem-v3-ActReason.html)

**Condition Related**: [Condition Gonokokkeninfektion des Muskel-Skelett-Systems](Condition-mii-exa-diagnose-mehrfachcodierung-primaercode.md)

**clinicalStatus**: Active

**verificationStatus**: Confirmed

**code**: Bursitis gonorrhoica: Hand

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1998-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-person-patient-1.md)

**encounter**: [Encounter: identifier = Fallnummer; status = finished; class = ambulatory (ActCode#AMB); period = 2019-09-26 10:00:00+0200 --> 2019-09-26 12:00:00+0200](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-8.md)

**onset**: 2019-09-26

**recordedDate**: 2019-09-26 11:30:00+0200



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "mii-exa-diagnose-mehrfachcodierung-sekundaercode",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/condition-related",
    "valueReference" : {
      "reference" : "Condition/mii-exa-diagnose-mehrfachcodierung-primaercode"
    }
  }],
  "clinicalStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
      "code" : "active"
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
      "extension" : [{
        "url" : "http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen",
        "valueCoding" : {
          "system" : "http://fhir.de/CodeSystem/icd-10-gm-mehrfachcodierungs-kennzeichen",
          "code" : "*"
        }
      }],
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "version" : "2020",
      "code" : "M73.04"
    }],
    "text" : "Bursitis gonorrhoica: Hand"
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
