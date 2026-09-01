# MII LM Fall - MII Implementation Guide Core Dataset Base v2027.0.0-dev

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII LM Fall**

## Logical Model: MII LM Fall 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/LogicalModel/Fall | *Version*:2027.0.0-dev |
| Active as of 2026-06-15 | *Computable Name*:MII_LM_Fall |

 
Logische Repräsentation des Basismoduls Fall 

**Usages:**

* This Logical Model is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.base|current/StructureDefinition/StructureDefinition-mii-lm-fall.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-lm-fall.csv), [Excel](../StructureDefinition-mii-lm-fall.xlsx) 

### Notes:

### Table View

| | | |
| :--- | :--- | :--- |
| Logical dataset | Data type | Description |
| Fall |  | MII LM Fall |
| Fall.Einrichtungskontakt | BackboneElement | Beschreibt den Kontakt zur Einrichtung, bestimmt durch den Behandlungsvertrag. |
| Fall.Einrichtungskontakt.KontaktEbene | CodeableConcept | Für die Unterscheidung der Kontakt-Hierarchieebenen im Modul FALL werden folgende Ausprägungen unterschieden: 1. Einrichtungskontakt 2. Abteilungskontakt 3. Versorgungsstellenkontakt Diese Gliederung gilt zunächst für stationäre Kontakte (siehe Kontakt-Klasse). Die Übertragung auf ambulante und teilstationäre Kontakte muss noch abgestimmt werden. |
| Fall.Einrichtungskontakt.KontaktKlasse | CodeableConcept | Auf Einrichtungsebene, also auf der Kontakt-Ebene Einrichtungskontakt, kann die Kontakt-Klasse stationär, ambulant oder teilstationär sein. |
| Fall.Einrichtungskontakt.KontaktArt | CodeableConcept | Differenzierung zwischen verschiedenen Arten von Kontakten (z.B. vorstationär, nachstationär, intensivstationär) |
| Fall.Einrichtungskontakt.PatientenIdentifikator | Identifier | Bei der internen Nutzung dient die sogenannte Patientennummer als Identifikator. Diese wird bei der ersten Aufnahme in die Einrichtung parallel zur ersten Fallnummer (Aufnahmenummer) vergeben. Bei jeder Wiederaufnahme (oder korrigierend danach) erfolgt eine Zuordnung zu dieser konstanten Patientennummer und die Vergabe einer neuen wechselnden Fallnummer. |
| Fall.Einrichtungskontakt.Aufnahmenummer | Identifier | Jeder Patient erhält bei der Planung einer Aufnahme oder bei der Aufnahme selbst eine Aufnahmenummer (auch Fallnummer oder Krankenhausinternes Kennzeichen genannt). Im Prinzip gilt diese Aufnahmenummer von der Aufnahme bis zur Entlassung - und auch bei den zugehörigen vorstationären und nachstationären Kontakten. Sie dient bei allen digital unterstüzten Vorgängen der Zuordnung zu dem Aufenthalt des Patienten in der Einrichtung. |
| Fall.Einrichtungskontakt.Aufnahmeanlass | CodeableConcept | Gemäß §21 KHEntgG |
| Fall.Einrichtungskontakt.Aufnahmegrund | CodeableConcept | Gemäß §21 KHEntgG |
| Fall.Einrichtungskontakt.Beginndatum | dateTime | Start des Kontakt Zeitraums |
| Fall.Einrichtungskontakt.Enddatum | dateTime | Ende des Kontakt Zeitraums |
| Fall.Einrichtungskontakt.Entlassungsgrund | code | Gemäß §21 KHEntgG |
| Fall.Abteilungskontakt | BackboneElement | Kontakte zur Abteilung |
| Fall.Abteilungskontakt.KontaktEbene | CodeableConcept | Für die Unterscheidung der Kontakt-Hierarchieebenen im Modul FALL werden folgende Ausprägungen unterschieden: 1. Einrichtungskontakt 2. Abteilungskontakt 3. Versorgungsstellenkontakt Diese Gliederung gilt zunächst für stationäre Kontakte (siehe Kontakt-Klasse). Die Übertragung auf ambulante und teilstationäre Kontakte muss noch abgestimmt werden. |
| Fall.Abteilungskontakt.KontaktArt | CodeableConcept | Differenzierung zwischen verschiedenen Arten von Kontakten (z.B. vorstationär, nachstationär, intensivstationär). |
| Fall.Abteilungskontakt.PatientenIdentifikator | Identifier | Bei der internen Nutzung dient die sogenannte Patientennummer als Identifikator. Diese wird bei der ersten Aufnahme in die Einrichtung parallel zur ersten Fallnummer (Aufnahmenummer) vergeben. Bei jeder Wiederaufnahme (oder korrigierend danach) erfolgt eine Zuordnung zu dieser konstanten Patientennummer und die Vergabe einer neuen wechselnden Fallnummer. |
| Fall.Abteilungskontakt.Aufnahmenummer | Identifier | Jeder Patient erhält bei der Planung einer Aufnahme oder bei der Aufnahme selbst eine Aufnahmenummer (auch Fallnummer oder Krankenhausinternes Kennzeichen genannt). Im Prinzip gilt diese Aufnahmenummer von der Aufnahme bis zur Entlassung - und auch bei den zugehörigen vorstationären und nachstationären Kontakten. Sie dient bei allen digital unterstüzten Vorgängen der Zuordnung zu dem Aufenthalt des Patienten in der Einrichtung. Im MII KDS dient sie als Identifikator bzw. Referenz zum Einrichtungskontakt. |
| Fall.Abteilungskontakt.Beginndatum | dateTime | Start des Kontakt Zeitraums |
| Fall.Abteilungskontakt.Enddatum | dateTime | Ende des Kontakt Zeitraums |
| Fall.Abteilungskontakt.Fachabteilungsschluessel | code | Bis auf Weiteres wird der proprietäre deutsche Fachabteilungsschlüssel des § 301 SGB V und des Datensatzes gemäß § 21 KHentgG als Fachrichtungsschlüssel genutzt, weil dieser in jedem Krankenhaus als |Fachabteilungsschlüssel im Einsatz ist. Der Einsatz des IHE-Fachabteilungsschlüssel wird geprüft, sobald einschlägige Anforderungen formuliert werden. |
| Fall.Versorgungsstellenkontakt | BackboneElement | Kontakte zu Versorgungsstellen und den eigentlich Behandelnden |
| Fall.Versorgungsstellenkontakt.KontaktEbene | CodeableConcept | Für die Unterscheidung der Kontakt-Hierarchieebenen im Modul FALL werden folgende Ausprägungen unterschieden: 1. Einrichtungskontakt 2. Abteilungskontakt 3. Versorgungsstellenkontakt Diese Gliederung gilt zunächst für stationäre Kontakte (siehe Kontakt-Klasse). Die Übertragung auf ambulante und teilstationäre Kontakte muss noch abgestimmt werden. |
| Fall.Versorgungsstellenkontakt.KontaktArt | CodeableConcept | Differenzierung zwischen verschiedenen Arten von Kontakten (z.B. vorstationär, nachstationär, intensivstationär). |
| Fall.Versorgungsstellenkontakt.PatientenIdentifikator | Identifier | Bei der internen Nutzung dient die sogenannte Patientennummer als Identifikator. Diese wird bei der ersten Aufnahme in die Einrichtung parallel zur ersten Fallnummer (Aufnahmenummer) vergeben. Bei jeder Wiederaufnahme (oder korrigierend danach) erfolgt eine Zuordnung zu dieser konstanten Patientennummer und die Vergabe einer neuen wechselnden Fallnummer. |
| Fall.Versorgungsstellenkontakt.Aufnahmenummer | Identifier | Jeder Patient erhält bei der Planung einer Aufnahme oder bei der Aufnahme selbst eine Aufnahmenummer (auch Fallnummer oder Krankenhausinternes Kennzeichen genannt). Im Prinzip gilt diese Aufnahmenummer von der Aufnahme bis zur Entlassung - und auch bei den zugehörigen vorstationären und nachstationären Kontakten. Sie dient bei allen digital unterstüzten Vorgängen der Zuordnung zu dem Aufenthalt des Patienten in der Einrichtung. Im MII KDS dient sie als Identifikator bzw. Referenz zum Einrichtungskontakt. |
| Fall.Versorgungsstellenkontakt.Beginndatum | dateTime | Start des Kontakt Zeitraums |
| Fall.Versorgungsstellenkontakt.Enddatum | dateTime | Ende des Kontakt Zeitraums |

