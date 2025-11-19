### Profile

Die folgenden Profile wurden für diesen Implementierungsleitfaden definiert. Sie sind nach Modulen organisiert, um die MII-Kerndatensatz-Anforderungen zu dokumentieren.

#### Modul Person Profile

* [MII PR Person Patient](StructureDefinition-mii-pr-person-patient.html) - Patientendemografie und administrative Informationen
* [MII PR Person Patient Pseudonymisiert](StructureDefinition-mii-pr-person-patient-pseudonymisiert.html) - Pseudonymisierter Patient für Forschungszwecke
* [MII PR Person Vitalstatus](StructureDefinition-mii-pr-person-vitalstatus.html) - Vitalstatus-Observation
* [MII PR Person Todesursache](StructureDefinition-mii-pr-person-todesursache.html) - Todesursachen-Condition

#### Modul Fall Profile

* [MII PR Fall Kontakt Gesundheitseinrichtung](StructureDefinition-mii-pr-fall-kontaktgesundheitseinrichtung.html) - Kontakt mit Gesundheitseinrichtung

#### Modul Diagnose Profile

* [MII PR Diagnose Condition](StructureDefinition-mii-pr-diagnose-condition.html) - Diagnose/Erkrankung

#### Modul Prozedur Profile

* [MII PR Prozedur Procedure](StructureDefinition-mii-pr-prozedur-procedure.html) - Prozedur/Intervention

---

### Extensions

Die folgenden [Extensions](http://hl7.org/fhir/R4/extensibility.html) wurden als Teil des MII-Implementierungsleitfadens definiert. Ein [Verzeichnis der Standard-Extensions](http://hl7.org/fhir/R4/extensibility-registry.html) findet sich in der FHIR-Spezifikation und zusätzliche Erweiterungen können in der HL7 [FHIR-Registry](https://registry.fhir.org/) gefunden werden.

#### Modul Fall Extensions

* [MII EX Fall Planned Start Date](StructureDefinition-mii-ex-fall-planned-start-date.html) - Geplantes Startdatum für einen Kontakt
* [MII EX Fall Planned End Date](StructureDefinition-mii-ex-fall-planned-end-date.html) - Geplantes Enddatum für einen Kontakt

#### Modul Prozedur Extensions

* [MII EX Prozedur Durchfuehrungsabsicht](StructureDefinition-mii-ex-prozedur-durchfuehrungsabsicht.html) - Durchführungsabsicht der Prozedur

---

Eine vollständige Auflistung aller Artefakte (Profile, Extensions, ValueSets usw.) finden Sie in der [Artefakt-Übersicht](artifacts.html).

Für die konzeptionellen Datenmodelle siehe [Logische Modelle](logical-models.html).
