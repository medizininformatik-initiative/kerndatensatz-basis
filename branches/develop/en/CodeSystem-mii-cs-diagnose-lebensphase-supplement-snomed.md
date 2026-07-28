# MII CS Diagnose Lebensphase Supplement SNOMED - MII Implementation Guide Core Dataset Base v2027.0.0-dev

## CodeSystem: MII CS Diagnose Lebensphase Supplement SNOMED (Experimental) 

 
CodeSystem Supplement mit Definitionen zu den SNOMED-Konzepten für Lebensphasen. 

This Code system is referenced in the definition of the following value sets:

* This CodeSystem Supplement is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "mii-cs-diagnose-lebensphase-supplement-snomed",
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
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablecodesystem"]
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
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-effectivePeriod",
    "valuePeriod" : {
      "start" : "2027"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-approvalDate",
    "valueDate" : "2024-03-07"
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
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-topic",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl",
        "code" : "C15607"
      }]
    }
  }],
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/CodeSystem/mii-cs-diagnose-lebensphase-supplement-snomed",
  "version" : "2027.0.0-dev",
  "name" : "MII_CS_Diagnose_Lebensphase_Supplement_SNOMED",
  "title" : "MII CS Diagnose Lebensphase Supplement SNOMED",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-07-17",
  "publisher" : "Medical Informatics Initiative (MII)",
  "contact" : [{
    "name" : "Medical Informatics Initiative (MII)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/en"
    }]
  }],
  "description" : "CodeSystem Supplement mit Definitionen zu den SNOMED-Konzepten für Lebensphasen.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "purpose" : "Provide German language descriptions for SNOMED CT concepts related to life phases used in the MII Diagnosis module.",
  "copyright" : "This material includes SNOMED Clinical Terms® (SNOMED CT®) which is used by permission of SNOMED International. All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists. SNOMED and SNOMED CT are registered trademarks of SNOMED International. Implementers of these artefacts must have the appropriate SNOMED CT Affiliate license.",
  "content" : "supplement",
  "supplements" : "http://snomed.info/sct",
  "property" : [{
    "code" : "comment",
    "uri" : "http://hl7.org/fhir/concept-properties#comment",
    "type" : "string"
  }],
  "concept" : [{
    "code" : "271872005",
    "display" : "Old age (qualifier value)",
    "property" : [{
      "code" : "comment",
      "valueString" : "Ältere Person/ Senioren (mit Beginn des 65. Lebensjahres)"
    }]
  },
  {
    "code" : "41847000",
    "display" : "Adulthood (qualifier value)",
    "property" : [{
      "code" : "comment",
      "valueString" : "Erwachsener (ab Beginn des 19. Lebensjahres)"
    }]
  },
  {
    "code" : "263659003",
    "display" : "Adolescence (qualifier value)",
    "property" : [{
      "code" : "comment",
      "valueString" : "Jugendlicher (ab Beginn des 13. bis zum vollendeten 18. Lebensjahres)"
    }]
  },
  {
    "code" : "255398004",
    "display" : "Childhood (qualifier value)",
    "property" : [{
      "code" : "comment",
      "valueString" : "Kind (ab Beginn des 4. bis zum vollendeten 12. Lebensjahres)"
    }]
  },
  {
    "code" : "713153009",
    "display" : "Toddler (qualifier value)",
    "property" : [{
      "code" : "comment",
      "valueString" : "Kleinkind (ab Beginn des 13. Lebensmonat bis zum vollendeten 3. Lebensjahr)"
    }]
  },
  {
    "code" : "3658006",
    "display" : "Infancy (qualifier value)",
    "property" : [{
      "code" : "comment",
      "valueString" : "Säugling (ab Beginn des 29. Lebenstages bis zum vollendeten 12. Lebensmonat)"
    }]
  },
  {
    "code" : "255407002",
    "display" : "Neonatal (qualifier value)",
    "property" : [{
      "code" : "comment",
      "valueString" : "Neugeborenes (bis zum vollendeten 28. Lebenstag)"
    }]
  }]
}

```
