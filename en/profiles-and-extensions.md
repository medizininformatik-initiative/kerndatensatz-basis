# Profiles and Extensions - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Profiles and Extensions

### Profiles

The following profiles have been defined for this implementation guide. They are organized by module to support the MII core dataset requirements.

#### Person Module Profiles

* [MII PR Person Patient](StructureDefinition-mii-pr-person-patient.md) - Patient demographics and administrative information
* [MII PR Person Patient Pseudonymisiert](StructureDefinition-mii-pr-person-patient-pseudonymisiert.md) - Pseudonymized patient for research use
* [MII PR Person Vitalstatus](StructureDefinition-mii-pr-person-vitalstatus.md) - Vital status observation
* [MII PR Person Todesursache](StructureDefinition-mii-pr-person-todesursache.md) - Cause of death observation

#### Treatment Case Module Profiles

* [MII PR Fall Kontakt Gesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md) - Encounter/contact with healthcare facility

#### Diagnosis Module Profiles

* [MII PR Diagnose Condition](StructureDefinition-mii-pr-diagnose-condition.md) - Diagnosis/condition

#### Procedure Module Profiles

* [MII PR Prozedur Procedure](StructureDefinition-mii-pr-prozedur-procedure.md) - Procedure/intervention

-------

### Extensions

The following [extensions](http://hl7.org/fhir/R4/extensibility.html) have been defined as part of the MII Implementation Guide.

#### Treatment Case Module Extensions

* [MII EX Fall Planned Start Date](StructureDefinition-mii-ex-fall-planned-start-date.md) - Planned start date for encounter
* [MII EX Fall Planned End Date](StructureDefinition-mii-ex-fall-planned-end-date.md) - Planned end date for encounter

#### Procedure Module Extensions

* [MII EX Prozedur Durchfuehrungsabsicht](StructureDefinition-mii-ex-prozedur-durchfuehrungsabsicht.md) - Procedure intent

-------

For a complete listing of all artifacts (profiles, extensions, value sets, etc.), see the [Artifacts Overview](artifacts.md).

For the conceptual data models, see [Logical Models](logical-models.md).

