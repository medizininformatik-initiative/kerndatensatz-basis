# MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt ED Treatment Room VS1) - MII Implementation Guide Core Dataset Base v2026.0.1

## Example Encounter: MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt ED Treatment Room VS1)

-------

**English**

-------

Profile: [MII PR Fall Kontakt mit einer Gesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md) version: 2026.0.1

Security Label: [test health data (Details: ActReason code HTEST = 'test health data')](http://terminology.hl7.org/7.3.0/CodeSystem-v3-ActReason.html)

**identifier**: Visit number/VS1

**status**: Finished

**class**: [ActCode: AMB](http://terminology.hl7.org/7.3.0/CodeSystem-v3-ActCode.html#v3-ActCode-AMB) (ambulatory)

**type**: Versorgungsstellenkontakt

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1998-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-person-patient-1.md)

**period**: 2020-01-08 07:00:00+0100 --> 2020-01-08 09:00:00+0100

**account**: Account A1 - DRG G23B Appendektomie ohne schwere CC (Identifier: `https://www.charite.de/fhir/sid/fallnummer`/F-2020-000123)

### Locations

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Location** | **Status** | **PhysicalType** |
| * | Emergency Department, Treatment Room 3 | Completed | Room |

**serviceProvider**: Identifier: `http://fhir.de/sid/dkgev/iknr`/260950472

**partOf**: [Encounter: extension = ; identifier = Visit number; status = finished; class = ambulatory (ActCode#AMB); type = Abteilungskontakt; priority = emergency; period = 2020-01-08 07:00:00+0100 --> 2020-01-08 09:00:00+0100](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-9.md)



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "mii-exa-fall-kontakt-gesundheitseinrichtung-11",
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
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung|2026.0.1"],
    "security" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-ActReason",
      "code" : "HTEST",
      "display" : "test health data"
    }]
  },
  "identifier" : [{
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "VN"
      }]
    },
    "system" : "https://www.charite.de/fhir/sid/aufnahmenummer",
    "value" : "VS1"
  }],
  "status" : "finished",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "AMB"
  },
  "type" : [{
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/Kontaktebene",
      "code" : "versorgungsstellenkontakt"
    }]
  }],
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
  "location" : [{
    "location" : {
      "display" : "Emergency Department, Treatment Room 3"
    },
    "status" : "completed",
    "physicalType" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
        "code" : "ro"
      }]
    }
  }],
  "serviceProvider" : {
    "identifier" : {
      "system" : "http://fhir.de/sid/dkgev/iknr",
      "value" : "260950472"
    }
  },
  "partOf" : {
    "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-9"
  }
}

```
