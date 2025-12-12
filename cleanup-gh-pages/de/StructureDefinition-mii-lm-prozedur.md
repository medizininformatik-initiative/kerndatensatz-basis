# MII LM Prozedur - MII Implementation Guide Core Dataset Base v2026.0.0

## Logisches Modell: MII LM Prozedur 

 
Logische Repräsentation des Basismoduls Prozedur 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.medizininformatikinitiative.kerndatensatz.base|current/StructureDefinition/mii-lm-prozedur)

### Formale Ansichten des Profilinhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

Diese Struktur ist abgeleitet von [Element](http://hl7.org/fhir/R4/datatypes.html#Element) 

#### Constraints

Diese Struktur ist abgeleitet von [Element](http://hl7.org/fhir/R4/datatypes.html#Element) 

**Summary**

Mandatory: 0 element(1 nested mandatory element)

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [Element](http://hl7.org/fhir/R4/datatypes.html#Element) 

 **Snapshot-AnsichtView** 

#### Constraints

Diese Struktur ist abgeleitet von [Element](http://hl7.org/fhir/R4/datatypes.html#Element) 

**Summary**

Mandatory: 0 element(1 nested mandatory element)

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-mii-lm-prozedur.csv), [Excel](../StructureDefinition-mii-lm-prozedur.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-lm-prozedur",
  "extension" : [
    {
      "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-ex-meta-license-codeable",
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://hl7.org/fhir/spdx-license",
            "code" : "CC-BY-4.0",
            "display" : "Creative Commons Attribution 4.0 International"
          }
        ]
      }
    }
  ],
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/LogicalModel/Prozedur",
  "version" : "2026.0.0",
  "name" : "MII_LM_Prozedur",
  "title" : "MII LM Prozedur",
  "status" : "active",
  "date" : "2024-12-09",
  "publisher" : "Medical Informatics Initiative (MII)",
  "_publisher" : {
    "extension" : [
      {
        "extension" : [
          {
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Medizininformatik-Initiative (MII)"
          }
        ],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }
    ]
  },
  "contact" : [
    {
      "name" : "Medical Informatics Initiative (MII)",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.medizininformatik-initiative.de/en"
        }
      ]
    }
  ],
  "description" : "Logische Repräsentation des Basismoduls Prozedur",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "DE",
          "display" : "Germany"
        }
      ]
    }
  ],
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "FHIR",
      "name" : "Prozedur LogicalModel FHIR Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/LogicalModel/Prozedur",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Element",
  "derivation" : "specialization",
  "differential" : {
    "element" : [
      {
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
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ],
        "mapping" : [
          {
            "identity" : "FHIR",
            "map" : "Procedure.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/ops')"
          }
        ]
      },
      {
        "id" : "Prozedur.OPSProzedurKodiert.VollstaendigerProzedurencode",
        "path" : "Prozedur.OPSProzedurKodiert.VollstaendigerProzedurencode",
        "short" : "Vollständiger Prozedurencode",
        "definition" : "Der vollständige Prozedurencode: Tripel aus OPS-Code, Codesystem (inkl. Version!) und Katalogtext.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Coding"
          }
        ],
        "mapping" : [
          {
            "identity" : "FHIR",
            "map" : "Procedure.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/ops')"
          }
        ]
      },
      {
        "id" : "Prozedur.OPSProzedurKodiert.Seitenlokalisation",
        "path" : "Prozedur.OPSProzedurKodiert.Seitenlokalisation",
        "short" : "Seitenlokalisation",
        "definition" : "Seitenlokalisation für die durchgeführte Prozedur gemäß BfArM",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Coding"
          }
        ],
        "mapping" : [
          {
            "identity" : "FHIR",
            "map" : "Procedure.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/ops').extension('http://fhir.de/StructureDefinition/seitenlokalisation').value"
          }
        ]
      },
      {
        "id" : "Prozedur.SNOMEDProzedurKodiert",
        "path" : "Prozedur.SNOMEDProzedurKodiert",
        "short" : "Kodierung der durchgeführten Prozedur mittels SNOMED CT.",
        "definition" : "Kodierung der durchgeführten Prozedur mittels SNOMED CT.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ],
        "mapping" : [
          {
            "identity" : "FHIR",
            "map" : "Procedure.code.coding.where(system='http://snomed.info/sct')"
          }
        ]
      },
      {
        "id" : "Prozedur.SNOMEDProzedurKodiert.VollstaendigerProzedurencode",
        "path" : "Prozedur.SNOMEDProzedurKodiert.VollstaendigerProzedurencode",
        "short" : "Vollständiger Prozedurencode",
        "definition" : "Der vollständige Prozedurencode: Tripel aus SNOMED-CT-Code, Codesystem (Version optional) und präferierten Namen",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Coding"
          }
        ],
        "mapping" : [
          {
            "identity" : "FHIR",
            "map" : "Procedure.code.coding.where(system='http://snomed.info/sct')"
          }
        ]
      },
      {
        "id" : "Prozedur.Koerperstelle",
        "path" : "Prozedur.Koerperstelle",
        "short" : "Körperstelle",
        "definition" : "Körperstelle der Prozedur mittels SNOMED CT inkl. Lateralität (R, L, B)",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ],
        "mapping" : [
          {
            "identity" : "FHIR",
            "map" : "Procedure.bodySite"
          }
        ]
      },
      {
        "id" : "Prozedur.Durchfuehrungsabsicht",
        "path" : "Prozedur.Durchfuehrungsabsicht",
        "short" : "Durchführungsabsicht",
        "definition" : "Intention mit der die Prozedur durchgeführt wird.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Coding"
          }
        ],
        "mapping" : [
          {
            "identity" : "FHIR",
            "map" : "Procedure.extension('https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht').value"
          }
        ]
      },
      {
        "id" : "Prozedur.Durchfuehrungsdatum",
        "path" : "Prozedur.Durchfuehrungsdatum",
        "short" : "Durchführungsdatum",
        "definition" : "Das Datum ist der Zeitpunkt, an dem eine Prozedur durchgeführt wurde.",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "dateTime"
          }
        ],
        "mapping" : [
          {
            "identity" : "FHIR",
            "map" : "Procedure.performedDateTime"
          }
        ]
      },
      {
        "id" : "Prozedur.Dokumentationsdatum",
        "path" : "Prozedur.Dokumentationsdatum",
        "short" : "Dokumentationsdatum",
        "definition" : "Das Datum ist der Zeitpunkt, an dem eine Prozedur dokumentiert wurde.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "dateTime"
          }
        ],
        "mapping" : [
          {
            "identity" : "FHIR",
            "map" : "Procedure.extension('http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum').value"
          }
        ]
      },
      {
        "id" : "Prozedur.Freitextbeschreibung",
        "path" : "Prozedur.Freitextbeschreibung",
        "short" : "Freitextbeschreibung",
        "definition" : "Freitextbeschreibung der durchgeführten Prozedur",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "string"
          }
        ],
        "mapping" : [
          {
            "identity" : "FHIR",
            "map" : "Procedure.code.text"
          }
        ]
      }
    ]
  }
}

```
