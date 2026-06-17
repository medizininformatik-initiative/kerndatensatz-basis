Extension: MII_EX_Prozedur_Durchfuehrungsabsicht
Id: mii-ex-prozedur-durchfuehrungsabsicht
Title: "MII EX Prozedur Durchführungsabsicht"
Description: "Intention der Prozedur"
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht"
* insert PR_CS_VS_Version
* insert Publisher
* insert LicenseCodeableCCBY40
* insert CRMIShareableStructureDefinition
* insert CRMIPublishableStructureDefinition
* insert CRMIKnowledgeCapabilitiesStructureDefinition
* insert CRMIVersionPolicyStrict
* insert CRMIPackageSourceDefinitionalResource
* insert CRMIResourceEffectivePeriod
* insert CRMIArtifactContributors
* insert CRMIApprovalDate(2024-03-07)
* insert CRMIArtifactUsageExtension
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C25218)
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C192500)
* ^status = #active
* ^experimental = false
* ^date = "2026-06-15"
* ^jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* ^purpose = "Represent the intended purpose of a procedure."
* ^context.type = #element
* ^context.expression = "Procedure"
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht" (exactly)
* value[x] 1..
* value[x] only Coding
* value[x] from MII_VS_Prozedur_Durchfuehrungsabsicht_SNOMEDCT (required)
* value[x].system 1..
* value[x].system = "http://snomed.info/sct" (exactly)
* value[x].code 1..