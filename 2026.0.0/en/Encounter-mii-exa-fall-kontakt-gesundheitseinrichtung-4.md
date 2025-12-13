# MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt Radiology VS2) - MII Implementation Guide Core Dataset Base v2026.0.0

## Example Encounter: MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt Radiology VS2)

-------

**English**

-------

Language: en

Profile: [MII PR Fall Kontakt mit einer Gesundheitseinrichtungversion: null2026.0.0)](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md)

Security Label: test health data (Details: ActReason code HTEST = 'test health data')

**identifier**: Visit number/VS2

**status**: Finished

**class**: [ActCode: IMP](http://terminology.hl7.org/7.0.1/CodeSystem-v3-ActCode.html#v3-ActCode-IMP) (inpatient encounter)

**type**: Versorgungsstellenkontakt

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1998-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-person-patient-1.md)

**period**: 2020-01-08 10:00:00+0100 --> 2020-01-08 10:30:00+0100

**account**: Account A1 - DRG G23B Appendektomie ohne schwere CC (Identifier: `https://www.charite.de/fhir/sid/fallnummer`/F-2020-000123)

### Locations

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Location** | **Status** | **PhysicalType** |
| * | Radiology Department, CT Scanner | Completed | Room |

**serviceProvider**: Identifier: `http://fhir.de/sid/dkgev/iknr`/260950472

**partOf**: [Encounter: identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt; serviceType = Allgemeine Chirurgie; period = 2020-01-08 09:00:00+0100 --> 2020-01-11 23:59:00+0100](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-2.md)



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "mii-exa-fall-kontakt-gesundheitseinrichtung-4",
  "meta" : {
    "profile" : [
      "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung|2026.0.0"
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
  "identifier" : [
    {
      "type" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code" : "VN"
          }
        ]
      },
      "system" : "https://www.charite.de/fhir/sid/aufnahmenummer",
      "value" : "VS2"
    }
  ],
  "status" : "finished",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "IMP"
  },
  "type" : [
    {
      "coding" : [
        {
          "system" : "http://fhir.de/CodeSystem/Kontaktebene",
          "code" : "versorgungsstellenkontakt"
        }
      ]
    }
  ],
  "subject" : {
    "reference" : "Patient/mii-exa-person-patient-1"
  },
  "period" : {
    "start" : "2020-01-08T10:00:00+01:00",
    "end" : "2020-01-08T10:30:00+01:00"
  },
  "account" : [
    {
      "identifier" : {
        "system" : "https://www.charite.de/fhir/sid/fallnummer",
        "value" : "F-2020-000123"
      },
      "display" : "Account A1 - DRG G23B Appendektomie ohne schwere CC"
    }
  ],
  "location" : [
    {
      "location" : {
        "display" : "Radiology Department, CT Scanner"
      },
      "status" : "completed",
      "physicalType" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
            "code" : "ro",
            "display" : "Room"
          }
        ]
      }
    }
  ],
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
