### Versioning Scheme

Starting with version 2024.0.0, the MII Kerndatensatz follows a **Calendar Versioning (CalVer)** scheme in a SemVer-compatible numeric form:

* **YYYY.MINOR.PATCH[-label]** format
* **YYYY** = Year the IG is applicable and intended to be used; this is the major version component
* **MINOR** = Minor version number, incremented for non-breaking feature additions or refinements
* **PATCH** = Patch version number, incremented for corrections and bug fixes
* **label** = Optional pre-release or build label, for example `draft`, `ballot`, or `cibuild`

Stable releases can be compared by treating the numeric components as SemVer-style `<major>.<minor>.<patch>` values, with the calendar year used as the major version. For example, `2026.1.0` is newer than `2026.0.3`. Labels indicate pre-release or build status; no ordering is inferred among labels.

All released FHIR artifacts in the package use the same version as the overall IG/package. As a result, an artifact may receive a new version when the IG is released even if that individual artifact did not change.

The computable CRMI metadata used to declare version algorithm, versioning policy, package source, and manifest parameters is described on the [Metadata Overview](metadata.html) page.

### Version History and Changes

* **[Change Log](changes.html)** - Detailed change log documenting all modifications across versions, organized by module (Person, Treatment Case, Diagnosis, Procedure)
