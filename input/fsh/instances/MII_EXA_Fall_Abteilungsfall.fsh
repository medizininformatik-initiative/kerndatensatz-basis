// Instance: GOFSH-GENERATED-ID-1
// InstanceOf: Encounter
// Usage: #example
// * meta.profile = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/Encounter/Abteilungsfall"
// * status = #finished
// * class = $Abteilungsfallklasse#ub "Untersuchung und Behandlung"
// * period.end = "2020-03-13T12:00:00+01:00"
// * period.start = "2020-02-13T12:00:00+01:00"
// * subject = Reference(Patient/12345)
// * serviceType = $Fachabteilungsschluessel#0100 "Fachabteilung für Innere Medizin"
// * location[0].location.identifier.system = "https://diz.mii.de/fhir/CodeSystem/TestOrganisationAbteilungen"
// * location[=].location.identifier.value = "Station 1"
// * location[=].status = #completed
// * location[=].period.start = "2020-03-13T10:00:00+01:00"
// * location[=].period.end = "2020-03-13T11:00:00+01:00"
// * location[+].location.identifier.system = "https://diz.mii.de/fhir/CodeSystem/TestOrganisationAbteilungen"
// * location[=].location.identifier.value = "OP"
// * location[=].status = #completed
// * location[=].period.start = "2020-03-13T11:00:00+01:00"
// * location[=].period.end = "2020-03-13T12:00:00+01:00"
// * partOf = Reference(Encounter/versorgungsfall123)