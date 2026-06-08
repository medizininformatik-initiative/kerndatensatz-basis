# MII CPS Person CapabilityStatement - MII Implementation Guide Core Dataset Base v2026.0.0

## CapabilityStatement: MII CPS Person CapabilityStatement 

 
Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss um das Modul Person der Medizininformatik Initiative zu implementieren. 

 [Raw OpenAPI-Swagger Definition file](../mii-cps-person-capabilitystatement.openapi.json) | [Download](../mii-cps-person-capabilitystatement.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "mii-cps-person-capabilitystatement",
  "meta" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://hl7.org/fhir/spdx-license",
          "code" : "CC-BY-4.0",
          "display" : "Creative Commons Attribution 4.0 International"
        }]
      }
    }]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm",
    "valueCoding" : {
      "system" : "http://hl7.org/fhir/version-algorithm",
      "code" : "semver",
      "display" : "SemVer"
    }
  }],
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/CapabilityStatement/metadata",
  "version" : "2026.0.0",
  "name" : "MII_CPS_Person_CapabilityStatement",
  "title" : "MII CPS Person CapabilityStatement",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-05-11",
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
  "description" : "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss um das Modul Person der Medizininformatik Initiative zu implementieren.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
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
      "type" : "Patient",
      "supportedProfile" : ["https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient|2026.0.0",
      "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert|2026.0.0"],
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
        "documentation" : "**Example:**\n`GET [base]/Patient?_count=10`\n\n**Notes:**\nFor further details see FHIR core specification, section [Page Count](https://www.hl7.org/fhir/R4/search.html#count)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_summary",
        "type" : "special",
        "documentation" : "**Example:**\n`GET [base]/Patient?_summary=count`\n\n**Notes:**\nFor further details see FHIR core specification, section [Summary](https://www.hl7.org/fhir/R4/search.html#summary)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_id",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-id",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Patient?_id=mii-exa-person-patient-1`\n\n**Notes:**\nThe `_id` parameter is rarely used on its own since the `READ` interaction is more appropriate for fetching a single resource by id. It can be combined with `_include` to pull related resources in one request, e.g.:\n`GET [base]/Patient?_id=mii-exa-person-patient-1&_include=Patient:link`\nFor further details see FHIR core specification, section [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_profile",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-profile",
        "type" : "uri",
        "documentation" : "**Example:**\n`GET [base]/Patient?_profile=https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient|2026.0.0`\n\n**Notes:**\nSearches on `Patient.meta.profile`. For further details see FHIR core specification, section [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "identifier",
        "definition" : "http://hl7.org/fhir/SearchParameter/Patient-identifier",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Patient?identifier=https://www.charite.de/fhir/sid/patienten|42285243`\n`GET [base]/Patient?identifier=42285243`\n\n**Notes:**\nSearches on `Patient.identifier`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "assigner-pid",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-assignerpid",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Patient?assigner-pid=https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier|Charité`\n`GET [base]/Patient?assigner-pid=http://fhir.de/sid/arge-ik/iknr|260326822`\n\n**Notes:**\nSearches on `Patient.identifier.assigner`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "given",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-given",
        "type" : "string",
        "documentation" : "**Example:**\n`GET [base]/Patient?given=Maja`\n\n**Notes:**\nSearches on `Patient.name.given`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "family",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-family",
        "type" : "string",
        "documentation" : "**Example:**\n`GET [base]/Patient?family=Van-der-Dussen`\n\n**Notes:**\nSearches on `Patient.name.family`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "name",
        "definition" : "http://hl7.org/fhir/SearchParameter/Patient-name",
        "type" : "string",
        "documentation" : "**Example:**\n`GET [base]/Patient?name=Van-der-Dussen`\n`GET [base]/Patient?name=Maja`\n\n**Notes:**\nSearches on `Patient.name`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "prefix",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-prefix",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Patient?prefix=Prof. Dr. med.`\n\n**Notes:**\nSearches on `Patient.name.prefix`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "prefix-qualifier",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-prefixqualifier",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Patient?prefix-qualifier=AC`\n\n**Notes:**\nSearches on `Patient.name.prefix.extension:prefix-qualifier`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "gender",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-gender",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Patient?gender=female`\n\n**Notes:**\nSearches on `Patient.gender`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "other-amtlich",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-otheramtlich",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Patient?other-amtlich=http://fhir.de/CodeSystem/gender-amtlich-de|D`\n\n**Notes:**\nSearches on `Patient.gender.extension:other-amtlich`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "birthdate",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-birthdate",
        "type" : "date",
        "documentation" : "**Example:**\n`GET [base]/Patient?birthdate=1998-09-19`\n`GET [base]/Patient?birthdate=ge1990-01-01&birthdate=le2000-12-31`\n\n**Notes:**\nSearches on `Patient.birthDate`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#date)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "death-date",
        "definition" : "http://hl7.org/fhir/SearchParameter/Patient-death-date",
        "type" : "date",
        "documentation" : "**Example:**\n`GET [base]/Patient?death-date=2021-01-01`\n\n**Notes:**\nSearches on `Patient.deceased`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#date)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "deceased",
        "definition" : "http://hl7.org/fhir/SearchParameter/Patient-deceased",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Patient?deceased=false`\n\n**Notes:**\nSearches on `Patient.deceased`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "address",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-address",
        "type" : "string",
        "documentation" : "**Example:**\n`GET [base]/Patient?address=Berlin`\n\n**Notes:**\nSearches on `Patient.address`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "address-city",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-address-city",
        "type" : "string",
        "documentation" : "**Example:**\n`GET [base]/Patient?address-city=Berlin`\n\n**Notes:**\nSearches on `Patient.address.city`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "address-postalcode",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-address-postalcode",
        "type" : "string",
        "documentation" : "**Example:**\n`GET [base]/Patient?address-postalcode=10178`\n\n**Notes:**\nSearches on `Patient.address.postalCode`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "address-country",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-address-country",
        "type" : "string",
        "documentation" : "**Example:**\n`GET [base]/Patient?address-country=DE`\n\n**Notes:**\nSearches on `Patient.address.country`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "gemeindeschluessel",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-gemeindeschluessel",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Patient?gemeindeschluessel=http://fhir.de/sid/destatis/ags|11000000`\n\n**Notes:**\nSearches on `Patient.address.city.extension:gemeindeschluessel`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "strasse",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-strasse",
        "type" : "string",
        "documentation" : "**Example:**\n`GET [base]/Patient?strasse=Anna-Louisa-Karsch%20Str.`\n\n**Notes:**\nSearches on `Patient.address.line.extension:Strasse`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "hausnummer",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-hausnummer",
        "type" : "string",
        "documentation" : "**Example:**\n`GET [base]/Patient?hausnummer=2`\n\n**Notes:**\nSearches on `Patient.address.line.extension:Hausnummer`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "adresszusatz",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-adresszusatz",
        "type" : "string",
        "documentation" : "**Example:**\n`GET [base]/Patient?adresszusatz=c%2FO%20Abteilung%20XYZ`\n\n**Notes:**\nSearches on `Patient.address.line.extension:Adresszusatz`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "postfach",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-postfach",
        "type" : "string",
        "documentation" : "**Example:**\n`GET [base]/Patient?postfach=Postfach-252618`\n\n**Notes:**\nSearches on `Patient.address.line.extension:Postfach`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "stadtteil",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-stadtteil",
        "type" : "string",
        "documentation" : "**Example:**\n`GET [base]/Patient?stadtteil=Berlin-Mitte`\n\n**Notes:**\nSearches on `Patient.address.extension:Stadtteil`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#string)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "link",
        "definition" : "http://hl7.org/fhir/SearchParameter/Patient-link",
        "type" : "reference",
        "documentation" : "**Example:**\n`GET [base]/Patient?link=Patient/mii-exa-person-patient-1`\n\n**Notes:**\nSearches on `Patient.link.other`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "Observation",
      "supportedProfile" : ["https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Vitalstatus|2026.0.0"],
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
        "documentation" : "**Example:**\n`GET [base]/Observation?_count=10`\n\n**Notes:**\nFor further details see FHIR core specification, section [Page Count](https://www.hl7.org/fhir/R4/search.html#count)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_summary",
        "type" : "special",
        "documentation" : "**Example:**\n`GET [base]/Observation?_summary=count`\n\n**Notes:**\nFor further details see FHIR core specification, section [Summary](https://www.hl7.org/fhir/R4/search.html#summary)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_id",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-id",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Observation?_id=mii-exa-person-observation-vitalstatus`\n\n**Notes:**\nFor further details see FHIR core specification, section [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_profile",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-profile",
        "type" : "uri",
        "documentation" : "**Example:**\n`GET [base]/Observation?_profile=https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Vitalstatus|2026.0.0`\n\n**Notes:**\nSearches on `Observation.meta.profile`. For further details see FHIR core specification, section [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "status",
        "definition" : "http://hl7.org/fhir/SearchParameter/Observation-status",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Observation?status=final`\n\n**Notes:**\nSearches on `Observation.status`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "code",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-code",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Observation?code=http://loinc.org|67162-8`\n\n**Notes:**\nSearches on `Observation.code`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "subject",
        "definition" : "http://hl7.org/fhir/SearchParameter/Observation-subject",
        "type" : "reference",
        "documentation" : "**Example:**\n`GET [base]/Observation?subject=Patient/mii-exa-person-patient-1`\n\n**Notes:**\nSearches on `Observation.subject`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "patient",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-patient",
        "type" : "reference",
        "documentation" : "**Example:**\n`GET [base]/Observation?patient=Patient/mii-exa-person-patient-1`\n\n**Notes:**\nSearches on `Observation.subject` where the subject is a Patient. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "date",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-date",
        "type" : "date",
        "documentation" : "**Example:**\n`GET [base]/Observation?date=2020-01-08`\n`GET [base]/Observation?date=ge2020-01-01&date=le2020-12-31`\n\n**Notes:**\nSearches on `Observation.effective`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#date)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "value-concept",
        "definition" : "http://hl7.org/fhir/SearchParameter/Observation-value-concept",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Observation?value-concept=https://www.medizininformatik-initiative.de/fhir/core/modul-person/CodeSystem/Vitalstatus|L`\n\n**Notes:**\nSearches on `Observation.value` as CodeableConcept. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "code-value-concept",
        "definition" : "http://hl7.org/fhir/SearchParameter/Observation-code-value-concept",
        "type" : "composite",
        "documentation" : "**Example:**\n`GET [base]/Observation?code-value-concept=http://loinc.org|67162-8$https://www.medizininformatik-initiative.de/fhir/core/modul-person/CodeSystem/Vitalstatus|L`\n\n**Notes:**\nCombines `Observation.code` and `Observation.value` as CodeableConcept in a single filter. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#composite)."
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "Condition",
      "supportedProfile" : ["https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Todesursache|2026.0.0"],
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
        "documentation" : "**Example:**\n`GET [base]/Condition?_id=mii-exa-diagnose-mehrfachcodierung-primaercode`\n\n**Notes:**\nFor further details see FHIR core specification, section [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)."
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
        "name" : "category",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-category",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Condition?category=http://snomed.info/sct|161000001`\n\n**Notes:**\nSearches on `Condition.category`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "code",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-code",
        "type" : "token",
        "documentation" : "**Example:**\n`GET [base]/Condition?code=http://fhir.de/CodeSystem/bfarm/icd-10-gm|A54.4`\n\n**Notes:**\nSearches on `Condition.code`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#token)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "subject",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-subject",
        "type" : "reference",
        "documentation" : "**Example:**\n`GET [base]/Condition?subject=Patient/mii-exa-person-patient-1`\n\n**Notes:**\nSearches on `Condition.subject`. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "patient",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-patient",
        "type" : "reference",
        "documentation" : "**Example:**\n`GET [base]/Condition?patient=Patient/mii-exa-person-patient-1`\n\n**Notes:**\nSearches on `Condition.subject` where the subject is a Patient. For further details see [FHIR core specification](https://hl7.org/fhir/R4/search.html#reference)."
      }]
    }]
  }]
}

```
