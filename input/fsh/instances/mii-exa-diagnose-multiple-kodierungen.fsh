Instance: mii-exa-diagnose-multiple-kodierungen
InstanceOf: MII_PR_Diagnose_Condition
Usage: #example
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose)
* extension[Feststellungsdatum].valueDateTime = "2020-02-13"
* clinicalStatus = $condition-clinical#active
* code.coding[0].version = "2020"
* code.coding[=] = $icd-10-gm#H83.8 "Sonstige näher bezeichnete Krankheiten des Innenohres"
* code.coding[+] = $alpha-id#I125918
* code.coding[=].version = "2020"
* code.coding[+] = $orpha#420402 "Semicircular canal dehiscence syndrome"
* subject = Reference(Patient/12345)
* encounter = Reference(Encounter/12345)
* onsetPeriod.start = "2020-02-13T16:56:00+01:00"
* recordedDate = "2020-04-26T12:00:00+01:00"

//Instance: mii-exa-diagnose-multiple-kodierungen-2
//InstanceOf: MII_PR_Diagnose_Condition
//Usage: #example
//* meta.profile[0] = "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose|2024.0.0"
//* clinicalStatus = $condition-clinical#active
//* code.coding[icd10-gm].version = "2022"
//* code.coding[icd10-gm] = $icd-10-gm#C50.1 "Zentraler Drüsenkörper der Brustdrüse"
//* code.coding[icd-o-3] = $icd-o-3#8510/3
//* code.coding[icd-o-3].version = "Zweite Revision"
//* subject = Reference(Patient/12345)
//* encounter = Reference(Encounter/12345)
//* recordedDate = "2022-04-26T12:00:00+01:00"
//* bodySite.coding[snomed-ct] = $sct#49058007 "Structure of central portion of breast (body structure)"
//* bodySite.coding[icd-o-3] = $icd-o-3#C50.1 "Zentraler Drüsenkörper der Brust"