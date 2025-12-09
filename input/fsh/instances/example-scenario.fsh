// Example Scenario Patient with Appendicitis and Complications

// Patient
Instance: mii-exa-person-patient-1
InstanceOf: MII_PR_Person_Patient
Usage: #example
Title: "MII EXA Person Patient"
Description: "Patient: with insurance identifier, name and address"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient)
* identifier[0].use = #usual
* identifier[=].type = $v2-0203#MR
* identifier[=].system = "https://www.charite.de/fhir/sid/patienten"
* identifier[=].value = "42285243"
* identifier[=].assigner.display = "Charité – Universitätsmedizin Berlin"
* identifier[=].assigner.identifier.system = "https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier"
* identifier[=].assigner.identifier.value = "Charité"
* identifier[+].use = #official
* identifier[=].type = $identifier-type-de-basis#KVZ10
* identifier[=].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[=].value = "A999999999"
* identifier[=].assigner.identifier.use = #official
* identifier[=].assigner.identifier.value = "260326822"
* identifier[=].assigner.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
//* identifier[+].use = #secondary
//* identifier[=].type = $identifier-type-de-basis#PKV
//* identifier[=].value = "123456"
//* identifier[=].assigner.display = "Signal Iduna"
* name[name].use = #official
* name[name].family = "Van-der-Dussen"
* name[name].family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[name].family.extension.valueString = "Van-der-Dussen"
* name[name].given[0] = "Maja"
* name[name].given[+] = "Julia"
* name[name].prefix = "Prof. Dr. med."
* name[name].prefix.extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier"
* name[name].prefix.extension.valueCode = #AC
* name[geburtsname].use = #maiden
* name[geburtsname].family = "Bachmann"
* gender = #female
//* gender.extension.url = "http://fhir.de/StructureDefinition/gender-amtlich-de"
//* gender.extension.valueCoding = $gender-amtlich-de#D "divers"
* birthDate = "1998-09-19"
* deceasedBoolean = false
* address.type = #both
* address.line = "Anna-Louisa-Karsch Str. 2"
* address.city = "Berlin"
* address.city.extension.url = "http://fhir.de/StructureDefinition/destatis/ags"
* address.city.extension.valueCoding = $ags#11000000
* address.state = "DE-BE"
* address.postalCode = "10178"
* address.country = "DE"
// * managingOrganization = Reference(Organization/Charite-Universitaetsmedizin-Berlin)

/*
========================================
PRE-HOSPITAL HISTORY: September 26, 2019
Outpatient Rheumatology Visit
========================================
*/

// Encounter-8: 2019 Outpatient Rheumatology Visit (original bursitis diagnosis)
Instance: mii-exa-fall-kontakt-gesundheitseinrichtung-8
InstanceOf: mii-pr-fall-kontakt-gesundheitseinrichtung
Usage: #example
Title: "MII EXA Fall Kontakt Gesundheitseinrichtung (Ambulanter Kontakt)"
Description: "Encounter: Example demonstrating an outpatient rheumatology encounter for initial bursitis diagnosis"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
* identifier.type = $v2-0203#VN
* identifier.system = "https://www.charite.de/fhir/sid/aufnahmenummer"
* identifier.value = "F_20190926_001"
* status = #finished
* class = $v3-ActCode#AMB
* subject = Reference(mii-exa-person-patient-1)
* period.start = "2019-09-26T10:00:00+02:00"
* period.end = "2019-09-26T12:00:00+02:00"
* serviceProvider.identifier.system = "http://fhir.de/sid/dkgev/iknr"
* serviceProvider.identifier.value = "260950472"
// * diagnosis[0].condition = Reference(mii-exa-diagnose-mehrfachcodierung-primaercode)
// * diagnosis[=].use = $diagnosis-role#CC "Chief complaint"

