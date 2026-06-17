# MII LM Diagnose - MII Implementation Guide Core Dataset Base v2026.0.0

## Logical Model: MII LM Diagnose 

 
Logische Repräsentation des Basismoduls Diagnose 

**Usages:**

* This Logical Model is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.base|current/StructureDefinition/StructureDefinition-mii-lm-diagnose.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-lm-diagnose.csv), [Excel](../StructureDefinition-mii-lm-diagnose.xlsx) 

### Notes:

### Mapping LogicalModel Diagnose -> FHIR

| | |
| :--- | :--- |
| MII LM Diagnose | FHIR |
| Diagnose.ALPHAIDKodiert | Condition.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/alpha-id') |
| Diagnose.ALPHAIDKodiert.Diagnosecode | Condition.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/alpha-id').code |
| Diagnose.Diagnoseerlaeuterung | Condition.note |
| Diagnose.Dokumentationsdatum | Condition.recordedDate |
| Diagnose.Feststellungsdatum | Condition.extension('http://hl7.org/fhir/StructureDefinition/condition-assertedDate').valueDateTime |
| Diagnose.Freitextbeschreibung | Condition.code.text |
| Diagnose.ICD10GMDiagnoseKodiert | Condition.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm') |
| Diagnose.ICD10GMDiagnoseKodiert.Diagnosecode | Condition.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').code |
| Diagnose.ICD10GMDiagnoseKodiert.Diagnosesicherheit | Condition.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').extension('http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit').valueCoding.code |
| Diagnose.ICD10GMDiagnoseKodiert.Mehrfachkodierungskennzeichen | Condition.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').extension('http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen').valueCoding.code |
| Diagnose.ICD10GMDiagnoseKodiert.Seitenlokalisation | Condition.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').extension('http://fhir.de/StructureDefinition/seitenlokalisation').valueCoding.code |
| Diagnose.KlinischRelevanterZeitraum | Condition.onset[x] |
| Diagnose.KlinischRelevanterZeitraum.Lebensphase.bis | Condition.onsetPeriod.end.extension('http://fhir.de/StructureDefinition/lebensphase').valueCodeableConcept |
| Diagnose.KlinischRelevanterZeitraum.Lebensphase.von | Condition.onsetPeriod.start.extension('http://fhir.de/StructureDefinition/lebensphase').valueCodeableConcept |
| Diagnose.KlinischRelevanterZeitraum.Zeitraum | Condition.onsetPeriod |
| Diagnose.KlinischRelevanterZeitraum.Zeitraum.bis | Condition.onsetPeriod.end |
| Diagnose.KlinischRelevanterZeitraum.Zeitraum.von | Condition.onsetPeriod.start |
| Diagnose.KlinischerStatus | Condition.clinicalStatus |
| Diagnose.Koerperstelle | Condition.bodySite |
| Diagnose.ORPHANETDiagnoseKodiert | Condition.code.coding.where(system='http://www.orpha.net') |
| Diagnose.ORPHANETDiagnoseKodiert.Diagnosecode | Condition.code.coding.where(system='http://www.orpha.net').code |
| Diagnose.SNOMEDDiagnoseKodiert | Condition.code.coding.where(system='http://snomed.info/sct') |
| Diagnose.SNOMEDDiagnoseKodiert.Diagnosecode | Condition.code.coding.where(system='http://snomed.info/sct').code |
| Diagnose.WeitereKodiersysteme | Condition.code.coding |
| Diagnose.WeitereKodiersysteme.Diagnosecode | Condition.code.coding.code |



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-lm-diagnose",
  "meta" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license",
      "valueCode" : "CC-BY-4.0"
    },
    {
      "extension" : [{
        "url" : "packageId",
        "valueId" : "de.medizininformatikinitiative.kerndatensatz.base"
      },
      {
        "url" : "version",
        "valueString" : "2026.0.0"
      },
      {
        "url" : "uri",
        "valueUri" : "https://www.medizininformatik-initiative.de/fhir/modul-base"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/package-source"
    }],
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm",
    "valueCoding" : {
      "system" : "http://hl7.org/fhir/version-algorithm",
      "code" : "semver",
      "display" : "SemVer"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "shareable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "publishable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionPolicy",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/artifact-version-policy-codes",
        "code" : "strict",
        "display" : "Strict"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-usage",
    "valueMarkdown" : "Use this logical model as the module-specific information model for the Medical Informatics Initiative core dataset. The model describes clinically or administratively relevant information in a domain-oriented form and provides a bridge between the conceptual content specification and the corresponding technical FHIR profiles. It is a pattern for describing the intended content model and is not intended to be exchanged as a concrete FHIR resource instance. Implementers should use it to understand the scope, semantics, and structure of the module before applying the related FHIR profiles and mappings."
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-approvalDate",
    "valueDate" : "2024-03-07"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-effectivePeriod",
    "valuePeriod" : {
      "start" : "2026"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-topic",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl",
        "code" : "C15607"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-author",
    "valueContactDetail" : {
      "telecom" : [{
        "system" : "email",
        "value" : "julian.sass@charite.de"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-editor",
    "valueContactDetail" : {
      "name" : "Taskforce Core Data Set"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-reviewer",
    "valueContactDetail" : {
      "name" : "Interoperability Working Group",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/interoperability-working-group"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-reviewer",
    "valueContactDetail" : {
      "name" : "National Steering Committee",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/national-steering-committee"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-endorser",
    "valueContactDetail" : {
      "name" : "Interoperability Working Group",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/interoperability-working-group"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-endorser",
    "valueContactDetail" : {
      "name" : "National Steering Committee",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/national-steering-committee"
      }]
    }
  }],
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/LogicalModel/Diagnose",
  "version" : "2026.0.0",
  "name" : "MII_LM_Diagnose",
  "title" : "MII LM Diagnose",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-06-15",
  "publisher" : "Medical Informatics Initiative (MII)",
  "_publisher" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "de"
      },
      {
        "url" : "content",
        "valueString" : "Medizininformatik-Initiative (MII)"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "contact" : [{
    "name" : "Medical Informatics Initiative (MII)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/en"
    }]
  }],
  "description" : "Logische Repräsentation des Basismoduls Diagnose",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "purpose" : "Define the information model for diagnoses independently of a concrete FHIR resource representation.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "FHIR",
    "uri" : "http://hl7.org/fhir/StructureDefinition/Condition|4.0.1",
    "name" : "Diagnose LogicalModel FHIR Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/LogicalModel/Diagnose",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Element",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "Diagnose",
      "path" : "Diagnose",
      "short" : "Das Basismodul Diagnosen enthält Diagnosen als Behandlungsbegründungen und abrechnungsbasiertes Gliederungsmerkmal, z.B. als Hauptdiagnose, Nebendiagnose, Quartalsdiagnose etc.",
      "definition" : "Logische Repräsentation des Basismoduls Diagnose"
    },
    {
      "id" : "Diagnose.ICD10GMDiagnoseKodiert",
      "path" : "Diagnose.ICD10GMDiagnoseKodiert",
      "short" : "Im Bereich der administrativen und statistischen Auswertung wird die Diagnose mit Hilfe von Codiersystemen verschlüsselt. So wird z.B. bei der Abrechnung nach §301 und §295 SGB V die Codierung von Diagnosen mittels ICD-10-GM gesetzlich vorgeschrieben. Weitere Codiersysteme sind z.B. die Alpha-ID oder SNOMED CT. Die Kodierung einer Diagnose mittels verschiedener Codesysteme sollte möglich sein.",
      "definition" : "Im Bereich der administrativen und statistischen Auswertung wird die Diagnose mit Hilfe von Codiersystemen verschlüsselt. So wird z.B. bei der Abrechnung nach §301 und §295 SGB V die Codierung von Diagnosen mittels ICD-10-GM gesetzlich vorgeschrieben. Weitere Codiersysteme sind z.B. die Alpha-ID oder SNOMED CT. Die Kodierung einer Diagnose mittels verschiedener Codesysteme sollte möglich sein.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm')"
      }]
    },
    {
      "id" : "Diagnose.ICD10GMDiagnoseKodiert.Diagnosecode",
      "path" : "Diagnose.ICD10GMDiagnoseKodiert.Diagnosecode",
      "short" : "Diagnosecode ICD-10-GM",
      "definition" : "Code ohne Zusatzkennzeichen",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').code"
      }]
    },
    {
      "id" : "Diagnose.ICD10GMDiagnoseKodiert.Mehrfachkodierungskennzeichen",
      "path" : "Diagnose.ICD10GMDiagnoseKodiert.Mehrfachkodierungskennzeichen",
      "short" : "Mehrfachkodierungskennzeichen",
      "definition" : "Mehrfachkodierungskennzeichen Kreuz-Stern-System und Ausrufezeichen (\"*\", \"†\", \"!\").",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').extension('http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen').valueCoding.code"
      }]
    },
    {
      "id" : "Diagnose.ICD10GMDiagnoseKodiert.Diagnosesicherheit",
      "path" : "Diagnose.ICD10GMDiagnoseKodiert.Diagnosesicherheit",
      "short" : "Zusatzkennzeichen für die Diagnosensicherhe",
      "definition" : "Die Diagnosensicherheit, d.h. wie sicher die Diagnose im Einzelfall zu werten ist, kann unterschiedlich angegeben werden. Für Abrechnungszwecke in der ambulanten Versorgung muss obligatorisch ein Zusatzkennzeichen für die Diagnosensicherheit (A, G, V oder Z) angegeben werden, d. h. die Angabe ist obligatorisch. In der stationären Versorgung sind diese Zusatzkennzeichen für die Angabe der Diagnosensicherheit für Abrechnungszwecke dagegen nicht zulässig.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').extension('http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit').valueCoding.code"
      }]
    },
    {
      "id" : "Diagnose.ICD10GMDiagnoseKodiert.Seitenlokalisation",
      "path" : "Diagnose.ICD10GMDiagnoseKodiert.Seitenlokalisation",
      "short" : "Zusatzkennzeichen Seite einer Erkrankung",
      "definition" : "Zusatzkennzeichen der ICD-10 für die Seitigkeit einer Diagnose (R, L, B)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').extension('http://fhir.de/StructureDefinition/seitenlokalisation').valueCoding.code"
      }]
    },
    {
      "id" : "Diagnose.ALPHAIDKodiert",
      "path" : "Diagnose.ALPHAIDKodiert",
      "short" : "Kodierung einer Diagnose mit Alpha-ID",
      "definition" : "Kodierung einer Diagnose mit Alpha-ID",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/alpha-id')"
      }]
    },
    {
      "id" : "Diagnose.ALPHAIDKodiert.Diagnosecode",
      "path" : "Diagnose.ALPHAIDKodiert.Diagnosecode",
      "short" : "Alpha-ID-Code",
      "definition" : "Alpha-ID-Code",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/alpha-id').code"
      }]
    },
    {
      "id" : "Diagnose.ORPHANETDiagnoseKodiert",
      "path" : "Diagnose.ORPHANETDiagnoseKodiert",
      "short" : "Für die Kodierung von Seltenen Krankheiten ist die Orpha-Kennnummer erforderlich.",
      "definition" : "Für die Kodierung von Seltenen Krankheiten ist die Orpha-Kennnummer erforderlich.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.code.coding.where(system='http://www.orpha.net')"
      }]
    },
    {
      "id" : "Diagnose.ORPHANETDiagnoseKodiert.Diagnosecode",
      "path" : "Diagnose.ORPHANETDiagnoseKodiert.Diagnosecode",
      "short" : "Orpha-Kennnummer",
      "definition" : "Orpha-Kennnummer",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.code.coding.where(system='http://www.orpha.net').code"
      }]
    },
    {
      "id" : "Diagnose.SNOMEDDiagnoseKodiert",
      "path" : "Diagnose.SNOMEDDiagnoseKodiert",
      "short" : "Ermöglicht die Kodierung einer Diagnose mit SNOMED-CT",
      "definition" : "Ermöglicht die Kodierung einer Diagnose mit SNOMED-CT",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.code.coding.where(system='http://snomed.info/sct')"
      }]
    },
    {
      "id" : "Diagnose.SNOMEDDiagnoseKodiert.Diagnosecode",
      "path" : "Diagnose.SNOMEDDiagnoseKodiert.Diagnosecode",
      "short" : "SNOMED-CT Code",
      "definition" : "SNOMED-CT Code",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.code.coding.where(system='http://snomed.info/sct').code"
      }]
    },
    {
      "id" : "Diagnose.WeitereKodiersysteme",
      "path" : "Diagnose.WeitereKodiersysteme",
      "short" : "Bei Bedarf ist die Aufnahme weiterer Klassifikationen und Terminologien möglich.",
      "definition" : "Bei Bedarf ist die Aufnahme weiterer Klassifikationen und Terminologien möglich.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.code.coding"
      }]
    },
    {
      "id" : "Diagnose.WeitereKodiersysteme.Diagnosecode",
      "path" : "Diagnose.WeitereKodiersysteme.Diagnosecode",
      "short" : "Code aus weiterem Kodiersystem",
      "definition" : "Angabe des Codes aus weiterem Kodiersystem",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.code.coding.code"
      }]
    },
    {
      "id" : "Diagnose.Koerperstelle",
      "path" : "Diagnose.Koerperstelle",
      "short" : "Körperstelle",
      "definition" : "Über die Körperstelle kann angegeben werden, in welchem Bereich des Körpers eine Krankheit diagnostiziert wurde (Topografische Informatiomn)",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.bodySite"
      }]
    },
    {
      "id" : "Diagnose.Freitextbeschreibung",
      "path" : "Diagnose.Freitextbeschreibung",
      "short" : "Diagnose im Klartext",
      "definition" : "Diagnose im Klartext. Im Bereich der medizinischen Dokumentation sollte die Textbeschreibung obligatorisch sein. Bei der sekundären Übernahme einer kodierten Diagonse aus der Primärdokumentation kann eine Freitextbeschreibung fehlen.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.code.text"
      }]
    },
    {
      "id" : "Diagnose.Diagnoseerlaeuterung",
      "path" : "Diagnose.Diagnoseerlaeuterung",
      "short" : "Diagnoseerläuterung",
      "definition" : "Damit soll dem Arzt die Möglichkeit gegeben werden, umfangreichere Angaben zusätzlich zu einer Diagnose abzufassen.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.note"
      }]
    },
    {
      "id" : "Diagnose.KlinischerStatus",
      "path" : "Diagnose.KlinischerStatus",
      "short" : "Klinischer Status",
      "definition" : "aktiv, Rezidiv, Rückfall, inaktiv, Remission, geheilt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.clinicalStatus"
      }]
    },
    {
      "id" : "Diagnose.KlinischRelevanterZeitraum",
      "path" : "Diagnose.KlinischRelevanterZeitraum",
      "short" : "Klinisch relevanter Zeitraum",
      "definition" : "Hier kann der Klinisch Relevante Zeitraum beziehungsweise die Lebensphase einer Erkrankung angegeben werden. Datumsangaben zu Diagnosen können in unterschiedlicher Präzision vorhanden sein.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.onset[x]"
      }]
    },
    {
      "id" : "Diagnose.KlinischRelevanterZeitraum.Zeitraum",
      "path" : "Diagnose.KlinischRelevanterZeitraum.Zeitraum",
      "short" : "klinisch relevanter Zeitraum",
      "definition" : "Der Zeitraum wird durch zwei Datumsangaben beschrieben, das heißt, von wann bis wann ein Patient an der diagnostizierten Krankheit litt. Über den Zeitraum kann auch ausgedrückt werden, seit wann ein Patient an einer Krankheit leidet, indem nur das Startdatum des Zeitraums angegeben wird. Das Startdatum des Zeitraums kann abweichen von dem Diagnosedatum. Datumsangaben zu Diagnosen können in unterschiedlicher Präzision vorhanden sein.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.onsetPeriod"
      }]
    },
    {
      "id" : "Diagnose.KlinischRelevanterZeitraum.Zeitraum.von",
      "path" : "Diagnose.KlinischRelevanterZeitraum.Zeitraum.von",
      "short" : "Startdatum",
      "definition" : "Startdatum",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.onsetPeriod.start"
      }]
    },
    {
      "id" : "Diagnose.KlinischRelevanterZeitraum.Zeitraum.bis",
      "path" : "Diagnose.KlinischRelevanterZeitraum.Zeitraum.bis",
      "short" : "Enddatum",
      "definition" : "Enddatum",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.onsetPeriod.end"
      }]
    },
    {
      "id" : "Diagnose.KlinischRelevanterZeitraum.Lebensphase",
      "path" : "Diagnose.KlinischRelevanterZeitraum.Lebensphase",
      "short" : "Lebensphase",
      "definition" : "Lebensphase, in der die Erkrankung aufgetreten ist",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Diagnose.KlinischRelevanterZeitraum.Lebensphase.von",
      "path" : "Diagnose.KlinischRelevanterZeitraum.Lebensphase.von",
      "short" : "In welcher Lebensphase die Krankheit began",
      "definition" : "In welcher Lebensphase die Krankheit began",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.onsetPeriod.start.extension('http://fhir.de/StructureDefinition/lebensphase').valueCodeableConcept"
      }]
    },
    {
      "id" : "Diagnose.KlinischRelevanterZeitraum.Lebensphase.bis",
      "path" : "Diagnose.KlinischRelevanterZeitraum.Lebensphase.bis",
      "short" : "In welcher Lebensphase die Krankheit endete",
      "definition" : "In welcher Lebensphase die Krankheit endete",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.onsetPeriod.end.extension('http://fhir.de/StructureDefinition/lebensphase').valueCodeableConcept"
      }]
    },
    {
      "id" : "Diagnose.Feststellungsdatum",
      "path" : "Diagnose.Feststellungsdatum",
      "short" : "Feststellungsdatum / Diagnosedatum",
      "definition" : "Das Datum ist der Zeitpunkt, an dem eine Krankheit z. B. durch einen Arzt festgestellt wurde. Dies wird im Folgenden mit Diagnosedatum bezeichnet.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.extension('http://hl7.org/fhir/StructureDefinition/condition-assertedDate').valueDateTime"
      }]
    },
    {
      "id" : "Diagnose.Dokumentationsdatum",
      "path" : "Diagnose.Dokumentationsdatum",
      "short" : "Dokumentationsdatum",
      "definition" : "Das Datum ist der Zeitpunkt, an dem eine Krankheit z. B. durch einen Arzt dokumentiert wurde. Hinweis: Wenn zwischen Feststellung der Diagnose und Dokumentationsdatum nicht unterschieden werden muss, ist das Datum der Feststellung der Diagnose (Diagnosedatum) anzugeben.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Condition.recordedDate"
      }]
    }]
  }
}

```
