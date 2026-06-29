# MII CPS Diagnose CapabilityStatement - MII Implementation Guide Core Dataset Base v2026.0.0

## CapabilityStatement: MII CPS Diagnose CapabilityStatement 

 
Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss, um das Modul Diagnose der Medizininformatik Initiative zu implementieren. 

 [Rohdatei der OpenAPI-/Swagger-Definition](../mii-cps-diagnose-capabilitystatement.openapi.json) | [Download](../mii-cps-diagnose-capabilitystatement.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "mii-cps-diagnose-capabilitystatement",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/CapabilityStatement/metadata",
  "version" : "2026.0.0",
  "name" : "MII_CPS_Diagnose_CapabilityStatement",
  "title" : "MII CPS Diagnose CapabilityStatement",
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
  "description" : "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss, um das Modul Diagnose der Medizininformatik Initiative zu implementieren.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "purpose" : "Define the minimum capabilities a system must support to implement and claim conformance to the MII Diagnosis module.",
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
      "type" : "Condition",
      "profile" : "http://hl7.org/fhir/StructureDefinition/Condition",
      "supportedProfile" : ["https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose|2026.0.0"],
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
        "documentation" : "**Example:**\n`GET [base]/Condition?_count=10`\n\n**Notes:**\nFor further details see FHIR core specification, section [Page Count](https://www.hl7.org/fhir/R4/search.html#count)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_summary",
        "type" : "special",
        "documentation" : "**Example:**\n`GET [base]/Condition?_summary=count`\n\n**Notes:**\nFor further details see FHIR core specification, section [Summary](https://www.hl7.org/fhir/R4/search.html#summary)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_id",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-id",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Condition?_id=mii-exa-diagnose-appendicitis`\n\n**Notes:**\nFor further details see FHIR core specification, section [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_lastUpdated",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated",
        "type" : "date",
        "documentation" : "**Example:**\n`GET [base]/Condition?_lastUpdated=ge2026-01-01`\n\n**Notes:**\nSearches on `Condition.meta.lastUpdated`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#_lastUpdated)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_profile",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-profile",
        "type" : "uri",
        "documentation" : "**Example:**\n`GET [base]/Condition?_profile=https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose|2026.0.0`\n\n**Notes:**\nSearches on `Condition.meta.profile`. For further details see FHIR core specification, section [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "abatement-age",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-abatement-age",
        "type" : "quantity",
        "documentation" : "**Example:**\n`GET [base]/Condition?abatement-age=20|http://unitsofmeasure.org|a`\n\n**Notes:**\nSearches on `Condition.abatement.ofType(Age)`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#quantity)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "abatement-date",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-abatement-date",
        "type" : "date",
        "documentation" : "**Example:**\n`GET [base]/Condition?abatement-date=2020-01-08`\n\n**Notes:**\nSearches on `Condition.abatement.ofType(dateTime)`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#date)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "abatement-string",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-abatement-string",
        "type" : "string",
        "documentation" : "**Example:**\n`GET [base]/Condition?abatement-string=resolved`\n\n**Notes:**\nSearches on `Condition.abatement.ofType(string)`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "body-site",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-body-site",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Condition?body-site=elbow`\n\n**Notes:**\nSearches on `Condition.bodySite`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "category",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-category",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Condition?category=problem-list-item`\n\n**Notes:**\nSearches on `Condition.category`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "clinical-status",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-clinical-status",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Condition?clinical-status=active`\n\n**Notes:**\nSearches on `Condition.clinicalStatus`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "code",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-code",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Condition?code=http://fhir.de/CodeSystem/bfarm/icd-10-gm|K35.8`\n`GET [base]/Condition?code=K35.8`\n\n**Notes:**\nSearches on `Condition.code`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "encounter",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-encounter",
        "type" : "reference",
        "documentation" : "**Example:**\n`GET [base]/Condition?encounter=Encounter/mii-exa-fall-kontakt-gesundheitseinrichtung-2`\n`GET [base]/Condition?encounter=mii-exa-fall-kontakt-gesundheitseinrichtung-2`\n\n**Notes:**\nSearches on `Condition.encounter`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "evidence",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-evidence",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Condition?evidence=manifestation`\n\n**Notes:**\nSearches on `Condition.evidence`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "evidence-detail",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-evidence-detail",
        "type" : "reference",
        "documentation" : "**Example:**\n`GET [base]/Condition?evidence-detail=Observation/mii-exa-person-observation-vitalstatus`\n`GET [base]/Condition?evidence-detail=mii-exa-person-observation-vitalstatus`\n\n**Notes:**\nSearches on `Condition.evidence.detail`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "identifier",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-identifier",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Condition?identifier=diagnose-1`\n\n**Notes:**\nSearches on `Condition.identifier`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "onset-age",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-onset-age",
        "type" : "quantity",
        "documentation" : "**Example:**\n`GET [base]/Condition?onset-age=20|http://unitsofmeasure.org|a`\n\n**Notes:**\nSearches on `Condition.onset.ofType(Age)`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#quantity)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "onset-date",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-onset-date",
        "type" : "date",
        "documentation" : "**Example:**\n`GET [base]/Condition?onset-date=2020-01-08`\n\n**Notes:**\nSearches on `Condition.onset.ofType(dateTime)`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#date)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "onset-info",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-onset-info",
        "type" : "string",
        "documentation" : "**Example:**\n`GET [base]/Condition?onset-info=2019-09-26`\n\n**Notes:**\nSearches on `Condition.onset.ofType(string)`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "patient",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-patient",
        "type" : "reference",
        "documentation" : "**Example:**\n`GET [base]/Condition?patient=Patient/mii-exa-person-patient-1`\n`GET [base]/Condition?patient=mii-exa-person-patient-1`\n\n**Notes:**\nSearches on `Condition.subject` where the subject is a Patient. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "recorded-date",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-recorded-date",
        "type" : "date",
        "documentation" : "**Example:**\n`GET [base]/Condition?recorded-date=2020-01-08`\n\n**Notes:**\nSearches on `Condition.recordedDate`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#date)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "severity",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-severity",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Condition?severity=moderate`\n\n**Notes:**\nSearches on `Condition.severity`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "stage",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-stage",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Condition?stage=initial`\n\n**Notes:**\nSearches on `Condition.stage`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "subject",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-subject",
        "type" : "reference",
        "documentation" : "**Example:**\n`GET [base]/Condition?subject=Patient/mii-exa-person-patient-1`\n`GET [base]/Condition?subject=mii-exa-person-patient-1`\n\n**Notes:**\nSearches on `Condition.subject`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "verification-status",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-verification-status",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Condition?verification-status=confirmed`\n\n**Notes:**\nSearches on `Condition.verificationStatus`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "icd10gm-diagnosesicherheit",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-icd10gm-diagnosesicherheit",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Condition?icd10gm-diagnosesicherheit=https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_DIAGNOSESICHERHEIT|G`\n\n**Notes:**\nSearches on `Condition.code.coding.extension.where(url='http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit').value`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "icd10gm-mehrfachcodierung",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-icd10gm-mehrfachcodierung",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Condition?icd10gm-mehrfachcodierung=http://fhir.de/CodeSystem/icd-10-gm-mehrfachcodierungs-kennzeichen|†`\n\n**Notes:**\nSearches on `Condition.code.coding.extension.where(url='http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen').value`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "icd10gm-seitenlokalisation",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-icd10gm-seitenlokalisation",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Condition?icd10gm-seitenlokalisation=https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_SEITENLOKALISATION|L`\n\n**Notes:**\nSearches on `Condition.code.coding.extension.where(url='http://fhir.de/StructureDefinition/seitenlokalisation').value`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      }]
    }]
  }]
}

```