// Diagnosis 3a: Gonococcal Bursitis - Primary Code (diagnosed 2019)
Instance: mii-exa-diagnose-mehrfachcodierung-primaercode
InstanceOf: MII_PR_Diagnose_Condition
Usage: #example
Title: "MII EXA Diagnose Mehrfachcodierung Primaercode"
Description: "Condition: Primary code (†) - gonococcal bursitis etiology"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose)
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* code.coding[icd10-gm] = $icd-10-gm#A54.4 "Gonokokkeninfektion des Muskel-Skelett-Systems"
* code.coding[icd10-gm].version = "2020"
* code.coding[icd10-gm].extension[0].url = "http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen"
* code.coding[icd10-gm].extension[=].valueCoding = $icd-10-gm-mehrfachcodierungs-kennzeichen#†
* code.coding[icd10-gm].extension[+].url = "http://fhir.de/StructureDefinition/seitenlokalisation"
* code.coding[icd10-gm].extension[=].valueCoding = $KBV_CS_SFHIR_ICD_SEITENLOKALISATION#L "links"
* code.coding[icd10-gm].extension[+].url = "http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit"
* code.coding[icd10-gm].extension[=].valueCoding = $KBV_CS_SFHIR_ICD_DIAGNOSESICHERHEIT#G "gesicherte Diagnose"
* code.coding[alpha-id].system = $alpha-id
* code.coding[alpha-id].version = "2020"
* code.coding[alpha-id].code = #I97525
* subject = Reference(mii-exa-person-patient-1)
* encounter = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-8)
* onsetDateTime = "2019-09-26"
* recordedDate = "2019-09-26T11:30:00+02:00"

// Diagnosis 3b: Gonococcal Bursitis - Secondary Code (Manifestation)
Instance: mii-exa-diagnose-mehrfachcodierung-sekundaercode
InstanceOf: MII_PR_Diagnose_Condition
Usage: #example
Title: "MII EXA Diagnose Mehrfachcodierung Sekundaercode"
Description: "Condition: Secondary code (*) - bursitis manifestation"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose)
* extension.url = "http://hl7.org/fhir/StructureDefinition/condition-related"
* extension.valueReference = Reference(mii-exa-diagnose-mehrfachcodierung-primaercode)
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* code.coding[icd10-gm] = $icd-10-gm#M73.04 
* code.coding[icd10-gm].version = "2020"
* code.coding[icd10-gm].extension[0].url = "http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen"
* code.coding[icd10-gm].extension[=].valueCoding = $icd-10-gm-mehrfachcodierungs-kennzeichen#*
* code.text = "Bursitis gonorrhoica: Hand"
* subject = Reference(mii-exa-person-patient-1)
* encounter = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-8)
* onsetDateTime = "2019-09-26"
* recordedDate = "2019-09-26T11:30:00+02:00"

/*
========================================
2020 HOSPITAL ADMISSION: January 8-17, 2020
Acute Appendicitis with Complications
========================================
*/

// Encounter-1 (E0): Einrichtungskontakt - Facility-level encounter
Instance: mii-exa-fall-kontakt-gesundheitseinrichtung-1
InstanceOf: mii-pr-fall-kontakt-gesundheitseinrichtung
Usage: #example
Title: "MII EXA Fall Kontakt Gesundheitseinrichtung (Einrichtungskontakt E0)"
Description: "Encounter: Facility-level encounter (Einrichtungskontakt) for entire hospital stay"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
* identifier.type = $v2-0203#VN
* identifier.system = "https://www.charite.de/fhir/sid/aufnahmenummer"
* identifier.value = "E0"
* status = #finished
* class = $v3-ActCode#IMP
* type[Kontaktebene] = $Kontaktebene#einrichtungskontakt
* subject = Reference(mii-exa-person-patient-1)
* period.start = "2020-01-08T07:00:00+01:00"
* period.end = "2020-01-17T18:00:00+01:00"
* serviceProvider.identifier.system = "http://fhir.de/sid/dkgev/iknr"
* serviceProvider.identifier.value = "260950472"
* account.identifier.system = "https://www.charite.de/fhir/sid/fallnummer"
* account.identifier.value = "F-2020-000123"
* account.display = "Account A1 - DRG G23B Appendektomie ohne schwere CC"
* hospitalization.admitSource = $Aufnahmeanlass#N "Notfall"
* hospitalization.dischargeDisposition.extension[Entlassungsgrund].extension[ErsteUndZweiteStelle].valueCoding = $EntlassungsgrundErsteUndZweiteStelle#01 "Behandlung regulär beendet"
* hospitalization.dischargeDisposition.extension[Entlassungsgrund].extension[DritteStelle].valueCoding = $EntlassungsgrundDritteStelle#1 "arbeitsfähig entlassen"

