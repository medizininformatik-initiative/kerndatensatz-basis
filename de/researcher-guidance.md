# Orientierungshilfe für Forschende - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Orientierungshilfe für Forschende

 
Diese Seite enthält Übersetzungen aus der Originalsprache, in der der Leitfaden verfasst wurde. Informationen zu diesen Übersetzungen und Anweisungen zum Abgeben von Feedback zu den Übersetzungen finden Sie[hier](translationinfo.md). 

### Leitfaden für Forschende

**Hinweis:** Detaillierte Anleitungen für Forschende werden in einer zukünftigen Version dieses Implementierungsleitfadens hinzugefügt.

#### Erste Schritte

Wenn Sie neu im MII-Kerndatensatz sind, empfehlen wir die Erkundung der folgenden Ressourcen:

**1. Logische Modelle - Modulinhalte verstehen**

Die [Logischen Modelle](logical-models.md) bieten technologieunabhängige Beschreibungen der in jedem Modul enthaltenen Daten:

* **Modul Person** - Demographie, Vitalstatus und Patientenidentifikatoren
* **Modul Diagnose** - Klinische Diagnosen und zugehörige Informationen
* **Modul Prozedur** - Medizinische Prozeduren und Interventionen
* **Modul Fall** - Behandlungsfälle und Versorgungsepisoden

Diese Modelle helfen Ihnen, den Umfang und die Struktur der verfügbaren Daten zu verstehen, ohne FHIR-technische Details kennen zu müssen.

**2. UML-Diagramme - Datenbeziehungen visualisieren**

Die [UML-Diagramme](uml-diagrams.md) zeigen, wie verschiedene Datenelemente innerhalb und zwischen Modulen miteinander in Beziehung stehen. Diese Diagramme sind besonders nützlich für:

* Verständnis von Datenabhängigkeiten
* Identifizierung relevanter Datenelemente für eine Forschungsfrage

**3. Beispiele - FHIR-Daten in der Praxis**

Der Abschnitt [Beispiele](examples.md) bietet praxisnahe Beispiele von FHIR-Ressourcen, die zeigen:

* Wie klinische Daten im FHIR-Format dargestellt werden
* Wie ein vollständiger Datensatz aussieht
* Wie verschiedene Ressourcen aufeinander verweisen

Die Durchsicht von Beispielen kann Ihnen helfen zu verstehen, was Sie bei der Arbeit mit MII-Kerndatensatz-Implementierungen erwarten können.

