# Predefined Resources

This directory is used primarily for deprecated content that should no longer be part of the SUSHI build process but is kept for historical reasons.

## Retired Resources

### ValueSet MII_VS_Person_ICD10WHO

This ValueSet has been retired as it is redundant. The ICD-10-WHO CodeSystem already references an implicit ICD-10-WHO ValueSet via `CodeSystem.valueSet`. 

See: https://github.com/medizininformatik-initiative/kerndatensatzmodul-person/issues/86

### Profile Proband:in (ResearchSubject) - MII_PR_Person_Proband

Starting with version 2025.0.0, this profile is published and further developed in the Studie (Study) module. Implementations SHOULD migrate to the modeling from the Studie module.
