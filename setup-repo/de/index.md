# Start - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Start

 
Diese Seite enthält Übersetzungen aus der Originalsprache, in der der Leitfaden verfasst wurde. Informationen zu diesen Übersetzungen und Anweisungen zum Abgeben von Feedback zu den Übersetzungen finden Sie[hier](translationinfo.md). 

### Einführung

Dieser Implementierungsleitfaden beschreibt die FHIR-Repräsentation der Basismodule des Kerndatensatzes der Medizininformatik-Initiative (MII). Die Spezifikation umfasst die Module Person, Behandlungsfall, Diagnose und Prozedur. Der MII-Kerndatensatz zielt darauf ab, die Sekundärnutzung von klinischen Routinedaten in der Forschung zu ermöglichen.

#### Zielgruppe

Dieser Implementierungsleitfaden richtet sich an:

##### Implementierer

Implementierer, die für Datenmanagement und Integration in Datenintegrationszentren (DIZ) verantwortlich sind, Softwareentwickler und Systemarchitekten, die FHIR-basierte Lösungen implementieren

* → Siehe [Logische Modelle](logical-models.md) für konzeptuelle Datenmodelle
* → Siehe [UML-Diagramme](uml-diagrams.md) für visuelle Darstellungen
* → Siehe [FHIR-Artefakte](artifacts.md) für technische Spezifikationen

##### Forschende

Wissenschaftler*innen, die MII-Daten für medizinische Forschung nutzen

* → Siehe [Leitfaden für Forschende](researcher-guidance.md) für Anleitungen, Beschreibungen und Beispieldaten zur Analyse
* → Siehe [Logische Modelle](logical-models.md) für Datenstruktur-Übersichten

### Hintergrund

MII Kerndatensatz Module

#### Modulübersicht

**Modul Person**

Das Modul umfasst:

* Patienten-Identifikatoren und demografische Informationen ([Patient](StructureDefinition-mii-pr-person-patient.md))
* Pseudonymisierte Patienten-Repräsentationen für die Forschung ([Patient Pseudonymisiert](StructureDefinition-mii-pr-person-patient-pseudonymisiert.md))
* Vitalstatus ([Vitalstatus Observation](StructureDefinition-mii-pr-person-vitalstatus.md))
* Todesursache ([Todesursache Condition](StructureDefinition-mii-pr-person-todesursache.md))

**Modul Behandlungsfall**

Das Modul umfasst:

* Darstellung von Kontakten (Aufenthalte und Besuche) zwischen Patient*innen und Gesundheitseinrichtungen ([Encounter](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md))

**Modul Diagnose**

Das Modul umfasst:

* Diagnosen und krankheitsbezogene Informationen ([Condition](StructureDefinition-mii-pr-diagnose-condition.md))

**Modul Prozedur**

Das Modul umfasst:

* Dokumentation von Operationen, Eingriffen und anderen medizinischen Prozeduren ([Procedure](StructureDefinition-mii-pr-prozedur-procedure.md))

### Kontaktinformationen

Fragen zu dieser Publikation können auf [chat.fhir.org](https://chat.fhir.org/#narrow/stream/179307-german.2Fmi-initiative) im Stream 'german/mi-initiative' oder auf [mii.zulipchat.com](https://mii.zulipchat.com/#narrow/channel/430086-MII-Kerndatensatz) gestellt werden.

Kommentare und Kritik sind jederzeit in Form von Issues im [GitHub-Repository](https://github.com/medizininformatik-initiative/kerndatensatz-basis) willkommen.

#### Mitwirkende

Dieser Implementierungsleitfaden wurde im Rahmen der Medizininformatik-Initiative erstellt und unterliegt dem Governance-Prozess des Interoperabilitätsforums und der Technischen Komitees von HL7 Deutschland e.V.

### Urheberrecht und Lizenz

© 2019+ TMF e. V., Charlottenstraße 42, 10117 Berlin

![](https://licensebuttons.net/l/by/4.0/88x31.png)

Dieses Werk ist lizenziert unter der [Creative Commons Namensnennung 4.0 International Lizenz](https://creativecommons.org/licenses/by/4.0/deed.de).

Für Nutzungsrechte der zugrunde liegenden FHIR-Technologie siehe die FHIR-Basisspezifikation.

Einige verwendete Codesysteme werden von anderen Organisationen veröffentlicht und gepflegt. Es gilt das Urheberrecht der jeweiligen Herausgeber.

### Haftungsausschluss

* Der Inhalt dieses Dokuments ist öffentlich. Bitte beachten Sie, dass Teile dieses Dokuments auf FHIR Version R4 basieren, dessen Urheberrecht bei HL7 International liegt.
* Obwohl diese Publikation mit größter Sorgfalt erstellt wurde, können die Autor*innen keine Haftung für direkte oder indirekte Schäden übernehmen, die aus dem Inhalt dieser Spezifikation entstehen könnten.

