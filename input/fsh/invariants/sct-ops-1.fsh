Invariant: sct-ops-1
Description: "Eine Prozedur MUSS mit OPS oder SNOMED-CT kodiert werden."
Severity: #error
Expression: "coding.where(system = 'http://snomed.info/sct').exists() or coding.where(system = 'http://fhir.de/CodeSystem/bfarm/ops').exists()"