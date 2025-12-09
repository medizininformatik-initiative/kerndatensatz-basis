// retired and moved resource to /terminologie 

// ValueSet: MII_VS_Person_ICD10WHO
// Id: mii-vs-person-icd10who
// Title: "MII VS Person ICD-10-WHO"
// Description: "MII VS Person ICD-10-WHO"
// * ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
// * ^extension[0].valueCode = #vocab
// * ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
// * ^url = "http://hl7.org/fhir/sid/icd-10/vs"
// * ^status = #retired
// * ^experimental = true
// * ^date = "2025-01-09"
// * insert PR_CS_VS_Version
// * insert Publisher
// * insert LicenseCodeableCCBY40
// * ^copyright = "BfArM - Bundesinstitut für Arzneimittel und Medizinprodukte"
// * include codes from system http://hl7.org/fhir/sid/icd-10|*

// re-published under MII URL

ValueSet: MII_VS_Person_ICD10WHO
Id: mii-vs-person-icd10who
Title: "MII VS Person ICD-10-WHO"
Description: "MII VS Person ICD-10-WHO"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/ValueSet/mii-vs-person-icd10who"
* ^status = #active
* ^experimental = true
* ^date = "2025-12-08"
* insert PR_CS_VS_Version
* insert Publisher
* insert LicenseCodeableCCBY40
* ^copyright = "BfArM - Bundesinstitut für Arzneimittel und Medizinprodukte"
* include codes from system http://hl7.org/fhir/sid/icd-10|2011
* include codes from system http://hl7.org/fhir/sid/icd-10|2013
* include codes from system http://hl7.org/fhir/sid/icd-10|2016
* include codes from system http://hl7.org/fhir/sid/icd-10|2019