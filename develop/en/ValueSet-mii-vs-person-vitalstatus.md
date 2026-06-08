# MII VS Person Vitalstatus - MII Implementation Guide Core Dataset Base v2026.0.0

## ValueSet: MII VS Person Vitalstatus 

 
Enthält alle Werte, die den Vitalstatus einer Person beschreiben. 

 **References** 

* [MII PR Person Vitalstatus](StructureDefinition-mii-pr-person-vitalstatus.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-person-vitalstatus",
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
    }],
    "profile" : ["http://hl7.org/fhir/StructureDefinition/shareablevalueset"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm",
    "valueCoding" : {
      "system" : "http://hl7.org/fhir/version-algorithm",
      "code" : "semver",
      "display" : "SemVer"
    }
  }],
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/ValueSet/Vitalstatus",
  "version" : "2026.0.0",
  "name" : "MII_VS_Person_Vitalstatus",
  "title" : "MII VS Person Vitalstatus",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-12-04",
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
  "description" : "Enthält alle Werte, die den Vitalstatus einer Person beschreiben.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/CodeSystem/Vitalstatus"
    }]
  }
}

```
