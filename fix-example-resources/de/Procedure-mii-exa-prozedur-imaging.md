# MII EXA Prozedur Procedure Imaging CT Abdomen - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Beispiel Procedure: MII EXA Prozedur Procedure Imaging CT Abdomen

-------

**German**

-------

Language: en

Profile: [MII PR Prozedur Procedureversion: null2026.0.0-dev.1)](StructureDefinition-mii-pr-prozedur-procedure.md)

Security Label: test health data (Details: ActReason code HTEST = 'test health data')

**ExtensionProzedurDokumentationsdatum**: 2020-01-08 10:30:00+0100

**MII EX Prozedur Durchführungsabsicht**: [SNOMED CT: 261004008](http://snomed.info/id/261004008) (Diagnostic intent)

**status**: Completed

**category**: Imaging

**code**: Native Computertomographie des Abdomens

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1998-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-person-patient-1.md)

**encounter**: [Encounter: identifier = Fallnummer; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt; serviceType = Allgemeine Chirurgie; period = 2020-01-08 09:00:00+0100 --> 2020-01-11 23:59:00+0100](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-2.md)

**performed**: 2020-01-08 10:00:00+0100

**bodySite**: Abdomen



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "mii-exa-prozedur-imaging",
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
      "valueDateTime" : "2020-01-08T10:30:00+01:00"
    },
    {
      "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht",
      "valueCoding" : {
        "system" : "http://snomed.info/sct",
        "code" : "261004008"
      }
    }
  ],
  "status" : "completed",
  "category" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "363679005"
      }
    ]
  },
  "code" : {
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/ops",
        "version" : "2020",
        "code" : "3-207"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "169070004"
      }
    ],
    "text" : "Native Computertomographie des Abdomens"
  },
  "subject" : {
    "reference" : "Patient/mii-exa-person-patient-1"
  },
  "encounter" : {
    "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-2"
  },
  "performedDateTime" : "2020-01-08T10:00:00+01:00",
  "bodySite" : [
    {
      "coding" : [
        {
          "system" : "http://snomed.info/sct",
          "code" : "818981001"
        }
      ],
      "text" : "Abdomen"
    }
  ]
}

```
