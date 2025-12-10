# Suchparameter und Operations - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Suchparameter und Operations

 
Diese Seite enthält Übersetzungen aus der Originalsprache, in der der Leitfaden verfasst wurde. Informationen zu diesen Übersetzungen und Anweisungen zum Abgeben von Feedback zu den Übersetzungen finden Sie[hier](translationinfo.md). 

### Suchparameter und Operationen

Diese Seite beschreibt die Suchfunktionen und Operationen, die für die Module des MII-Kerndatensatzes Basis definiert sind.

#### Suchparameter

Der MII-Kerndatensatz nutzt sowohl Standard-FHIR-Suchparameter als auch benutzerdefinierte Suchparameter, um die Abfrage von Daten zu ermöglichen.

**Standard-FHIR-Suchparameter**

Alle in der FHIR R4-Spezifikation definierten Basis-FHIR-Suchparameter SOLLTEN von Implementierungen unterstützt werden. Details sind zu finden in der [FHIR Search-Spezifikation](http://hl7.org/fhir/R4/search.html).

**Modulspezifische Suchanforderungen**

Die relevanten Suchparameter, die für jedes Modul erforderlich sind, sind in den jeweiligen Capability Statements aufgeführt:

* [Capability Statement Modul Person](CapabilityStatement-mii-cps-person-capabilitystatement.md)
* [Capability Statement Modul Diagnose](CapabilityStatement-mii-cps-diagnose-capabilitystatement.md)
* [Capability Statement Modul Prozedur](CapabilityStatement-mii-cps-prozedur-capabilitystatement.md)
* [Capability Statement Modul Fall](CapabilityStatement-mii-cps-fall-capabilitystatement.md)

**Benutzerdefinierte Suchparameter**

Benutzerdefinierte SearchParameter-Ressourcen, die spezifisch für den MII-Kerndatensatz sind, werden im **MII Meta-Modul** veröffentlicht:

* **Simplifier-Projekt:** [MedizininformatikInitiative-Kerndatensatz](https://simplifier.net/MedizininformatikInitiative-Kerndatensatz)
* **Zweck:** Spezialisierte Abfragen ermöglichen, die für Forschungsanwendungsfälle relevant sind

Implementierer sollten das Meta-Modul auf benutzerdefinierte SearchParameter-Definitionen prüfen, die die Standard-FHIR-Suchfunktionen erweitern.

#### Operationen

Es sind derzeit **keine benutzerdefinierten Operationen** in diesem Modul definiert.