// Encounter-9 (A1E): Emergency Department
Instance: mii-exa-fall-kontakt-gesundheitseinrichtung-9
InstanceOf: mii-pr-fall-kontakt-gesundheitseinrichtung
Usage: #example
Title: "MII EXA Fall Kontakt Gesundheitseinrichtung (Abteilungskontakt Notaufnahme A1E)"
Description: "Encounter: Emergency department encounter as entry point for hospital admission"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
* extension[Aufnahmegrund].extension[VierteStelle].valueCoding = $AufnahmegrundVierteStelle#7 "Notfall"
* identifier.type = $v2-0203#VN
* identifier.system = "https://www.charite.de/fhir/sid/aufnahmenummer"
* identifier.value = "A1E"
* status = #finished
* class = $v3-ActCode#AMB
* type[Kontaktebene] = $Kontaktebene#abteilungskontakt
* priority = $v3-ActPriority#EM
* subject = Reference(mii-exa-person-patient-1)
* period.start = "2020-01-08T07:00:00+01:00"
* period.end = "2020-01-08T09:00:00+01:00"
* partOf = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-1)
* serviceProvider.identifier.system = "http://fhir.de/sid/dkgev/iknr"
* serviceProvider.identifier.value = "260950472"
* account.identifier.system = "https://www.charite.de/fhir/sid/fallnummer"
* account.identifier.value = "F-2020-000123"
* account.display = "Account A1 - DRG G23B Appendektomie ohne schwere CC"

// Encounter-11 (VS1): ED Treatment Room 3
Instance: mii-exa-fall-kontakt-gesundheitseinrichtung-11
InstanceOf: mii-pr-fall-kontakt-gesundheitseinrichtung
Usage: #example
Title: "MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt ED Treatment Room VS1)"
Description: "Encounter: Care unit encounter (Versorgungsstellenkontakt) for ED treatment room"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
* identifier.type = $v2-0203#VN
* identifier.system = "https://www.charite.de/fhir/sid/aufnahmenummer"
* identifier.value = "VS1"
* status = #finished
* class = $v3-ActCode#AMB
* type[Kontaktebene] = $Kontaktebene#versorgungsstellenkontakt
* subject = Reference(mii-exa-person-patient-1)
* period.start = "2020-01-08T07:00:00+01:00"
* period.end = "2020-01-08T09:00:00+01:00"
* partOf = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-9)
* serviceProvider.identifier.system = "http://fhir.de/sid/dkgev/iknr"
* serviceProvider.identifier.value = "260950472"
* account.identifier.system = "https://www.charite.de/fhir/sid/fallnummer"
* account.identifier.value = "F-2020-000123"
* account.display = "Account A1 - DRG G23B Appendektomie ohne schwere CC"
* location[+].status = #completed
* location[=].physicalType = $location-physical-type#ro
* location[=].location.display = "Emergency Department, Treatment Room 3"

// Observation: Admission Vital Status
Instance: mii-exa-person-observation-vitalstatus
InstanceOf: MII_PR_Person_Vitalstatus
Usage: #example
Title: "MII EXA Person Observation Vitalstatus"
Description: "Observation: Vital status at hospital admission"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Vitalstatus)
* status = #final
* category[survey] = $observation-category#survey
* code = $loinc#67162-8
* subject = Reference(mii-exa-person-patient-1)
* encounter = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-9)
* effectiveDateTime = "2020-01-08T07:00:00+01:00"
* valueCodeableConcept = $Vitalstatus#L "Patient lebt"

