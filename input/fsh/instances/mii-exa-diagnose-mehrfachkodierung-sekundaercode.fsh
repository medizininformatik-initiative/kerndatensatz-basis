Instance: mii-exa-diagnose-mehrfachkodierung-sekundaercode
InstanceOf: MII_PR_Diagnose_Condition
Usage: #example
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose)
* extension.url = "http://hl7.org/fhir/StructureDefinition/condition-related"
* extension.valueReference = Reference(mii-exa-diagnose-mehrfachkodierung-primaercode)
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* code.coding[icd10-gm].extension.url = "http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen"
* code.coding[icd10-gm].extension.valueCoding = $icd-10-gm-mehrfachcodierungs-kennzeichen#*
* code.coding[icd10-gm] = $icd-10-gm|2020#M73.04 "Bursitis gonorrhoica: Hand [Finger, Handwurzel, Mittelhand, Gelenke zwischen diesen Knochen]"
* subject = Reference(mii-exa-person-patient-minimal)
* encounter = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-1)
* onsetPeriod.start = "2019-09-26T12:45:00+01:00"
* onsetPeriod.end = "2020-03-25T13:00:00+01:00"
* recordedDate = "2020-01-05T12:53:00+01:00"