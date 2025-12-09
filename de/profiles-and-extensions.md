# Profile und Extensions - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Profile und Extensions

 
Diese Seite enthält Übersetzungen aus der Originalsprache, in der der Leitfaden verfasst wurde. Informationen zu diesen Übersetzungen und Anweisungen zum Abgeben von Feedback zu den Übersetzungen finden Sie[hier](translationinfo.md). 

### Profile

Die folgenden Profile wurden für diesen Implementierungsleitfaden definiert. Sie sind nach Modulen organisiert, um die MII-Kerndatensatz-Anforderungen zu dokumentieren.

#### Modul Person Profile

* [MII PR Person Patient](StructureDefinition-mii-pr-person-patient.md) - Patientendemografie und administrative Informationen
* [MII PR Person Patient Pseudonymisiert](StructureDefinition-mii-pr-person-patient-pseudonymisiert.md) - Pseudonymisierter Patient für Forschungszwecke
* [MII PR Person Vitalstatus](StructureDefinition-mii-pr-person-vitalstatus.md) - Vitalstatus-Observation
* [MII PR Person Todesursache](StructureDefinition-mii-pr-person-todesursache.md) - Todesursachen-Condition

#### Modul Fall Profile

* [MII PR Fall Kontakt Gesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md) - Kontakt mit Gesundheitseinrichtung

#### Modul Diagnose Profile

* [MII PR Diagnose Condition](StructureDefinition-mii-pr-diagnose-condition.md) - Diagnose/Erkrankung

#### Modul Prozedur Profile

* [MII PR Prozedur Procedure](StructureDefinition-mii-pr-prozedur-procedure.md) - Prozedur/Intervention

-------

### Extensions

Die folgenden [Extensions](http://hl7.org/fhir/R4/extensibility.html) wurden als Teil des MII-Implementierungsleitfadens definiert.

#### Modul Fall Extensions

* [MII EX Fall Planned Start Date](StructureDefinition-mii-ex-fall-planned-start-date.md) - Geplantes Startdatum für einen Kontakt
* [MII EX Fall Planned End Date](StructureDefinition-mii-ex-fall-planned-end-date.md) - Geplantes Enddatum für einen Kontakt

#### Modul Prozedur Extensions

* [MII EX Prozedur Durchfuehrungsabsicht](StructureDefinition-mii-ex-prozedur-durchfuehrungsabsicht.md) - Durchführungsabsicht der Prozedur

-------

Eine vollständige Auflistung aller Artefakte (Profile, Extensions, ValueSets usw.) finden Sie in der [Artefakt-Übersicht](artifacts.md).

Für die konzeptionellen Datenmodelle siehe [Logische Modelle](logical-models.md).

