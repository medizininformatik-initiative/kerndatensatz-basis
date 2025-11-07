Instance: mii-exa-fall-kontakt-gesundheitseinrichtung-4
InstanceOf: mii-pr-fall-kontakt-gesundheitseinrichtung
Usage: #example
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
* status = #in-progress
* class = $v3-ActCode#IMP "inpatient encounter"
* type[Kontaktebene] = $Kontaktebene#abteilungskontakt
* serviceType.coding[ErweiterterFachabteilungsschluessel] = $FachabteilungsschluesselErweitertCS#2315 "Orthopädie/Schwerpunkt Chirurgie"
* period.start = "2024-06-14"
* subject.reference = "Patient/mii-exa-test-data-patient-1"