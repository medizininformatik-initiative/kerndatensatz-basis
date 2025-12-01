---
parent: 
---
## Terminologien

| Hinweis |  |
|---------|---------------------|
| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} | CodeSystem-Ressourcen für externe Terminologien können bei der Service Unit Terminologische Dienste (SU-TermServ) bezogen werden: https://www.ontoserver.mii-termserv.de/ |

---

| MII VS Fall Identifier Type Codes | |
|--|--|
|Canonical CodeSystem | http://terminology.hl7.org/CodeSystem/v2-0203 |
|Canonical ValueSet | https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/identifier-type-codes |
| Binding | ([extensible](http://hl7.org/fhir/terminologies.html#extensible)) Encounter.identifier:Aufnahmenummer.type |

{{render:https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/identifier-type-codes}}

-------

| Kontaktebene | |
|--|--|
|Canonical CodeSystem | http://fhir.de/CodeSystem/Kontaktebene |
|Canonical ValueSet | http://fhir.de/ValueSet/Kontaktebene |
| Binding | ([required](http://hl7.org/fhir/terminologies.html#required)) Encounter.type:KontaktEbene |

{{render:http://fhir.de/CodeSystem/Kontaktebene}}

-----

| Kontaktart | |
|--|--|
|Canonical CodeSystem | http://fhir.de/CodeSystem/kontaktart-de |
|Canonical ValueSet | http://fhir.de/ValueSet/kontaktart-de |
| Binding | ([required](http://hl7.org/fhir/terminologies.html#required)) Encounter.type:KontaktArt |

{{render:http://fhir.de/CodeSystem/kontaktart-de}}

-----

| Kontakt-Klasse | |
|--|--|
|Canonical CodeSystem | http://terminology.hl7.org/CodeSystem/v3-ActCode |
|Canonical ValueSet | http://fhir.de/ValueSet/EncounterClassDE |
| Binding | ([required](http://hl7.org/fhir/terminologies.html#required)) Encounter.class |

{{render:http://fhir.de/ValueSet/EncounterClassDE}}

---

| DiagnosisRole | |
|--|--|
|Canonical CodeSystem | http://terminology.hl7.org/CodeSystem/diagnosis-role |
|Canonical ValueSet | http://hl7.org/fhir/ValueSet/diagnosis-role |
| Binding | ([extensible](http://hl7.org/fhir/terminologies.html#extensible)) Encounter.diagnosis.use |

{{render:http://hl7.org/fhir/ValueSet/diagnosis-role}}

## Supplement für DiagnosisRole

Zusätzlich existiert ein CodeSystem Supplement mit Anzeigenamen in deutscher Sprache für das DiagnosisRole-CodeSystem:

{{render:http://fhir.de/CodeSystem/diagnosis-role-supplement}}

-----

| Fachabteilungsschlüssel | |
|--|--|
|Canonical CodeSystem | http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel |
|Canonical ValueSet | http://fhir.de/ValueSet/dkgev/Fachabteilungsschluessel |
| Binding | ([extensible](http://hl7.org/fhir/terminologies.html#extensible)) Encounter.serviceType |

{{render:http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel}}

----------------------------------------

| Aufnahmeanlass | |
|--|--|
|Canonical CodeSystem | http://fhir.de/CodeSystem/dgkev/Aufnahmeanlass |
| Canonical ValueSet | http://fhir.de/ValueSet/dgkev/Aufnahmeanlass |
| Binding | ([required](http://hl7.org/fhir/terminologies.html#required)) Encounter.hospitalization.admitSource | 

{{render:http://fhir.de/CodeSystem/dgkev/Aufnahmeanlass}}

----------------------------------------

| Aufnahmegrund 1. & 2. Stelle| |
|--|--|
| Canonical CodeSystem | http://fhir.de/CodeSystem/dkgev/AufnahmegrundErsteUndZweiteStelle |
| Canonical ValueSet | http://fhir.de/ValueSet/dkgev/AufnahmegrundErsteUndZweiteStelle |
| Binding| ([required](http://hl7.org/fhir/terminologies.html#required)) Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle |

{{render:http://fhir.de/CodeSystem/dkgev/AufnahmegrundErsteUndZweiteStelle}}

----------------------------------------

| Aufnahmegrund 3. Stelle| |
|--|--|
| Canonical CodeSystem | http://fhir.de/CodeSystem/dkgev/AufnahmegrundDritteStelle |
| Canonical ValueSet | http://fhir.de/ValueSet/dkgev/AufnahmegrundDritteStelle |
| Binding| ([required](http://hl7.org/fhir/terminologies.html#required)) Encounter.extension:Aufnahmegrund.extension:DritteStelle |

{{render:http://fhir.de/CodeSystem/dkgev/AufnahmegrundDritteStelle}}

----------------------------------------

| Aufnahmegrund 4. Stelle| |
|--|--|
| Canonical CodeSystem | http://fhir.de/CodeSystem/dkgev/AufnahmegrundVierteStelle |
| Canonical ValueSet | http://fhir.de/ValueSet/dkgev/AufnahmegrundVierteStelle |
| Binding| ([required](http://hl7.org/fhir/terminologies.html#required)) Encounter.extension:Aufnahmegrund.extension:VierteStelle |

{{render:http://fhir.de/CodeSystem/dkgev/AufnahmegrundVierteStelle}}

----------------------------------------

| Entlassungsgrund 1. & 2. Stelle| |
|--|--|
| Canonical CodeSystem | http://fhir.de/CodeSystem/dkgev/EntlassungsgrundErsteUndZweiteStelle |
| Canonical ValueSet | http://fhir.de/ValueSet/dkgev/EntlassungsgrundErsteUndZweiteStelle |
| Binding | ([required](http://hl7.org/fhir/terminologies.html#required)) Encounter.hospitalization.dischargeDisposition |

{{render:http://fhir.de/CodeSystem/dkgev/EntlassungsgrundErsteUndZweiteStelle}}

