ValueSet: MII_VS_Fall_LocationPhysicalType
Id: mii-vs-fall-location-physical-type
Title: "MII VS Fall Location Physical Type"
Description: "A coded type for the physical type of the location."
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/location-physical-type"
* insert PR_CS_VS_Version
* insert LicenseCodeableCCBY40
* ^experimental = false
* ^date = "2024-12-10"
* insert Publisher
* ^experimental = false
* LocationType#bd "Bed"
* LocationType#ro "Room"
* LocationType#wa "Ward"