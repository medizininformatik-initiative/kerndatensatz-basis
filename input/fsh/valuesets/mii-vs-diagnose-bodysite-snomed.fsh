ValueSet: MII_VS_Diagnose_BodyStructure_SNOMED
Id: mii-vs-diagnose-bodystructure-snomed
Title: "MII VS Diagnose BodyStructure SNOMED"
Description: "Enthaelt alle SNOMED Body structure codes"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^copyright = "This material includes SNOMED Clinical Terms® (SNOMED CT®) which is used by permission of SNOMED International. All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists. SNOMED and SNOMED CT are registered trademarks of SNOMED International. Implementers of these artefacts must have the appropriate SNOMED CT Affiliate license."
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-bodystructure-snomed"
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
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C15607)
* ^status = #active
* ^experimental = true
* ^date = "2026-09-01"
* ^purpose = "Define SNOMED CT body structure concepts allowed for diagnosis body site representation."
* include codes from system $sct where concept descendent-of #123037004