// Encounter-2 (A2E): Surgery Department
Instance: mii-exa-fall-kontakt-gesundheitseinrichtung-2
InstanceOf: mii-pr-fall-kontakt-gesundheitseinrichtung
Usage: #example
Title: "MII EXA Fall Kontakt Gesundheitseinrichtung (Abteilungskontakt Chirurgie A2E)"
Description: "Encounter: Department-level encounter (Abteilungskontakt) for surgical care"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
* identifier.type = $v2-0203#VN
* identifier.system = "https://www.charite.de/fhir/sid/aufnahmenummer"
* identifier.value = "A2E"
* status = #finished
* class = $v3-ActCode#IMP
* type[Kontaktebene] = $Kontaktebene#abteilungskontakt
* serviceType = $Fachabteilungsschluessel#1500 "Allgemeine Chirurgie"
* subject = Reference(mii-exa-person-patient-1)
* period.start = "2020-01-08T09:00:00+01:00"
* period.end = "2020-01-11T23:59:00+01:00"
* partOf = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-1)
* serviceProvider.identifier.system = "http://fhir.de/sid/dkgev/iknr"
* serviceProvider.identifier.value = "260950472"
* account.identifier.system = "https://www.charite.de/fhir/sid/fallnummer"
* account.identifier.value = "F-2020-000123"
* account.display = "Account A1 - DRG G23B Appendektomie ohne schwere CC"
* diagnosis[0].condition = Reference(mii-exa-diagnose-appendicitis)
* diagnosis[=].use = $diagnosis-role#AD "Admission diagnosis"
* diagnosis[+].condition = Reference(mii-exa-diagnose-appendicitis)
* diagnosis[=].use = $KontaktDiagnoseProzedur#treatment-diagnosis
* diagnosis[+].condition = Reference(mii-exa-diagnose-condition-elbow-contusion)
* diagnosis[=].use = $KontaktDiagnoseProzedur#treatment-diagnosis

// Diagnosis 1: Acute Appendicitis
Instance: mii-exa-diagnose-appendicitis
InstanceOf: MII_PR_Diagnose_Condition
Usage: #example
Title: "MII EXA Diagnose Condition Appendicitis"
Description: "Condition: Acute appendicitis diagnosis as admission diagnosis"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose)
* extension[Feststellungsdatum].valueDateTime = "2020-01-08T07:30:00+01:00"
* clinicalStatus = $condition-clinical#resolved
* verificationStatus = $condition-ver-status#confirmed
* code.coding[icd10-gm] = $icd-10-gm#K35.8
* code.coding[icd10-gm].version = "2020"
* code.coding[sct] = $sct-no-ver#85189001 "Acute appendicitis"
* code.text = "Akute Appendizitis"
* subject = Reference(mii-exa-person-patient-1)
* encounter = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-2)
* onsetDateTime = "2020-01-08T04:00:00+01:00"
* recordedDate = "2020-01-08T09:00:00+01:00"

// Diagnosis 2: Elbow Contusion
Instance: mii-exa-diagnose-condition-elbow-contusion
InstanceOf: MII_PR_Diagnose_Condition
Usage: #example
Title: "MII EXA Diagnose Condition Contusion Elbow"
Description: "Condition: Elbow contusion diagnosis"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose)
* extension[Feststellungsdatum].valueDateTime = "2020-01-08T08:00:00+01:00"
* clinicalStatus = $condition-clinical#resolved
* verificationStatus = $condition-ver-status#confirmed
* code.coding[icd10-gm] = $icd-10-gm#S50.0 "Prellung des Ellenbogens"
* code.coding[icd10-gm].version = "2020"
* code.coding[sct] = $sct-no-ver#91613004 "Contusion of elbow"
* subject = Reference(mii-exa-person-patient-1)
* encounter = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-2)
* onsetDateTime = "2020-01-08T06:00:00+01:00"
* recordedDate = "2020-01-08T09:00:00+01:00"

// Encounter-4 (VS2): Radiology CT
Instance: mii-exa-fall-kontakt-gesundheitseinrichtung-4
InstanceOf: mii-pr-fall-kontakt-gesundheitseinrichtung
Usage: #example
Title: "MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt Radiology VS2)"
Description: "Encounter: Care unit encounter (Versorgungsstellenkontakt) for radiology CT procedure"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
* identifier.type = $v2-0203#VN
* identifier.system = "https://www.charite.de/fhir/sid/aufnahmenummer"
* identifier.value = "VS2"
* status = #finished
* class = $v3-ActCode#IMP
* type[Kontaktebene] = $Kontaktebene#versorgungsstellenkontakt
* subject = Reference(mii-exa-person-patient-1)
* period.start = "2020-01-08T10:00:00+01:00"
* period.end = "2020-01-08T10:30:00+01:00"
* partOf = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-2)
* serviceProvider.identifier.system = "http://fhir.de/sid/dkgev/iknr"
* serviceProvider.identifier.value = "260950472"
* account.identifier.system = "https://www.charite.de/fhir/sid/fallnummer"
* account.identifier.value = "F-2020-000123"
* account.display = "Account A1 - DRG G23B Appendektomie ohne schwere CC"
* location[+].status = #completed
* location[=].physicalType = $location-physical-type#ro "Room"
* location[=].location.display = "Radiology Department, CT Scanner"

