Instance: mii-exa-diagnose-mehrfachkodierung-primaercode
InstanceOf: MII_PR_Diagnose_Condition
Usage: #example
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose)
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* code.coding.extension[0].url = "http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit"
* code.coding.extension[=].valueCoding = $KBV_CS_SFHIR_ICD_DIAGNOSESICHERHEIT#G
* code.coding.extension[+].url = "http://fhir.de/StructureDefinition/seitenlokalisation"
* code.coding.extension[=].valueCoding = $KBV_CS_SFHIR_ICD_SEITENLOKALISATION#L "links"
* code.coding.extension[+].url = "http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen"
* code.coding.extension[=].valueCoding = $icd-10-gm-mehrfachcodierungs-kennzeichen#†
* code.coding[icd10-gm] = $icd-10-gm|2020#A54.4 "Gonokokkeninfektion des Muskel-Skelett-Systems"
* code.coding[alpha-id] = $alpha-id|2020#I97525 "Bursitis gonorrhoica"
* subject = Reference(mii-exa-person-patient-minimal)
* encounter = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-1)
* onsetPeriod.start = "2019-09-26T12:45:00+01:00"
* onsetPeriod.end = "2020-03-25T13:00:00+01:00"
* recordedDate = "2020-01-05T12:53:00+01:00"