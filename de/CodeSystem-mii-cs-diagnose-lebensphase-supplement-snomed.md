# MII CS Diagnose Lebensphase Supplement SNOMED - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## CodeSystem: MII CS Diagnose Lebensphase Supplement SNOMED (Experimentell) 

 
CodeSystem Supplement mit Definitionen zu den SNOMED-Konzepten für Lebensphasen. 

Dieses CodeSystem wird in der Definition der folgenden ValueSets referenziert:

* This CodeSystem Supplement is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

**Changes since version {current}:**

* New Content

-------

 [Beschreibung der obigen Tabelle(n)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "mii-cs-diagnose-lebensphase-supplement-snomed",
  "meta" : {
    "profile" : [
      "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
    ]
  },
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/CodeSystem/mii-cs-diagnose-lebensphase-supplement-snomed",
  "version" : "2026.0.0-dev.1",
  "name" : "MII_CS_Diagnose_Lebensphase_Supplement_SNOMED",
  "title" : "MII CS Diagnose Lebensphase Supplement SNOMED",
  "status" : "active",
  "experimental" : true,
  "date" : "2024-11-13",
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
  "description" : "CodeSystem Supplement mit Definitionen zu den SNOMED-Konzepten für Lebensphasen.",
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
  "copyright" : "This material includes SNOMED Clinical Terms® (SNOMED CT®) which is used by permission of SNOMED International. All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists. SNOMED and SNOMED CT are registered trademarks of SNOMED International. Implementers of these artefacts must have the appropriate SNOMED CT Affiliate license.",
  "content" : "supplement",
  "supplements" : "http://snomed.info/sct",
  "property" : [
    {
      "code" : "comment",
      "uri" : "http://hl7.org/fhir/concept-properties#comment",
      "type" : "string"
    }
  ],
  "concept" : [
    {
      "code" : "271872005",
      "display" : "Old age (qualifier value)",
      "property" : [
        {
          "code" : "comment",
          "valueString" : "Ältere Person/ Senioren (mit Beginn des 65. Lebensjahres)"
        }
      ]
    },
    {
      "code" : "41847000",
      "display" : "Adulthood (qualifier value)",
      "property" : [
        {
          "code" : "comment",
          "valueString" : "Erwachsener (ab Beginn des 19. Lebensjahres)"
        }
      ]
    },
    {
      "code" : "263659003",
      "display" : "Adolescence (qualifier value)",
      "property" : [
        {
          "code" : "comment",
          "valueString" : "Jugendlicher (ab Beginn des 13. bis zum vollendeten 18. Lebensjahres)"
        }
      ]
    },
    {
      "code" : "255398004",
      "display" : "Childhood (qualifier value)",
      "property" : [
        {
          "code" : "comment",
          "valueString" : "Kind (ab Beginn des 4. bis zum vollendeten 12. Lebensjahres)"
        }
      ]
    },
    {
      "code" : "713153009",
      "display" : "Toddler (qualifier value)",
      "property" : [
        {
          "code" : "comment",
          "valueString" : "Kleinkind (ab Beginn des 13. Lebensmonat bis zum vollendeten 3. Lebensjahr)"
        }
      ]
    },
    {
      "code" : "3658006",
      "display" : "Infancy (qualifier value)",
      "property" : [
        {
          "code" : "comment",
          "valueString" : "Säugling (ab Beginn des 29. Lebenstages bis zum vollendeten 12. Lebensmonat)"
        }
      ]
    },
    {
      "code" : "255407002",
      "display" : "Neonatal (qualifier value)",
      "property" : [
        {
          "code" : "comment",
          "valueString" : "Neugeborenes (bis zum vollendeten 28. Lebenstag)"
        }
      ]
    }
  ]
}

```
