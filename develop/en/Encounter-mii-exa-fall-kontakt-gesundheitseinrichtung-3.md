# MII EXA Fall Kontakt Gesundheitseinrichtung (Planned Encounter) - MII Implementation Guide Core Dataset Base v2026.0.0

## Example Encounter: MII EXA Fall Kontakt Gesundheitseinrichtung (Planned Encounter)

-------

**English**

-------

Profile: [MII PR Fall Kontakt mit einer Gesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md) version: 2026.0.0

Security Label: [test health data (Details: v3 Code System ActReason code HTEST = 'test health data')](http://hl7.org/fhir/R4/v3/ActReason/cs.html)

**R5: The planned start date/time (or admission date) of the encounter (new)**: 2024-06-14

**R5: The planned end date/time (or discharge date) of the encounter (new)**: 2024-06-17

**identifier**: Visit number/F_20240614_001

**status**: Planned

**class**: [v3 Code System ActCode: IMP](http://hl7.org/fhir/R4/v3/ActCode/cs.html#v3-ActCode-IMP) (inpatient encounter)

**type**: Einrichtungskontakt

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1998-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-person-patient-1.md)

**serviceProvider**: Identifier: `http://fhir.de/sid/dkgev/iknr`/260950472



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "mii-exa-fall-kontakt-gesundheitseinrichtung-3",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung|2026.0.0"],
    "security" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-ActReason",
      "code" : "HTEST",
      "display" : "test health data"
    }]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedStartDate",
    "valueDateTime" : "2024-06-14"
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedEndDate",
    "valueDateTime" : "2024-06-17"
  }],
  "identifier" : [{
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "VN"
      }]
    },
    "system" : "https://www.charite.de/fhir/sid/aufnahmenummer",
    "value" : "F_20240614_001"
  }],
  "status" : "planned",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "IMP"
  },
  "type" : [{
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/Kontaktebene",
      "code" : "einrichtungskontakt"
    }]
  }],
  "subject" : {
    "reference" : "Patient/mii-exa-person-patient-1"
  },
  "serviceProvider" : {
    "identifier" : {
      "system" : "http://fhir.de/sid/dkgev/iknr",
      "value" : "260950472"
    }
  }
}

```
