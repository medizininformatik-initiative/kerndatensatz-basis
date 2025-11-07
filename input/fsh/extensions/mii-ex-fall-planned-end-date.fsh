Extension: MII_EX_Fall_Planned_End_Date
Id: mii-ex-fall-planned-end-date
Title: "MII EX Fall Planned End Date"
Description: "The planned end date/time (or discharge date) of the encounter"
* insert Publisher
* insert PR_CS_VS_Version
* insert LicenseCodeableCC0
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #pa
* insert ExtensionContext(Encounter)
* ^url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedEndDate"
* value[x] only dateTime