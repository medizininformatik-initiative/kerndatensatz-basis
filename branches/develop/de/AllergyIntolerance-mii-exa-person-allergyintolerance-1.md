# mii-exa-person-allergyintolerance-1 - MII Implementation Guide Core Dataset Base v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-exa-person-allergyintolerance-1**

## Beispiel AllergyIntolerance: mii-exa-person-allergyintolerance-1

-------

**German**

-------

Profile: [MII PR Person Allergy Intolerance](StructureDefinition-mii-pr-person-allergieunvertraeglichkeit.md)

**clinicalStatus**: Active

**verificationStatus**: Confirmed

**type**: Allergy

**category**: Medication

**criticality**: High Risk

**code**: Penicillin

**patient**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1998-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-person-patient-1.md)

**encounter**: [Encounter: extension = ; identifier = Fallnummer; status = finished; class = ambulatory (ActCode#AMB); type = Abteilungskontakt; priority = emergency; period = 2020-01-08 07:00:00+0100 --> 2020-01-08 09:00:00+0100](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-9.md)

**recordedDate**: 2020-01-08

### Reactions

| | | |
| :--- | :--- | :--- |
| - | **Manifestation** | **Severity** |
| * | Atopic dermatitis | Severe |



## Resource Content

```json
{
  "resourceType" : "AllergyIntolerance",
  "id" : "mii-exa-person-allergyintolerance-1",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/modul-person/StructureDefinition/AllergieUnvertraeglichkeit"]
  },
  "clinicalStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical",
      "code" : "active"
    }]
  },
  "verificationStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/allergyintolerance-verification",
      "code" : "confirmed"
    }]
  },
  "type" : "allergy",
  "category" : ["medication"],
  "criticality" : "high",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "764146007",
      "display" : "Penicillin"
    }]
  },
  "patient" : {
    "reference" : "Patient/mii-exa-person-patient-1"
  },
  "encounter" : {
    "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-9"
  },
  "recordedDate" : "2020-01-08",
  "reaction" : [{
    "manifestation" : [{
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "24079001",
        "display" : "Atopic dermatitis"
      }]
    }],
    "severity" : "severe"
  }]
}

```
