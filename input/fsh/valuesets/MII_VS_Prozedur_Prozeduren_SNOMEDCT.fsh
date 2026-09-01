ValueSet: MII_VS_Prozedur_Prozeduren_SNOMEDCT
Id: mii-vs-prozedur-prozeduren-snomedct
Title: "MII VS Prozedur Prozeduren [SNOMED CT]"
Description: "Enthaelt alle SNOMED CT Procedure Codes"
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-sct"
* insert PR_CS_VS_Version
* insert Publisher
* insert SnomedLicense
* insert LicenseCodeableCCBY40
* insert CRMIShareableValueSet
* insert CRMIPublishableValueSet
* insert CRMIKnowledgeCapabilitiesValueSet
* insert CRMIVersionPolicyStrict
* insert CRMIPackageSourceDefinitionalResource
* insert CRMIResourceEffectivePeriod
* insert CRMIArtifactContributors
* insert CRMIApprovalDate(2024-03-07)
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C25218)
* ^status = #active
* ^experimental = false
* ^date = "2026-09-01"
* ^purpose = "Define SNOMED CT procedure concepts allowed for procedure coding."
* include codes from system $sct where concept descendent-of #71388002
