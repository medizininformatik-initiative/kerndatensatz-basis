Alias: $spdx-license = http://hl7.org/fhir/spdx-license

RuleSet: LicenseCodeableCCBY40
* ^meta.extension[+].url = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license"
* ^meta.extension[=].valueCode = #CC-BY-4.0

RuleSet: LicenseCodeableCCBY40Instance
* meta.extension[+].url = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license"
* meta.extension[=].valueCode = #CC-BY-4.0

RuleSet: LicenseCodeableCC0
* ^meta.extension[+].url = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license"
* ^meta.extension[=].valueCode = #CC0-1.0