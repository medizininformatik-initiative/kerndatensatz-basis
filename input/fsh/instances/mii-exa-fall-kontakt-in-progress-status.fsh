Instance: mii-exa-fall-kontakt-in-progress-status
InstanceOf: mii-pr-fall-kontakt-gesundheitseinrichtung
Usage: #example
Title: "MII EXA Fall Kontakt Gesundheitseinrichtung (Status in-progress)"
Description: "Encounter: Status 'in-progress'"
* insert TestDataLabel
* insert CRMIPackageSource
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
* status = #in-progress
* class = $v3-ActCode#IMP "inpatient encounter"
* type[Kontaktebene] = $Kontaktebene#abteilungskontakt
* serviceType.coding[ErweiterterFachabteilungsschluessel] = $FachabteilungsschluesselErweitertCS#2315 "Orthopädie/Schwerpunkt Chirurgie"
* period.start = "2024-06-14"
* subject = Reference(mii-exa-person-patient-pseudonymisiert)