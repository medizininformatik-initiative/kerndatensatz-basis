# MII CS Person Vitalstatus - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## CodeSystem: MII CS Person Vitalstatus 

 
Vitalstatus des Patienten 

Dieses CodeSystem wird in der Definition der folgenden ValueSets referenziert:

* [MII_VS_Person_Vitalstatus](ValueSet-mii-vs-person-vitalstatus.md)

**Changes since version {current}:**

* New Content

-------

 [Beschreibung der obigen Tabelle(n)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "mii-cs-person-vitalstatus",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/CodeSystem/Vitalstatus",
  "version" : "2026.0.0-dev.1",
  "name" : "MII_CS_Person_Vitalstatus",
  "title" : "MII CS Person Vitalstatus",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-12-04",
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
  "description" : "Vitalstatus des Patienten",
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
  "caseSensitive" : true,
  "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/ValueSet/Vitalstatus",
  "content" : "complete",
  "count" : 7,
  "concept" : [
    {
      "code" : "L",
      "display" : "Patient lebt"
    },
    {
      "code" : "T",
      "display" : "Patient verstorben"
    },
    {
      "code" : "A",
      "display" : "unbekannt, Patient nicht mehr auffindbar (lost to follow-up)"
    },
    {
      "code" : "N",
      "display" : "unbekannt, Betreuung/Nachsorge nicht mehr nötig"
    },
    {
      "code" : "B",
      "display" : "unbekannt, Patient ist anderenorts in Betreuung"
    },
    {
      "code" : "V",
      "display" : "unbekannt, Patient verweigert weitere Betreuung"
    },
    {
      "code" : "X",
      "display" : "unbekannt"
    }
  ]
}

```
