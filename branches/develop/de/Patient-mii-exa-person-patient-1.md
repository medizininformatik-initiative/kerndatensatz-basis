# MII EXA Person Patient - MII Implementation Guide Core Dataset Base v2027.0.0-dev

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **MII EXA Person Patient**

## Beispiel Patient: MII EXA Person Patient

-------

**German**

-------

Profile: [MII PR Person Patient](StructureDefinition-mii-pr-person-patient.md) version: 2027.0.0-dev

Security Label: [test health data (Details: ActReason code HTEST = 'test health data')](http://terminology.hl7.org/7.2.0/CodeSystem-v3-ActReason.html)

Maja Julia Van-der-Dussen (official) Female, DoB: 1998-09-19 ( Krankenaktennummer (use: usual, ))

-------

| | |
| :--- | :--- |
| Deceased: | false |
| Other Id: | Krankenversichertennummer/A999999999 (use: official, ) |
| Alt. Name: | Bachmann (Name changed for Marriage) |
| Contact Detail | Anna-Louisa-Karsch Str. 2 Berlin DE-BE 10178 DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "mii-exa-person-patient-1",
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
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient|2027.0.0-dev"],
    "security" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-ActReason",
      "code" : "HTEST",
      "display" : "test health data"
    }]
  },
  "identifier" : [{
    "use" : "usual",
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "MR"
      }]
    },
    "system" : "https://www.charite.de/fhir/sid/patienten",
    "value" : "42285243",
    "assigner" : {
      "identifier" : {
        "system" : "https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier",
        "value" : "Charité"
      },
      "display" : "Charité – Universitätsmedizin Berlin"
    }
  },
  {
    "use" : "official",
    "type" : {
      "coding" : [{
        "system" : "http://fhir.de/CodeSystem/identifier-type-de-basis",
        "code" : "KVZ10"
      }]
    },
    "system" : "http://fhir.de/sid/gkv/kvid-10",
    "value" : "A999999999",
    "assigner" : {
      "identifier" : {
        "use" : "official",
        "system" : "http://fhir.de/sid/arge-ik/iknr",
        "value" : "260326822"
      }
    }
  }],
  "name" : [{
    "use" : "official",
    "family" : "Van-der-Dussen",
    "_family" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/humanname-own-name",
        "valueString" : "Van-der-Dussen"
      }]
    },
    "given" : ["Maja", "Julia"],
    "prefix" : ["Prof. Dr. med."],
    "_prefix" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier",
        "valueCode" : "AC"
      }]
    }]
  },
  {
    "use" : "maiden",
    "family" : "Bachmann"
  }],
  "gender" : "female",
  "birthDate" : "1998-09-19",
  "deceasedBoolean" : false,
  "address" : [{
    "type" : "both",
    "line" : ["Anna-Louisa-Karsch Str. 2"],
    "city" : "Berlin",
    "_city" : {
      "extension" : [{
        "url" : "http://fhir.de/StructureDefinition/destatis/ags",
        "valueCoding" : {
          "system" : "http://fhir.de/sid/destatis/ags",
          "code" : "11000000"
        }
      }]
    },
    "state" : "DE-BE",
    "postalCode" : "10178",
    "country" : "DE"
  }]
}

```
