RuleSet: AddBundleEntry(resource, url)
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/{url}/{resource}"
* entry[=].resource = {resource}
* entry[=].request.method = #POST
* entry[=].request.url = "{url}"

// =============================================================================
// Bundles the example scenario resources into a single transaction bundle
// =============================================================================
Instance: mii-exa-base-test-data-bundle-1
InstanceOf: Bundle
Usage: #example
Title: "MII EXA Base Test Data Bundle 1"
Description: "Bundle: collection of example scenario resources as transaction bundle"
* insert TestDataLabel
* type = #transaction
* timestamp = "2025-11-28T09:38:00+01:00"
// Patient
* insert AddBundleEntry(mii-exa-person-patient-1, Patient)
// Encounters - 2019 Pre-hospital
* insert AddBundleEntry(mii-exa-fall-kontakt-gesundheitseinrichtung-8, Encounter)
// Encounters - 2020 Hospitalization
* insert AddBundleEntry(mii-exa-fall-kontakt-gesundheitseinrichtung-1, Encounter)
* insert AddBundleEntry(mii-exa-fall-kontakt-gesundheitseinrichtung-9, Encounter)
* insert AddBundleEntry(mii-exa-fall-kontakt-gesundheitseinrichtung-11, Encounter)
* insert AddBundleEntry(mii-exa-fall-kontakt-gesundheitseinrichtung-2, Encounter)
* insert AddBundleEntry(mii-exa-fall-kontakt-gesundheitseinrichtung-4, Encounter)
* insert AddBundleEntry(mii-exa-fall-kontakt-gesundheitseinrichtung-5, Encounter)
* insert AddBundleEntry(mii-exa-fall-kontakt-gesundheitseinrichtung-6, Encounter)
* insert AddBundleEntry(mii-exa-fall-kontakt-gesundheitseinrichtung-10, Encounter)
* insert AddBundleEntry(mii-exa-fall-kontakt-gesundheitseinrichtung-7, Encounter)
// Diagnoses
* insert AddBundleEntry(mii-exa-diagnose-mehrfachcodierung-primaercode, Condition)
* insert AddBundleEntry(mii-exa-diagnose-mehrfachcodierung-sekundaercode, Condition)
* insert AddBundleEntry(mii-exa-diagnose-appendicitis, Condition)
* insert AddBundleEntry(mii-exa-diagnose-condition-elbow-contusion, Condition)
* insert AddBundleEntry(mii-exa-diagnose-condition-multiple-codings, Condition)
// Procedures
* insert AddBundleEntry(mii-exa-prozedur-procedure, Procedure)
* insert AddBundleEntry(mii-exa-prozedur-procedure-2, Procedure)
* insert AddBundleEntry(mii-exa-prozedur-imaging, Procedure)
// Observations
* insert AddBundleEntry(mii-exa-person-observation-vitalstatus, Observation)
* insert AddBundleEntry(mii-exa-person-observation-vitalstatus-discharge, Observation)