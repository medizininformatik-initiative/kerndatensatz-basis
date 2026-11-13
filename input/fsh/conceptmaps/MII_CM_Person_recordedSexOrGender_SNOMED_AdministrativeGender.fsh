Instance: mii-cm-person-recordedsexorgender-snomed-administrative-gender
InstanceOf: ConceptMap
Usage: #definition
Title: "MII CM Person Recorded Sex or Gender SNOMED to Administrative Gender"
Description: "Maps the SNOMED CT codes of MII VS Person Recorded Sex or Gender SNOMED to FHIR AdministrativeGender. Recorded sex (e.g. sex assigned at birth) and administrative gender are different concepts, so no mapping is equivalent; each relationship is qualified."
* url = "https://www.medizininformatik-initiative.de/fhir/modul-person/ConceptMap/mii-cm-person-recordedsexorgender-snomed-administrative-gender"
* name = "MII_CM_Person_RecordedSexOrGender_SNOMED_AdministrativeGender"
* version = "2027.0.0-ballot"
* status = #active
* experimental = false
* date = "2026-11-12"
* publisher = "Medizininformatik Initiative"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.medizininformatik-initiative.de"
* purpose = "Support deriving or checking Patient.gender from a recorded sex or gender in the Patient extension individual-recordedSexOrGender, without implying that both concepts are equivalent. It is not intended for the reverse direction."
* copyright = "This material includes SNOMED Clinical Terms® (SNOMED CT®) which is used by permission of SNOMED International. All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists. SNOMED and SNOMED CT are registered trademarks of SNOMED International. Implementers of these artefacts must have the appropriate SNOMED CT Affiliate license."
* insert LicenseCodeableCCBY40Instance
* sourceCanonical = "https://www.medizininformatik-initiative.de/fhir/modul-person/ValueSet/mii-vs-person-recordedsexorgender-snomed"
* targetCanonical = "http://hl7.org/fhir/ValueSet/administrative-gender"
* group[0].source = "http://snomed.info/sct"
* group[=].target = "http://hl7.org/fhir/administrative-gender"
* group[=].element[0].code = #248153007
* group[=].element[=].display = "Male"
* group[=].element[=].target[0].code = #male
* group[=].element[=].target[=].display = "Male"
* group[=].element[=].target[=].equivalence = #inexact
* group[=].element[=].target[=].comment = "Recorded (biological) sex and administrative gender overlap but are different concepts; a person may have a different administrative gender."
* group[=].element[+].code = #248152002
* group[=].element[=].display = "Female"
* group[=].element[=].target[0].code = #female
* group[=].element[=].target[=].display = "Female"
* group[=].element[=].target[=].equivalence = #inexact
* group[=].element[=].target[=].comment = "Recorded (biological) sex and administrative gender overlap but are different concepts; a person may have a different administrative gender."
* group[=].element[+].code = #32570691000036108
* group[=].element[=].display = "Intersex"
* group[=].element[=].target[0].code = #other
* group[=].element[=].target[=].display = "Other"
* group[=].element[=].target[=].equivalence = #inexact
* group[=].element[=].target[=].comment = "In Germany, the administrative entries 'divers' (D) and 'ohne Angabe' (X) are represented as 'other' with the extension http://fhir.de/StructureDefinition/gender-amtlich-de; which of them applies cannot be derived from the recorded sex."
* group[=].element[+].code = #32570681000036106
* group[=].element[=].display = "Indeterminate sex"
* group[=].element[=].target[0].code = #other
* group[=].element[=].target[=].display = "Other"
* group[=].element[=].target[=].equivalence = #inexact
* group[=].element[=].target[=].comment = "In Germany, a sex that cannot be determined at birth is registered as 'ohne Angabe' (X) or 'divers' (D), both represented as 'other' with the extension http://fhir.de/StructureDefinition/gender-amtlich-de."
* group[=].element[+].code = #261665006
* group[=].element[=].display = "Unknown"
* group[=].element[=].target[0].code = #unknown
* group[=].element[=].target[=].display = "Unknown"
* group[=].element[=].target[=].equivalence = #wider
* group[=].element[=].target[=].comment = "AdministrativeGender 'unknown' also covers a gender that could not be uniquely defined, so the target is wider than the source."
