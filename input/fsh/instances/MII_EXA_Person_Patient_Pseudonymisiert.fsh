Instance: mii-exa-person-patient-pseudonymisiert
InstanceOf: MII_PR_Person_PatientPseudonymisiert
Usage: #example
Title: "MII EXA Person Patient Pseudonymisiert"
Description: "Patient: with pseudonym and masked insurance identifier (maskierter Versichertenidentifer)"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert)
* identifier[PseudonymisierterIdentifier].type = $v3-ObservationValue#PSEUDED
* identifier[PseudonymisierterIdentifier].system = "https://www.medizininformatik-initiative.de/fhir/sid/pseudonym"
* identifier[PseudonymisierterIdentifier].value = "1234567890"
* identifier[MaskierterVersichertenIdentifer].use = #official
* identifier[MaskierterVersichertenIdentifer].type = $identifier-type-de-basis#KVZ10
* identifier[MaskierterVersichertenIdentifer].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[MaskierterVersichertenIdentifer].value.extension[data-absent-reason].valueCode = #masked
* identifier[MaskierterVersichertenIdentifer].assigner.identifier.use = #official
* identifier[MaskierterVersichertenIdentifer].assigner.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* identifier[MaskierterVersichertenIdentifer].assigner.identifier.value = "260326822"
* address.type = #both
* address.postalCode = "10"
* address.country = "DE"
* gender = #female
* birthDate = "1998"