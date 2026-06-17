ValueSet: MII_VS_Fall_LocationPhysicalType
Id: mii-vs-fall-location-physical-type
Title: "MII VS Fall Location Physical Type"
Description: "A coded type for the physical type of the location."
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/location-physical-type"
* insert PR_CS_VS_Version
* insert LicenseCodeableCCBY40
* insert CRMIShareableValueSet
* insert CRMIPublishableValueSet
* insert CRMIKnowledgeCapabilitiesValueSet
* insert CRMIVersionPolicyStrict
* insert CRMIPackageSourceDefinitionalResource
* insert CRMIResourceEffectivePeriod
* insert CRMIArtifactContributors
* insert CRMIApprovalDate(2024-03-07)
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C154624)
* ^experimental = false
* ^date = "2026-06-09"
* insert Publisher
* ^experimental = false
* ^purpose = "Define physical location type codes used for encounter locations."
* LocationType#bd "Bed"
* LocationType#ro "Room"
* LocationType#wa "Ward"
