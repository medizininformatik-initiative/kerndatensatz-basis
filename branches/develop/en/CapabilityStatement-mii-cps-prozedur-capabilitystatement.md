# MII CPS Prozedur CapabilityStatement - MII Implementation Guide Core Dataset Base v2027.0.0-dev

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII CPS Prozedur CapabilityStatement**

## CapabilityStatement: MII CPS Prozedur CapabilityStatement 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/CapabilityStatement/metadata | *Version*:2027.0.0-dev |
| Active as of 2026-06-15 | *Computable Name*:MII_CPS_Prozedur_CapabilityStatement |

 
Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss um das Modul Prozedur der Medizininformatik Initiative zu implementieren. 

 [Raw OpenAPI-Swagger Definition file](../mii-cps-prozedur-capabilitystatement.openapi.json) | [Download](../mii-cps-prozedur-capabilitystatement.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "mii-cps-prozedur-capabilitystatement",
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
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablecapabilitystatement",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablecapabilitystatement"]
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
    "valueMarkdown" : "Use this CapabilityStatement to determine the minimum RESTful server capabilities required for a system that implements the corresponding module of the Medical Informatics Initiative core dataset. It lists the FHIR resource types and MII profiles that SHALL be supported, together with required interactions, supported formats, and search parameters for read and search access. Systems claiming conformance to the module are expected to implement the listed capabilities according to the stated conformance expectations."
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/CapabilityStatement/metadata",
  "version" : "2027.0.0-dev",
  "name" : "MII_CPS_Prozedur_CapabilityStatement",
  "title" : "MII CPS Prozedur CapabilityStatement",
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
  "description" : "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss um das Modul Prozedur der Medizininformatik Initiative zu implementieren.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "purpose" : "Define the minimum capabilities a system must support to implement and claim conformance to the MII Procedure module.",
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["xml", "json"],
  "rest" : [{
    "mode" : "server",
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "Procedure",
      "profile" : "http://hl7.org/fhir/StructureDefinition/Procedure",
      "supportedProfile" : ["https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure|2027.0.0-dev"],
      "_supportedProfile" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }]
      }],
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "read"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "search-type"
      }],
      "searchParam" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_count",
        "type" : "special",
        "documentation" : "**Example:**\n`GET [base]/Procedure?_count=10`\n\n**Notes:**\nFor further details see FHIR core specification, section [Page Count](https://hl7.org/fhir/R4/search.html#count)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_summary",
        "type" : "special",
        "documentation" : "**Example:**\n`GET [base]/Procedure?_summary=count`\n\n**Notes:**\nFor further details see FHIR core specification, section [Summary](https://hl7.org/fhir/R4/search.html#summary)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_id",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-id",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Procedure?_id=mii-exa-prozedur-procedure`\n\n**Notes:**\nFor further details see FHIR core specification, section [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_lastUpdated",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated",
        "type" : "date",
        "documentation" : "**Example:**\n`GET [base]/Procedure?_lastUpdated=ge2020-01-01`\n\n**Notes:**\nSearches on `Procedure.meta.lastUpdated`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#_lastUpdated)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_profile",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-profile",
        "type" : "uri",
        "documentation" : "**Example:**\n`GET [base]/Procedure?_profile=https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure|2027.0.0-dev`\n\n**Notes:**\nSearches on `Procedure.meta.profile`. For further details see FHIR core specification, section [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "status",
        "definition" : "http://hl7.org/fhir/SearchParameter/Procedure-status",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Procedure?status=completed`\n\n**Notes:**\nSearches on `Procedure.status`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "category",
        "definition" : "http://hl7.org/fhir/SearchParameter/Procedure-category",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Procedure?category=http://snomed.info/sct|277132007`\n`GET [base]/Procedure?category=277132007`\n\n**Notes:**\nSearches on `Procedure.category`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "code",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-code",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Procedure?code=http://fhir.de/CodeSystem/bfarm/ops|5-470`\n`GET [base]/Procedure?code=5-470`\n\n**Notes:**\nSearches on `Procedure.code`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "date",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-date",
        "type" : "date",
        "documentation" : "**Example:**\n`GET [base]/Procedure?date=2020-01-08`\n`GET [base]/Procedure?date=ge2020-01-08&date=lt2020-01-09`\n\n**Notes:**\nSearches on `Procedure.performed[x]`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#date)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "patient",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-patient",
        "type" : "reference",
        "documentation" : "**Example:**\n`GET [base]/Procedure?patient=Patient/mii-exa-person-patient-1`\n`GET [base]/Procedure?patient=mii-exa-person-patient-1`\n\n**Notes:**\nSearches on `Procedure.subject` where the subject is a Patient. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "subject",
        "definition" : "http://hl7.org/fhir/SearchParameter/Procedure-subject",
        "type" : "reference",
        "documentation" : "**Example:**\n`GET [base]/Procedure?subject=Patient/mii-exa-person-patient-1`\n`GET [base]/Procedure?subject=mii-exa-person-patient-1`\n\n**Notes:**\nSearches on `Procedure.subject`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "bodySite",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-bodysite",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Procedure?bodySite=http://snomed.info/sct|181255000`\n`GET [base]/Procedure?bodySite=181255000`\n\n**Notes:**\nSearches on `Procedure.bodySite`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "dokumentationsdatum",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-dokumentationsdatum",
        "type" : "date",
        "documentation" : "**Example:**\n`GET [base]/Procedure?dokumentationsdatum=2020-01-08`\n\n**Notes:**\nSearches on `Procedure.extension('http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum').value`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#date)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "durchfuehrungsabsicht",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-durchfuehrungsabsicht",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Procedure?durchfuehrungsabsicht=http://snomed.info/sct|262202000`\n`GET [base]/Procedure?durchfuehrungsabsicht=262202000`\n\n**Notes:**\nSearches on `Procedure.extension('https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht').value`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "ops-seitenlokalisation",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-ops-seitenlokalisation",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Procedure?ops-seitenlokalisation=https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_SEITENLOKALISATION|L`\n\n**Notes:**\nSearches on `Procedure.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/ops').extension('http://fhir.de/StructureDefinition/seitenlokalisation').valueCoding.code`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      }]
    }]
  }]
}

```