// Procedure 3: CT Abdomen
Instance: mii-exa-prozedur-imaging
InstanceOf: MII_PR_Prozedur_Procedure
Usage: #example
Title: "MII EXA Prozedur Procedure Imaging CT Abdomen"
Description: "Procedure: Diagnostic imaging procedure (CT abdomen) for appendicitis workup"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure)
* extension[Dokumentationsdatum].valueDateTime = "2020-01-08T10:30:00+01:00"
* extension[durchfuehrungsabsicht].valueCoding = $sct-no-ver#261004008
* status = #completed
* category = $sct-no-ver#363679005
* code.coding[ops] = $ops#3-207
* code.coding[ops].version = "2020"
* code.coding[sct] = $sct-no-ver#169070004
* code.text = "Native Computertomographie des Abdomens"
* subject = Reference(mii-exa-person-patient-1)
* encounter = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-2)
* performedDateTime = "2020-01-08T10:00:00+01:00"
* bodySite = $sct-no-ver#818981001
* bodySite.text = "Abdomen"

// Encounter-5 (VS3): Operating Room 4
Instance: mii-exa-fall-kontakt-gesundheitseinrichtung-5
InstanceOf: mii-pr-fall-kontakt-gesundheitseinrichtung
Usage: #example
Title: "MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt OR VS3)"
Description: "Encounter: Care unit encounter (Versorgungsstellenkontakt) for operating room"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
* identifier.type = $v2-0203#VN
* identifier.system = "https://www.charite.de/fhir/sid/aufnahmenummer"
* identifier.value = "VS3"
* status = #finished
* class = $v3-ActCode#IMP
* type[Kontaktebene] = $Kontaktebene#versorgungsstellenkontakt
* type[KontaktArt] = $kontaktart-de-cs#operation
* subject = Reference(mii-exa-person-patient-1)
* period.start = "2020-01-08T20:30:00+01:00"
* period.end = "2020-01-08T22:15:00+01:00"
* partOf = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-2)
* serviceProvider.identifier.system = "http://fhir.de/sid/dkgev/iknr"
* serviceProvider.identifier.value = "260950472"
* account.identifier.system = "https://www.charite.de/fhir/sid/fallnummer"
* account.identifier.value = "F-2020-000123"
* account.display = "Account A1 - DRG G23B Appendektomie ohne schwere CC"
* location[+].status = #completed
* location[=].physicalType = $location-physical-type#ro "Room"
* location[=].location.display = "OR 4 (Operating Room 4)"

// Procedure 1: Emergency Appendectomy
Instance: mii-exa-prozedur-procedure
InstanceOf: MII_PR_Prozedur_Procedure
Usage: #example
Title: "MII EXA Prozedur Procedure Appendectomy"
Description: "Procedure: Surgical procedure (appendectomy)"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure)
* extension[Dokumentationsdatum].valueDateTime = "2020-01-08T23:00:00+01:00"
* extension[durchfuehrungsabsicht].valueCoding = $sct-no-ver#262202000
* status = #completed
* category = $sct-no-ver#387713003
* code.coding[ops] = $ops#5-470
* code.coding[ops].version = "2020"
* code.coding[sct] = $sct-no-ver#80146002
* code.text = "Appendektomie"
* subject = Reference(mii-exa-person-patient-1)
* encounter = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-2)
* performedPeriod.start = "2020-01-08T20:30:00+01:00"
* performedPeriod.end = "2020-01-08T22:15:00+01:00"
* bodySite = $sct-no-ver#181255000
* bodySite.text = "Appendix"

