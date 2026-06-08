// switch version of all conformance resources here
RuleSet: Version
* version = "2026.0.0"
* extension[+].url = $artifact-versionAlgorithm
* extension[=].valueCoding = $version-algorithm#semver "SemVer"

RuleSet: PR_CS_VS_Version
* ^version = "2026.0.0"
* ^extension[+].url = $artifact-versionAlgorithm
* ^extension[=].valueCoding = $version-algorithm#semver "SemVer"

Alias: $artifact-versionAlgorithm = http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm
Alias: $version-algorithm = http://hl7.org/fhir/version-algorithm

