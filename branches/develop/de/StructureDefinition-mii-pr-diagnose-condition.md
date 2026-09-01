# MII PR Diagnose Condition - MII Implementation Guide Core Dataset Base v2027.0.0-dev

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **MII PR Diagnose Condition**

## Ressourcenprofil: MII PR Diagnose Condition 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose | *Version*:2027.0.0-dev |
| Active Stand: 2026-06-15 | *Maschinenlesbarer Name*:MII_PR_Diagnose_Condition |

 
Eine klinische Diagnose der Patientin oder des Patienten. 

**Beispielhafte Anwendungsszenarien:**

* Dokumentation von Diagnosen für Patienten in der klinischen Versorgung mittels ICD-10-GM-Codierung
* Unterstützung von Abrechnungsprozessen mit codierten Diagnoseinformationen
* Ermöglichung epidemiologischer Forschung durch standardisierte Diagnosecodierung
* Darstellung seltener Erkrankungen mittels Alpha-ID oder Orphanet-Codes neben ICD-10-GM
* Verknüpfung von Diagnosen mit spezifischen Behandlungsfällen zur zeitlichen und kontextuellen Dokumentation

### Profilspezifische Implementierungshinweise

Dieser Abschnitt enthält detaillierte Implementierungshinweise für das MII-Diagnose-Profil.

#### Codierungsanforderungen

**Verpflichtende Codierung:**

* **`Condition.code`**: Mindestens eine kodierte Diagnose MUSS enthalten sein
* System frei wählbar aus: ICD-10-GM, Alpha-ID, SNOMED CT oder Orphanet
* ICD-10-GM-Codierung ist das primäre Codiersystem für Diagnosen in Deutschland

**Mehrere Codiersysteme:**

* Mehrfachcodierungen aus verschiedenen Terminologien sind erlaubt und werden, wo anwendbar, empfohlen
* Beispiel: ICD-10-GM für Abrechnungszwecke + SNOMED CT für semantische Interoperabilität + Alpha-ID/Orphanet für seltene Erkrankungen

#### ICD-10-GM-spezifische Extensions

##### Best Practice - ICD-10-GM-Extensions und Sonderzeichen

**Trennung von Sonderzeichen:** Das Element `Condition.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').code` **SOLL NICHT** ein Mehrfachkodierungskennzeichen oder Zusatzkennzeichen (z.B. Seitenlokalisation oder Diagnosesicherheit) enthalten.

**Verwendung von Extensions:**

* **Mehrfachcodierungs-Kennzeichen:** Mehrfachcodierungskennzeichen (`*`, `†`, `!`) **SOLLEN** von den ICD-10-GM-Codes getrennt und in der Extension "Mehrfachcodierungs-Kennzeichen" erfasst werden
* **Seitenlokalisation:** Die Extension "Seitenlokalisation" **SOLL** zur Angabe der Seitenlokalisation in der ICD-10-GM-codierung verwendet werden
* **Diagnosesicherheit:** Die Extension "Diagnosesicherheit" **SOLL** zur Angabe der Diagnosesicherheit in der ICD-10-GM-codierung verwendet werden

