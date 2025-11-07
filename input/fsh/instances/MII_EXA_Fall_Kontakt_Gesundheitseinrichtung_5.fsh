Instance: mii-exa-fall-kontakt-gesundheitseinrichtung-5
InstanceOf: mii-pr-fall-kontakt-gesundheitseinrichtung
Usage: #example
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
* status = #onleave
* class = $v3-ActCode#IMP "inpatient encounter"
* subject.reference = "Patient/mii-exa-test-data-patient-1"
* period.start = "2024-06-14"