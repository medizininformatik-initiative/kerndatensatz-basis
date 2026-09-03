# MII LM Person - MII Implementation Guide Core Dataset Base v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **MII LM Person**

## Logisches Modell: MII LM Person 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/LogicalModel/Person | *Version*:2027.0.0-ballot.rc1 |
| Active Stand: 2026-09-01 | *Maschinenlesbarer Name*:MII_LM_Person |

 
Logische Repräsentation des Basismoduls Person 

**Usages:**

* This Logical Model is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.base|current/StructureDefinition/StructureDefinition-mii-lm-person.json)

### Formale Ansichten des Profilinhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Schlüsselelemente-Tabelle](#tabs-key) 
*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Element](http://hl7.org/fhir/R4/datatypes.html#Element) 

#### Terminology Bindings (Differential)

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Element](http://hl7.org/fhir/R4/datatypes.html#Element) 

** Summary **

Mandatory: 0 element(15 nested mandatory elements)

 **Schlüsselelemente-Ansicht** 

#### Terminology Bindings

#### Constraints

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [Element](http://hl7.org/fhir/R4/datatypes.html#Element) 

#### Terminology Bindings (Differential)

 **Snapshot-AnsichtView** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Element](http://hl7.org/fhir/R4/datatypes.html#Element) 

** Summary **

Mandatory: 0 element(15 nested mandatory elements)

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-mii-lm-person.csv), [Excel](../StructureDefinition-mii-lm-person.xlsx) 

### Notizen:

### Tabellenansicht

| | | |
| :--- | :--- | :--- |
| Logischer Datensatz | Datentyp | Beschreibung |
| Person |  | -- Überschrift -- |
| Person.Name | BackboneElement | Vollständiger Name einer Person. |
| Person.Name.Vorname | string | Vollständiger Vorname einer Person. |
| Person.Name.Nachname | string | Nachname einer Person ohne Vor- und Zusätze. Dient z.B. der alphabetischen Einordnung des Namens. |
| Person.Name.Familienname | string | Der vollständige Familienname, einschließlich aller Vorsatz- und Zusatzwörter, mit Leerzeichen getrennt. |
| Person.Name.Vorsatzwort | string | Vorsatzwort wie z.B.: von, van, zu Vgl. auch VSDM-Spezifikation der Gematik (Versichertenstammdatenmanagement, "eGK") |
| Person.Name.Namenszusatz | string | Namenszusatz als Bestandteil das Nachnamens, wie in VSDM (Versichertenstammdatenmanagement, "eGK") definiert. Beispiele: Gräfin, Prinz oder Fürst |
| Person.Name.Praefix | string | Namensteile vor dem Vornamen, z.B. akademischer Grad |
| Person.Name.Praefix.ArtdesPraefixes | code | Art des Präfixes, z.B. "AC" für Akademische Titel |
| Person.Name.Geburtsname | string | Familienname einer Person zum Zeitpunkt ihrer Geburt. Kann sich danach z.B. durch Heirat und Annahme eines anderen Familiennamens ändern. |
| Person.Demographie | BackboneElement | Das Basismodul Demographie enthält demographische Parameter (Alter, Geschlecht etc.). |
| Person.Demographie.AdministrativesGeschlecht | code | Administratives Geschlecht der Person |
| Person.Demographie.DokumentiertesGeschlecht | BackboneElement | Dokumentierte Geschlechtsangabe einer Person. |
| Person.Demographie.DokumentiertesGeschlecht.Wert | CodeableConcept | Dokumentierte Geschlechtsangabe der Person. |
| Person.Demographie.DokumentiertesGeschlecht.Typ | CodeableConcept | Art der dokumentierten Geschlechtsangabe. |
| Person.Demographie.DokumentiertesGeschlecht.Gueltigkeitszeitraum | Period | Gültigkeitszeitraum der dokumentierten Geschlechtsangabe. |
| Person.Demographie.DokumentiertesGeschlecht.Erfassungszeitpunkt | dateTime | Zeitpunkt der Erfassung. |
| Person.Demographie.DokumentiertesGeschlecht.Quelle[x] | CodeableConcept | Reference | Quelle der dokumentierten Geschlechtsangabe. |
| Person.Demographie.DokumentiertesGeschlecht.Quelldokument[x] | CodeableConcept | Reference | Quelldokument der dokumentierten Geschlechtsangabe. |
| Person.Demographie.DokumentiertesGeschlecht.ZustaendigerRechtsraum | CodeableConcept | Zuständiger Rechtsraum der Quelle. |
| Person.Demographie.Geburtsdatum | date | Geburtsdatum des Person. |
| Person.Demographie.Adresse | BackboneElement | Vollständige Anschrift einer Person für die postlische Kommunikation. |
| Person.Demographie.Adresse.Strassenanschrift | BackboneElement | Eine Adresse für die Strassenanschrift gemäß postalischer Konventionen. Bei Stadtstaaten einschließlich Bezirken. |
| Person.Demographie.Adresse.Strassenanschrift.Land | string | Ländercode nach ISO 3166. |
| Person.Demographie.Adresse.Strassenanschrift.PLZ | string | Postleitzahl gemäß der im jeweiligen Land gültigen Konventionen. |
| Person.Demographie.Adresse.Strassenanschrift.Wohnort | string | Bei Personen aus Stadtstaaten inklusive des Stadtteils. |
| Person.Demographie.Adresse.Strassenanschrift.Strasse | string | Straßenname mit Hausnummer oder Postfach sowie weitere Angaben zur Zustellung. |
| Person.Demographie.Adresse.Postfach | BackboneElement | Eine Adresse für ein Postfach gemäß postalischer Konventionen. Bei Stadtstaaten einschließlich Bezirken. |
| Person.Demographie.Adresse.Postfach.Land | string | Ländercode nach ISO 3166. |
| Person.Demographie.Adresse.Postfach.PLZ | string | Postleitzahl gemäß der im jeweiligen Land gültigen Konventionen. |
| Person.Demographie.Adresse.Postfach.Wohnort | string | Bei Personen aus Stadtstaaten inklusive des Stadtteils. |
| Person.Demographie.Adresse.Postfach.Strasse | string | Straßenname mit Hausnummer oder Postfach sowie weitere Angaben zur Zustellung. |
| Person.Demographie.Vitalstatus | BackboneElement | Gibt an, ob ein Patient verstorben ist. Falls ja, zudem den Zeitpunkt. |
| Person.Demographie.Vitalstatus.PatientVerstorben | boolean | Gibt an, ob der Patient am Leben oder verstorben ist. |
| Person.Demographie.Vitalstatus.Todeszeitpunkt | dateTime | Gibt den Todeszeitpunkt des Patienten an, falls dieser im KH verstorben ist. Ansonsten "Null Flavor". |
| Person.Demographie.Vitalstatus.Informationsquelle | string | Quelle des Vitalstatus. |
| Person.Demographie.Vitalstatus.ZeitpunktFeststellungDesVitalstatus | dateTime | Letzter bekannter Zeitpunkt oder Zeitraum, zudem ein Vitalstatus festgestellt wurde |
| Person.Demographie.Vitalstatus.Todesursache | CodeableConcept | Todesursache mit ICD-10-WHO codiert. |
| Person.AllergieOderUnvertraeglichkeit | BackboneElement | Allergie oder Unverträglichkeit |
| Person.AllergieOderUnvertraeglichkeit.KlinischerStatus | CodeableConcept | Klinischer Status |
| Person.AllergieOderUnvertraeglichkeit.Verifikationsstatus | CodeableConcept | Verifikationsstatus |
| Person.AllergieOderUnvertraeglichkeit.Art | code | Art |
| Person.AllergieOderUnvertraeglichkeit.Kategorie | code | Kategorie |
| Person.AllergieOderUnvertraeglichkeit.Kritikalitaet | code | Kritikalität |
| Person.AllergieOderUnvertraeglichkeit.AllergieOderUnvertraeglichkeitGegen | CodeableConcept | Allergie oder Unverträglichkeit gegen |
| Person.AllergieOderUnvertraeglichkeit.Patient | Reference | Patient |
| Person.AllergieOderUnvertraeglichkeit.Kontakt | Reference | Kontakt |
| Person.AllergieOderUnvertraeglichkeit.Beginn[x] | dateTime | Age | Period | Range | string | Beginn |
| Person.AllergieOderUnvertraeglichkeit.Dokumentationsdatum | dateTime | Dokumentationsdatum |
| Person.AllergieOderUnvertraeglichkeit.UnerwuenschteReaktion | BackboneElement | Unerwünschte Reaktion |
| Person.AllergieOderUnvertraeglichkeit.UnerwuenschteReaktion.Manifestation | CodeableConcept | Manifestation |
| Person.AllergieOderUnvertraeglichkeit.UnerwuenschteReaktion.Schweregrad | code | Schweregrad |
| Person.AllergieOderUnvertraeglichkeit.UnerwuenschteReaktion.Expositionsweg | CodeableConcept | Expositionsweg |
| Person.PatientIn | BackboneElement | Person, die in einer oder mehreren Gesundheitseinrichtungen behandelt wird |
| Person.PatientIn.PatientenIdentifikator | BackboneElement | Identifikation des Patienten in Verschiedenen Gesundheitseinrichtungen, Einrichtungskennzeichen kann als "Codesystem" gesehen werden, und Patienten-Identifikator als "Code" |
| Person.PatientIn.PatientenIdentifikator.PatientenIdentifikator | Identifier | Gesundheitseinrichtungs-eigene Identifikationsnummer für einen Patienten |
| Person.PatientIn.PatientenIdentifikator.PatientenIdentifikatorKontext | CodeableConcept | Der Kontext des Patienten-Identifikators um den Patienten-Identifikator zu Beschreiben, da der Patient innerhalb einer Gesundheitseinrichtung möglicherweise pro System eine Nummer (Im Krankenhaus: Labor, Radiologie, Internistische Station etc.) bekommt. |
| Person.PatientIn.Versicherung | BackboneElement | Aktuell gültige Versicherung der Patient:in welcher zur Abrechnung der Behandlungsleistung verwendet wird. |
| Person.PatientIn.Versicherung.InstitutionskennzeichenDerKrankenkasse | string | Die Institutionskennzeichen (kurz: IK) sind bundesweit eindeutige, neunstellige Zahlen, mit deren Hilfe Abrechnungen und Qualitätssicherungsmaßnahmen im Bereich der deutschen Sozialversicherung einrichtungsübergreifend abgewickelt werden können. |
| Person.PatientIn.Versicherung.Versicherungstyp | CodeableConcept | Versicherungstyp des Patienten |
| Person.PatientIn.Versicherung.Versichertennummer | BackboneElement | Angaben zur Identifikation der versicherten Person |
| Person.PatientIn.Versicherung.Versichertennummer.VersichertenIDGKV | string | Unveränderlicher Teil der Krankenversichertennummer (VersichertenID) bei GKV Patienten. Diese findet sich z.B. auf der Mitgliedskarte der Krankenkasse. |
| Person.PatientIn.Versicherung.Versichertennummer.VersichertennummerPKV | string | Versichertennummer bei PKV Patienten. Vergabe erfolgt durch die jeweilige Private Krankenversicherung. |
| Person.PatientInPseudonym | BackboneElement | Pseudonymisierte Repräsentation einer dazueghörigen Patient:in |
| Person.PatientInPseudonym.Pseudonym | Identifier | Neu generierte Identifikation der PatientIn mit Bezug zum Original-Identifikator in einer Treuhandstelle. |

### Mapping LogicalModel Person -> FHIR

| | |
| :--- | :--- |
| MII LM Person | FHIR |
| Person.Demographie.AdministrativesGeschlecht | Patient.gender |
| Person.Demographie.Adresse | Patient.address |
| Person.Demographie.Adresse.Postfach.Land | Patient.address.country |
| Person.Demographie.Adresse.Postfach.PLZ | Patient.address.postalCode |
| Person.Demographie.Adresse.Postfach.Strasse | Patient.address.line |
| Person.Demographie.Adresse.Postfach.Wohnort | Patient.address.city + Patient.address.extension.Stadtteil |
| Person.Demographie.Adresse.Strassenanschrift.Land | Patient.address.country |
| Person.Demographie.Adresse.Strassenanschrift.PLZ | Patient.address.postalCode |
| Person.Demographie.Adresse.Strassenanschrift.Strasse | Patient.address.line |
| Person.Demographie.Adresse.Strassenanschrift.Wohnort | Patient.address.city + Patient.address.extension.Stadtteil |
| Person.Demographie.DokumentiertesGeschlecht | Patient.extension:recordedSexOrGender |
| Person.Demographie.DokumentiertesGeschlecht.Erfassungszeitpunkt | Patient.extension:recordedSexOrGender.extension:acquisitionDate.valueDateTime |
| Person.Demographie.DokumentiertesGeschlecht.Gueltigkeitszeitraum | Patient.extension:recordedSexOrGender.extension:effectivePeriod.valuePeriod |
| Person.Demographie.DokumentiertesGeschlecht.Quelldokument[x] | Patient.extension:recordedSexOrGender.extension:sourceDocument.value[x] |
| Person.Demographie.DokumentiertesGeschlecht.Quelle[x] | Patient.extension:recordedSexOrGender.extension:source.value[x] |
| Person.Demographie.DokumentiertesGeschlecht.Typ | Patient.extension:recordedSexOrGender.extension:type.valueCodeableConcept |
| Person.Demographie.DokumentiertesGeschlecht.Wert | Patient.extension:recordedSexOrGender.extension:value.valueCodeableConcept |
| Person.Demographie.DokumentiertesGeschlecht.ZustaendigerRechtsraum | Patient.extension:recordedSexOrGender.extension:jurisdiction.valueCodeableConcept |
| Person.Demographie.Geburtsdatum | Patient.birthDate |
| Person.Demographie.Vitalstatus.PatientVerstorben | Patient.deceased[x] |
| Person.Demographie.Vitalstatus.Todeszeitpunkt | Patient.deceased[x] |
| Person.Name | Patient.name |
| Person.Name.Familienname | Patient.name.family |
| Person.Name.Geburtsname | Patient.name.use |
| Person.Name.Nachname | Patient.name.family.extension.nachname |
| Person.Name.Namenszusatz | Patient.name.family.extension.namenszusatz |
| Person.Name.Praefix | Patient.name.prefix |
| Person.Name.Praefix.ArtdesPraefixes | Patient.name.prefix.extension-prefix-qualifier |
| Person.Name.Vorname | Patient.name.given |
| Person.Name.Vorsatzwort | Patient.name.family.extension.vorsatzwort |
| Person.PatientIn.PatientenIdentifikator.PatientenIdentifikator | Patient.identifier:pid |
| Person.PatientIn.Versicherung | Patient.identifier:default |
| Person.PatientIn.Versicherung.Versichertennummer.VersichertenIDGKV | Patient.identifier:versichertenId_GKV |
| Person.PatientIn.Versicherung.Versichertennummer.VersichertennummerPKV | Patient.identifier:versicherungsnummer_pkv |
| Person.PatientInPseudonym.Pseudonym | Patient.identifier:PseudonymisierterIdentifier |

*** Delete File: input/translations/de/intro-notes/StructureDefinition-mii-lm-diagnose-notes.md



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-lm-person",
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
        "code" : "C16960"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-topic",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl",
        "code" : "C25190"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-topic",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl",
        "code" : "C81239"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-topic",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl",
        "code" : "C25717"
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/LogicalModel/Person",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_LM_Person",
  "title" : "MII LM Person",
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
  "description" : "Logische Repräsentation des Basismoduls Person",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "purpose" : "Define the person-related information model independently of a concrete FHIR resource representation.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "FHIR",
    "uri" : "http://hl7.org/fhir/StructureDefinition/Patient|4.0.1",
    "name" : "Person LogicalModel FHIR Mapping"
  },
  {
    "identity" : "AllergyIntolerance",
    "uri" : "http://hl7.org/fhir/StructureDefinition/AllergyIntolerance|4.0.1",
    "name" : "Person LogicalModel AllergyIntolerance Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/LogicalModel/Person",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Element",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "Person",
      "path" : "Person",
      "short" : "-- Überschrift --",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "-- Heading --"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Logische Repräsentation des Basismoduls Person"
    },
    {
      "id" : "Person.Name",
      "path" : "Person.Name",
      "short" : "Vollständiger Name einer Person.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Full name of a person"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Vollständiger Name einer Person.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.name"
      }]
    },
    {
      "id" : "Person.Name.Vorname",
      "path" : "Person.Name.Vorname",
      "short" : "Vollständiger Vorname einer Person.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Full given name of a person"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Vollständiger Vorname einer Person.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.name.given"
      }]
    },
    {
      "id" : "Person.Name.Nachname",
      "path" : "Person.Name.Nachname",
      "short" : "Nachname einer Person ohne Vor- und Zusätze. Dient z.B. der alphabetischen Einordnung des Namens.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Last name of a person without prefixes and suffixes. Serves e.g. the alphabetical classification of the name."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Nachname einer Person ohne Vor- und Zusätze. Dient z.B. der alphabetischen Einordnung des Namens.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.name.family.extension.nachname"
      }]
    },
    {
      "id" : "Person.Name.Familienname",
      "path" : "Person.Name.Familienname",
      "short" : "Der vollständige Familienname, einschließlich aller Vorsatz- und Zusatzwörter, mit Leerzeichen getrennt.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "The full family name, including all prefix and suffix words, separated by spaces."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der vollständige Familienname, einschließlich aller Vorsatz- und Zusatzwörter, mit Leerzeichen getrennt.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.name.family"
      }]
    },
    {
      "id" : "Person.Name.Vorsatzwort",
      "path" : "Person.Name.Vorsatzwort",
      "short" : "Vorsatzwort wie z.B.: von, van, zu Vgl. auch VSDM-Spezifikation der Gematik (Versichertenstammdatenmanagement, \"eGK\")",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Prefix word such as: \"von\", \"van\", \"zu\", cf. also VSDM specification of Gematik (Versichertenstammdatenmanagement, \"eGK\")"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Vorsatzwort wie z.B.: von, van, zu Vgl. auch VSDM-Spezifikation der Gematik (Versichertenstammdatenmanagement, \"eGK\")",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.name.family.extension.vorsatzwort"
      }]
    },
    {
      "id" : "Person.Name.Namenszusatz",
      "path" : "Person.Name.Namenszusatz",
      "short" : "Namenszusatz als Bestandteil das Nachnamens, wie in VSDM (Versichertenstammdatenmanagement, \"eGK\") definiert. Beispiele: Gräfin, Prinz oder Fürst",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Name suffix as part of the last name, as defined in VSDM (Versichertenstammdatenmanagement, \"eGK\"). Examples: Countess, Prince, or Prince"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Namenszusatz als Bestandteil das Nachnamens, wie in VSDM (Versichertenstammdatenmanagement, \"eGK\") definiert. Beispiele: Gräfin, Prinz oder Fürst",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.name.family.extension.namenszusatz"
      }]
    },
    {
      "id" : "Person.Name.Praefix",
      "path" : "Person.Name.Praefix",
      "short" : "Namensteile vor dem Vornamen, z.B. akademischer Grad",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Parts of the name before the first name, e.g. academic degree"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Namensteile vor dem Vornamen, z.B. akademischer Grad",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.name.prefix"
      }]
    },
    {
      "id" : "Person.Name.Praefix.ArtdesPraefixes",
      "path" : "Person.Name.Praefix.ArtdesPraefixes",
      "short" : "Art des Präfixes, z.B. \"AC\" für Akademische Titel",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Type of prefix, e.g. \"AC\" for Academic Titel"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Art des Präfixes, z.B. \"AC\" für Akademische Titel",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.name.prefix.extension-prefix-qualifier"
      }]
    },
    {
      "id" : "Person.Name.Geburtsname",
      "path" : "Person.Name.Geburtsname",
      "short" : "Familienname einer Person zum Zeitpunkt ihrer Geburt. Kann sich danach z.B. durch Heirat und Annahme eines anderen Familiennamens ändern.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Family name of a person at the time of his or her birth. Can change afterwards, e.g. by marriage and adoption of another family name."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Familienname einer Person zum Zeitpunkt ihrer Geburt. Kann sich danach z.B. durch Heirat und Annahme eines anderen Familiennamens ändern.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.name.use"
      }]
    },
    {
      "id" : "Person.Demographie",
      "path" : "Person.Demographie",
      "short" : "Das Basismodul Demographie enthält demographische Parameter (Alter, Geschlecht etc.).",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "The basic demography module contains demographic parameters (age, gender, etc.)."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Das Basismodul Demographie enthält demographische Parameter (Alter, Geschlecht etc.).",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Person.Demographie.AdministrativesGeschlecht",
      "path" : "Person.Demographie.AdministrativesGeschlecht",
      "short" : "Administratives Geschlecht der Person",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Administrative sex of the person"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Administratives Geschlecht der Person",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.gender"
      }]
    },
    {
      "id" : "Person.Demographie.DokumentiertesGeschlecht",
      "path" : "Person.Demographie.DokumentiertesGeschlecht",
      "short" : "Dokumentierte Geschlechtsangabe einer Person.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Recorded sex or gender information for a person."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Geschlechtsangabe einer Person aus einem Dokument oder einem anderen Datensatz einschließlich optionaler Angaben zu Art, zeitlicher Gültigkeit und Provenienz. Sie repräsentiert weder eine Geschlechtsidentität noch einen klinisch relevanten Geschlechtsparameter oder Angaben zur Sexualität.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.extension:recordedSexOrGender"
      }]
    },
    {
      "id" : "Person.Demographie.DokumentiertesGeschlecht.Wert",
      "path" : "Person.Demographie.DokumentiertesGeschlecht.Wert",
      "short" : "Dokumentierte Geschlechtsangabe der Person.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "The recorded sex or gender value for the person."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Geschlechtsangabe der Person, wie sie in einem Dokument oder einem anderen Datensatz erfasst wurde.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "example",
        "valueSet" : "http://hl7.org/fhir/ValueSet/administrative-gender"
      },
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.extension:recordedSexOrGender.extension:value.valueCodeableConcept"
      }]
    },
    {
      "id" : "Person.Demographie.DokumentiertesGeschlecht.Typ",
      "path" : "Person.Demographie.DokumentiertesGeschlecht.Typ",
      "short" : "Art der dokumentierten Geschlechtsangabe.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Type of recorded sex or gender."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Art oder Kategorie der dokumentierten Geschlechtsangabe, zum Beispiel administratives Geschlecht, administratives biologisches Geschlecht oder bei Geburt zugewiesenes Geschlecht.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "example",
        "valueSet" : "http://terminology.hl7.org/ValueSet/recorded-sex-or-gender-type"
      },
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.extension:recordedSexOrGender.extension:type.valueCodeableConcept"
      }]
    },
    {
      "id" : "Person.Demographie.DokumentiertesGeschlecht.Gueltigkeitszeitraum",
      "path" : "Person.Demographie.DokumentiertesGeschlecht.Gueltigkeitszeitraum",
      "short" : "Gültigkeitszeitraum der dokumentierten Geschlechtsangabe.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "When the recorded sex or gender value applies."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Zeitraum, in dem die dokumentierte Geschlechtsangabe für die Person gilt.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Period"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.extension:recordedSexOrGender.extension:effectivePeriod.valuePeriod"
      }]
    },
    {
      "id" : "Person.Demographie.DokumentiertesGeschlecht.Erfassungszeitpunkt",
      "path" : "Person.Demographie.DokumentiertesGeschlecht.Erfassungszeitpunkt",
      "short" : "Zeitpunkt der Erfassung.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "When the recorded sex or gender value was recorded."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Zeitpunkt, zu dem die dokumentierte Geschlechtsangabe im System erfasst wurde.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.extension:recordedSexOrGender.extension:acquisitionDate.valueDateTime"
      }]
    },
    {
      "id" : "Person.Demographie.DokumentiertesGeschlecht.Quelle[x]",
      "path" : "Person.Demographie.DokumentiertesGeschlecht.Quelle[x]",
      "short" : "Quelle der dokumentierten Geschlechtsangabe.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Source of the recorded sex or gender value."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Codierte Angabe oder Referenz auf die Quelle der dokumentierten Geschlechtsangabe.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Organization",
        "http://hl7.org/fhir/StructureDefinition/Device",
        "http://hl7.org/fhir/StructureDefinition/RelatedPerson",
        "http://hl7.org/fhir/StructureDefinition/Practitioner"]
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.extension:recordedSexOrGender.extension:source.value[x]"
      }]
    },
    {
      "id" : "Person.Demographie.DokumentiertesGeschlecht.Quelldokument[x]",
      "path" : "Person.Demographie.DokumentiertesGeschlecht.Quelldokument[x]",
      "short" : "Quelldokument der dokumentierten Geschlechtsangabe.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Document from which the recorded sex or gender value was acquired."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz auf das Quelldokument oder codierte Angabe der Dokumentart, in der die Geschlechtsangabe erstmalig erfasst wurde.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/DocumentReference"]
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.extension:recordedSexOrGender.extension:sourceDocument.value[x]"
      }]
    },
    {
      "id" : "Person.Demographie.DokumentiertesGeschlecht.ZustaendigerRechtsraum",
      "path" : "Person.Demographie.DokumentiertesGeschlecht.ZustaendigerRechtsraum",
      "short" : "Zuständiger Rechtsraum der Quelle.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Jurisdiction responsible for the source or source document."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Rechtsraum, der für die Quelle oder das Quelldokument der erfassten Geschlechtsangabe zuständig ist.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "http://terminology.hl7.org/ValueSet/jurisdiction"
      },
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.extension:recordedSexOrGender.extension:jurisdiction.valueCodeableConcept"
      }]
    },
    {
      "id" : "Person.Demographie.Geburtsdatum",
      "path" : "Person.Demographie.Geburtsdatum",
      "short" : "Geburtsdatum des Person.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Date of birth of the patient"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Geburtsdatum des Person.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.birthDate"
      }]
    },
    {
      "id" : "Person.Demographie.Adresse",
      "path" : "Person.Demographie.Adresse",
      "short" : "Vollständige Anschrift einer Person für die postlische Kommunikation.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Full address of a person for postal communication."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Vollständige Anschrift einer Person für die postlische Kommunikation.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.address"
      }]
    },
    {
      "id" : "Person.Demographie.Adresse.Strassenanschrift",
      "path" : "Person.Demographie.Adresse.Strassenanschrift",
      "short" : "Eine Adresse für die Strassenanschrift gemäß postalischer Konventionen. Bei Stadtstaaten einschließlich Bezirken.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Postal code according to the conventions valid in the respective country. For persons from city states including the city district"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Eine Adresse für die Strassenanschrift gemäß postalischer Konventionen. Bei Stadtstaaten einschließlich Bezirken.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Person.Demographie.Adresse.Strassenanschrift.Land",
      "path" : "Person.Demographie.Adresse.Strassenanschrift.Land",
      "short" : "Ländercode nach ISO 3166.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Country code according to ISO 3166"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Ländercode nach ISO 3166.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.address.country"
      }]
    },
    {
      "id" : "Person.Demographie.Adresse.Strassenanschrift.PLZ",
      "path" : "Person.Demographie.Adresse.Strassenanschrift.PLZ",
      "short" : "Postleitzahl gemäß der im jeweiligen Land gültigen Konventionen.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Postal code according to the conventions valid in the respective country"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Postleitzahl gemäß der im jeweiligen Land gültigen Konventionen.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.address.postalCode"
      }]
    },
    {
      "id" : "Person.Demographie.Adresse.Strassenanschrift.Wohnort",
      "path" : "Person.Demographie.Adresse.Strassenanschrift.Wohnort",
      "short" : "Bei Personen aus Stadtstaaten inklusive des Stadtteils.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "For persons from city states including the city district"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Bei Personen aus Stadtstaaten inklusive des Stadtteils.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.address.city + Patient.address.extension.Stadtteil"
      }]
    },
    {
      "id" : "Person.Demographie.Adresse.Strassenanschrift.Strasse",
      "path" : "Person.Demographie.Adresse.Strassenanschrift.Strasse",
      "short" : "Straßenname mit Hausnummer oder Postfach sowie weitere Angaben zur Zustellung.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Street name with house number or P.O. Box and other delivery details"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Straßenname mit Hausnummer oder Postfach sowie weitere Angaben zur Zustellung.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.address.line"
      }]
    },
    {
      "id" : "Person.Demographie.Adresse.Postfach",
      "path" : "Person.Demographie.Adresse.Postfach",
      "short" : "Eine Adresse für ein Postfach gemäß postalischer Konventionen. Bei Stadtstaaten einschließlich Bezirken.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Postal code according for a P.O box to the conventions valid in the respective country. For persons from city states including the city district."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Eine Adresse für ein Postfach gemäß postalischer Konventionen. Bei Stadtstaaten einschließlich Bezirken.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Person.Demographie.Adresse.Postfach.Land",
      "path" : "Person.Demographie.Adresse.Postfach.Land",
      "short" : "Ländercode nach ISO 3166.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Country code according to ISO 3166"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Ländercode nach ISO 3166.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.address.country"
      }]
    },
    {
      "id" : "Person.Demographie.Adresse.Postfach.PLZ",
      "path" : "Person.Demographie.Adresse.Postfach.PLZ",
      "short" : "Postleitzahl gemäß der im jeweiligen Land gültigen Konventionen.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Postal code according to the conventions valid in the respective country"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Postleitzahl gemäß der im jeweiligen Land gültigen Konventionen.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.address.postalCode"
      }]
    },
    {
      "id" : "Person.Demographie.Adresse.Postfach.Wohnort",
      "path" : "Person.Demographie.Adresse.Postfach.Wohnort",
      "short" : "Bei Personen aus Stadtstaaten inklusive des Stadtteils.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "For persons from city states including the city district"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Bei Personen aus Stadtstaaten inklusive des Stadtteils.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.address.city + Patient.address.extension.Stadtteil"
      }]
    },
    {
      "id" : "Person.Demographie.Adresse.Postfach.Strasse",
      "path" : "Person.Demographie.Adresse.Postfach.Strasse",
      "short" : "Straßenname mit Hausnummer oder Postfach sowie weitere Angaben zur Zustellung.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Street name with house number or P.O. Box and other delivery details"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Straßenname mit Hausnummer oder Postfach sowie weitere Angaben zur Zustellung.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.address.line"
      }]
    },
    {
      "id" : "Person.Demographie.Vitalstatus",
      "path" : "Person.Demographie.Vitalstatus",
      "short" : "Gibt an, ob ein Patient verstorben ist. Falls ja, zudem den Zeitpunkt.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Indicates whether a patient has died. If yes, also the time is recorded."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Gibt an, ob ein Patient verstorben ist. Falls ja, zudem den Zeitpunkt.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Person.Demographie.Vitalstatus.PatientVerstorben",
      "path" : "Person.Demographie.Vitalstatus.PatientVerstorben",
      "short" : "Gibt an, ob der Patient am Leben oder verstorben ist.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Indicates whether the patient is alive or deceased."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Gibt an, ob der Patient am Leben oder verstorben ist.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.deceased[x]"
      }]
    },
    {
      "id" : "Person.Demographie.Vitalstatus.Todeszeitpunkt",
      "path" : "Person.Demographie.Vitalstatus.Todeszeitpunkt",
      "short" : "Gibt den Todeszeitpunkt des Patienten an, falls dieser im KH verstorben ist. Ansonsten \"Null Flavor\".",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Indicates the time of death of the patient, if the patient died in the hospital. Otherwise \"Null flavor\"."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Gibt den Todeszeitpunkt des Patienten an, falls dieser im KH verstorben ist. Ansonsten \"Null Flavor\".",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.deceased[x]"
      }]
    },
    {
      "id" : "Person.Demographie.Vitalstatus.Informationsquelle",
      "path" : "Person.Demographie.Vitalstatus.Informationsquelle",
      "short" : "Quelle des Vitalstatus.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Source of vital status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Quelle des Vitalstatus.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Person.Demographie.Vitalstatus.ZeitpunktFeststellungDesVitalstatus",
      "path" : "Person.Demographie.Vitalstatus.ZeitpunktFeststellungDesVitalstatus",
      "short" : "Letzter bekannter Zeitpunkt oder Zeitraum, zudem ein Vitalstatus festgestellt wurde",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Last known point in time at which a vital status was recorded"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Letzter bekannter Zeitpunkt oder Zeitraum, zudem ein Vitalstatus festgestellt wurde",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "Person.Demographie.Vitalstatus.Todesursache",
      "path" : "Person.Demographie.Vitalstatus.Todesursache",
      "short" : "Todesursache mit ICD-10-WHO codiert.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reason for patient's death. Coded per ICD-10-WHO."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Todesursache mit ICD-10-WHO codiert.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "Person.AllergieOderUnvertraeglichkeit",
      "path" : "Person.AllergieOderUnvertraeglichkeit",
      "short" : "Allergie oder Unverträglichkeit",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Allergy or intolerance"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Dokumentierte Einschätzung einer patientenbezogenen Allergie oder Unverträglichkeit, die mit dem Risiko einer schädlichen oder unerwünschten Reaktion bei Exposition gegenüber einem bestimmten Stoff, Produkt oder einer Stoffklasse verbunden ist.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "AllergyIntolerance",
        "map" : "AllergyIntolerance"
      }]
    },
    {
      "id" : "Person.AllergieOderUnvertraeglichkeit.KlinischerStatus",
      "path" : "Person.AllergieOderUnvertraeglichkeit.KlinischerStatus",
      "short" : "Klinischer Status",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Clinical status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Klinischer Zustand der Allergie oder Unverträglichkeit, beispielsweise aktiv, inaktiv oder abgeklungen.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://hl7.org/fhir/ValueSet/allergyintolerance-clinical"
      },
      "mapping" : [{
        "identity" : "AllergyIntolerance",
        "map" : "AllergyIntolerance.clinicalStatus"
      }]
    },
    {
      "id" : "Person.AllergieOderUnvertraeglichkeit.Verifikationsstatus",
      "path" : "Person.AllergieOderUnvertraeglichkeit.Verifikationsstatus",
      "short" : "Verifikationsstatus",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Verification status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Grad der fachlichen Bestätigung der Allergie oder Unverträglichkeit, beispielsweise unbestätigt, bestätigt oder widerlegt.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://hl7.org/fhir/ValueSet/allergyintolerance-verification"
      },
      "mapping" : [{
        "identity" : "AllergyIntolerance",
        "map" : "AllergyIntolerance.verificationStatus"
      }]
    },
    {
      "id" : "Person.AllergieOderUnvertraeglichkeit.Art",
      "path" : "Person.AllergieOderUnvertraeglichkeit.Art",
      "short" : "Art",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Type"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Einordnung als Allergie oder Unverträglichkeit, sofern der zugrunde liegende Mechanismus bekannt ist.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://hl7.org/fhir/ValueSet/allergy-intolerance-type"
      },
      "mapping" : [{
        "identity" : "AllergyIntolerance",
        "map" : "AllergyIntolerance.type"
      }]
    },
    {
      "id" : "Person.AllergieOderUnvertraeglichkeit.Kategorie",
      "path" : "Person.AllergieOderUnvertraeglichkeit.Kategorie",
      "short" : "Kategorie",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Category"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kategorie des auslösenden Stoffes, beispielsweise Arzneimittel, Lebensmittel, Umweltstoff oder biologischer Stoff.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://hl7.org/fhir/ValueSet/allergy-intolerance-category"
      },
      "mapping" : [{
        "identity" : "AllergyIntolerance",
        "map" : "AllergyIntolerance.category"
      }]
    },
    {
      "id" : "Person.AllergieOderUnvertraeglichkeit.Kritikalitaet",
      "path" : "Person.AllergieOderUnvertraeglichkeit.Kritikalitaet",
      "short" : "Kritikalität",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Criticality"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Einschätzung des potenziellen klinischen Schadens bei einer zukünftigen Exposition.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://hl7.org/fhir/ValueSet/allergy-intolerance-criticality"
      },
      "mapping" : [{
        "identity" : "AllergyIntolerance",
        "map" : "AllergyIntolerance.criticality"
      }]
    },
    {
      "id" : "Person.AllergieOderUnvertraeglichkeit.AllergieOderUnvertraeglichkeitGegen",
      "path" : "Person.AllergieOderUnvertraeglichkeit.AllergieOderUnvertraeglichkeitGegen",
      "short" : "Allergie oder Unverträglichkeit gegen",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Substance, product, class, or allergy or intolerance concept"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Stoff, Produkt, Stoffklasse oder Allergie-/Unverträglichkeitsbegriff, auf den sich die dokumentierte Gefährdung bezieht.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "example",
        "valueSet" : "http://hl7.org/fhir/ValueSet/allergyintolerance-code"
      },
      "mapping" : [{
        "identity" : "AllergyIntolerance",
        "map" : "AllergyIntolerance.code"
      }]
    },
    {
      "id" : "Person.AllergieOderUnvertraeglichkeit.Patient",
      "path" : "Person.AllergieOderUnvertraeglichkeit.Patient",
      "short" : "Patient",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Patient with the allergy or intolerance"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Patient, bei dem die Allergie oder Unverträglichkeit besteht beziehungsweise dokumentiert wurde.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mapping" : [{
        "identity" : "AllergyIntolerance",
        "map" : "AllergyIntolerance.patient"
      }]
    },
    {
      "id" : "Person.AllergieOderUnvertraeglichkeit.Kontakt",
      "path" : "Person.AllergieOderUnvertraeglichkeit.Kontakt",
      "short" : "Kontakt",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Encounter associated with the allergy or intolerance"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kontakt, in dessen Zusammenhang die Allergie oder Unverträglichkeit dokumentiert wurde.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Encounter"]
      }],
      "mapping" : [{
        "identity" : "AllergyIntolerance",
        "map" : "AllergyIntolerance.encounter"
      }]
    },
    {
      "id" : "Person.AllergieOderUnvertraeglichkeit.Beginn[x]",
      "path" : "Person.AllergieOderUnvertraeglichkeit.Beginn[x]",
      "short" : "Beginn",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Onset of the allergy or intolerance"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Zeitpunkt, Zeitraum, Lebensalter oder andere zeitliche Angabe zum erstmaligen Auftreten der Allergie oder Unverträglichkeit.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      },
      {
        "code" : "Age"
      },
      {
        "code" : "Period"
      },
      {
        "code" : "Range"
      },
      {
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "AllergyIntolerance",
        "map" : "AllergyIntolerance.onset[x]"
      }]
    },
    {
      "id" : "Person.AllergieOderUnvertraeglichkeit.Dokumentationsdatum",
      "path" : "Person.AllergieOderUnvertraeglichkeit.Dokumentationsdatum",
      "short" : "Dokumentationsdatum",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Date when the allergy or intolerance was first recorded"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Zeitpunkt, zu dem die Allergie oder Unverträglichkeit erstmals im dokumentierenden System erfasst wurde.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mapping" : [{
        "identity" : "AllergyIntolerance",
        "map" : "AllergyIntolerance.recordedDate"
      }]
    },
    {
      "id" : "Person.AllergieOderUnvertraeglichkeit.UnerwuenschteReaktion",
      "path" : "Person.AllergieOderUnvertraeglichkeit.UnerwuenschteReaktion",
      "short" : "Unerwünschte Reaktion",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Observed adverse reaction"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Angaben zu einer beobachteten unerwünschten Reaktion nach Exposition gegenüber dem betreffenden Stoff oder Produkt.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "AllergyIntolerance",
        "map" : "AllergyIntolerance.reaction"
      }]
    },
    {
      "id" : "Person.AllergieOderUnvertraeglichkeit.UnerwuenschteReaktion.Manifestation",
      "path" : "Person.AllergieOderUnvertraeglichkeit.UnerwuenschteReaktion.Manifestation",
      "short" : "Manifestation",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Clinical manifestation of the adverse reaction"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Klinische Symptome oder Befunde, die im Zusammenhang mit der unerwünschten Reaktion beobachtet wurden.",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "example",
        "valueSet" : "http://hl7.org/fhir/ValueSet/clinical-findings"
      },
      "mapping" : [{
        "identity" : "AllergyIntolerance",
        "map" : "AllergyIntolerance.reaction.manifestation"
      }]
    },
    {
      "id" : "Person.AllergieOderUnvertraeglichkeit.UnerwuenschteReaktion.Schweregrad",
      "path" : "Person.AllergieOderUnvertraeglichkeit.UnerwuenschteReaktion.Schweregrad",
      "short" : "Schweregrad",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Severity of the observed reaction"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Schweregrad der tatsächlich aufgetretenen Reaktion.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://hl7.org/fhir/ValueSet/reaction-event-severity"
      },
      "mapping" : [{
        "identity" : "AllergyIntolerance",
        "map" : "AllergyIntolerance.reaction.severity"
      }]
    },
    {
      "id" : "Person.AllergieOderUnvertraeglichkeit.UnerwuenschteReaktion.Expositionsweg",
      "path" : "Person.AllergieOderUnvertraeglichkeit.UnerwuenschteReaktion.Expositionsweg",
      "short" : "Expositionsweg",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Route of exposure"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Weg, über den der Patient dem auslösenden Stoff oder Produkt ausgesetzt war.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "example",
        "valueSet" : "http://hl7.org/fhir/ValueSet/route-codes"
      },
      "mapping" : [{
        "identity" : "AllergyIntolerance",
        "map" : "AllergyIntolerance.reaction.exposureRoute"
      }]
    },
    {
      "id" : "Person.PatientIn",
      "path" : "Person.PatientIn",
      "short" : "Person, die in einer oder mehreren Gesundheitseinrichtungen behandelt wird",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Person receiving treatment in one or more health care facilities"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Person, die in einer oder mehreren Gesundheitseinrichtungen behandelt wird",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Person.PatientIn.PatientenIdentifikator",
      "path" : "Person.PatientIn.PatientenIdentifikator",
      "short" : "Identifikation des Patienten in Verschiedenen Gesundheitseinrichtungen, Einrichtungskennzeichen kann als \"Codesystem\" gesehen werden, und Patienten-Identifikator als \"Code\"",
      "definition" : "Identifikation des Patienten in Verschiedenen Gesundheitseinrichtungen, Einrichtungskennzeichen kann als \"Codesystem\" gesehen werden, und Patienten-Identifikator als \"Code\"",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Person.PatientIn.PatientenIdentifikator.PatientenIdentifikator",
      "path" : "Person.PatientIn.PatientenIdentifikator.PatientenIdentifikator",
      "short" : "Gesundheitseinrichtungs-eigene Identifikationsnummer für einen Patienten",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Health facility unique identification number for a patient."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Gesundheitseinrichtungs-eigene Identifikationsnummer für einen Patienten",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.identifier:pid"
      }]
    },
    {
      "id" : "Person.PatientIn.PatientenIdentifikator.PatientenIdentifikatorKontext",
      "path" : "Person.PatientIn.PatientenIdentifikator.PatientenIdentifikatorKontext",
      "short" : "Der Kontext des Patienten-Identifikators um den Patienten-Identifikator zu Beschreiben, da der Patient innerhalb einer Gesundheitseinrichtung möglicherweise pro System eine Nummer (Im Krankenhaus: Labor, Radiologie, Internistische Station etc.) bekommt.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "The context of the patient identifier to describe the patient identifier, since the patient within a healthcare facility may be assigned a number per system (in the hospital: \"laboratory\", \"radiology\", \"internal medicine ward\", etc.)."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der Kontext des Patienten-Identifikators um den Patienten-Identifikator zu Beschreiben, da der Patient innerhalb einer Gesundheitseinrichtung möglicherweise pro System eine Nummer (Im Krankenhaus: Labor, Radiologie, Internistische Station etc.) bekommt.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "Person.PatientIn.Versicherung",
      "path" : "Person.PatientIn.Versicherung",
      "short" : "Aktuell gültige Versicherung der Patient:in welcher zur Abrechnung der Behandlungsleistung verwendet wird.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Patient's current valid insurance which is used to bill the medical healthcare services."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Aktuell gültige Versicherung der Patient:in welcher zur Abrechnung der Behandlungsleistung verwendet wird.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.identifier:default"
      }]
    },
    {
      "id" : "Person.PatientIn.Versicherung.InstitutionskennzeichenDerKrankenkasse",
      "path" : "Person.PatientIn.Versicherung.InstitutionskennzeichenDerKrankenkasse",
      "short" : "Die Institutionskennzeichen (kurz: IK) sind bundesweit eindeutige, neunstellige Zahlen, mit deren Hilfe Abrechnungen und Qualitätssicherungsmaßnahmen im Bereich der deutschen Sozialversicherung einrichtungsübergreifend abgewickelt werden können.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "The institutional identifiers (IK for short) are nationwide unique nine-digit numbers that can be used to process billing and quality assurance measures across institutions in the German social insurance sector."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die Institutionskennzeichen (kurz: IK) sind bundesweit eindeutige, neunstellige Zahlen, mit deren Hilfe Abrechnungen und Qualitätssicherungsmaßnahmen im Bereich der deutschen Sozialversicherung einrichtungsübergreifend abgewickelt werden können.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "string"
      }],
      "maxLength" : 9
    },
    {
      "id" : "Person.PatientIn.Versicherung.Versicherungstyp",
      "path" : "Person.PatientIn.Versicherung.Versicherungstyp",
      "short" : "Versicherungstyp des Patienten",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Insurance type of the patient"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Versicherungstyp des Patienten",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "Person.PatientIn.Versicherung.Versichertennummer",
      "path" : "Person.PatientIn.Versicherung.Versichertennummer",
      "short" : "Angaben zur Identifikation der versicherten Person",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Information for the identification of the insured person"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Angaben zur Identifikation der versicherten Person",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Person.PatientIn.Versicherung.Versichertennummer.VersichertenIDGKV",
      "path" : "Person.PatientIn.Versicherung.Versichertennummer.VersichertenIDGKV",
      "short" : "Unveränderlicher Teil der Krankenversichertennummer (VersichertenID) bei GKV Patienten. Diese findet sich z.B. auf der Mitgliedskarte der Krankenkasse.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Unchangeable part of the health insurance number (insured ID) for SHI patients. This can be found, for example, on the health insurance compan's membership card."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Unveränderlicher Teil der Krankenversichertennummer (VersichertenID) bei GKV Patienten. Diese findet sich z.B. auf der Mitgliedskarte der Krankenkasse.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.identifier:versichertenId_GKV"
      }]
    },
    {
      "id" : "Person.PatientIn.Versicherung.Versichertennummer.VersichertennummerPKV",
      "path" : "Person.PatientIn.Versicherung.Versichertennummer.VersichertennummerPKV",
      "short" : "Versichertennummer bei PKV Patienten. Vergabe erfolgt durch die jeweilige Private Krankenversicherung.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Insurance number for private health insurance patients. The number is assigned by the respective private health insurance company."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Versichertennummer bei PKV Patienten. Vergabe erfolgt durch die jeweilige Private Krankenversicherung.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.identifier:versicherungsnummer_pkv"
      }]
    },
    {
      "id" : "Person.PatientInPseudonym",
      "path" : "Person.PatientInPseudonym",
      "short" : "Pseudonymisierte Repräsentation einer dazueghörigen Patient:in",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Pseudonymised representation of a corresponding Patient"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Pseudonymisierte Repräsentation einer dazueghörigen Patient:in",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Person.PatientInPseudonym.Pseudonym",
      "path" : "Person.PatientInPseudonym.Pseudonym",
      "short" : "Neu generierte Identifikation der PatientIn mit Bezug zum Original-Identifikator in einer Treuhandstelle.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Newly generated identification of the patient with reference to the original identifier in a trust center."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Neu generierte Identifikation der PatientIn mit Bezug zum Original-Identifikator in einer Treuhandstelle.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }],
      "mapping" : [{
        "identity" : "FHIR",
        "map" : "Patient.identifier:PseudonymisierterIdentifier"
      }]
    }]
  }
}

```
