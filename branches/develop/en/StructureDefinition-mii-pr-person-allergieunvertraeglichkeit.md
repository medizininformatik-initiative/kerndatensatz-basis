# MII PR Person Allergy Intolerance - MII Implementation Guide Core Dataset Base v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII PR Person Allergy Intolerance**

## Resource Profile: MII PR Person Allergy Intolerance 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-person/StructureDefinition/AllergieUnvertraeglichkeit | *Version*:2027.0.0-ballot.rc1 |
| Active as of 2026-09-04 | *Computable Name*:MII_PR_Person_AllergieUnvertraeglichkeit |

 
This profile describes an allergy or intolerance in the Medical Informatics Initiative. 

The MII `AllergyIntolerance` profile is a new addition to the Person module and aims to align the representation of patient-related allergies and intolerances with

* [IPS 2.0.1](https://hl7.org/fhir/uv/ips/2.0.1/en/StructureDefinition-AllergyIntolerance-uv-ips.html),
* [ISiK 6.0.0](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0/StructureDefinition-ISiKAllergieUnvertraeglichkeit.html),
* and [HL7 Europe Base 2.0.0](https://hl7.eu/fhir/base/2.0.0/StructureDefinition-allergyIntolerance-eu-core.html)

**Usages:**

* Examples for this Profile: [AllergyIntolerance/mii-exa-person-allergyintolerance-1](AllergyIntolerance-mii-exa-person-allergyintolerance-1.md)
* CapabilityStatements using this Profile: [MII CPS Person CapabilityStatement](CapabilityStatement-mii-cps-person-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.base|current/StructureDefinition/StructureDefinition-mii-pr-person-allergieunvertraeglichkeit.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-pr-person-allergieunvertraeglichkeit.csv), [Excel](../StructureDefinition-mii-pr-person-allergieunvertraeglichkeit.xlsx), [Schematron](../StructureDefinition-mii-pr-person-allergieunvertraeglichkeit.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-person-allergieunvertraeglichkeit",
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
    "valueMarkdown" : "Use this profile as the technical FHIR representation of the corresponding Medical Informatics Initiative logical model. The profile constrains a base FHIR resource for the MII module context by specifying how elements are used, which elements are required or not used, which extensions and terminology bindings apply, and how the resource maps to the module-specific content model. Implementers should produce and consume resource instances that conform to this profile when exchanging data for the corresponding MII module."
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
        "code" : "C114476"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-topic",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl",
        "code" : "C71437"
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-person/StructureDefinition/AllergieUnvertraeglichkeit",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_PR_Person_AllergieUnvertraeglichkeit",
  "title" : "MII PR Person Allergy Intolerance",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "de"
      },
      {
        "url" : "content",
        "valueString" : "Allergie / Unverträglichkeit"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "active",
  "experimental" : false,
  "date" : "2026-09-04",
  "publisher" : "Medical Informatics Initiative (MII)",
  "contact" : [{
    "name" : "Medical Informatics Initiative (MII)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/en"
    }]
  }],
  "description" : "This profile describes an allergy or intolerance in the Medical Informatics Initiative.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "de"
      },
      {
        "url" : "content",
        "valueString" : "Eine dokumentierte Allergie oder Unverträglichkeit der Patientin oder des Patienten."
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
  "purpose" : "Constrain the FHIR AllergyIntolerance resource for consistent exchange of allergy and intolerance information in the MII Person module.",
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
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "AllergyIntolerance",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/AllergyIntolerance",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "AllergyIntolerance",
      "path" : "AllergyIntolerance"
    },
    {
      "id" : "AllergyIntolerance.id",
      "path" : "AllergyIntolerance.id",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.meta",
      "path" : "AllergyIntolerance.meta",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.meta.source",
      "path" : "AllergyIntolerance.meta.source",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.meta.profile",
      "path" : "AllergyIntolerance.meta.profile",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.extension",
      "path" : "AllergyIntolerance.extension",
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
      "id" : "AllergyIntolerance.extension:abatement",
      "path" : "AllergyIntolerance.extension",
      "sliceName" : "abatement",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/allergyintolerance-abatement"]
      }]
    },
    {
      "id" : "AllergyIntolerance.extension:abatement.value[x]",
      "path" : "AllergyIntolerance.extension.value[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "AllergyIntolerance.extension:abatement.value[x]:valueDateTime",
      "path" : "AllergyIntolerance.extension.value[x]",
      "sliceName" : "valueDateTime",
      "short" : "End date",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Enddatum"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.clinicalStatus",
      "path" : "AllergyIntolerance.clinicalStatus",
      "short" : "Current allergy or intolerance status",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Klinischer Status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "The current clinical status of the allergy or intolerance.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Klinischer Zustand der Allergie oder Unverträglichkeit, beispielsweise aktiv, inaktiv oder abgeklungen."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.clinicalStatus.coding",
      "path" : "AllergyIntolerance.clinicalStatus.coding",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.clinicalStatus.coding.system",
      "path" : "AllergyIntolerance.clinicalStatus.coding.system",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.clinicalStatus.coding.code",
      "path" : "AllergyIntolerance.clinicalStatus.coding.code",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.verificationStatus",
      "path" : "AllergyIntolerance.verificationStatus",
      "short" : "Certainty",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Verifikationsstatus"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Assertion about certainty associated with the propensity or potential risk of a reaction to the identified substance, including a pharmaceutical product.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Grad der fachlichen Bestätigung der Allergie oder Unverträglichkeit, beispielsweise unbestätigt, bestätigt oder widerlegt."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.verificationStatus.coding",
      "path" : "AllergyIntolerance.verificationStatus.coding",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.verificationStatus.coding.system",
      "path" : "AllergyIntolerance.verificationStatus.coding.system",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.verificationStatus.coding.code",
      "path" : "AllergyIntolerance.verificationStatus.coding.code",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.type",
      "path" : "AllergyIntolerance.type",
      "short" : "Type of propensity",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Art"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Identifies the underlying physiological mechanism for the reaction risk.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Einordnung als Allergie oder Unverträglichkeit, sofern der zugrunde liegende Mechanismus bekannt ist."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.category",
      "path" : "AllergyIntolerance.category",
      "short" : "Category of the identified substance",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Kategorie"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Category assigned to the identified substance.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Kategorie des auslösenden Stoffes, beispielsweise Arzneimittel, Lebensmittel, Umweltstoff oder biologischer Stoff."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.criticality",
      "path" : "AllergyIntolerance.criticality",
      "short" : "Criticality",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Kritikalität"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Estimate of the potential clinical harm or seriousness of a reaction to the identified substance.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Einschätzung des potenziellen klinischen Schadens bei einer zukünftigen Exposition."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.code",
      "path" : "AllergyIntolerance.code",
      "short" : "Code identifying the allergy or intolerance",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Allergie oder Unverträglichkeit gegen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Code for an allergy or intolerance statement, including positive and negated or excluded statements. It may identify a substance, pharmaceutical product, substance class, allergy or intolerance condition, or a general categorical absence statement. A substance recorded for a specific reaction may be more specific than AllergyIntolerance.code but must remain semantically consistent with it. Implementations must be clinically safe when processing code without reaction.substance; if that consistency cannot be confirmed, reaction.substance should be ignored.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Stoff, Produkt, Stoffklasse oder Allergie-/Unverträglichkeitsbegriff, auf den sich die dokumentierte Gefährdung bezieht."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true,
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "http://hl7.org/fhir/uv/ips/ValueSet/allergies-intolerances-uv-ips"
      }
    },
    {
      "id" : "AllergyIntolerance.code.coding",
      "path" : "AllergyIntolerance.code.coding",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.code.coding.system",
      "path" : "AllergyIntolerance.code.coding.system",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.code.coding.code",
      "path" : "AllergyIntolerance.code.coding.code",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.patient",
      "path" : "AllergyIntolerance.patient",
      "short" : "Who the allergy or intolerance concerns",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Patient"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "The patient concerned by the allergy or intolerance.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Patient, bei dem die Allergie oder Unverträglichkeit besteht beziehungsweise dokumentiert wurde."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.patient.reference",
      "path" : "AllergyIntolerance.patient.reference",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.encounter",
      "path" : "AllergyIntolerance.encounter",
      "short" : "Encounter in which the allergy or intolerance was asserted",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Kontakt"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "The encounter during which the allergy or intolerance was asserted.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Kontakt, in dessen Zusammenhang die Allergie oder Unverträglichkeit dokumentiert wurde."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.encounter.reference",
      "path" : "AllergyIntolerance.encounter.reference",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.onset[x]",
      "path" : "AllergyIntolerance.onset[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      },
      "short" : "Date of onset of the allergy or intolerance",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Beginn"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "The estimated or actual date, date-time, age, or other period when the allergy or intolerance was identified.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Zeitpunkt, Zeitraum, Lebensalter oder andere zeitliche Angabe zum erstmaligen Auftreten der Allergie oder Unverträglichkeit."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.onset[x]:onsetDateTime",
      "path" : "AllergyIntolerance.onset[x]",
      "sliceName" : "onsetDateTime",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.recordedDate",
      "path" : "AllergyIntolerance.recordedDate",
      "short" : "Date when the allergy or intolerance was recorded",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Dokumentationsdatum"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "The date when this AllergyIntolerance record was first created in the system, often generated automatically.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Zeitpunkt, zu dem die Allergie oder Unverträglichkeit erstmals im dokumentierenden System erfasst wurde."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.reaction",
      "path" : "AllergyIntolerance.reaction",
      "short" : "Adverse reaction events linked to substance exposure",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Unerwünschte Reaktion"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Details of each adverse reaction event linked to exposure to the identified substance.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Angaben zu einer beobachteten unerwünschten Reaktion nach Exposition gegenüber dem betreffenden Stoff oder Produkt."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.reaction.manifestation",
      "path" : "AllergyIntolerance.reaction.manifestation",
      "short" : "Clinical symptoms or signs associated with the reaction event",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Manifestation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Clinical symptoms and/or signs observed or associated with the adverse reaction event.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Klinische Symptome oder Befunde, die im Zusammenhang mit der unerwünschten Reaktion beobachtet wurden."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true,
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "http://hl7.org/fhir/uv/ips/ValueSet/allergy-reaction-uv-ips"
      }
    },
    {
      "id" : "AllergyIntolerance.reaction.manifestation.coding",
      "path" : "AllergyIntolerance.reaction.manifestation.coding",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.reaction.manifestation.coding.system",
      "path" : "AllergyIntolerance.reaction.manifestation.coding.system",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.reaction.manifestation.coding.code",
      "path" : "AllergyIntolerance.reaction.manifestation.coding.code",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.reaction.severity",
      "path" : "AllergyIntolerance.reaction.severity",
      "short" : "Reaction severity",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Schweregrad"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Clinical assessment of the severity of the reaction event as a whole, potentially taking multiple manifestations into account.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Schweregrad der tatsächlich aufgetretenen Reaktion."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.reaction.exposureRoute",
      "path" : "AllergyIntolerance.reaction.exposureRoute",
      "short" : "Route by which the subject was exposed to the substance",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Expositionsweg"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Identifies the route by which the subject was exposed to the substance.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Weg, über den der Patient dem auslösenden Stoff oder Produkt ausgesetzt war."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.reaction.exposureRoute.coding",
      "path" : "AllergyIntolerance.reaction.exposureRoute.coding",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.reaction.exposureRoute.coding.system",
      "path" : "AllergyIntolerance.reaction.exposureRoute.coding.system",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.reaction.exposureRoute.coding.code",
      "path" : "AllergyIntolerance.reaction.exposureRoute.coding.code",
      "mustSupport" : true
    }]
  }
}

```
