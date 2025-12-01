Instance: mii-exa-fall-kontakt-unknown-status
InstanceOf: mii-pr-fall-kontakt-gesundheitseinrichtung
Usage: #example
Title: "MII EXA Fall Kontakt Gesundheitseinrichtung (Status unknown)"
Description: "Encounter: Status 'unknown'"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
* status = #unknown
* class = $v3-ActCode#IMP "inpatient encounter"
* subject = Reference(mii-exa-person-patient-pseudonymisiert)
* period.start = "2024-06-14"