### Mapping LogicalModel Fall -> FHIR

| | |
| :--- | :--- |
| MII LM Fall | FHIR |
| Fall.Abteilungskontakt.Aufnahmenummer | Encounter.identifier |
| Fall.Abteilungskontakt.Beginndatum | Encounter.period.start |
| Fall.Abteilungskontakt.Enddatum | Encounter.period.end |
| Fall.Abteilungskontakt.KontaktArt | Encounter.type |
| Fall.Abteilungskontakt.KontaktEbene | Encounter.type |
| Fall.Abteilungskontakt.PatientenIdentifikator | Encounter.subject |
| Fall.Einrichtungskontakt.Aufnahmeanlass | Encounter.hospitalization.admitSource |
| Fall.Einrichtungskontakt.Aufnahmegrund | Encounter.extension('http://fhir.de/StructureDefinition/Aufnahmegrund') |
| Fall.Einrichtungskontakt.Aufnahmenummer | Encounter.identifier |
| Fall.Einrichtungskontakt.Beginndatum | Encounter.period.start |
| Fall.Einrichtungskontakt.Enddatum | Encounter.period.end |
| Fall.Einrichtungskontakt.Entlassungsgrund | Encounter.hospitalization.dischargeDisposition |
| Fall.Einrichtungskontakt.KontaktArt | Encounter.type |
| Fall.Einrichtungskontakt.KontaktEbene | Encounter.type |
| Fall.Einrichtungskontakt.PatientenIdentifikator | Encounter.subject |
| Fall.Versorgungsstellenkontakt.Aufnahmenummer | Encounter.identifier |
| Fall.Versorgungsstellenkontakt.Beginndatum | Encounter.period.start |
| Fall.Versorgungsstellenkontakt.Enddatum | Encounter.period.end |
| Fall.Versorgungsstellenkontakt.KontaktArt | Encounter.type |
| Fall.Versorgungsstellenkontakt.KontaktEbene | Encounter.type |
| Fall.Versorgungsstellenkontakt.PatientenIdentifikator | Encounter.subject |

