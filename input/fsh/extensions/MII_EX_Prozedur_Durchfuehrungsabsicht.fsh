Extension: MII_EX_Prozedur_Durchfuehrungsabsicht
Id: mii-ex-prozedur-durchfuehrungsabsicht
Title: "MII EX Prozedur Durchführungsabsicht"
Description: "Intention der Prozedur"
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht"
* insert PR_CS_VS_Version
* insert Publisher
* insert LicenseCodeableCCBY40
* ^date = "2024-12-09"
* ^context.type = #element
* ^context.expression = "Procedure"
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht" (exactly)
* value[x] 1..
* value[x] only Coding
* value[x] from MII_VS_Prozedur_Durchfuehrungsabsicht_SNOMEDCT (required)
* value[x].system 1..
* value[x].system = "http://snomed.info/sct" (exactly)
* value[x].code 1..