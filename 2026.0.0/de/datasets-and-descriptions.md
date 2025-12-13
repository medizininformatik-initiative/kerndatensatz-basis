# Datensätze und Beschreibungen - MII Implementation Guide Core Dataset Base v2026.0.0

## Datensätze und Beschreibungen

 
Diese Seite enthält Übersetzungen aus der Originalsprache, in der der Leitfaden verfasst wurde. Informationen zu diesen Übersetzungen und Anweisungen zum Abgeben von Feedback zu den Übersetzungen finden Sie[hier](translationinfo.md). 

Logische Modelle bieten eine konzeptionelle Ansicht der in diesem Implementierungsleitfaden definierten Datenstrukturen. Sie repräsentieren die Datenelemente und ihre Beziehungen unabhängig von der FHIR-Ressourcenstruktur und sind dadurch für Fachexpert*innen und Forschende leichter verständlich.

Eine vollständige Liste aller logischen Modelle finden Sie in der [Übersicht der logischen Modelle](logical-models.md).

Für die Basismodule des MII-Kerndatensatzes sind folgende logische Modelle definiert:

### Modul Person

* [Logisches Modell Person](StructureDefinition-mii-lm-person.md) - Konzeptionelles Modell für Patientendemografie, Vitalstatus und identifizierende Informationen

### Modul Fall

* [Logisches Modell Fall](StructureDefinition-mii-lm-fall.md) - Konzeptionelles Modell für Kontakte im Gesundheitswesen

### Modul Diagnose

* [Logisches Modell Diagnose](StructureDefinition-mii-lm-diagnose.md) - Konzeptionelles Modell für Diagnosen und Erkrankungen

### Modul Prozedur

* [Logisches Modell Prozedur](StructureDefinition-mii-lm-prozedur.md) - Konzeptionelles Modell für Prozeduren

-------

Für die entsprechenden FHIR-Ressourcenprofile, die diese logischen Modelle implementieren, siehe [Profile und Extensions](profiles-and-extensions.md).

