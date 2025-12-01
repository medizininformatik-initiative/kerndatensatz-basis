Instance: mii-exa-fall-kontakt-onleave-status
InstanceOf: mii-pr-fall-kontakt-gesundheitseinrichtung
Usage: #example
Title: "MII EXA Fall Kontakt Gesundheitseinrichtung (Status onleave)"
Description: "Encounter: Status 'onleave'"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
* status = #onleave
* class = $v3-ActCode#IMP "inpatient encounter"
* subject = Reference(mii-exa-person-patient-pseudonymisiert)
* period.start = "2024-06-14"