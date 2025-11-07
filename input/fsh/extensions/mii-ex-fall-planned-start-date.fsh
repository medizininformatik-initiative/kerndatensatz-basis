Extension: MII_EX_Fall_Planned_Start_Date
Id: mii-ex-fall-planned-start-date
Title: "MII EX Fall Planned Start Date"
Description: "The planned start date/time (or admission date) of the encounter"
* insert Publisher
* insert PR_CS_VS_Version
* insert LicenseCodeableCC0
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #pa
* insert ExtensionContext(Encounter)
* ^url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedStartDate"
* value[x] only dateTime