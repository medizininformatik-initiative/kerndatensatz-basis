# MII PR Person Patient (Pseudonymisiert) - MII Implementation Guide Core Dataset Base v2026.0.1

## Resource Profile: MII PR Person Patient (Pseudonymisiert) 

 
Demographics and other administrative information about a patient. 

**Example Usage Scenarios:**

* Provide pseudonymized patient data for secondary use in research contexts while protecting patient identity
* Support federated analyses across multiple MII sites without exposing identifying patient information
* Enable health insurance-based analyses (e.g., NUM-CON-MON use case) using IK numbers without revealing individual insurance IDs
* Maintain coarse demographic granularity for research cohort formation while preventing re-identification

##### ⚠️ Important: Pseudonymization Validation Limitations

This profile **does not contain rules to validate correct pseudonymization**. Successful validation against this profile does **not** guarantee that technically or legally compliant pseudonymization has been performed.

Pseudonymization requirements vary by project context and cannot be fully represented in a single FHIR profile. For comprehensive pseudonymization guidance, consult the [MII Pseudonymization Interface](https://medizininformatik-initiative.github.io/mii-interface-module-pseudonymization/).

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the MII Pseudonymized Patient Profile.

#### Pseudonymization Identifiers

The pseudonymized patient profile uses specialized identifier types:

* **`Patient.identifier:pseudonymisierterIdentifier`**: Pseudonymized identifier for the patient 
* **MUST** be appropriately typed if the identifier is a derived pseudonym
* Use when the identifier can be linked back to the original patient data through a controlled process
* Typically used in research scenarios where de-pseudonymization may be necessary for specific purposes
* **`identifier.type.coding:pseuded`** (`PSEUDED`, required): Indicates the value is a pseudonym
* **`identifier.type.coding:mr`** (`MR`, optional): **SHOULD** additionally be set when the pseudonym replaces an organization-internal patient identifier (Medical Record Number). This allows consumers to locate the pseudonymized patient number without knowing the site-specific `identifier.system`. See [Best Practice - Pseudonymized MR Identifier](#best-practice---pseudonymized-mr-identifier) for details.
 
* **`Patient.identifier:anonymisierterIdentifier`**: Anonymized identifier for the patient 
* **SHOULD** only be used when no inference about the original dataset is possible
* Represents irreversible anonymization where re-identification is not feasible
 
* **`Patient.identifier:maskierterVersichertenIdentifier`**: Masked health insurance identifier 
* Used for health insurance-based analyses without revealing the actual insurance ID
* See [Best Practice - Masked Insurance ID with IK Number](#best-practice---masked-insurance-id-with-ik-number) for implementation details
 

##### Best Practice - Pseudonymized Medical Record Number Identifier

When a pseudonym replaces an organization-internal patient identifier (Medical Record Number, MR), the `identifier.type` SHOULD carry both codings:

* `http://terminology.hl7.org/CodeSystem/v3-ObservationValue|PSEUDED` — required, signals that the value is a pseudonym
* `http://terminology.hl7.org/CodeSystem/v2-0203|MR` — optional, signals the functional role of the original identifier

Setting the `MR` code is recommended because it allows queries to locate pseudonymized patient numbers across sites using a stable, site-independent type code, without needing to know each site's proprietary `identifier.system` value.

Note: `MR` here describes the functional role of the identifier (i.e., what it represents), not the nature of the pseudonymous value itself. Pseudonyms that do not replace a Medical Record Number (e.g., study-specific pseudonyms) SHOULD NOT carry the `MR` code.

```
{
  "type": {
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/v3-ObservationValue",
      "code": "PSEUDED"
    },
    {
      "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
      "code": "MR"
    }]
  },
  "system": "https://ttp.example.org/pseudonyms",
  "value": "a3f2c1d9-pseudonym"
}

```

##### Best Practice - Masked Insurance ID with IK Number

For use cases requiring health insurance analysis (e.g., NUM-CON-MON), it is necessary to include the IK number (Institutionskennzeichen) of the health insurance provider in the pseudonymized patient profile without exposing the actual insurance ID.

This is achieved by:

1. Creating an`Identifier`with type`KVZ10`(10-digit health insurance ID)
1. Replacing the`Identifier.value`element with the [Data Absent Reason] extension using code`masked`
1. Providing the IK number of the health insurance provider in`Identifier.assigner.identifier`

See the example resource for this modeling approach.

**Usages:**

* Examples for this Profile: [Patient/mii-exa-person-patient-pseudonymisiert](Patient-mii-exa-person-patient-pseudonymisiert.md)
* CapabilityStatements using this Profile: [MII CPS Person CapabilityStatement](CapabilityStatement-mii-cps-person-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.base|current/StructureDefinition/StructureDefinition-mii-pr-person-patient-pseudonymisiert.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-pr-person-patient-pseudonymisiert.csv), [Excel](../StructureDefinition-mii-pr-person-patient-pseudonymisiert.xlsx), [Schematron](../StructureDefinition-mii-pr-person-patient-pseudonymisiert.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-person-patient-pseudonymisiert",
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
        "valueString" : "2026.0.1"
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
      "start" : "2026"
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert",
  "version" : "2026.0.1",
  "name" : "MII_PR_Person_PatientPseudonymisiert",
  "title" : "MII PR Person Patient (Pseudonymisiert)",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "de-DE"
      },
      {
        "url" : "content",
        "valueString" : "Patient / Patientin pseudonymisiert"
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
        "valueString" : "Patient pseudonymized"
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
  "description" : "Dieses Profil beschreibt eine*n pseudonymisierte*n Patient*in in der Medizininformatik-Initiative.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "de-DE"
      },
      {
        "url" : "content",
        "valueString" : "Demografische und andere administrative Informationen über eine Patientin oder einen Patienten."
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
        "valueString" : "Demographics and other administrative information about a patient."
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
  "purpose" : "Constrain the FHIR Patient resource for privacy-preserving exchange of patient information in the MII Person module.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "loinc",
    "uri" : "http://loinc.org",
    "name" : "LOINC code for the element"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Patient",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Patient",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Patient",
      "path" : "Patient",
      "constraint" : [{
        "key" : "mii-pat-1",
        "severity" : "error",
        "human" : "Falls die Geschlechtsangabe 'other' gewählt wird, muss die amtliche Differenzierung per Extension angegeben werden",
        "expression" : "gender.exists() and gender='other' implies gender.extension('http://fhir.de/StructureDefinition/gender-amtlich-de').exists()",
        "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert"
      }]
    },
    {
      "id" : "Patient.id",
      "path" : "Patient.id",
      "mustSupport" : true
    },
    {
      "id" : "Patient.meta",
      "path" : "Patient.meta",
      "mustSupport" : true
    },
    {
      "id" : "Patient.meta.profile",
      "path" : "Patient.meta.profile",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier",
      "path" : "Patient.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "short" : "Patienten-Identifikator",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Identifikator"
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
            "valueString" : "Identifier"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Ein Identifikator für den/die Patient*in",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Ein Identifikator für den/die Patient*in"
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
            "valueString" : "An identifier for this patient"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:PseudonymisierterIdentifier",
      "path" : "Patient.identifier",
      "sliceName" : "PseudonymisierterIdentifier",
      "short" : "Pseudonymisierter Identifikator",
      "definition" : "Ein Pseudonym ersetzt einen Originalwert. \nDie Verarbeitung ist umkehrbar. Zusätzliche Informationen sind erforderlich, um den Originalwert zu rekonstruieren, bspw. eine Trusted Third Party.",
      "min" : 0,
      "max" : "*",
      "patternIdentifier" : {
        "type" : {
          "coding" : [{
            "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationValue",
            "code" : "PSEUDED"
          }]
        }
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:PseudonymisierterIdentifier.type",
      "path" : "Patient.identifier.type",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:PseudonymisierterIdentifier.type.coding",
      "path" : "Patient.identifier.type.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "Patient.identifier:PseudonymisierterIdentifier.type.coding:pseuded",
      "path" : "Patient.identifier.type.coding",
      "sliceName" : "pseuded",
      "min" : 1,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationValue",
        "code" : "PSEUDED"
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:PseudonymisierterIdentifier.type.coding:mr",
      "path" : "Patient.identifier.type.coding",
      "sliceName" : "mr",
      "short" : "Medical Record Number",
      "definition" : "Wenn dieses Pseudonym einen pseudonymisierten organisationsinternen Patienten-Identifier (Medical Record Number) ersetzt,\nSOLL dieser Code zusätzlich gesetzt werden, um die funktionale Rolle des Identifiers\nunabhängig vom Standort-spezifischen system auffindbar zu machen.",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "MR"
      }
    },
    {
      "id" : "Patient.identifier:AnonymisierterIdentifier",
      "path" : "Patient.identifier",
      "sliceName" : "AnonymisierterIdentifier",
      "short" : "Anonymisierter Identifikator",
      "definition" : "Ein Anonymisierter Identifikator ersetzt einen Originalwert. \nDie Verarbeitung ist unumkehrbar. Der Originalwert kann nicht oder nur mit unverhältnismäßigem Aufwand rekonstruiert werden.",
      "min" : 0,
      "max" : "*",
      "patternIdentifier" : {
        "type" : {
          "coding" : [{
            "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationValue",
            "code" : "ANONYED"
          }]
        }
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:MaskierterVersichertenIdentifer",
      "path" : "Patient.identifier",
      "sliceName" : "MaskierterVersichertenIdentifer",
      "short" : "Maskierter Identifier der Krankenversicherten-ID",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Maskierter Identifier der Krankenversicherten-ID"
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
            "valueString" : "Masked identifier of the health insurance ID"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Identifier der Krankenversichertennummer, bei dem der Wert maskiert wurde.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Identifier der Krankenversichertennummer, bei dem der Wert maskiert wurde."
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
            "valueString" : "Health insurance number identifier with masked value."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-kvid-10"]
      }],
      "patternIdentifier" : {
        "type" : {
          "coding" : [{
            "system" : "http://fhir.de/CodeSystem/identifier-type-de-basis",
            "code" : "KVZ10"
          }]
        }
      },
      "constraint" : [{
        "key" : "ide-masked-1",
        "severity" : "warning",
        "human" : "Identifier.value SOLLTE keinen Wert und SOLLTE die Extension Data Absent Reason mit Code 'masked' enthalten.",
        "expression" : "value.hasValue().not() and value.extension.where(url='http://hl7.org/fhir/StructureDefinition/data-absent-reason' and value='masked').exists()",
        "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:MaskierterVersichertenIdentifer.type",
      "path" : "Patient.identifier.type",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:MaskierterVersichertenIdentifer.system",
      "path" : "Patient.identifier.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:MaskierterVersichertenIdentifer.value",
      "path" : "Patient.identifier.value",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:MaskierterVersichertenIdentifer.value.extension",
      "path" : "Patient.identifier.value.extension",
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
      "id" : "Patient.identifier:MaskierterVersichertenIdentifer.value.extension:data-absent-reason",
      "path" : "Patient.identifier.value.extension",
      "sliceName" : "data-absent-reason",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/data-absent-reason"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:MaskierterVersichertenIdentifer.value.extension:data-absent-reason.value[x]",
      "path" : "Patient.identifier.value.extension.value[x]",
      "patternCode" : "masked"
    },
    {
      "id" : "Patient.identifier:MaskierterVersichertenIdentifer.assigner",
      "path" : "Patient.identifier.assigner",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:MaskierterVersichertenIdentifer.assigner.identifier",
      "path" : "Patient.identifier.assigner.identifier",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-iknr"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:MaskierterVersichertenIdentifer.assigner.identifier.type",
      "path" : "Patient.identifier.assigner.identifier.type",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:MaskierterVersichertenIdentifer.assigner.identifier.system",
      "path" : "Patient.identifier.assigner.identifier.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:MaskierterVersichertenIdentifer.assigner.identifier.value",
      "path" : "Patient.identifier.assigner.identifier.value",
      "mustSupport" : true
    },
    {
      "id" : "Patient.active",
      "path" : "Patient.active",
      "short" : "Aktiv",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Aktiv"
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
            "valueString" : "Active"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Gibt an, ob diese Patient-Ressource aktiv verwendet wird.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Gibt an, ob diese Patient-Ressource aktiv verwendet wird."
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
            "valueString" : "Whether this patient's record is in active use"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.gender",
      "path" : "Patient.gender",
      "short" : "Administratives Geschlecht",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Administratives Geschlecht"
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
            "valueString" : "Administrative gender"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "männlich | weiblich | andere | unbekannt | unbestimmt | divers",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "männlich | weiblich | andere | unbekannt | unbestimmt | divers"
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
            "valueString" : "male | female | other | unknown | undetermined | diverse"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.gender.extension",
      "path" : "Patient.gender.extension",
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
      "id" : "Patient.gender.extension:other-amtlich",
      "path" : "Patient.gender.extension",
      "sliceName" : "other-amtlich",
      "short" : "Extension Administratives Geschlecht",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Extension Administratives Geschlecht"
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
            "valueString" : "Extension administrative gender"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Extension zur genaueren Differenzierung des administrativen Geschlechts",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Extension zur genaueren Differenzierung des administrativen Geschlechts"
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
            "valueString" : "Extension for detailed differentiation of administrative gender"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://fhir.de/StructureDefinition/gender-amtlich-de"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.birthDate",
      "path" : "Patient.birthDate",
      "short" : "Geburtsdatum",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Geburtsdatum"
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
            "valueString" : "Date of birth"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Das Geburtsdatum der Patientin oder des Patienten",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das Geburtsdatum der Patientin oder des Patienten"
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
            "valueString" : "The date of birth for the individual"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.address",
      "path" : "Patient.address",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "short" : "Adresse",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Adresse"
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
            "valueString" : "Address"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Eine Adresse der Patientin oder des Patienten",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Eine Adresse der Patientin oder des Patienten"
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
            "valueString" : "An address for the individual"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift",
      "path" : "Patient.address",
      "sliceName" : "Strassenanschrift",
      "short" : "Straßenanschrift",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Straßenanschrift"
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
            "valueString" : "Street address"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Eine Straßenanschrift der Patientin oder des Patienten",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Eine Straßenanschrift der Patientin oder des Patienten"
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
            "valueString" : "A street address for the individual"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Address",
        "profile" : ["http://fhir.de/StructureDefinition/address-de-basis"]
      }],
      "patternAddress" : {
        "type" : "both"
      },
      "constraint" : [{
        "key" : "pat-cnt-2or3-char",
        "severity" : "warning",
        "human" : "The content of the country element (if present) SHALL be selected EITHER from ValueSet ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2 OR MAY be selected from ISO Country Alpha-3 Value Set http://hl7.org/fhir/ValueSet/iso3166-1-3, IF the country is not specified in value Set ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2.",
        "expression" : "country.empty() or (country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-2') or country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-3'))",
        "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.type",
      "path" : "Patient.address.type",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.city.extension",
      "path" : "Patient.address.city.extension",
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
      "id" : "Patient.address:Strassenanschrift.city.extension:gemeindeschluessel",
      "path" : "Patient.address.city.extension",
      "sliceName" : "gemeindeschluessel",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://fhir.de/StructureDefinition/destatis/ags"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.postalCode",
      "path" : "Patient.address.postalCode",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.country",
      "path" : "Patient.address.country",
      "min" : 1,
      "mustSupport" : true
    }]
  }
}

```
