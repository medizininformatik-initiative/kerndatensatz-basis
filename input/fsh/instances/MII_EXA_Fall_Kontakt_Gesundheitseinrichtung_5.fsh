Instance: mii-exa-fall-kontakt-gesundheitseinrichtung-5
InstanceOf: mii-pr-fall-kontakt-gesundheitseinrichtung
Usage: #example
Description: "Encounter: Kontakt mit Status 'onleave'"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
* status = #onleave
* class = $v3-ActCode#IMP "inpatient encounter"
* subject = Reference(mii-exa-person-patient-minimal)
* period.start = "2024-06-14"