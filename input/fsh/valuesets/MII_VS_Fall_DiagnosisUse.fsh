ValueSet: MII_VS_Fall_Diagnosis_Use
Id: mii-vs-fall-diagnosis-use
Title: "MII VS Fall Diagnosis Use"
Description: "Diagnosetyp"
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/mii-vs-fall-diagnosis-use"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* insert PR_CS_VS_Version
* insert LicenseCodeableCCBY40
* ^experimental = false
* ^date = "2024-12-10"
* insert Publisher
* include codes from valueset http://fhir.de/ValueSet/DiagnoseTyp
* include codes from valueset http://fhir.de/ValueSet/Diagnosesubtyp
* include codes from valueset http://hl7.org/fhir/ValueSet/diagnosis-role 