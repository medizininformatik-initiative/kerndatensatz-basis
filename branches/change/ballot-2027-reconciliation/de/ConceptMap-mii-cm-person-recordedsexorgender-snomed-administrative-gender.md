# MII CM Person Recorded Sex or Gender SNOMED to Administrative Gender - MII Implementation Guide Core Dataset Base v2027.0.0-ballot

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **MII CM Person Recorded Sex or Gender SNOMED to Administrative Gender**

## ConceptMap: MII CM Person Recorded Sex or Gender SNOMED to Administrative Gender 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/modul-person/ConceptMap/mii-cm-person-recordedsexorgender-snomed-administrative-gender | *Version*:2027.0.0-ballot |
| Active Stand: 2026-11-12 | *Maschinenlesbarer Name*:MII_CM_Person_RecordedSexOrGender_SNOMED_AdministrativeGender |
| **Copyright/Rechtliches**: This material includes SNOMED Clinical Terms® (SNOMED CT®) which is used by permission of SNOMED International. All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists. SNOMED and SNOMED CT are registered trademarks of SNOMED International. Implementers of these artefacts must have the appropriate SNOMED CT Affiliate license. | |

 
Maps the SNOMED CT codes of MII VS Person Recorded Sex or Gender SNOMED to FHIR AdministrativeGender. Recorded sex (e.g. sex assigned at birth) and administrative gender are different concepts, so no mapping is equivalent; each relationship is qualified. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "mii-cm-person-recordedsexorgender-snomed-administrative-gender",
  "meta" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license",
      "valueCode" : "CC-BY-4.0"
    }]
  },
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-person/ConceptMap/mii-cm-person-recordedsexorgender-snomed-administrative-gender",
  "version" : "2027.0.0-ballot",
  "name" : "MII_CM_Person_RecordedSexOrGender_SNOMED_AdministrativeGender",
  "title" : "MII CM Person Recorded Sex or Gender SNOMED to Administrative Gender",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-11-12",
  "publisher" : "Medical Informatics Initiative (MII)",
  "contact" : [{
    "name" : "Medical Informatics Initiative (MII)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/en"
    }]
  }],
  "description" : "Maps the SNOMED CT codes of MII VS Person Recorded Sex or Gender SNOMED to FHIR AdministrativeGender. Recorded sex (e.g. sex assigned at birth) and administrative gender are different concepts, so no mapping is equivalent; each relationship is qualified.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "purpose" : "Support deriving or checking Patient.gender from a recorded sex or gender in the Patient extension individual-recordedSexOrGender, without implying that both concepts are equivalent. It is not intended for the reverse direction.",
  "copyright" : "This material includes SNOMED Clinical Terms® (SNOMED CT®) which is used by permission of SNOMED International. All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists. SNOMED and SNOMED CT are registered trademarks of SNOMED International. Implementers of these artefacts must have the appropriate SNOMED CT Affiliate license.",
  "sourceCanonical" : "https://www.medizininformatik-initiative.de/fhir/modul-person/ValueSet/mii-vs-person-recordedsexorgender-snomed",
  "targetCanonical" : "http://hl7.org/fhir/ValueSet/administrative-gender",
  "group" : [{
    "source" : "http://snomed.info/sct",
    "target" : "http://hl7.org/fhir/administrative-gender",
    "element" : [{
      "code" : "248153007",
      "display" : "Male",
      "target" : [{
        "code" : "male",
        "display" : "Male",
        "equivalence" : "inexact",
        "comment" : "Recorded (biological) sex and administrative gender overlap but are different concepts; a person may have a different administrative gender."
      }]
    },
    {
      "code" : "248152002",
      "display" : "Female",
      "target" : [{
        "code" : "female",
        "display" : "Female",
        "equivalence" : "inexact",
        "comment" : "Recorded (biological) sex and administrative gender overlap but are different concepts; a person may have a different administrative gender."
      }]
    },
    {
      "code" : "32570691000036108",
      "display" : "Intersex",
      "target" : [{
        "code" : "other",
        "display" : "Other",
        "equivalence" : "inexact",
        "comment" : "In Germany, the administrative entries 'divers' (D) and 'ohne Angabe' (X) are represented as 'other' with the extension http://fhir.de/StructureDefinition/gender-amtlich-de; which of them applies cannot be derived from the recorded sex."
      }]
    },
    {
      "code" : "32570681000036106",
      "display" : "Indeterminate sex",
      "target" : [{
        "code" : "other",
        "display" : "Other",
        "equivalence" : "inexact",
        "comment" : "In Germany, a sex that cannot be determined at birth is registered as 'ohne Angabe' (X) or 'divers' (D), both represented as 'other' with the extension http://fhir.de/StructureDefinition/gender-amtlich-de."
      }]
    },
    {
      "code" : "261665006",
      "display" : "Unknown",
      "target" : [{
        "code" : "unknown",
        "display" : "Unknown",
        "equivalence" : "wider",
        "comment" : "AdministrativeGender 'unknown' also covers a gender that could not be uniquely defined, so the target is wider than the source."
      }]
    }]
  }]
}

```
