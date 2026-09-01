# MII LM Prozedur - MII Implementation Guide Core Dataset Base v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII LM Prozedur**

## Logical Model: MII LM Prozedur 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/LogicalModel/Prozedur | *Version*:2027.0.0-ballot.rc1 |
| Active as of 2026-09-01 | *Computable Name*:MII_LM_Prozedur |

 
Logische Repräsentation des Basismoduls Prozedur 

**Usages:**

* This Logical Model is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.base|current/StructureDefinition/StructureDefinition-mii-lm-prozedur.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-lm-prozedur.csv), [Excel](../StructureDefinition-mii-lm-prozedur.xlsx) 

### Notes:

### Table View

| | | |
| :--- | :--- | :--- |
| Logical dataset | Data type | Description |
| Prozedur |  | Das Basismodul Prozeduren umfasst die Beschreibung diagnostischer oder therapeutischer Maßnahmen, die als Leistungskomplexe auch für die Abrechnung dokumentiert und kodiert werden, z.B. Operationen. |
| Prozedur.OPSProzedurKodiert | BackboneElement | Kodierung der durchgeführten Prozedur mittels OPS. |
| Prozedur.OPSProzedurKodiert.VollstaendigerProzedurencode | Coding | Vollständiger Prozedurencode |
| Prozedur.OPSProzedurKodiert.Seitenlokalisation | Coding | Seitenlokalisation |
| Prozedur.SNOMEDProzedurKodiert | BackboneElement | Kodierung der durchgeführten Prozedur mittels SNOMED CT. |
| Prozedur.SNOMEDProzedurKodiert.VollstaendigerProzedurencode | Coding | Vollständiger Prozedurencode |
| Prozedur.Koerperstelle | CodeableConcept | Körperstelle |
| Prozedur.DetaillierteAnatomischeStruktur | Reference | Detaillierte anatomische Struktur |
| Prozedur.Durchfuehrungsabsicht | Coding | Durchführungsabsicht |
| Prozedur.Durchfuehrungsdatum | dateTime | Durchführungsdatum |
| Prozedur.Dokumentationsdatum | dateTime | Dokumentationsdatum |
| Prozedur.Freitextbeschreibung | string | Freitextbeschreibung |

### Mapping LogicalModel Prozedur -> FHIR

| | |
| :--- | :--- |
| MII LM Prozedur | FHIR |
| Prozedur.DetaillierteAnatomischeStruktur | Procedure.bodySite.extension('http://hl7.org/fhir/StructureDefinition/bodySite').valueReference |
| Prozedur.Dokumentationsdatum | Procedure.extension('http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum').value |
| Prozedur.Durchfuehrungsabsicht | Procedure.extension('https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht').value |
| Prozedur.Durchfuehrungsdatum | Procedure.performedDateTime |
| Prozedur.Freitextbeschreibung | Procedure.code.text |
| Prozedur.Koerperstelle | Procedure.bodySite |
| Prozedur.OPSProzedurKodiert | Procedure.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/ops') |
| Prozedur.OPSProzedurKodiert.Seitenlokalisation | Procedure.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/ops').extension('http://fhir.de/StructureDefinition/seitenlokalisation').value |
| Prozedur.OPSProzedurKodiert.VollstaendigerProzedurencode | Procedure.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/ops') |
| Prozedur.SNOMEDProzedurKodiert | Procedure.code.coding.where(system='http://snomed.info/sct') |
| Prozedur.SNOMEDProzedurKodiert.VollstaendigerProzedurencode | Procedure.code.coding.where(system='http://snomed.info/sct') |

