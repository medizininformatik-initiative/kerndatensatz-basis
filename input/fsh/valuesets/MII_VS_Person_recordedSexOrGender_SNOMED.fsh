ValueSet: MII_VS_Person_recordedSexOrGender_SNOMED
Id: mii-vs-person-recordedsexorgender-snomed
Title: "MII VS Person Recorded Sex or Gender SNOMED"
Description: "Enthaelt SNOMED CT Codes für das dokumentierte Geschlecht"
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/ValueSet/recordedSexOrGender-sct"
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
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C16960)
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C28421)
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C17357)
* insert CRMIArtifactContributors
//* insert CRMIApprovalDate(2024-03-07)
* ^status = #active
* ^experimental = false
* ^date = "2026-09-02"
* ^purpose = "Define SNOMED CT concepts allowed for representing recorded sex or gender."
* include codes from system $sct where concept descendent-of #429019009
* $sct#261665006