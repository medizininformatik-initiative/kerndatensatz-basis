CodeSystem: MII_CS_Person_Vitalstatus
Id: mii-cs-person-vitalstatus
Title: "MII CS Person Vitalstatus"
Description: "Vitalstatus des Patienten"
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/CodeSystem/Vitalstatus"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* insert PR_CS_VS_Version
* ^status = #active
* insert Publisher
* insert LicenseCodeableCCBY40
* insert CRMIShareableCodeSystem
* insert CRMIPublishableCodeSystem
* insert CRMIKnowledgeCapabilitiesCodeSystem
* insert CRMIVersionPolicyStrict
* insert CRMIPackageSourceDefinitionalResource
* insert CRMIResourceEffectivePeriod
* insert CRMIApprovalDate(2024-03-07)
* insert CRMIArtifactContributors
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C16960)
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C25717)
* ^experimental = false
* ^date = "2026-06-15"
* ^purpose = "Provide a code system for representing the vital status of a patient in the MII Person module."
* ^caseSensitive = true
* ^valueSet = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/ValueSet/Vitalstatus"
* ^content = #complete
* #L "Patient lebt"
* #T "Patient verstorben"
* #A "unbekannt, Patient nicht mehr auffindbar (lost to follow-up)"
* #N "unbekannt, Betreuung/Nachsorge nicht mehr nötig"
* #B "unbekannt, Patient ist anderenorts in Betreuung"
* #V "unbekannt, Patient verweigert weitere Betreuung"
* #X "unbekannt"