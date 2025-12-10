### Leitfaden für Implementierer

Dieser Leitfaden bietet wesentliche Informationen für die Implementierung des MII-Kerndatensatzes in FHIR-basierten Systemen.

#### Verständnis der Anforderungen

**1. Logische Modelle - Fachliche Anforderungen**

[Logischen Modelle](logical-models.html) enthalten die fachlichen und klinischen Anforderungen für jedes Modul:

* **Modul Person** - Patientendemographie und Vitalstatus
* **Modul Diagnose** - Anforderungen an die Diagnosedokumentation
* **Modul Prozedur** - Dokumentation von Prozeduren und Interventionen
* **Modul Fall** - Behandlungsfällen und Versorgungsepisoden

Diese Modelle bieten eine technologieunabhängige Sicht darauf, welche Daten erfasst und ausgetauscht werden.

**2. UML-Diagramme - Datenbeziehungen**

Die [UML-Diagramme](uml-diagrams.html) veranschaulichen:

* Beziehungen zwischen verschiedenen Datenelementen
* Kardinalitäten und Einschränkungen
* Modulabhängigkeiten und Querverweise

#### Konformität und Implementierungsanforderungen

**3. Konformitätsregeln**

Konformitätsanforderungen:

* [Allgemeine Anforderungen](general-requirements.html) - Übergreifende Implementierungsregeln und Erwartungen
* [Must Support](must-support.html) - Kritische Elemente, die Systeme verarbeiten können müssen
* [Umgang mit fehlenden Daten](missing-data.html) - Strategien für den Umgang mit unvollständigen Daten

Diese Seiten definieren die minimalen Konformitätskriterien für die Einhaltung des MII-Kerndatensatzes.

**4. Technische Artefakte**

Implementierungsartefakte:

* [Profile und Extensions](profiles-and-extensions.html) - FHIR-Profile mit Einschränkungen und Erweiterungen
* [Terminologie](terminology.html) - ValueSets und CodeSystems
* [Capability Statements](capability-statements.html) - Anforderungen an Server-Fähigkeiten
* [Suchparameter und Operationen](search-parameters-and-operations.html) - Erforderliche Suchfähigkeiten
* [Beispiele](examples.html) - Beispielressourcen zur Demonstration korrekter Implementierung

**5. Downloads**

Die Seite [Downloads](downloads.html) enthält:

* **FHIR-Package** - Vollständiges Implementierungsleitfaden-Package zur Validierung
* **Beispielressourcen** - Beispieldaten in JSON- und XML-Formaten
* **ImplementationGuide-Ressource** - Maschinenlesbare IG-Definition

#### Validierung und Testen

**Terminologiedienste**

Verwenden Sie für die Terminologievalidierung den MII-Terminologieservice:
* **URL:** [https://www.ontoserver.mii-termserv.de/](https://www.ontoserver.mii-termserv.de/)
* **Zweck:** ValueSet-Expansionen, Code-Validierung und Terminologie-Lookups

**Validierungswerkzeuge**

Verwenden des FHIR-Package mit:
* [FHIR Validator](https://confluence.hl7.org/spaces/FHIR/pages/35718580/Using+the+FHIR+Validator)