// Encounter-6 (VS4): PACU
Instance: mii-exa-fall-kontakt-gesundheitseinrichtung-6
InstanceOf: mii-pr-fall-kontakt-gesundheitseinrichtung
Usage: #example
Title: "MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt PACU VS4)"
Description: "Encounter: Care unit encounter (Versorgungsstellenkontakt) for post-anesthesia care unit"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
* identifier.type = $v2-0203#VN
* identifier.system = "https://www.charite.de/fhir/sid/aufnahmenummer"
* identifier.value = "VS4"
* status = #finished
* class = $v3-ActCode#IMP
* type[Kontaktebene] = $Kontaktebene#versorgungsstellenkontakt
* subject = Reference(mii-exa-person-patient-1)
* period.start = "2020-01-08T22:15:00+01:00"
* period.end = "2020-01-09T00:00:00+01:00"
* partOf = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-2)
* serviceProvider.identifier.system = "http://fhir.de/sid/dkgev/iknr"
* serviceProvider.identifier.value = "260950472"
* account.identifier.system = "https://www.charite.de/fhir/sid/fallnummer"
* account.identifier.value = "F-2020-000123"
* account.display = "Account A1 - DRG G23B Appendektomie ohne schwere CC"
* location[+].status = #completed
* location[=].physicalType = $location-physical-type#wa "Ward"
* location[=].location.display = "PACU (Post-Anesthesia Care Unit)"

// Encounter-10 (VS5): Surgical Ward C3
Instance: mii-exa-fall-kontakt-gesundheitseinrichtung-10
InstanceOf: mii-pr-fall-kontakt-gesundheitseinrichtung
Usage: #example
Title: "MII EXA Fall Kontakt Gesundheitseinrichtung (Versorgungsstellenkontakt Surgical Ward VS5)"
Description: "Encounter: Care unit encounter (Versorgungsstellenkontakt) for surgical ward post-operative care"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
* identifier.type = $v2-0203#VN
* identifier.system = "https://www.charite.de/fhir/sid/aufnahmenummer"
* identifier.value = "VS5"
* status = #finished
* class = $v3-ActCode#IMP
* type[Kontaktebene] = $Kontaktebene#versorgungsstellenkontakt
* subject = Reference(mii-exa-person-patient-1)
* period.start = "2020-01-09T00:00:00+01:00"
* period.end = "2020-01-11T23:59:00+01:00"
* partOf = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-2)
* serviceProvider.identifier.system = "http://fhir.de/sid/dkgev/iknr"
* serviceProvider.identifier.value = "260950472"
* account.identifier.system = "https://www.charite.de/fhir/sid/fallnummer"
* account.identifier.value = "F-2020-000123"
* account.display = "Account A1 - DRG G23B Appendektomie ohne schwere CC"
* location[+].status = #completed
* location[=].physicalType = $location-physical-type#wa "Ward"
* location[=].location.display = "Surgical Ward C3, Room 315, Bed 315-02"

// Encounter-7: Internal Medicine Department
Instance: mii-exa-fall-kontakt-gesundheitseinrichtung-7
InstanceOf: mii-pr-fall-kontakt-gesundheitseinrichtung
Usage: #example
Title: "MII EXA Fall Kontakt Gesundheitseinrichtung (Abteilungskontakt Innere Medizin)"
Description: "Encounter: Department-level encounter (Abteilungskontakt) for Internal Medicine ward care"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
* identifier.type = $v2-0203#VN
* identifier.system = "https://www.charite.de/fhir/sid/aufnahmenummer"
* identifier.value = "F_20200108_001_INME"
* status = #finished
* class = $v3-ActCode#IMP
* type[Kontaktebene] = $Kontaktebene#abteilungskontakt
* serviceType = $Fachabteilungsschluessel#0100 "Innere Medizin"
* subject = Reference(mii-exa-person-patient-1)
* period.start = "2020-01-12T00:00:00+01:00"
* period.end = "2020-01-17T18:00:00+01:00"
* partOf = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-1)
* serviceProvider.identifier.system = "http://fhir.de/sid/dkgev/iknr"
* serviceProvider.identifier.value = "260950472"
* account.identifier.system = "https://www.charite.de/fhir/sid/fallnummer"
* account.identifier.value = "F-2020-000123"
* account.display = "Account A1 - DRG G23B Appendektomie ohne schwere CC"
* diagnosis[0].condition = Reference(mii-exa-diagnose-condition-multiple-codings)
* diagnosis[=].use = $diagnosis-role#CC "Chief complaint"
* diagnosis[+].condition = Reference(mii-exa-diagnose-condition-multiple-codings)
* diagnosis[=].use = $diagnosis-role#AD "Admission diagnosis"
* diagnosis[+].condition = Reference(mii-exa-diagnose-mehrfachcodierung-primaercode)
* diagnosis[=].use = $KontaktDiagnoseProzedur#treatment-diagnosis

