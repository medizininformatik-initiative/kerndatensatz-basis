ValueSet: MII_VS_Person_Vitalstatus
Id: mii-vs-person-vitalstatus
Title: "MII VS Person Vitalstatus"
Description: "Enthält alle Werte, die den Vitalstatus einer Person beschreiben."
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/ValueSet/Vitalstatus"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* insert PR_CS_VS_Version
* insert Publisher
* insert LicenseCodeableCCBY40
* insert CRMIShareableValueSet
* insert CRMIPublishableValueSet
* insert CRMIKnowledgeCapabilitiesValueSet
* insert CRMIVersionPolicyStrict
* insert CRMIPackageSourceDefinitionalResource
* insert CRMIResourceEffectivePeriod
* insert CRMIArtifactContributors
* insert CRMIApprovalDate(2024-03-07)
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C16960)
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C25717)
* ^status = #active
* ^date = "2026-09-01"
* ^experimental = false
* ^purpose = "Define codes allowed for representing a person's vital status."
* include codes from system MII_CS_Person_Vitalstatus
