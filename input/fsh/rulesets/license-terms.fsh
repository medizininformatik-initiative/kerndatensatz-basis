Alias: $spdx-license = http://hl7.org/fhir/spdx-license

RuleSet: LicenseCodeableCCBY40
* ^meta.extension[+].url = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license"
* ^meta.extension[=].valueCodeableConcept = $spdx-license#CC-BY-4.0 "Creative Commons Attribution 4.0 International"

RuleSet: LicenseCodeableCCBY40Instance
* meta.extension[+].url = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license"
* meta.extension[=].valueCodeableConcept = $spdx-license#CC-BY-4.0 "Creative Commons Attribution 4.0 International"

RuleSet: LicenseCodeableCC0
* ^meta.extension[+].url = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license"
* ^meta.extension[=].valueCodeableConcept = $spdx-license#CC0-1.0 "Creative Commons Zero v1.0 Universal"