// Diagnosis 4: Semicircular Canal Dehiscence
Instance: mii-exa-diagnose-condition-multiple-codings
InstanceOf: MII_PR_Diagnose_Condition
Usage: #example
Title: "MII EXA Diagnose Multiple Codings"
Description: "Condition: Multiple coding systems - ICD-10-GM, Alpha-ID, and Orphanet"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose)
* extension[Feststellungsdatum].valueDateTime = "2020-01-13T14:00:00+01:00"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* code.coding[icd10-gm] = $icd-10-gm#H83.8 "Sonstige näher bezeichnete Krankheiten des Innenohres"
* code.coding[icd10-gm].version = "2020"
* code.coding[alpha-id].system = $alpha-id
* code.coding[alpha-id].version = "2020"
* code.coding[alpha-id].code = #I125918
* code.coding[orphanet].system = "http://www.orpha.net"
* code.coding[orphanet].code = #420402
* code.coding[orphanet].display = "Semicircular canal dehiscence syndrome"
* subject = Reference(mii-exa-person-patient-1)
* encounter = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-7)
* onsetDateTime = "2020-01-13T14:00:00+01:00"
* recordedDate = "2020-01-13T16:00:00+01:00"

// Procedure 2: Physiotherapy for Bursitis
Instance: mii-exa-prozedur-procedure-2
InstanceOf: MII_PR_Prozedur_Procedure
Usage: #example
Title: "MII EXA Prozedur Procedure Physiotherapy"
Description: "Procedure: Physiotherapy procedure for bursitis treatment"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure)
* extension[Dokumentationsdatum].valueDateTime = "2020-01-17T00:00:00+01:00"
* extension[durchfuehrungsabsicht].valueCoding = $sct-no-ver#262202000
* status = #completed
* category = $sct-no-ver#277132007
* code.coding[ops] = $ops#8-561.1
* code.coding[ops].version = "2020"
* code.text = "Funktionsorientierte physikalische Monotherapie"
* subject = Reference(mii-exa-person-patient-1)
* encounter = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-7)
* performedPeriod.start = "2020-01-13T00:00:00+01:00"
* performedPeriod.end = "2020-01-16T00:00:00+01:00"
* bodySite = $sct-no-ver#85562004 "Hand structure"

// Observation: Discharge Vital Status
Instance: mii-exa-person-observation-vitalstatus-discharge
InstanceOf: MII_PR_Person_Vitalstatus
Usage: #example
Title: "MII EXA Person Observation Vitalstatus Discharge"
Description: "Observation: Vital status observation at hospital discharge"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Vitalstatus)
* status = #final
* category[survey] = $observation-category#survey
* code = $loinc#67162-8
* code.text = "Vital status"
* subject = Reference(mii-exa-person-patient-1)
* encounter = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-7)
* effectiveDateTime = "2020-01-17T18:00:00+01:00"
* valueCodeableConcept = $Vitalstatus#L "Patient lebt"
* valueCodeableConcept.text = "Patient lebt"

/*
========================================
PLANNED FUTURE ENCOUNTER: June 14, 2024
Bursitis Follow-up
========================================
*/

// Encounter-3: Planned Follow-up
Instance: mii-exa-fall-kontakt-gesundheitseinrichtung-3
InstanceOf: mii-pr-fall-kontakt-gesundheitseinrichtung
Usage: #example
Title: "MII EXA Fall Kontakt Gesundheitseinrichtung (Planned Encounter)"
Description: "Encounter: Planned encounter with future dates"
* insert TestDataLabel
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
* identifier.type = $v2-0203#VN
* identifier.system = "https://www.charite.de/fhir/sid/aufnahmenummer"
* identifier.value = "F_20240614_001"
* status = #planned
* class = $v3-ActCode#IMP
* type[Kontaktebene] = $Kontaktebene#einrichtungskontakt
* subject = Reference(mii-exa-person-patient-1)
* serviceProvider.identifier.system = "http://fhir.de/sid/dkgev/iknr"
* serviceProvider.identifier.value = "260950472"
* extension[plannedStartDate].valueDateTime = "2024-06-14"
* extension[plannedEndDate].valueDateTime = "2024-06-17"
