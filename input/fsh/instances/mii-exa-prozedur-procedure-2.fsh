Instance: mii-exa-prozedur-procedure-2
InstanceOf: MII_PR_Prozedur_Procedure
Usage: #example
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure)
* status = #completed
* category = $sct-no-ver#18629005
//* code.coding[0] = $sct-no-ver#80146002 "Excision of appendix (procedure)"
* code.coding[+].version = "2018"
* code.coding[=] = $ops#9-649.60 "Anzahl der Therapieeinheiten pro Woche bei Erwachsenen: Gruppentherapie durch Spezialtherapeuten: Mehr als 0,05 bis 1 Therapieeinheit pro Woche"
* performedDateTime = "2018-03-31"
* subject = Reference(mii-exa-person-patient-minimal)
* encounter = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-1)