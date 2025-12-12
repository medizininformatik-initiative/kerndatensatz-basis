# MII EXA Fall Kontakt Gesundheitseinrichtung (Abteilungskontakt Chirurgie A2E) - MII Implementation Guide Core Dataset Base v2026.0.0

## Beispiel Encounter: MII EXA Fall Kontakt Gesundheitseinrichtung (Abteilungskontakt Chirurgie A2E)

-------

**German**

-------

Language: en

Profile: [MII PR Fall Kontakt mit einer Gesundheitseinrichtungversion: null2026.0.0)](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md)

Security Label: test health data (Details: ActReason code HTEST = 'test health data')

**identifier**: Fallnummer/A2E

**status**: Finished

**class**: [ActCode: IMP](http://terminology.hl7.org/7.0.1/CodeSystem-v3-ActCode.html#v3-ActCode-IMP) (inpatient encounter)

**type**: Abteilungskontakt

**serviceType**: Allgemeine Chirurgie

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1998-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-person-patient-1.md)

**period**: 2020-01-08 09:00:00+0100 --> 2020-01-11 23:59:00+0100

> **diagnosis****condition**:[Condition Acute appendicitis](Condition-mii-exa-diagnose-appendicitis.md)**use**:Admission diagnosis

> **diagnosis****condition**:[Condition Acute appendicitis](Condition-mii-exa-diagnose-appendicitis.md)**use**:Behandlungsrelevante Diagnosen

> **diagnosis****condition**:[Condition Prellung des Ellenbogens](Condition-mii-exa-diagnose-condition-elbow-contusion.md)**use**:Behandlungsrelevante Diagnosen

**account**: Account A1 - DRG G23B Appendektomie ohne schwere CC (Identifier: `https://www.charite.de/fhir/sid/fallnummer`/F-2020-000123)

**serviceProvider**: Identifier: `http://fhir.de/sid/dkgev/iknr`/260950472

**partOf**: [Encounter: identifier = Fallnummer; status = finished; class = inpatient encounter (ActCode#IMP); type = Einrichtungskontakt; period = 2020-01-08 07:00:00+0100 --> 2020-01-17 18:00:00+0100](Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-1.md)



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "mii-exa-fall-kontakt-gesundheitseinrichtung-2",
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
      "value" : "A2E"
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
          "code" : "abteilungskontakt"
        }
      ]
    }
  ],
  "serviceType" : {
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel",
        "code" : "1500",
        "display" : "Allgemeine Chirurgie"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-person-patient-1"
  },
  "period" : {
    "start" : "2020-01-08T09:00:00+01:00",
    "end" : "2020-01-11T23:59:00+01:00"
  },
  "diagnosis" : [
    {
      "condition" : {
        "reference" : "Condition/mii-exa-diagnose-appendicitis"
      },
      "use" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/diagnosis-role",
            "code" : "AD",
            "display" : "Admission diagnosis"
          }
        ]
      }
    },
    {
      "condition" : {
        "reference" : "Condition/mii-exa-diagnose-appendicitis"
      },
      "use" : {
        "coding" : [
          {
            "system" : "http://fhir.de/CodeSystem/KontaktDiagnoseProzedur",
            "code" : "treatment-diagnosis"
          }
        ]
      }
    },
    {
      "condition" : {
        "reference" : "Condition/mii-exa-diagnose-condition-elbow-contusion"
      },
      "use" : {
        "coding" : [
          {
            "system" : "http://fhir.de/CodeSystem/KontaktDiagnoseProzedur",
            "code" : "treatment-diagnosis"
          }
        ]
      }
    }
  ],
  "account" : [
    {
      "identifier" : {
        "system" : "https://www.charite.de/fhir/sid/fallnummer",
        "value" : "F-2020-000123"
      },
      "display" : "Account A1 - DRG G23B Appendektomie ohne schwere CC"
    }
  ],
  "serviceProvider" : {
    "identifier" : {
      "system" : "http://fhir.de/sid/dkgev/iknr",
      "value" : "260950472"
    }
  },
  "partOf" : {
    "reference" : "Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-1"
  }
}

```
