ValueSet: MII_VS_Diagnose_AlphaID
Id: mii-vs-diagnose-alphaid
Title: "MII VS Diagnose Alpha-ID"
Description: "Enthaelt Alpha-ID-Codes der aller verfügbarer Versionen" 
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^copyright = "WHO, BfArM 1994 - 2025 - Die Erstellung erfolgt unter Verwendung der maschinenlesbaren Fassung des Bundesinstituts für Arzneimittel und Medizinprodukte (BfArM)."
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-alphaid"
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
* ^experimental = false
* ^date = "2026-09-01"
* ^purpose = "Define Alpha-ID codes allowed for diagnosis coding in the MII Diagnosis module."
* include codes from system $alpha-id|2026
* include codes from system $alpha-id|2025
* include codes from system $alpha-id|2024
* include codes from system $alpha-id|2023
* include codes from system $alpha-id|2022
* include codes from system $alpha-id|2021
* include codes from system $alpha-id|2020
* include codes from system $alpha-id|2019
* include codes from system $alpha-id|2018
