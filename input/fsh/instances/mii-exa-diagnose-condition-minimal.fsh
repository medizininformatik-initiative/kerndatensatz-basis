Instance: mii-exa-diagnose-condition-minimal
InstanceOf: MII_PR_Diagnose_Condition
Usage: #example
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose)
* clinicalStatus = $condition-clinical#active
* code.coding[0].version = "2020"
* code.coding[=] = $icd-10-gm#S50.0 "Prellung des Ellenbogens"
* code.coding[+] = $sct-no-ver#91613004 "Contusion of elbow (disorder)"
* code.text = "Prellung des linken Ellenbogens"
* subject = Reference(mii-exa-person-patient-minimal)
* encounter = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-1)
* onsetPeriod.start = "2020-02-26T12:00:00+01:00"
* onsetPeriod.end = "2020-03-05T13:00:00+01:00"
* recordedDate = "2020-02-26T12:00:00+01:00"