*** Delete File: input/intro-notes/StructureDefinition-mii-lm-fall-notes.md



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-lm-prozedur",
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
        "valueString" : "2027.0.0-ballot.rc1"
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
        "version" : "3.0.0",
        "code" : "package",
        "display" : "Package"
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
      "start" : "2027"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-topic",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl",
        "code" : "C25218"
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/LogicalModel/Prozedur",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_LM_Prozedur",
  "title" : "MII LM Prozedur",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-09-01",
  "publisher" : "Medical Informatics Initiative (MII)",
  "contact" : [{
    "name" : "Medical Informatics Initiative (MII)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/en"
    }]
  }],
  "description" : "Logische Repräsentation des Basismoduls Prozedur",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "purpose" : "Define the information model for procedures independently of a concrete FHIR resource representation.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "FHIR",
    "uri" : "http://hl7.org/fhir/StructureDefinition/Procedure|4.0.1",
    "name" : "Prozedur LogicalModel FHIR Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/LogicalModel/Prozedur",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Element",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "Prozedur",
      "path" : "Prozedur",
      "short" : "Das Basismodul Prozeduren umfasst die Beschreibung diagnostischer oder therapeutischer Maßnahmen, die als Leistungskomplexe auch für die Abrechnung dokumentiert und kodiert werden, z.B. Operationen.",
      "definition" : "Logische Repräsentation des Basismoduls Prozedur"
    },
    {
      "id" : "Prozedur.OPSProzedurKodiert",
      "path" : "Prozedur.OPSProzedurKodiert",
      "short" : "Kodierung der durchgeführten Prozedur mittels OPS.",
      "definition" : "Kodierung der durchgeführten Prozedur mittels OPS.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Procedure.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/ops')"
      }]
    },
    {
      "id" : "Prozedur.OPSProzedurKodiert.VollstaendigerProzedurencode",
      "path" : "Prozedur.OPSProzedurKodiert.VollstaendigerProzedurencode",
      "short" : "Vollständiger Prozedurencode",
      "definition" : "Der vollständige Prozedurencode: Tripel aus OPS-Code, Codesystem (inkl. Version!) und Katalogtext.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Coding"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Procedure.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/ops')"
      }]
    },
    {
      "id" : "Prozedur.OPSProzedurKodiert.Seitenlokalisation",
      "path" : "Prozedur.OPSProzedurKodiert.Seitenlokalisation",
      "short" : "Seitenlokalisation",
      "definition" : "Seitenlokalisation für die durchgeführte Prozedur gemäß BfArM",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Coding"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Procedure.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/ops').extension('http://fhir.de/StructureDefinition/seitenlokalisation').value"
      }]
    },
    {
      "id" : "Prozedur.SNOMEDProzedurKodiert",
      "path" : "Prozedur.SNOMEDProzedurKodiert",
      "short" : "Kodierung der durchgeführten Prozedur mittels SNOMED CT.",
      "definition" : "Kodierung der durchgeführten Prozedur mittels SNOMED CT.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Procedure.code.coding.where(system='http://snomed.info/sct')"
      }]
    },
    {
      "id" : "Prozedur.SNOMEDProzedurKodiert.VollstaendigerProzedurencode",
      "path" : "Prozedur.SNOMEDProzedurKodiert.VollstaendigerProzedurencode",
      "short" : "Vollständiger Prozedurencode",
      "definition" : "Der vollständige Prozedurencode: Tripel aus SNOMED-CT-Code, Codesystem (Version optional) und präferierten Namen",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Coding"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Procedure.code.coding.where(system='http://snomed.info/sct')"
      }]
    },
    {
      "id" : "Prozedur.Koerperstelle",
      "path" : "Prozedur.Koerperstelle",
      "short" : "Körperstelle",
      "definition" : "Körperstelle der Prozedur mittels SNOMED CT inkl. Lateralität (R, L, B)",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Procedure.bodySite"
      }]
    },
    {
      "id" : "Prozedur.DetaillierteAnatomischeStruktur",
      "path" : "Prozedur.DetaillierteAnatomischeStruktur",
      "short" : "Detaillierte anatomische Struktur",
      "definition" : "Detaillierte Angaben zu der patientenbezogenen anatomischen Struktur oder Lokalisation, auf die sich die Prozedur bezieht. Das Element kann verwendet werden, wenn die kodierte Angabe der Körperstelle allein nicht die für den Anwendungsfall erforderliche Genauigkeit bietet.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/BodyStructure"]
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Procedure.bodySite.extension('http://hl7.org/fhir/StructureDefinition/bodySite').valueReference"
      }]
    },
    {
      "id" : "Prozedur.Durchfuehrungsabsicht",
      "path" : "Prozedur.Durchfuehrungsabsicht",
      "short" : "Durchführungsabsicht",
      "definition" : "Intention mit der die Prozedur durchgeführt wird.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Coding"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Procedure.extension('https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht').value"
      }]
    },
    {
      "id" : "Prozedur.Durchfuehrungsdatum",
      "path" : "Prozedur.Durchfuehrungsdatum",
      "short" : "Durchführungsdatum",
      "definition" : "Das Datum ist der Zeitpunkt, an dem eine Prozedur durchgeführt wurde.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Procedure.performedDateTime"
      }]
    },
    {
      "id" : "Prozedur.Dokumentationsdatum",
      "path" : "Prozedur.Dokumentationsdatum",
      "short" : "Dokumentationsdatum",
      "definition" : "Das Datum ist der Zeitpunkt, an dem eine Prozedur dokumentiert wurde.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Procedure.extension('http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum').value"
      }]
    },
    {
      "id" : "Prozedur.Freitextbeschreibung",
      "path" : "Prozedur.Freitextbeschreibung",
      "short" : "Freitextbeschreibung",
      "definition" : "Freitextbeschreibung der durchgeführten Prozedur",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Procedure.code.text"
      }]
    }]
  }
}

```
