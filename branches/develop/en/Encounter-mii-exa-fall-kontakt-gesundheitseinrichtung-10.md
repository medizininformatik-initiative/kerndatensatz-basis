# MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt Surgical Ward VS5) - MII Implementation Guide Core Dataset Base v2027.0.0-dev

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt Surgical Ward VS5)**

## Example Encounter: MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt Surgical Ward VS5)

-------

**English**

-------

Profile: [MII PR Fall Kontakt mit einer Gesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md) version: 2027.0.0-dev

Security Label: [test health data (Details: ActReason code HTEST = 'test health data')](http://terminology.hl7.org/7.2.0/CodeSystem-v3-ActReason.html)

**identifier**: Visit number/VS5

**status**: Finished

**class**: [ActCode: IMP](http://terminology.hl7.org/7.2.0/CodeSystem-v3-ActCode.html#v3-ActCode-IMP) (inpatient encounter)

**type**: Versorgungsstellenkontakt

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1998-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-person-patient-1.md)

**period**: 2020-01-09 00:00:00+0100 --> 2020-01-11 23:59:00+0100

**account**: Account A1 - DRG G23B Appendektomie ohne schwere CC (Identifier: `https://www.charite.de/fhir/sid/fallnummer`/F-2020-000123)

### Locations

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Location** | **Status** | **PhysicalType** |
| * | Surgical Ward C3, Room 315, Bed 315-02 | Completed | Ward |

**serviceProvider**: Identifier: `http://fhir.de/sid/dkgev/iknr`/260950472

**partOf**: [Encounter: identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt; serviceType = Allgemeine Chirurgie; period = 2020-01-08 09:00:00+0100 --> 2020-01-11 23:59:00+0100](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-2.md)



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "mii-exa-fall-kontakt-gesundheitseinrichtung-10",
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
  "identifier" : [{
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "VN"
      }]
    },
    "system" : "https://www.charite.de/fhir/sid/aufnahmenummer",
    "value" : "VS5"
  }],
  "status" : "finished",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "IMP"
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
    "start" : "2020-01-09T00:00:00+01:00",
    "end" : "2020-01-11T23:59:00+01:00"
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
      "display" : "Surgical Ward C3, Room 315, Bed 315-02"
    },
    "status" : "completed",
    "physicalType" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
        "code" : "wa",
        "display" : "Ward"
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
    "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-2"
  }
}

```
