CodeSystem: MII_CS_Fall_SupplementActEncounterCode
Id: mii-cs-fall-supplement-act-encounter-code
Title: "MII CS Fall Supplement ActEncounterCode"
Description: "CodeSystem Supplement für ActEncounterCode"
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/CodeSystem/SupplementActEncounterCode"
//* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* insert PR_CS_VS_Version
* insert LicenseCodeableCCBY40
* ^status = #active
* ^experimental = false
* ^date = "2026-07-17"
* ^purpose = "Provide German language designations for ActEncounterCode codes used in the MII Treatment Case module."
/*
CRMI ShareableCodeSystem requires CodeSystem.caseSensitive (1..1), but IG publisher QA says:
CodeSystems SHOULD NOT have a stated value for the caseSensitive element when they are a supplement
* insert CRMIShareableCodeSystem
* ^caseSensitive = true
*/
* insert Publisher
* insert CRMIPublishableCodeSystem
* insert CRMIKnowledgeCapabilitiesCodeSystemPublishable
* insert CRMIVersionPolicyStrict
* insert CRMIPackageSourceDefinitionalResource
* insert CRMIApprovalDate(2024-03-07)
* insert CRMIResourceEffectivePeriod
* insert CRMIArtifactContributors
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C154624)
* ^supplements = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* ^content = #supplement
* #AMB "ambulatory" "Umfasst ambulante Operationen nach § 115b SGB V und eine ambulante spezialfachärztliche Versorgung nach § 116b SGB V"
* #AMB ^designation.language = #de-DE
* #AMB ^designation.value = "teilstationäre Behandlung"
* #EMER "emergency"
* #EMER ^designation.language = #de-DE
* #EMER ^designation.value = "Notfall"
* #IMP "inpatient encounter"
* #IMP ^designation.language = #de-DE
* #IMP ^designation.value = "stationär"