# MII EXA Person Observation Vitalstatus Discharge - MII Implementation Guide Core Dataset Base v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **MII EXA Person Observation Vitalstatus Discharge**

## Beispiel Observation: MII EXA Person Observation Vitalstatus Discharge

-------

**German**

-------

Profile: [MII PR Person Vitalstatus](StructureDefinition-mii-pr-person-vitalstatus.md) version: 2027.0.0-ballot.rc1

Security Label: [test health data (Details: ActReason code HTEST = 'test health data')](http://terminology.hl7.org/7.2.0/CodeSystem-v3-ActReason.html)

**status**: Final

**category**: Survey

**code**: Vital status

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1998-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-person-patient-1.md)

**encounter**: [Encounter: identifier = Fallnummer; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt; serviceType = Innere Medizin; period = 2020-01-12 00:00:00+0100 --> 2020-01-17 18:00:00+0100](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-7.md)

**effective**: 2020-01-17 18:00:00+0100

**value**: Patient lebt



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-person-observation-vitalstatus-discharge",
  "meta" : {
    "extension" : [{
      "extension" : [{
        "url" : "packageId",
        "valueId" : "de.medizininformatikinitiative.kerndatensatz.base"
      },
      {
        "url" : "version",
        "valueString" : "2027.0.0-ballot.rc1"
      },
      {
        "url" : "uri",
        "valueUri" : "https://www.medizininformatik-initiative.de/fhir/modul-base"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/package-source"
    }],
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Vitalstatus|2027.0.0-ballot.rc1"],
    "security" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-ActReason",
      "code" : "HTEST",
      "display" : "test health data"
    }]
  },
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "code" : "survey"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "67162-8"
    }],
    "text" : "Vital status"
  },
  "subject" : {
    "reference" : "Patient/mii-exa-person-patient-1"
  },
  "encounter" : {
    "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-7"
  },
  "effectiveDateTime" : "2020-01-17T18:00:00+01:00",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/CodeSystem/Vitalstatus",
      "code" : "L",
      "display" : "Patient lebt"
    }],
    "text" : "Patient lebt"
  }
}

```
