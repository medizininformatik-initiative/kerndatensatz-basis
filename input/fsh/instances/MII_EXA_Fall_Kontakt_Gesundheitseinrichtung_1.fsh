Instance: mii-exa-fall-kontakt-gesundheitseinrichtung-1
InstanceOf: mii-pr-fall-kontakt-gesundheitseinrichtung
Usage: #example
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
* status = #finished
* identifier.type = $v2-0203#VN
* identifier.system = "http://medizininformatik-initiative.de/fhir/NamingSystem/Aufnahmenummer/MusterKrankenhaus"
* identifier.value = "F_0000002"
* class = $v3-ActCode#IMP "inpatient encounter"
* type[Kontaktebene] = $Kontaktebene#einrichtungskontakt "Einrichtungskontakt"
* subject.reference = "Patient/2b9d3335-70df-4055-b33d-27a55fe00855"
* serviceProvider.identifier.system = "http://medizininformatik-initiative.de/fhir/NamingSystem/Einrichtungsidentifikator/MusterKrankenhaus"
* serviceProvider.identifier.value = "260123451_MusterKrankenhaus"
* diagnosis.condition.reference = "Condition/e6b6895c-549b-47c5-a842-41100761385d"
* diagnosis.use.coding[Diagnosetyp] = $KontaktDiagnoseProzedur#treatment-diagnosis "Behandlungsrelevante Diagnosen"
* diagnosis.use.coding[DiagnosesubTyp] = $diagnosis-role#DD "Discharge diagnosis"
* hospitalization.admitSource = $Aufnahmeanlass#N
* hospitalization.dischargeDisposition.extension.url = "http://fhir.de/StructureDefinition/Entlassungsgrund"
* hospitalization.dischargeDisposition.extension.extension[0].url = "ErsteUndZweiteStelle"
* hospitalization.dischargeDisposition.extension.extension[=].valueCoding = $EntlassungsgrundErsteUndZweiteStelle#01 "Behandlung regulär beendet"
* hospitalization.dischargeDisposition.extension.extension[+].url = "DritteStelle"
* hospitalization.dischargeDisposition.extension.extension[=].valueCoding = $EntlassungsgrundDritteStelle#1 "arbeitsfähig entlassen"
* period.start = "2020-01-08T07:00:00+01:00"
* period.end = "2020-01-11T05:00:00+01:00"