*** Delete File: input/translations/de/intro-notes/StructureDefinition-mii-lm-person-notes.md



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-lm-fall",
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
        "valueString" : "2027.0.0-dev"
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
        "code" : "C154624"
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/LogicalModel/Fall",
  "version" : "2027.0.0-dev",
  "name" : "MII_LM_Fall",
  "title" : "MII LM Fall",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-06-15",
  "publisher" : "Medical Informatics Initiative (MII)",
  "contact" : [{
    "name" : "Medical Informatics Initiative (MII)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/en"
    }]
  }],
  "description" : "Logische Repräsentation des Basismoduls Fall",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "purpose" : "Define the information model for treatment cases and encounters independently of a concrete FHIR resource representation.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "FHIR",
    "uri" : "http://hl7.org/fhir/StructureDefinition/Encounter|4.0.1",
    "name" : "Fall LogicalModel FHIR Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/LogicalModel/Fall",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Element",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "Fall",
      "path" : "Fall",
      "short" : "MII LM Fall",
      "definition" : "Logische Repräsentation des Basismoduls Fall"
    },
    {
      "id" : "Fall.Einrichtungskontakt",
      "path" : "Fall.Einrichtungskontakt",
      "short" : "Beschreibt den Kontakt zur Einrichtung, bestimmt durch den Behandlungsvertrag.",
      "definition" : "Beschreibt den Kontakt zur Einrichtung, bestimmt durch den Behandlungsvertrag.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Fall.Einrichtungskontakt.KontaktEbene",
      "path" : "Fall.Einrichtungskontakt.KontaktEbene",
      "short" : "Für die Unterscheidung der Kontakt-Hierarchieebenen im Modul FALL werden folgende Ausprägungen unterschieden:\r\n\r\n1. Einrichtungskontakt\r\n\r\n2. Abteilungskontakt\r\n\r\n3. Versorgungsstellenkontakt\r\n\r\nDiese Gliederung gilt zunächst für stationäre Kontakte (siehe Kontakt-Klasse). Die Übertragung auf ambulante und teilstationäre Kontakte muss noch abgestimmt werden.",
      "definition" : "Für die Unterscheidung der Kontakt-Hierarchieebenen im Modul FALL werden folgende Ausprägungen unterschieden:\r\n\r\n1. Einrichtungskontakt\r\n\r\n2. Abteilungskontakt\r\n\r\n3. Versorgungsstellenkontakt\r\n\r\nDiese Gliederung gilt zunächst für stationäre Kontakte (siehe Kontakt-Klasse). Die Übertragung auf ambulante und teilstationäre Kontakte muss noch abgestimmt werden.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.type"
      }]
    },
    {
      "id" : "Fall.Einrichtungskontakt.KontaktKlasse",
      "path" : "Fall.Einrichtungskontakt.KontaktKlasse",
      "short" : "Auf Einrichtungsebene, also auf der Kontakt-Ebene Einrichtungskontakt, kann die Kontakt-Klasse stationär, ambulant oder teilstationär sein.",
      "definition" : "Auf Einrichtungsebene, also auf der Kontakt-Ebene Einrichtungskontakt, kann die Kontakt-Klasse stationär, ambulant oder teilstationär sein.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "Fall.Einrichtungskontakt.KontaktArt",
      "path" : "Fall.Einrichtungskontakt.KontaktArt",
      "short" : "Differenzierung zwischen verschiedenen Arten von Kontakten (z.B. vorstationär, nachstationär, intensivstationär)",
      "definition" : "Differenzierung zwischen verschiedenen Arten von Kontakten (z.B. vorstationär, nachstationär, intensivstationär)",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.type"
      }]
    },
    {
      "id" : "Fall.Einrichtungskontakt.PatientenIdentifikator",
      "path" : "Fall.Einrichtungskontakt.PatientenIdentifikator",
      "short" : "Bei der internen Nutzung dient die sogenannte Patientennummer als Identifikator. Diese wird bei der ersten Aufnahme in die Einrichtung parallel zur ersten Fallnummer (Aufnahmenummer) vergeben. Bei jeder Wiederaufnahme (oder korrigierend danach) erfolgt eine Zuordnung zu dieser konstanten Patientennummer und die Vergabe einer neuen wechselnden Fallnummer.",
      "definition" : "Bei der internen Nutzung dient die sogenannte Patientennummer als Identifikator. Diese wird bei der ersten Aufnahme in die Einrichtung parallel zur ersten Fallnummer (Aufnahmenummer) vergeben. Bei jeder Wiederaufnahme (oder korrigierend danach) erfolgt eine Zuordnung zu dieser konstanten Patientennummer und die Vergabe einer neuen wechselnden Fallnummer.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.subject"
      }]
    },
    {
      "id" : "Fall.Einrichtungskontakt.Aufnahmenummer",
      "path" : "Fall.Einrichtungskontakt.Aufnahmenummer",
      "short" : "Jeder Patient erhält bei der Planung einer Aufnahme oder bei der Aufnahme selbst eine Aufnahmenummer (auch Fallnummer oder Krankenhausinternes Kennzeichen genannt). Im Prinzip gilt diese Aufnahmenummer von der Aufnahme bis zur Entlassung - und auch bei den zugehörigen vorstationären und nachstationären Kontakten. Sie dient bei allen digital unterstüzten Vorgängen der Zuordnung zu dem Aufenthalt des Patienten in der Einrichtung.",
      "definition" : "Jeder Patient erhält bei der Planung einer Aufnahme oder bei der Aufnahme selbst eine Aufnahmenummer (auch Fallnummer oder Krankenhausinternes Kennzeichen genannt). Im Prinzip gilt diese Aufnahmenummer von der Aufnahme bis zur Entlassung - und auch bei den zugehörigen vorstationären und nachstationären Kontakten. Sie dient bei allen digital unterstüzten Vorgängen der Zuordnung zu dem Aufenthalt des Patienten in der Einrichtung.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.identifier"
      }]
    },
    {
      "id" : "Fall.Einrichtungskontakt.Aufnahmeanlass",
      "path" : "Fall.Einrichtungskontakt.Aufnahmeanlass",
      "short" : "Gemäß §21 KHEntgG",
      "definition" : "Gemäß §21 KHEntgG",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.hospitalization.admitSource"
      }]
    },
    {
      "id" : "Fall.Einrichtungskontakt.Aufnahmegrund",
      "path" : "Fall.Einrichtungskontakt.Aufnahmegrund",
      "short" : "Gemäß §21 KHEntgG",
      "definition" : "Es ist der Aufnahmegrund entsprechend Schlüssel 1 der Anlage 2 zur § 301-Vereinbarung anzugeben. Als 3. und 4. Stelle (xx) sind die nach Schlüssel 1 möglichen Werte (01 bis 07, bei tagesbezogenen Ent- gelten auch 21 bis 27) anzugeben. Fälle mit den Werten „41“ bis „47“ in der 3. und 4. Stelle (Behandlun- gen im Rahmen von Verträgen zur integrierten Versorgung) können übermittelt werden.\r\nDer Aufnahmegrund kann bei Begleitpersonen und mitaufgenommenen Pflegekräften (Aufnahmeanlass „B“) entfallen. In allen anderen Fällen ist der Aufnahmegrund eine Muss-Angabe.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.extension('http://fhir.de/StructureDefinition/Aufnahmegrund')"
      }]
    },
    {
      "id" : "Fall.Einrichtungskontakt.Beginndatum",
      "path" : "Fall.Einrichtungskontakt.Beginndatum",
      "short" : "Start des Kontakt Zeitraums",
      "definition" : "Start des Kontakt Zeitraums",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "dateTime"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.period.start"
      }]
    },
    {
      "id" : "Fall.Einrichtungskontakt.Enddatum",
      "path" : "Fall.Einrichtungskontakt.Enddatum",
      "short" : "Ende des Kontakt Zeitraums",
      "definition" : "Ende des Kontakt Zeitraums",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "dateTime"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.period.end"
      }]
    },
    {
      "id" : "Fall.Einrichtungskontakt.Entlassungsgrund",
      "path" : "Fall.Einrichtungskontakt.Entlassungsgrund",
      "short" : "Gemäß §21 KHEntgG",
      "definition" : "Gemäß §21 KHEntgG",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.hospitalization.dischargeDisposition"
      }]
    },
    {
      "id" : "Fall.Abteilungskontakt",
      "path" : "Fall.Abteilungskontakt",
      "short" : "Kontakte zur Abteilung",
      "definition" : "Kontakte zur Abteilung",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Fall.Abteilungskontakt.KontaktEbene",
      "path" : "Fall.Abteilungskontakt.KontaktEbene",
      "short" : "Für die Unterscheidung der Kontakt-Hierarchieebenen im Modul FALL werden folgende Ausprägungen unterschieden:\r\n\r\n1. Einrichtungskontakt\r\n\r\n2. Abteilungskontakt\r\n\r\n3. Versorgungsstellenkontakt\r\n\r\nDiese Gliederung gilt zunächst für stationäre Kontakte (siehe Kontakt-Klasse). Die Übertragung auf ambulante und teilstationäre Kontakte muss noch abgestimmt werden.",
      "definition" : "Für die Unterscheidung der Kontakt-Hierarchieebenen im Modul FALL werden folgende Ausprägungen unterschieden:\r\n\r\n1. Einrichtungskontakt\r\n\r\n2. Abteilungskontakt\r\n\r\n3. Versorgungsstellenkontakt\r\n\r\nDiese Gliederung gilt zunächst für stationäre Kontakte (siehe Kontakt-Klasse). Die Übertragung auf ambulante und teilstationäre Kontakte muss noch abgestimmt werden.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.type"
      }]
    },
    {
      "id" : "Fall.Abteilungskontakt.KontaktArt",
      "path" : "Fall.Abteilungskontakt.KontaktArt",
      "short" : "Differenzierung zwischen verschiedenen Arten von Kontakten (z.B. vorstationär, nachstationär, intensivstationär).",
      "definition" : "Differenzierung zwischen verschiedenen Arten von Kontakten (z.B. vorstationär, nachstationär, intensivstationär).",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.type"
      }]
    },
    {
      "id" : "Fall.Abteilungskontakt.PatientenIdentifikator",
      "path" : "Fall.Abteilungskontakt.PatientenIdentifikator",
      "short" : "Bei der internen Nutzung dient die sogenannte Patientennummer als Identifikator. Diese wird bei der ersten Aufnahme in die Einrichtung parallel zur ersten Fallnummer (Aufnahmenummer) vergeben. Bei jeder Wiederaufnahme (oder korrigierend danach) erfolgt eine Zuordnung zu dieser konstanten Patientennummer und die Vergabe einer neuen wechselnden Fallnummer.",
      "definition" : "Bei der internen Nutzung dient die sogenannte Patientennummer als Identifikator. Diese wird bei der ersten Aufnahme in die Einrichtung parallel zur ersten Fallnummer (Aufnahmenummer) vergeben. Bei jeder Wiederaufnahme (oder korrigierend danach) erfolgt eine Zuordnung zu dieser konstanten Patientennummer und die Vergabe einer neuen wechselnden Fallnummer.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.subject"
      }]
    },
    {
      "id" : "Fall.Abteilungskontakt.Aufnahmenummer",
      "path" : "Fall.Abteilungskontakt.Aufnahmenummer",
      "short" : "Jeder Patient erhält bei der Planung einer Aufnahme oder bei der Aufnahme selbst eine Aufnahmenummer (auch Fallnummer oder Krankenhausinternes Kennzeichen genannt). Im Prinzip gilt diese Aufnahmenummer von der Aufnahme bis zur Entlassung - und auch bei den zugehörigen vorstationären und nachstationären Kontakten. Sie dient bei allen digital unterstüzten Vorgängen der Zuordnung zu dem Aufenthalt des Patienten in der Einrichtung. Im MII KDS dient sie als Identifikator bzw. Referenz zum Einrichtungskontakt.",
      "definition" : "Jeder Patient erhält bei der Planung einer Aufnahme oder bei der Aufnahme selbst eine Aufnahmenummer (auch Fallnummer oder Krankenhausinternes Kennzeichen genannt). Im Prinzip gilt diese Aufnahmenummer von der Aufnahme bis zur Entlassung - und auch bei den zugehörigen vorstationären und nachstationären Kontakten. Sie dient bei allen digital unterstüzten Vorgängen der Zuordnung zu dem Aufenthalt des Patienten in der Einrichtung. Im MII KDS dient sie als Identifikator bzw. Referenz zum Einrichtungskontakt.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.identifier"
      }]
    },
    {
      "id" : "Fall.Abteilungskontakt.Beginndatum",
      "path" : "Fall.Abteilungskontakt.Beginndatum",
      "short" : "Start des Kontakt Zeitraums",
      "definition" : "Start des Kontakt Zeitraums",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "dateTime"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.period.start"
      }]
    },
    {
      "id" : "Fall.Abteilungskontakt.Enddatum",
      "path" : "Fall.Abteilungskontakt.Enddatum",
      "short" : "Ende des Kontakt Zeitraums",
      "definition" : "Ende des Kontakt Zeitraums",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "dateTime"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.period.end"
      }]
    },
    {
      "id" : "Fall.Abteilungskontakt.Fachabteilungsschluessel",
      "path" : "Fall.Abteilungskontakt.Fachabteilungsschluessel",
      "short" : "Bis auf Weiteres wird der proprietäre deutsche  Fachabteilungsschlüssel des § 301 SGB V und des Datensatzes gemäß § 21 KHentgG als Fachrichtungsschlüssel genutzt, weil dieser in jedem Krankenhaus als |Fachabteilungsschlüssel im Einsatz ist. Der Einsatz des IHE-Fachabteilungsschlüssel wird geprüft, sobald einschlägige Anforderungen formuliert werden.",
      "definition" : "Bis auf Weiteres wird der proprietäre deutsche  Fachabteilungsschlüssel des § 301 SGB V und des Datensatzes gemäß § 21 KHentgG als Fachrichtungsschlüssel genutzt, weil dieser in jedem Krankenhaus als |Fachabteilungsschlüssel im Einsatz ist. Der Einsatz des IHE-Fachabteilungsschlüssel wird geprüft, sobald einschlägige Anforderungen formuliert werden.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "Fall.Versorgungsstellenkontakt",
      "path" : "Fall.Versorgungsstellenkontakt",
      "short" : "Kontakte zu Versorgungsstellen und den eigentlich Behandelnden",
      "definition" : "Kontakte zu Versorgungsstellen und den eigentlich Behandelnden",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Fall.Versorgungsstellenkontakt.KontaktEbene",
      "path" : "Fall.Versorgungsstellenkontakt.KontaktEbene",
      "short" : "Für die Unterscheidung der Kontakt-Hierarchieebenen im Modul FALL werden folgende Ausprägungen unterschieden:\r\n\r\n1. Einrichtungskontakt\r\n\r\n2. Abteilungskontakt\r\n\r\n3. Versorgungsstellenkontakt\r\n\r\nDiese Gliederung gilt zunächst für stationäre Kontakte (siehe Kontakt-Klasse). Die Übertragung auf ambulante und teilstationäre Kontakte muss noch abgestimmt werden.",
      "definition" : "Für die Unterscheidung der Kontakt-Hierarchieebenen im Modul FALL werden folgende Ausprägungen unterschieden:\r\n\r\n1. Einrichtungskontakt\r\n\r\n2. Abteilungskontakt\r\n\r\n3. Versorgungsstellenkontakt\r\n\r\nDiese Gliederung gilt zunächst für stationäre Kontakte (siehe Kontakt-Klasse). Die Übertragung auf ambulante und teilstationäre Kontakte muss noch abgestimmt werden.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.type"
      }]
    },
    {
      "id" : "Fall.Versorgungsstellenkontakt.KontaktArt",
      "path" : "Fall.Versorgungsstellenkontakt.KontaktArt",
      "short" : "Differenzierung zwischen verschiedenen Arten von Kontakten (z.B. vorstationär, nachstationär, intensivstationär).",
      "definition" : "Differenzierung zwischen verschiedenen Arten von Kontakten (z.B. vorstationär, nachstationär, intensivstationär).",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.type"
      }]
    },
    {
      "id" : "Fall.Versorgungsstellenkontakt.PatientenIdentifikator",
      "path" : "Fall.Versorgungsstellenkontakt.PatientenIdentifikator",
      "short" : "Bei der internen Nutzung dient die sogenannte Patientennummer als Identifikator. Diese wird bei der ersten Aufnahme in die Einrichtung parallel zur ersten Fallnummer (Aufnahmenummer) vergeben. Bei jeder Wiederaufnahme (oder korrigierend danach) erfolgt eine Zuordnung zu dieser konstanten Patientennummer und die Vergabe einer neuen wechselnden Fallnummer.",
      "definition" : "Bei der internen Nutzung dient die sogenannte Patientennummer als Identifikator. Diese wird bei der ersten Aufnahme in die Einrichtung parallel zur ersten Fallnummer (Aufnahmenummer) vergeben. Bei jeder Wiederaufnahme (oder korrigierend danach) erfolgt eine Zuordnung zu dieser konstanten Patientennummer und die Vergabe einer neuen wechselnden Fallnummer.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.subject"
      }]
    },
    {
      "id" : "Fall.Versorgungsstellenkontakt.Aufnahmenummer",
      "path" : "Fall.Versorgungsstellenkontakt.Aufnahmenummer",
      "short" : "Jeder Patient erhält bei der Planung einer Aufnahme oder bei der Aufnahme selbst eine Aufnahmenummer (auch Fallnummer oder Krankenhausinternes Kennzeichen genannt). Im Prinzip gilt diese Aufnahmenummer von der Aufnahme bis zur Entlassung - und auch bei den zugehörigen vorstationären und nachstationären Kontakten. Sie dient bei allen digital unterstüzten Vorgängen der Zuordnung zu dem Aufenthalt des Patienten in der Einrichtung. Im MII KDS dient sie als Identifikator bzw. Referenz zum Einrichtungskontakt.",
      "definition" : "Jeder Patient erhält bei der Planung einer Aufnahme oder bei der Aufnahme selbst eine Aufnahmenummer (auch Fallnummer oder Krankenhausinternes Kennzeichen genannt). Im Prinzip gilt diese Aufnahmenummer von der Aufnahme bis zur Entlassung - und auch bei den zugehörigen vorstationären und nachstationären Kontakten. Sie dient bei allen digital unterstüzten Vorgängen der Zuordnung zu dem Aufenthalt des Patienten in der Einrichtung. Im MII KDS dient sie als Identifikator bzw. Referenz zum Einrichtungskontakt.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.identifier"
      }]
    },
    {
      "id" : "Fall.Versorgungsstellenkontakt.Beginndatum",
      "path" : "Fall.Versorgungsstellenkontakt.Beginndatum",
      "short" : "Start des Kontakt Zeitraums",
      "definition" : "Start des Kontakt Zeitraums",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "dateTime"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.period.start"
      }]
    },
    {
      "id" : "Fall.Versorgungsstellenkontakt.Enddatum",
      "path" : "Fall.Versorgungsstellenkontakt.Enddatum",
      "short" : "Ende des Kontakt Zeitraums",
      "definition" : "Ende des Kontakt Zeitraums",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "dateTime"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Encounter.period.end"
      }]
    }]
  }
}

```
