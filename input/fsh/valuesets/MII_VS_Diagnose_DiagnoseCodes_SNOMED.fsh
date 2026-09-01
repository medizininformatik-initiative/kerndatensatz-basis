ValueSet: MII_VS_Diagnose_DiagnoseCodes_SNOMED
Id: mii-vs-diagnose-diagnosecodes-snomed
Title: "MII VS Diagnose Diagnose-Codes SNOMED"
Description: "Enthaelt alle SNOMED Clinical finding, Event und Situation with explicit context codes"
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/diagnoses-sct"
* ^copyright = "This material includes SNOMED Clinical Terms® (SNOMED CT®) which is used by permission of SNOMED International. All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists. SNOMED and SNOMED CT are registered trademarks of SNOMED International. Implementers of these artefacts must have the appropriate SNOMED CT Affiliate license."
* insert PR_CS_VS_Version
* insert Publisher
* insert LicenseCodeableCCBY40
* insert CRMIShareableValueSet
* insert CRMIPublishableValueSet
* insert CRMIComputableValueSet
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
* ^purpose = "Define SNOMED CT concepts allowed for representing diagnoses."
* include codes from system $sct where concept is-a #404684003
* include codes from system $sct where concept is-a #272379006
* include codes from system $sct where concept is-a #243796009
