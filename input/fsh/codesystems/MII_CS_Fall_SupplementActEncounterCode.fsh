CodeSystem: MII_CS_Fall_SupplementActEncounterCode
Id: mii-cs-fall-supplement-act-encounter-code
Title: "MII CS Fall Supplement ActEncounterCode"
Description: "CodeSystem Supplement für ActEncounterCode"
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/CodeSystem/SupplementActEncounterCode"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* insert PR_CS_VS_Version
* insert LicenseCodeableCCBY40
* ^experimental = false
* insert Publisher
* ^supplements = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* ^content = #supplement
* #AMB "ambulatory" "Umfasst ambulante Operationen nach § 115b SGB V und eine ambulante spezialfachärztliche Versorgung nach § 116b SGB V"
* #AMB ^designation.language = #de-DE
* #AMB ^designation.value = "teilstationäre Behandlung"
* #EMER "emergency"
* #EMER ^designation.language = #de-DE
* #EMER ^designation.value = "Notfall"
* #IMP "inpatient encounter"
* #IMP ^designation.language = #de-DE
* #IMP ^designation.value = "stationär"