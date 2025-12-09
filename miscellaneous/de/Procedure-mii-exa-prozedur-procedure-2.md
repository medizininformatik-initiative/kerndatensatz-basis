# MII EXA Prozedur Procedure Physiotherapy - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Beispiel Procedure: MII EXA Prozedur Procedure Physiotherapy

-------

**German**

-------

Language: en

Profile: [MII PR Prozedur Procedureversion: null2026.0.0-dev.1)](StructureDefinition-mii-pr-prozedur-procedure.md)

Security Label: test health data (Details: ActReason code HTEST = 'test health data')

**ExtensionProzedurDokumentationsdatum**: 2020-01-17 00:00:00+0100

**MII EX Prozedur Durchführungsabsicht**: [SNOMED CT: 262202000](http://snomed.info/id/262202000) (Therapeutic)

**status**: Completed

**category**: Therapeutic procedure

**code**: Funktionsorientierte physikalische Monotherapie

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1998-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-person-patient-1.md)

**encounter**: [Encounter: identifier = Fallnummer; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt; serviceType = Innere Medizin; period = 2020-01-12 00:00:00+0100 --> 2020-01-17 18:00:00+0100](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-7.md)

**performed**: 2020-01-13 00:00:00+0100 --> 2020-01-16 00:00:00+0100

**bodySite**: Hand structure



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "mii-exa-prozedur-procedure-2",
  "meta" : {
    "profile" : [
      "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure|2026.0.0-dev.1"
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
  "extension" : [
    {
      "url" : "http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum",
      "valueDateTime" : "2020-01-17T00:00:00+01:00"
    },
    {
      "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht",
      "valueCoding" : {
        "system" : "http://snomed.info/sct",
        "code" : "262202000"
      }
    }
  ],
  "status" : "completed",
  "category" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "277132007"
      }
    ]
  },
  "code" : {
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/ops",
        "version" : "2020",
        "code" : "8-561.1"
      }
    ],
    "text" : "Funktionsorientierte physikalische Monotherapie"
  },
  "subject" : {
    "reference" : "Patient/mii-exa-person-patient-1"
  },
  "encounter" : {
    "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-7"
  },
  "performedPeriod" : {
    "start" : "2020-01-13T00:00:00+01:00",
    "end" : "2020-01-16T00:00:00+01:00"
  },
  "bodySite" : [
    {
      "coding" : [
        {
          "system" : "http://snomed.info/sct",
          "code" : "85562004",
          "display" : "Hand structure"
        }
      ]
    }
  ]
}

```
