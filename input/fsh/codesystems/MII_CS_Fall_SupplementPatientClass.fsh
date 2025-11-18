CodeSystem: MII_CS_Fall_SupplementPatientClass
Id: mii-cs-fall-supplement-patient-class
Title: "MII CS Fall Supplement PatientClass"
Description: "CodeSystem Supplement für v2-0004"
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/CodeSystem/SupplementPatientClass"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* insert PR_CS_VS_Version
* ^experimental = false
* insert Publisher
* insert LicenseCodeableCCBY40
* ^content = #supplement
* ^supplements = "http://terminology.hl7.org/CodeSystem/v2-0004"
* #R "recurring patient"
* #R ^designation.language = #de-DE
* #R ^designation.value = "Wiederholungspatient"
* #B "Obstetrics"
* #B ^designation.language = #de-DE
* #B ^designation.value = "Geburtshilfe"