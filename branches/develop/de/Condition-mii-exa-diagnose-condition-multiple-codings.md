# MII EXA Diagnose Multiple Codings - MII Implementation Guide Core Dataset Base v2026.0.1

## Beispiel Condition: MII EXA Diagnose Multiple Codings

-------

**German**

-------

Profile: [MII PR Diagnose Condition](StructureDefinition-mii-pr-diagnose-condition.md) version: 2026.0.1

Security Label: [test health data (Details: ActReason code HTEST = 'test health data')](http://terminology.hl7.org/7.3.0/CodeSystem-v3-ActReason.html)

**Condition Asserted Date**: 2020-01-13 14:00:00+0100

**clinicalStatus**: Active

**verificationStatus**: Confirmed

**code**: Sonstige näher bezeichnete Krankheiten des Innenohres

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1998-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-person-patient-1.md)

**encounter**: [Encounter: identifier = Fallnummer; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt; serviceType = Innere Medizin; period = 2020-01-12 00:00:00+0100 --> 2020-01-17 18:00:00+0100](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-7.md)

**onset**: 2020-01-13 14:00:00+0100

**recordedDate**: 2020-01-13 16:00:00+0100



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "mii-exa-diagnose-condition-multiple-codings",
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
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose|2026.0.1"],
    "security" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-ActReason",
      "code" : "HTEST",
      "display" : "test health data"
    }]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
    "valueDateTime" : "2020-01-13T14:00:00+01:00"
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
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "version" : "2020",
      "code" : "H83.8",
      "display" : "Sonstige näher bezeichnete Krankheiten des Innenohres"
    },
    {
      "system" : "http://fhir.de/CodeSystem/bfarm/alpha-id",
      "version" : "2020",
      "code" : "I125918"
    },
    {
      "system" : "http://www.orpha.net",
      "code" : "420402",
      "display" : "Semicircular canal dehiscence syndrome"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-person-patient-1"
  },
  "encounter" : {
    "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-7"
  },
  "onsetDateTime" : "2020-01-13T14:00:00+01:00",
  "recordedDate" : "2020-01-13T16:00:00+01:00"
}

```
