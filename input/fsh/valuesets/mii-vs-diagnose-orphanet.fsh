ValueSet: MII_VS_Diagnose_Orphanet
Id: mii-vs-diagnose-orphanet
Title: "MII VS Diagnose Orphanet"
Description: "Enthaelt alle Orpha-Kennnummern (ORPHAcodes)"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^copyright = "INSERM US14 (Institut national de la santé et de la recherche médicale)"
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-orphanet"
* insert PR_CS_VS_Version
* insert Publisher
* insert LicenseCodeableCCBY40
* insert CRMIShareableValueSet
* insert CRMIPublishableValueSet
* insert CRMIKnowledgeCapabilitiesValueSet
* insert CRMIVersionPolicyStrict
* insert CRMIPackageSourceDefinitionalResource
* insert CRMIResourceEffectivePeriod
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C15607)
* insert CRMIArtifactContributors
* insert CRMIApprovalDate(2024-03-07)
* ^status = #active
* ^experimental = true
* ^date = "2026-09-01"
* ^purpose = "Define ORPHAcode concepts allowed for rare disease coding."
* include codes from system $orpha
