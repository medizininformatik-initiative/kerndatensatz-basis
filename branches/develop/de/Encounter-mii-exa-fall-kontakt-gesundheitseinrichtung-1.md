# MII EXA Fall Kontakt Gesundheitseinrichtung (Einrichtungskontakt E0) - MII Implementation Guide Core Dataset Base v2027.0.0-dev

## Beispiel Encounter: MII EXA Fall Kontakt Gesundheitseinrichtung (Einrichtungskontakt E0)

-------

**German**

-------

Profile: [MII PR Fall Kontakt mit einer Gesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md) version: 2027.0.0-dev

Security Label: [test health data (Details: ActReason code HTEST = 'test health data')](http://terminology.hl7.org/7.3.0/CodeSystem-v3-ActReason.html)

**identifier**: Fallnummer/E0

**status**: Finished

**class**: [ActCode: IMP](http://terminology.hl7.org/7.3.0/CodeSystem-v3-ActCode.html#v3-ActCode-IMP) (inpatient encounter)

**type**: Einrichtungskontakt

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1998-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-person-patient-1.md)

**period**: 2020-01-08 07:00:00+0100 --> 2020-01-17 18:00:00+0100

**account**: Account A1 - DRG G23B Appendektomie ohne schwere CC (Identifier: `https://www.charite.de/fhir/sid/fallnummer`/F-2020-000123)

### Hospitalizations

| | | |
| :--- | :--- | :--- |
| - | **AdmitSource** | **DischargeDisposition** |
| * | Notfall |  |

**serviceProvider**: Identifier: `http://fhir.de/sid/dkgev/iknr`/260950472



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "mii-exa-fall-kontakt-gesundheitseinrichtung-1",
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
    "value" : "E0"
  }],
  "status" : "finished",
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
  "period" : {
    "start" : "2020-01-08T07:00:00+01:00",
    "end" : "2020-01-17T18:00:00+01:00"
  },
  "account" : [{
    "identifier" : {
      "system" : "https://www.charite.de/fhir/sid/fallnummer",
      "value" : "F-2020-000123"
    },
    "display" : "Account A1 - DRG G23B Appendektomie ohne schwere CC"
  }],
  "hospitalization" : {
    "admitSource" : {
      "coding" : [{
        "system" : "http://fhir.de/CodeSystem/dgkev/Aufnahmeanlass",
        "code" : "N",
        "display" : "Notfall"
      }]
    },
    "dischargeDisposition" : {
      "extension" : [{
        "extension" : [{
          "url" : "ErsteUndZweiteStelle",
          "valueCoding" : {
            "system" : "http://fhir.de/CodeSystem/dkgev/EntlassungsgrundErsteUndZweiteStelle",
            "code" : "01",
            "display" : "Behandlung regulär beendet"
          }
        },
        {
          "url" : "DritteStelle",
          "valueCoding" : {
            "system" : "http://fhir.de/CodeSystem/dkgev/EntlassungsgrundDritteStelle",
            "code" : "1",
            "display" : "arbeitsfähig entlassen"
          }
        }],
        "url" : "http://fhir.de/StructureDefinition/Entlassungsgrund"
      }]
    }
  },
  "serviceProvider" : {
    "identifier" : {
      "system" : "http://fhir.de/sid/dkgev/iknr",
      "value" : "260950472"
    }
  }
}

```