**Referenz:** Siehe [ICD-10-GM Coding-Profil](https://ig.fhir.de/basisprofile-de/1.5.4/ig-markdown-Datentypen-Coding.html#ig-markdown-Datentypen-ICD-10GM-Coding) und [Diagnosesicherheit Extension](https://ig.fhir.de/basisprofile-de/1.5.4/ig-markdown-ExtensionsfrCondition.html) in den Deutschen Basisprofilen für detaillierte Constraints.

#### Mehrfachcodierung mit ICD-10-GM Kreuz-Stern-System

##### Best Practice - Kreuz-Stern-System Implementierung

**Mehrere Condition-Instanzen:** Bei der Verwendung von ICD-10-GM-Codes mit dem Kreuz-Stern-System wird für **jeden ICD-10-Code eine separate Condition-Instanz** erstellt (Ätiologie, Manifestation, Zusatzinformation).

**Verknüpfung von Sekundär- zu Primärdiagnose:**

* Die Primärdiagnose-Condition (Ätiologie mit †-Kennzeichen) ist die Hauptinstanz
* Sekundärdiagnose-Conditions (Manifestation mit *-Kennzeichen, Zusatzinformation mit !-Kennzeichen) nutzen die [Extension Condition Related](http://hl7.org/fhir/R4/extension-condition-related.html), um auf die Primärdiagnose zu referenzieren
* Dies erstellt eine explizite Beziehungskette: Manifestation → Ätiologie

**Alpha-ID und Orphanet-Codes:**

* Wenn Alpha-ID- oder Orphanet-Codes zu kombinierten ICD-10-GM-Codes gemappt sind, werden sie **nur in der Primärdiagnose-Condition-Instanz** angegeben
* Alpha-ID/Orphanet-Codes werden nicht in Sekundärdiagnose-Condition-Instanzen dupliziert

**Aspekte zur Diagnosesicherheit:**

* Bei abweichenden Diagnosesicherheiten zwischen Primär- und Sekundärdiagnose MUSS sichergestellt werden, dass die Diagnosesicherheit der Primärcondition auf die assoziierte Alpha-ID zutrifft
* Dies verhindert Inkonsistenzen, wenn bspw. Seltene-Erkrankungen-Codes (Alpha-ID/Orphanet) mit unsicheren ätiologischen Diagnosen verknüpft sind

**Beispiel:** Siehe Beispielressourcen für Alpha-ID `I97525` mit ICD-10-GM `A54.4†` (Ätiologie) und `M73.09*` (Manifestation).

#### Dokumentation der Körperstelle

##### Hinweis zu FHIR-Core-Extensions

Das Profil enthält die FHIR-Core-Extension `http://hl7.org/fhir/StructureDefinition/bodySite` auf `Condition.bodySite`, um zusätzlich zu der codierten Körperstelle eine detaillierte anatomische Referenz, z.B. auf eine BodyStructure, abbilden zu können.

**`Condition.bodySite`:**

* OPTIONALES Element
* Falls dieses optionale Element verwendet wird, SOLL die Körperstelle mindestens mit einem SNOMED CT-Code codiert werden
* Hierbei DARF NICHT die Lateralität angegeben werden - verwenden Sie stattdessen die Extension Seitenlokalisation auf `Condition.code.coding:icd10-gm`

#### Verknüpfung mit dem Fall

##### Best Practice - Diagnose-Fall-Beziehungen

**Änderung gegenüber vorheriger Version:** In früheren Versionen dieses Implementierungsleitfadens wurde empfohlen, `Encounter.diagnosis` zur Verknüpfung von Diagnosen mit Behandlungsfällen zu verwenden. Diese Empfehlung wurde aktualisiert, um sich an die gematik ISiK-Empfehlungen (Informationssysteme im Krankenhaus) anzupassen.

**Aktuelle Empfehlung - Condition.encounter:**

* **Ebene Abteilungskontakt:** Die Zuordnung **SOLL** auf einen Encounter der Ebene "Abteilungskontakt" erfolgen
* Bei der Auswahl des Encounters ist zu beachten, dass unter einer (Abrechnungs-)"Fallnummer" (hier: `Encounter.account`) unter Umständen mehrere Encounter gruppiert sein können (z.B. stationärer Besuch mit mehreren vor- und nachstationären Aufenthalten)

#### Zeitliche Informationen

**`Condition.onset[x]`:**

* **KANN** als Period oder dateTime erfasst werden
* OPTIONAL zusätzlich Angabe von Lebensphase als Code mittels Extension, falls genaue Zeitpunkte nicht bekannt sind
* Repräsentiert, wann die Erkrankung begann oder erstmals bemerkt wurde

**`Condition.recordedDate`:**

* Repräsentiert, wann die Diagnose im System erfasst wurde
* Dient der zeitlichen Einordnung der Diagnose

**Usages:**

* Examples for this Profile: [Condition/mii-exa-diagnose-appendicitis](Condition-mii-exa-diagnose-appendicitis.md), [Condition/mii-exa-diagnose-condition-elbow-contusion](Condition-mii-exa-diagnose-condition-elbow-contusion.md), [Condition/mii-exa-diagnose-condition-multiple-codings](Condition-mii-exa-diagnose-condition-multiple-codings.md), [Condition/mii-exa-diagnose-mehrfachcodierung-primaercode](Condition-mii-exa-diagnose-mehrfachcodierung-primaercode.md) and [Condition/mii-exa-diagnose-mehrfachcodierung-sekundaercode](Condition-mii-exa-diagnose-mehrfachcodierung-sekundaercode.md)
* CapabilityStatements using this Profile: [MII CPS Diagnose CapabilityStatement](CapabilityStatement-mii-cps-diagnose-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.base|current/StructureDefinition/StructureDefinition-mii-pr-diagnose-condition.json)

### Formale Ansichten des Profilinhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Schlüsselelemente-Tabelle](#tabs-key) 
*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Condition](http://hl7.org/fhir/R4/condition.html) 

#### Terminology Bindings (Differential)

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Condition](http://hl7.org/fhir/R4/condition.html) 

** Summary **

Mandatory: 3 elements(6 nested mandatory elements)
 Must-Support: 85 elements

**Structures**

This structure refers to these other structures:

* [Coding-Profil für ICD-10-GM (http://fhir.de/StructureDefinition/CodingICD10GM)](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.de/StructureDefinition/CodingICD10GM)
* [Coding-Profil für Alpha-ID (http://fhir.de/StructureDefinition/CodingAlphaID)](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.de/StructureDefinition/CodingAlphaID)

**Extensions**

This structure refers to these extensions:

* [http://hl7.org/fhir/StructureDefinition/condition-related](http://hl7.org/fhir/extensions/5.3.0/StructureDefinition-condition-related.html)
* [http://hl7.org/fhir/StructureDefinition/condition-assertedDate](http://hl7.org/fhir/extensions/5.3.0/StructureDefinition-condition-assertedDate.html)
* [http://hl7.org/fhir/StructureDefinition/bodySite](http://hl7.org/fhir/extensions/5.3.0/StructureDefinition-bodySite.html)
* [http://fhir.de/StructureDefinition/lebensphase](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.de/StructureDefinition/lebensphase)

**Slices**

This structure defines the following [Slices](http://hl7.org/fhir/R4/profiling.html#slices):

* The element 1 is sliced based on the value of Condition.code.coding
* The element 1 is sliced based on the value of Condition.bodySite.coding
* The element 1 is sliced based on the value of Condition.onset[x]

 **Schlüsselelemente-Ansicht** 

#### Terminology Bindings

#### Constraints

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [Condition](http://hl7.org/fhir/R4/condition.html) 

#### Terminology Bindings (Differential)

 **Snapshot-AnsichtView** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Condition](http://hl7.org/fhir/R4/condition.html) 

** Summary **

Mandatory: 3 elements(6 nested mandatory elements)
 Must-Support: 85 elements

**Structures**

This structure refers to these other structures:

* [Coding-Profil für ICD-10-GM (http://fhir.de/StructureDefinition/CodingICD10GM)](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.de/StructureDefinition/CodingICD10GM)
* [Coding-Profil für Alpha-ID (http://fhir.de/StructureDefinition/CodingAlphaID)](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.de/StructureDefinition/CodingAlphaID)

**Extensions**

This structure refers to these extensions:

* [http://hl7.org/fhir/StructureDefinition/condition-related](http://hl7.org/fhir/extensions/5.3.0/StructureDefinition-condition-related.html)
* [http://hl7.org/fhir/StructureDefinition/condition-assertedDate](http://hl7.org/fhir/extensions/5.3.0/StructureDefinition-condition-assertedDate.html)
* [http://hl7.org/fhir/StructureDefinition/bodySite](http://hl7.org/fhir/extensions/5.3.0/StructureDefinition-bodySite.html)
* [http://fhir.de/StructureDefinition/lebensphase](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.de/StructureDefinition/lebensphase)

**Slices**

This structure defines the following [Slices](http://hl7.org/fhir/R4/profiling.html#slices):

* The element 1 is sliced based on the value of Condition.code.coding
* The element 1 is sliced based on the value of Condition.bodySite.coding
* The element 1 is sliced based on the value of Condition.onset[x]

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-mii-pr-diagnose-condition.csv), [Excel](../StructureDefinition-mii-pr-diagnose-condition.xlsx), [Schematron](../StructureDefinition-mii-pr-diagnose-condition.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-diagnose-condition",
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
        "code" : "package",
        "display" : "Package"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-usage",
    "valueMarkdown" : "Use this profile as the technical FHIR representation of the corresponding Medical Informatics Initiative logical model. The profile constrains a base FHIR resource for the MII module context by specifying how elements are used, which elements are required or not used, which extensions and terminology bindings apply, and how the resource maps to the module-specific content model. Implementers should produce and consume resource instances that conform to this profile when exchanging data for the corresponding MII module."
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose",
  "version" : "2027.0.0-dev",
  "name" : "MII_PR_Diagnose_Condition",
  "title" : "MII PR Diagnose Condition",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "de-DE"
      },
      {
        "url" : "content",
        "valueString" : "Diagnose"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    },
    {
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en-US"
      },
      {
        "url" : "content",
        "valueString" : "Diagnosis"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
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
  "description" : "Dieses Profil beschreibt eine Diagnose der Medizininformatik Initiative",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "de-DE"
      },
      {
        "url" : "content",
        "valueString" : "Eine klinische Diagnose der Patientin oder des Patienten."
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    },
    {
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en-US"
      },
      {
        "url" : "content",
        "valueString" : "A clinical diagnosis of a patient."
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "purpose" : "Constrain the FHIR Condition resource for consistent exchange of diagnoses in the MII Core Data Set.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "LogicalModel",
    "name" : "FHIR-Profil zu LogicalModel Mapping"
  },
  {
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "sct-concept",
    "uri" : "http://snomed.info/conceptdomain",
    "name" : "SNOMED CT Concept Domain Binding"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "sct-attr",
    "uri" : "http://snomed.org/attributebinding",
    "name" : "SNOMED CT Attribute Binding"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Condition",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Condition",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Condition",
      "path" : "Condition"
    },
    {
      "id" : "Condition.id",
      "path" : "Condition.id",
      "mustSupport" : true
    },
    {
      "id" : "Condition.meta",
      "path" : "Condition.meta",
      "mustSupport" : true
    },
    {
      "id" : "Condition.meta.source",
      "path" : "Condition.meta.source",
      "mustSupport" : true
    },
    {
      "id" : "Condition.meta.profile",
      "path" : "Condition.meta.profile",
      "mustSupport" : true
    },
    {
      "id" : "Condition.extension",
      "path" : "Condition.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Condition.extension:ReferenzPrimaerdiagnose",
      "path" : "Condition.extension",
      "sliceName" : "ReferenzPrimaerdiagnose",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/condition-related"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Condition.extension:ReferenzPrimaerdiagnose.url",
      "path" : "Condition.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Condition.extension:ReferenzPrimaerdiagnose.value[x]",
      "path" : "Condition.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Condition.extension:Feststellungsdatum",
      "path" : "Condition.extension",
      "sliceName" : "Feststellungsdatum",
      "short" : "Feststellungsdatum",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Feststellungsdatum"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Asserted date"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Datum, an dem die Diagnose erstmals festgestellt wurde",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Datum, an dem die Diagnose erstmals festgestellt wurde"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Date the condition was first asserted"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/condition-assertedDate"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "Feststellungsdatum"
      }]
    },
    {
      "id" : "Condition.extension:Feststellungsdatum.url",
      "path" : "Condition.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Condition.extension:Feststellungsdatum.value[x]",
      "path" : "Condition.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Condition.clinicalStatus",
      "path" : "Condition.clinicalStatus",
      "short" : "Klinischer Status",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Klinischer Status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Clinical status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "aktiv | Rezidiv | Rückfall | inaktiv | Remission | abgeklungen",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "aktiv | Rezidiv | Rückfall | inaktiv | Remission | abgeklungen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "active | recurrence | relapse | inactive | remission | resolved"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "KlinischerStatus"
      }]
    },
    {
      "id" : "Condition.clinicalStatus.coding",
      "path" : "Condition.clinicalStatus.coding",
      "mustSupport" : true
    },
    {
      "id" : "Condition.clinicalStatus.coding.system",
      "path" : "Condition.clinicalStatus.coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Condition.clinicalStatus.coding.code",
      "path" : "Condition.clinicalStatus.coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Condition.verificationStatus",
      "path" : "Condition.verificationStatus",
      "short" : "Verifizierungsstatus",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Verifizierungsstatus"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Verification status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "unbestätigt | vorläufig | differential | bestätigt | widerlegt | fehlerhafte Eingabe",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "unbestätigt | vorläufig | differential | bestätigt | widerlegt | fehlerhafte Eingabe"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "unconfirmed | provisional | differential | confirmed | refuted | entered-in-error"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Condition.verificationStatus.coding",
      "path" : "Condition.verificationStatus.coding",
      "mustSupport" : true
    },
    {
      "id" : "Condition.verificationStatus.coding.system",
      "path" : "Condition.verificationStatus.coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Condition.verificationStatus.coding.code",
      "path" : "Condition.verificationStatus.coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code",
      "path" : "Condition.code",
      "short" : "Code",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Ein ICD-10-, Alpha-ID-, SNOMED-, Orpha- oder anderer Code, der die Diagnose identifiziert.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Ein ICD-10-, Alpha-ID-, SNOMED-, Orpha- oder anderer Code, der die Diagnose identifiziert."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "An ICD-10-, Alpha-ID-, SNOMED-, Orpha- or other code that identifies the diagnosis."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding",
      "path" : "Condition.code.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "WeitereKodiersysteme"
      }]
    },
    {
      "id" : "Condition.code.coding.code",
      "path" : "Condition.code.coding.code",
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "WeitereKodiersysteme.Diagnosecode"
      }]
    },
    {
      "id" : "Condition.code.coding:icd10-gm",
      "path" : "Condition.code.coding",
      "sliceName" : "icd10-gm",
      "short" : "ICD-10-GM Code",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "ICD-10-GM Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "ICD-10-GM code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Ein Verweis auf einen von der ICD-10-GM definierten Code",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Ein Verweis auf einen von der ICD-10-GM definierten Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "A reference to a code defined by the ICD-10-GM"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Coding",
        "profile" : ["http://fhir.de/StructureDefinition/CodingICD10GM"]
      }],
      "patternCoding" : {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
      },
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-icd10gm"
      },
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "ICD10GMDiagnoseKodiert"
      }]
    },
    {
      "id" : "Condition.code.coding:icd10-gm.extension:Mehrfachcodierungs-Kennzeichen",
      "path" : "Condition.code.coding.extension",
      "sliceName" : "Mehrfachcodierungs-Kennzeichen",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:icd10-gm.extension:Mehrfachcodierungs-Kennzeichen.url",
      "path" : "Condition.code.coding.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:icd10-gm.extension:Mehrfachcodierungs-Kennzeichen.value[x]",
      "path" : "Condition.code.coding.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:icd10-gm.extension:Mehrfachcodierungs-Kennzeichen.value[x].system",
      "path" : "Condition.code.coding.extension.value[x].system",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:icd10-gm.extension:Mehrfachcodierungs-Kennzeichen.value[x].code",
      "path" : "Condition.code.coding.extension.value[x].code",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:icd10-gm.extension:Seitenlokalisation",
      "path" : "Condition.code.coding.extension",
      "sliceName" : "Seitenlokalisation",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:icd10-gm.extension:Seitenlokalisation.url",
      "path" : "Condition.code.coding.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:icd10-gm.extension:Seitenlokalisation.value[x]",
      "path" : "Condition.code.coding.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:icd10-gm.extension:Seitenlokalisation.value[x].system",
      "path" : "Condition.code.coding.extension.value[x].system",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:icd10-gm.extension:Seitenlokalisation.value[x].code",
      "path" : "Condition.code.coding.extension.value[x].code",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:icd10-gm.extension:Diagnosesicherheit",
      "path" : "Condition.code.coding.extension",
      "sliceName" : "Diagnosesicherheit",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:icd10-gm.extension:Diagnosesicherheit.url",
      "path" : "Condition.code.coding.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:icd10-gm.extension:Diagnosesicherheit.value[x]",
      "path" : "Condition.code.coding.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:icd10-gm.extension:Diagnosesicherheit.value[x].system",
      "path" : "Condition.code.coding.extension.value[x].system",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:icd10-gm.extension:Diagnosesicherheit.value[x].code",
      "path" : "Condition.code.coding.extension.value[x].code",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:icd10-gm.system",
      "path" : "Condition.code.coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:icd10-gm.version",
      "path" : "Condition.code.coding.version",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:icd10-gm.code",
      "path" : "Condition.code.coding.code",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "ICD10GMDiagnoseKodiert.Diagnosecode"
      }]
    },
    {
      "id" : "Condition.code.coding:alpha-id",
      "path" : "Condition.code.coding",
      "sliceName" : "alpha-id",
      "short" : "Alpha-ID Code",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Alpha-ID Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Alpha-ID code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Ein Verweis auf einen von der Alpha-ID definierten Code",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Ein Verweis auf einen von der Alpha-ID definierten Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "A reference to a code defined by the Alpha-ID"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Coding",
        "profile" : ["http://fhir.de/StructureDefinition/CodingAlphaID"]
      }],
      "patternCoding" : {
        "system" : "http://fhir.de/CodeSystem/bfarm/alpha-id"
      },
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-alphaid"
      },
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "ALPHAIDKodiert"
      }]
    },
    {
      "id" : "Condition.code.coding:alpha-id.system",
      "path" : "Condition.code.coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:alpha-id.version",
      "path" : "Condition.code.coding.version",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:alpha-id.code",
      "path" : "Condition.code.coding.code",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "ALPHAIDKodiert.Diagnosecode"
      }]
    },
    {
      "id" : "Condition.code.coding:sct",
      "path" : "Condition.code.coding",
      "sliceName" : "sct",
      "short" : "SNOMED CT Code",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "SNOMED CT Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "SNOMED CT code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Ein Verweis auf einen von SNOMED CT definierten Code",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Ein Verweis auf einen von SNOMED CT definierten Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "A reference to a code defined by SNOMED CT"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://snomed.info/sct"
      },
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/diagnoses-sct"
      },
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "SNOMEDDiagnoseKodiert"
      }]
    },
    {
      "id" : "Condition.code.coding:sct.system",
      "path" : "Condition.code.coding.system",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:sct.version",
      "path" : "Condition.code.coding.version",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:sct.code",
      "path" : "Condition.code.coding.code",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "SNOMEDDiagnoseKodiert.Diagnosecode"
      }]
    },
    {
      "id" : "Condition.code.coding:orphanet",
      "path" : "Condition.code.coding",
      "sliceName" : "orphanet",
      "short" : "ORPHAcode",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "ORPHAcode"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "ORPHAcode"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Ein Verweis auf einen von der Orphanet Nomenklatur der Seltenen Krankheiten definierten Code",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Ein Verweis auf einen von der Orphanet Nomenklatur der Seltenen Krankheiten definierten Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "A reference to a code defined by the Orphanet nomenclature of rare diseases"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://www.orpha.net"
      },
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-orphanet"
      },
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "ORPHANETDiagnoseKodiert"
      }]
    },
    {
      "id" : "Condition.code.coding:orphanet.system",
      "path" : "Condition.code.coding.system",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:orphanet.code",
      "path" : "Condition.code.coding.code",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "ORPHANETDiagnoseKodiert.Diagnosecode"
      }]
    },
    {
      "id" : "Condition.code.text",
      "path" : "Condition.code.text",
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "Freitextbeschreibung"
      }]
    },
    {
      "id" : "Condition.bodySite",
      "path" : "Condition.bodySite",
      "short" : "Körperstelle",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Körperstelle"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Body site"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die Körperstelle der Diagnose mittels SNOMED oder anderem Code.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Körperstelle der Diagnose mittels SNOMED oder anderem Code."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "The body site of the diagnosis using SNOMED or other systems."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "Koerperstelle"
      }]
    },
    {
      "id" : "Condition.bodySite.extension:bodySite",
      "path" : "Condition.bodySite.extension",
      "sliceName" : "bodySite",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/bodySite"]
      }]
    },
    {
      "id" : "Condition.bodySite.coding",
      "path" : "Condition.bodySite.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "system"
        }],
        "rules" : "open"
      },
      "mustSupport" : true
    },
    {
      "id" : "Condition.bodySite.coding:snomed-ct",
      "path" : "Condition.bodySite.coding",
      "sliceName" : "snomed-ct",
      "short" : "SNOMED CT Code",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "SNOMED CT Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "SNOMED CT code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Ein Verweis auf einen von SNOMED CT definierten Code",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Ein Verweis auf einen von SNOMED CT definierten Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "A reference to a code defined by SNOMED CT"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-bodystructure-snomed"
      }
    },
    {
      "id" : "Condition.bodySite.coding:snomed-ct.system",
      "path" : "Condition.bodySite.coding.system",
      "min" : 1,
      "patternUri" : "http://snomed.info/sct",
      "mustSupport" : true
    },
    {
      "id" : "Condition.bodySite.coding:snomed-ct.version",
      "path" : "Condition.bodySite.coding.version",
      "mustSupport" : true
    },
    {
      "id" : "Condition.bodySite.coding:snomed-ct.code",
      "path" : "Condition.bodySite.coding.code",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Condition.subject",
      "path" : "Condition.subject",
      "mustSupport" : true
    },
    {
      "id" : "Condition.subject.reference",
      "path" : "Condition.subject.reference",
      "mustSupport" : true
    },
    {
      "id" : "Condition.encounter",
      "path" : "Condition.encounter",
      "short" : "Kontakt (Aufenthaltsbezug)",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kontakt"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Encounter"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kontakt, während dem die Diagnose erstellt wurde oder mit dem die Diagnose in Zusammenhang steht.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kontakt, während dem die Diagnose erstellt wurde oder mit dem die Diagnose in Zusammenhang steht."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "The Encounter during which this Condition was created or to which the creation of this record is tightly associated."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Condition.encounter.reference",
      "path" : "Condition.encounter.reference",
      "mustSupport" : true
    },
    {
      "id" : "Condition.onset[x]",
      "path" : "Condition.onset[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      },
      "short" : "Beginn",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Beginn"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Onset"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Geschätztes oder tatsächliches Datum oder Zeitraum, an dem die Erkrankung begonnen hat, nach Meinung des Klinikers.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Geschätztes oder tatsächliches Datum oder Zeitraum, an dem die Erkrankung begonnen hat, nach Meinung des Klinikers."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Estimated or actual date or date-time the condition began, in the opinion of the clinician."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "dateTime"
      },
      {
        "code" : "Age"
      },
      {
        "code" : "Period"
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "KlinischRelevanterZeitraum"
      }]
    },
    {
      "id" : "Condition.onset[x]:onsetPeriod",
      "path" : "Condition.onset[x]",
      "sliceName" : "onsetPeriod",
      "short" : "Beginn Zeitraum",
      "definition" : "Der Zeitraum, in dem die Erkrankung begonnen hat, nach Meinung des Klinikers.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Period"
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "KlinischRelevanterZeitraum.Zeitraum"
      }]
    },
    {
      "id" : "Condition.onset[x]:onsetPeriod.start",
      "path" : "Condition.onset[x].start",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "KlinischRelevanterZeitraum.Zeitraum.von"
      }]
    },
    {
      "id" : "Condition.onset[x]:onsetPeriod.start.extension",
      "path" : "Condition.onset[x].start.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Condition.onset[x]:onsetPeriod.start.extension:lebensphase-von",
      "path" : "Condition.onset[x].start.extension",
      "sliceName" : "lebensphase-von",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://fhir.de/StructureDefinition/lebensphase"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Condition.onset[x]:onsetPeriod.start.extension:lebensphase-von.url",
      "path" : "Condition.onset[x].start.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Condition.onset[x]:onsetPeriod.start.extension:lebensphase-von.value[x]",
      "path" : "Condition.onset[x].start.extension.value[x]",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "KlinischRelevanterZeitraum.Lebensphase.von"
      }]
    },
    {
      "id" : "Condition.onset[x]:onsetPeriod.start.extension:lebensphase-von.value[x].coding",
      "path" : "Condition.onset[x].start.extension.value[x].coding",
      "mustSupport" : true
    },
    {
      "id" : "Condition.onset[x]:onsetPeriod.start.extension:lebensphase-von.value[x].coding.system",
      "path" : "Condition.onset[x].start.extension.value[x].coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Condition.onset[x]:onsetPeriod.start.extension:lebensphase-von.value[x].coding.code",
      "path" : "Condition.onset[x].start.extension.value[x].coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Condition.onset[x]:onsetPeriod.end",
      "path" : "Condition.onset[x].end",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "KlinischRelevanterZeitraum.Zeitraum.bis"
      }]
    },
    {
      "id" : "Condition.onset[x]:onsetPeriod.end.extension",
      "path" : "Condition.onset[x].end.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Condition.onset[x]:onsetPeriod.end.extension:lebensphase-bis",
      "path" : "Condition.onset[x].end.extension",
      "sliceName" : "lebensphase-bis",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://fhir.de/StructureDefinition/lebensphase"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Condition.onset[x]:onsetPeriod.end.extension:lebensphase-bis.url",
      "path" : "Condition.onset[x].end.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Condition.onset[x]:onsetPeriod.end.extension:lebensphase-bis.value[x]",
      "path" : "Condition.onset[x].end.extension.value[x]",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "KlinischRelevanterZeitraum.Lebensphase.bis"
      }]
    },
    {
      "id" : "Condition.onset[x]:onsetPeriod.end.extension:lebensphase-bis.value[x].coding",
      "path" : "Condition.onset[x].end.extension.value[x].coding",
      "mustSupport" : true
    },
    {
      "id" : "Condition.onset[x]:onsetPeriod.end.extension:lebensphase-bis.value[x].coding.system",
      "path" : "Condition.onset[x].end.extension.value[x].coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Condition.onset[x]:onsetPeriod.end.extension:lebensphase-bis.value[x].coding.code",
      "path" : "Condition.onset[x].end.extension.value[x].coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Condition.onset[x]:onsetDateTime",
      "path" : "Condition.onset[x]",
      "sliceName" : "onsetDateTime",
      "short" : "Beginn Datum",
      "definition" : "Das Datum, an dem die Erkrankung begonnen hat, nach Meinung des Klinikers.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Condition.onset[x]:onsetAge",
      "path" : "Condition.onset[x]",
      "sliceName" : "onsetAge",
      "short" : "Erkrankungsbeginn als Alter",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Age"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Condition.onset[x]:onsetAge.extension:Lebensphase-Beginn",
      "path" : "Condition.onset[x].extension",
      "sliceName" : "Lebensphase-Beginn",
      "short" : "Lebensphase des Erkrankungsbeginns",
      "comment" : "Alternative Angabe, wenn genauere Eingrenzungen des Zeitraums nicht möglich sind, insbesondere im Kontext anamnestischer Diagnosen",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://fhir.de/StructureDefinition/lebensphase"]
      }]
    },
    {
      "id" : "Condition.onset[x]:onsetAge.extension:Lebensphase-Beginn.url",
      "path" : "Condition.onset[x].extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Condition.onset[x]:onsetAge.extension:Lebensphase-Beginn.value[x]",
      "path" : "Condition.onset[x].extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Condition.onset[x]:onsetAge.extension:Lebensphase-Beginn.value[x].coding",
      "path" : "Condition.onset[x].extension.value[x].coding",
      "mustSupport" : true
    },
    {
      "id" : "Condition.onset[x]:onsetAge.extension:Lebensphase-Beginn.value[x].coding.system",
      "path" : "Condition.onset[x].extension.value[x].coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Condition.onset[x]:onsetAge.extension:Lebensphase-Beginn.value[x].coding.code",
      "path" : "Condition.onset[x].extension.value[x].coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Condition.recordedDate",
      "path" : "Condition.recordedDate",
      "short" : "Aufzeichnungsdatum",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Aufzeichnungsdatum"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Recorded date"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Datum, an dem die Diagnose erstmals dokumentiert wurde.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Datum, an dem die Diagnose erstmals dokumentiert wurde."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Date when the diagnosis was first recorded."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "Dokumentationsdatum"
      }]
    },
    {
      "id" : "Condition.note",
      "path" : "Condition.note",
      "short" : "Hinweis",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Hinweis"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Note"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Zusätzliche Informationen zur Diagnose als Freitext.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Zusätzliche Informationen zur Diagnose als Freitext."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Additional information about the diagnosis as free text."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "LogicalModel",
        "map" : "Diagnoseerlaeuterung"
      }]
    }]
  }
}

```
