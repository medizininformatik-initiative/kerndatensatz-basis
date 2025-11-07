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
* subject = Reference(mii-exa-person-patient-minimal)
* serviceProvider.identifier.system = "http://medizininformatik-initiative.de/fhir/NamingSystem/Einrichtungsidentifikator/MusterKrankenhaus"
* serviceProvider.identifier.value = "260123451_MusterKrankenhaus"
* diagnosis.condition = Reference(mii-exa-diagnose-condition-minimal)
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