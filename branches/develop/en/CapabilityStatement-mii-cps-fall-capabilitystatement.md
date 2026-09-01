# MII CPS Fall CapabilityStatement - MII Implementation Guide Core Dataset Base v2027.0.0-dev

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII CPS Fall CapabilityStatement**

## CapabilityStatement: MII CPS Fall CapabilityStatement 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/core/modul-fall/CapabilityStatement/metadata | *Version*:2027.0.0-dev |
| Active as of 2026-06-15 | *Computable Name*:MII_CPS_Fall_CapabilityStatement |

 
Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss, um das Modul Fall der Medizininformatik Initiative zu implementieren. 

 [Raw OpenAPI-Swagger Definition file](../mii-cps-fall-capabilitystatement.openapi.json) | [Download](../mii-cps-fall-capabilitystatement.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "mii-cps-fall-capabilitystatement",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/CapabilityStatement/metadata",
  "version" : "2027.0.0-dev",
  "name" : "MII_CPS_Fall_CapabilityStatement",
  "title" : "MII CPS Fall CapabilityStatement",
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
  "description" : "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss, um das Modul Fall der Medizininformatik Initiative zu implementieren.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "purpose" : "Define the minimum capabilities a system must support to implement and claim conformance to the MII Encounter module.",
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
      "type" : "Encounter",
      "profile" : "http://hl7.org/fhir/StructureDefinition/Encounter",
      "supportedProfile" : ["https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung|2027.0.0-dev"],
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
        "documentation" : "**Example:**\n`GET [base]/Encounter?_count=10`\n\n**Notes:**\nFor further details see FHIR core specification, section [Page Count](https://www.hl7.org/fhir/R4/search.html#count)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_summary",
        "type" : "special",
        "documentation" : "**Example:**\n`GET [base]/Encounter?_summary=count`\n\n**Notes:**\nFor further details see FHIR core specification, section [Summary](https://www.hl7.org/fhir/R4/search.html#summary)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_id",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-id",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Encounter?_id=mii-exa-fall-kontakt-gesundheitseinrichtung-1`\n\n**Notes:**\nSearches on `Encounter.id`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_lastUpdated",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated",
        "type" : "date",
        "documentation" : "**Example:**\n`GET [base]/Encounter?_lastUpdated=ge2026-05-05`\n\n**Notes:**\nSearches on `Encounter.meta.lastUpdated`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#date)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_profile",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-profile",
        "type" : "uri",
        "documentation" : "**Example:**\n`GET [base]/Encounter?_profile=https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung`\n\n**Notes:**\nSearches on `Encounter.meta.profile`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#uri)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "identifier",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-identifier",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Encounter?identifier=https://www.charite.de/fhir/sid/aufnahmenummer|E0`\n`GET [base]/Encounter?identifier=E0`\n\n**Notes:**\nSearches on `Encounter.identifier`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "status",
        "definition" : "http://hl7.org/fhir/SearchParameter/Encounter-status",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Encounter?status=finished`\n\n**Notes:**\nSearches on `Encounter.status`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "class",
        "definition" : "http://hl7.org/fhir/SearchParameter/Encounter-class",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Encounter?class=http://terminology.hl7.org/CodeSystem/v3-ActCode|IMP`\n`GET [base]/Encounter?class=IMP`\n\n**Notes:**\nSearches on `Encounter.class`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "type",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-type",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Encounter?type=http://fhir.de/CodeSystem/Kontaktebene|einrichtungskontakt`\n`GET [base]/Encounter?type=einrichtungskontakt`\n\n**Notes:**\nSearches on `Encounter.type`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "category",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-category",
        "type" : "token"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "subject",
        "definition" : "http://hl7.org/fhir/SearchParameter/Encounter-subject",
        "type" : "reference",
        "documentation" : "**Example:**\n`GET [base]/Encounter?subject=Patient/DHPYT7SPMZBGZE46`\n`GET [base]/Encounter?subject=DHPYT7SPMZBGZE46`\n\n**Notes:**\nSearches on `Encounter.subject`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "date",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-date",
        "type" : "date",
        "documentation" : "**Example:**\n`GET [base]/Encounter?date=2020-01-08`\n\n**Notes:**\nSearches on `Encounter.period`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#date)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "diagnosis",
        "definition" : "http://hl7.org/fhir/SearchParameter/Encounter-diagnosis",
        "type" : "reference",
        "documentation" : "**Example:**\n`GET [base]/Encounter?diagnosis=Condition/DHPYT7SPS2RNMVLB`\n`GET [base]/Encounter?diagnosis=DHPYT7SPS2RNMVLB`\n\n**Notes:**\nSearches on `Encounter.diagnosis.condition`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "location",
        "definition" : "http://hl7.org/fhir/SearchParameter/Encounter-location",
        "type" : "reference",
        "documentation" : "**Example:**\n`GET [base]/Encounter?location:identifier=https://www.charite.de/fhir/sid/Zimmernummern|RHC-06-210b`\n\n**Notes:**\nSearches on `Encounter.location.location.identifier`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "service-provider",
        "definition" : "http://hl7.org/fhir/SearchParameter/Encounter-service-provider",
        "type" : "reference",
        "documentation" : "**Example:**\n`GET [base]/Encounter?service-provider=Organization/DHPYT7SPMZBGZE5W`\n`GET [base]/Encounter?service-provider=DHPYT7SPMZBGZE5W`\n\n**Notes:**\nSearches on `Encounter.serviceProvider`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "part-of",
        "definition" : "http://hl7.org/fhir/SearchParameter/Encounter-part-of",
        "type" : "reference",
        "documentation" : "**Example:**\n`GET [base]/Encounter?part-of=Encounter/DHPYT7SPS2RNMVLD`\n`GET [base]/Encounter?part-of=DHPYT7SPS2RNMVLD`\n\n**Notes:**\nSearches on `Encounter.partOf`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "service-type",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-servicetype",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Encounter?service-type=http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel|1500`\n`GET [base]/Encounter?service-type=1500`\n\n**Notes:**\nSearches on `Encounter.serviceType`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "diagnosis-use",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-diagnosis-use",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Encounter?diagnosis-use=http://terminology.hl7.org/CodeSystem/diagnosis-role|AD`\n`GET [base]/Encounter?diagnosis-use=AD`\n\n**Notes:**\nSearches on `Encounter.diagnosis.use`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "hospitalization-admitsource",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-hospitalization-admitsource",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Encounter?hospitalization-admitsource=http://fhir.de/CodeSystem/dgkev/Aufnahmeanlass|N`\n`GET [base]/Encounter?hospitalization-admitsource=N`\n\n**Notes:**\nSearches on `Encounter.hospitalization.admitSource`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "location-physical-type",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-location-physical-type",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Encounter?location-physical-type=http://terminology.hl7.org/CodeSystem/location-physical-type|ro`\n`GET [base]/Encounter?location-physical-type=ro`\n\n**Notes:**\nSearches on `Encounter.location.physicalType`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "account",
        "definition" : "http://hl7.org/fhir/SearchParameter/Encounter-account",
        "type" : "reference",
        "documentation" : "**Example:**\n`GET [base]/Encounter?account:identifier=https://www.charite.de/fhir/sid/fallnummer|F-2020-000123`\n\n**Notes:**\nSearches on `Encounter.account`. Use the `:identifier` modifier to search by Fallnummer stored as a logical reference in `Encounter.account.identifier`, without requiring the Account resource to be present. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."
      }]
    }]
  }]
}

```
