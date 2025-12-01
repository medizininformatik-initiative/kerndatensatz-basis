# Handling Missing Data - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Handling Missing Data

### Missing Data

There are situations when information on a particular data element is missing and the source system does not know the reason for the absence of data.

This section provides guidance for MII DIZ Servers on handling missing data in MII Base Module resources. The rules align with the [FHIR core specification](https://hl7.org/fhir/R4/extensibility.html#Special-Case) and are consistent with international best practices as defined in the [International Patient Summary (IPS)](https://hl7.org/fhir/uv/ips/Empty-Sections-and-Missing-Data.html).

For general guidance on Must Support elements, see the [Must Support](must-support.md) page. For conformance expectations and coded element requirements, see the [General Requirements](general-requirements.md) page.

#### Elements with Minimum Cardinality = 0

**Rule**: If the source system does not have data for an element with a minimum cardinality = 0 (including elements labeled [Must Support](must-support.md)), the data element **SHALL** be omitted from the resource.

This applies to both non-coded and coded elements with min = 0. Simply omit the element from the resource instance.

#### Mandatory Elements (Minimum Cardinality > 0)

**Rule**: If the data element is a Mandatory element (minimum cardinality > 0), it **SHALL** be present even if the source system does not have data or does not know the reason for the absence of data.

The approach for representing missing data in mandatory elements depends on whether the element is coded or non-coded:

##### Non-Coded Data Elements

For non-coded data elements (e.g., string, HumanName, Address), use the [DataAbsentReason Extension](http://hl7.org/fhir/R4/extension-data-absent-reason.html) in the data type with the code `unknown`.

**Code**: `unknown` - The value is expected to exist but is not known.

**Example**: Patient resource where the patient's family name is not available:

```
{
  "resourceType": "Patient",
  "id": "example-missing-name",
  "name": [
    {
      "extension": [
        {
          "url": "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
          "valueCode": "unknown"
        }
      ]
    }
  ],
  "gender": "unknown",
  "birthDate": "1990-01-01"
}

```

##### Coded Data Elements

For coded data elements, the approach depends on the binding strength of the element:

###### Example, Preferred, or Extensible Binding Strengths

For elements with `example`, `preferred`, or `extensible` binding (CodeableConcept or Coding datatypes):

1. **If the source system has text but no coded data**: Only the`text`element is used.
* For Coding datatypes, the text-only data is represented as a `display` element.

1. **If there is neither text nor coded data**:
* Use the appropriate "unknown" concept code from the ValueSet if available.
* If the ValueSet does not have an appropriate "unknown" concept code, use `unknown` from the [DataAbsentReason Code System](http://hl7.org/fhir/R4/codesystem-data-absent-reason.html).

**Example**: Condition resource where the mandatory `Condition.code` value is unknown:

```
{
  "resourceType": "Condition",
  "id": "example-unknown-code",
  "clinicalStatus": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/condition-clinical",
        "code": "active"
      }
    ]
  },
  "code": {
    "coding": [
      {
        "system": "http://hl7.org/fhir/CodeSystem/data-absent-reason",
        "code": "unknown",
        "display": "Unknown"
      }
    ]
  },
  "subject": {
    "reference": "Patient/example"
  }
}

```

###### Required Binding Strength

For elements with `required` binding (CodeableConcept or Coding or code datatypes):

1. Use the appropriate "unknown" concept code from the ValueSet if available.
1. **If the ValueSet does not have an appropriate "unknown" concept code**, you**MUST**use a concept from the ValueSet. Otherwise, the instance will not be conformant.

#### See Also

* [Must Support](must-support.md) - Server and Client expectations for Must Support elements
* [General Requirements](general-requirements.md) - Using codes in MII profiles and claiming conformance
* [FHIR R4 Conformance Rules](http://hl7.org/fhir/R4/conformance-rules.html#missing) - Core specification guidance on missing data

