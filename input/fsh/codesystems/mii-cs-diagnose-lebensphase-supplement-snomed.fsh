CodeSystem: MII_CS_Diagnose_Lebensphase_Supplement_SNOMED
Id: mii-cs-diagnose-lebensphase-supplement-snomed
Title: "MII CS Diagnose Lebensphase Supplement SNOMED"
Description: "CodeSystem Supplement mit Definitionen zu den SNOMED-Konzepten für Lebensphasen."
//* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/CodeSystem/mii-cs-diagnose-lebensphase-supplement-snomed"
* ^status = #active
* ^content = #supplement
* insert PR_CS_VS_Version
* insert LicenseCodeableCCBY40
* insert CRMIPublishableCodeSystem
* insert CRMIKnowledgeCapabilitiesCodeSystemPublishable
* insert CRMIVersionPolicyStrict
* insert CRMIPackageSourceDefinitionalResource
* insert CRMIResourceEffectivePeriod
* insert CRMIApprovalDate(2024-03-07)
* insert CRMIArtifactContributors
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C15607)
* ^experimental = true
* ^date = "2026-07-17"
* ^purpose = "Provide German language descriptions for SNOMED CT concepts related to life phases used in the MII Diagnosis module."
* insert Publisher
* ^copyright = "This material includes SNOMED Clinical Terms® (SNOMED CT®) which is used by permission of SNOMED International. All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists. SNOMED and SNOMED CT are registered trademarks of SNOMED International. Implementers of these artefacts must have the appropriate SNOMED CT Affiliate license."
/*
CRMI ShareableCodeSystem requires CodeSystem.caseSensitive (1..1), but IG publisher QA says:
CodeSystems SHOULD NOT have a stated value for the caseSensitive element when they are a supplement
* insert CRMIShareableCodeSystem
* ^caseSensitive = true
*/
* ^supplements = "http://snomed.info/sct"
* ^property[0].code = #comment
* ^property[0].uri = "http://hl7.org/fhir/concept-properties#comment"
* ^property[0].type = #string
* #271872005 "Old age (qualifier value)"
* #271872005 ^property.code = #comment
* #271872005 ^property.valueString = "Ältere Person/ Senioren (mit Beginn des 65. Lebensjahres)"
* #41847000 "Adulthood (qualifier value)"
* #41847000 ^property.code = #comment
* #41847000 ^property.valueString = "Erwachsener (ab Beginn des 19. Lebensjahres)"
* #263659003 "Adolescence (qualifier value)"
* #263659003 ^property.code = #comment
* #263659003 ^property.valueString = "Jugendlicher (ab Beginn des 13. bis zum vollendeten 18. Lebensjahres)"
* #255398004 "Childhood (qualifier value)"
* #255398004 ^property.code = #comment
* #255398004 ^property.valueString = "Kind (ab Beginn des 4. bis zum vollendeten 12. Lebensjahres)"
* #713153009 "Toddler (qualifier value)"
* #713153009 ^property.code = #comment
* #713153009 ^property.valueString = "Kleinkind (ab Beginn des 13. Lebensmonat bis zum vollendeten 3. Lebensjahr)"
* #3658006 "Infancy (qualifier value)"
* #3658006 ^property.code = #comment
* #3658006 ^property.valueString = "Säugling (ab Beginn des 29. Lebenstages bis zum vollendeten 12. Lebensmonat)"
* #255407002 "Neonatal (qualifier value)"
* #255407002 ^property.code = #comment
* #255407002 ^property.valueString = "Neugeborenes (bis zum vollendeten 28. Lebenstag)"