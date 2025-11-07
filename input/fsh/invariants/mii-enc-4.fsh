Invariant: mii-enc-4
Description: "Geplante Kontakte SOLLTEN die Extensions für den geplanten Start- oder End-Zeitpunkt verwenden"
Severity: #warning
Expression: "status = 'planned' implies extension.where(url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedStartDate').exists()"