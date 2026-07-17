CodeSystem: MII_CS_Fall_SupplementPatientClass
Id: mii-cs-fall-supplement-patient-class
Title: "MII CS Fall Supplement PatientClass"
Description: "CodeSystem Supplement für v2-0004"
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/CodeSystem/SupplementPatientClass"
//* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* insert PR_CS_VS_Version
* ^status = #active
* ^experimental = false
* ^date = "2026-06-15"
* ^purpose = "Provide German language designations for PatientClass codes used in the MII Treatment Case module."
/*
CRMI ShareableCodeSystem requires CodeSystem.caseSensitive (1..1), but IG publisher QA says:
CodeSystems SHOULD NOT have a stated value for the caseSensitive element when they are a supplement
* insert CRMIShareableCodeSystem
* ^caseSensitive = true
*/
* insert Publisher
* insert LicenseCodeableCCBY40
* insert CRMIPublishableCodeSystem
* insert CRMIKnowledgeCapabilitiesCodeSystem
* insert CRMIVersionPolicyStrict
* insert CRMIPackageSourceDefinitionalResource
* insert CRMIApprovalDate(2024-03-07)
* insert CRMIResourceEffectivePeriod
* insert CRMIArtifactContributors
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C154624)
* ^content = #supplement
* ^supplements = "http://terminology.hl7.org/CodeSystem/v2-0004"
* #R "recurring patient"
* #R ^designation.language = #de-DE
* #R ^designation.value = "Wiederholungspatient"
* #B "Obstetrics"
* #B ^designation.language = #de-DE
* #B ^designation.value = "Geburtshilfe"