Die folgenden CapabilityStatements definieren die erwarteten FHIR-Fähigkeiten von Systemen, die diesen Implementierungsleitfaden umsetzen. Jedes Modul definiert die erforderlichen FHIR-RESTful-Interaktionen, Suchparameter und unterstützten Profile.

### Modulspezifische CapabilityStatements

#### Modul Person
* [MII CPS Person CapabilityStatement](CapabilityStatement-mii-cps-person-capabilitystatement.html) - Definiert die FHIR-Fähigkeiten für das Modul Person

#### Modul Behandlungsfall
* [MII CPS Fall CapabilityStatement](CapabilityStatement-mii-cps-fall-capabilitystatement.html) - Definiert die FHIR-Fähigkeiten für das Modul Fall

#### Modul Diagnose
* [MII CPS Diagnose CapabilityStatement](CapabilityStatement-mii-cps-diagnose-capabilitystatement.html) - Definiert die FHIR-Fähigkeiten für das Modul Diagnose

#### Modul Prozedur
* [MII CPS Prozedur CapabilityStatement](CapabilityStatement-mii-cps-prozedur-capabilitystatement.html) - Definiert die FHIR-Fähigkeiten für das Modul Prozedur

---

Jedes CapabilityStatement spezifiziert:
* **Server-Konformitätsanforderungen** - Die FHIR-Ressourcen und Operationen, die unterstützt werden müssen
* **Erforderliche Suchparameter** - Die Suchparameter, die implementiert werden MÜSSEN
* **Unterstützte Profile** - Die MII-Profile, die die Ressourcen einschränken
* **RESTful-Interaktionen** - Die unterstützten Operationen für Erstellen, Lesen, Aktualisieren, Löschen und Suchen

Für detaillierte Implementierungsleitfäden siehe die Seite [Konformität](conformance.html).