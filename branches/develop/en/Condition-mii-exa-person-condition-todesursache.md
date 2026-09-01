# MII EXA Person Condition (Todesursache) - MII Implementation Guide Core Dataset Base v2027.0.0-dev

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII EXA Person Condition (Todesursache)**

## Example Condition: MII EXA Person Condition (Todesursache)

-------

**English**

-------

Profile: [MII PR Person Todesursache](StructureDefinition-mii-pr-person-todesursache.md) version: 2027.0.0-dev

Security Label: [test health data (Details: ActReason code HTEST = 'test health data')](http://terminology.hl7.org/7.2.0/CodeSystem-v3-ActReason.html)

**category**: Death diagnosis

**code**: Todeseintritt innerhalb von weniger als 24 Stunden nach Beginn der Symptome, ohne anderweitige Angabe

**subject**: [Anonymous Patient Female, DoB: 1998 ( Krankenversichertennummer (use: official, ))](Patient-mii-exa-person-patient-pseudonymisiert.md)



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "mii-exa-person-condition-todesursache",
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
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Todesursache|2027.0.0-dev"],
    "security" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-ActReason",
      "code" : "HTEST",
      "display" : "test health data"
    }]
  },
  "category" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "16100001"
    },
    {
      "system" : "http://loinc.org",
      "code" : "79378-6"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://hl7.org/fhir/sid/icd-10",
      "version" : "2019",
      "code" : "R96.1"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-person-patient-pseudonymisiert"
  }
}

```
