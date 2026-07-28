# Versionierung - MII Implementation Guide Core Dataset Base v2027.0.0-dev

## Versionierung

 
Diese Seite enthält Übersetzungen aus der Originalsprache, in der der Leitfaden verfasst wurde. Informationen zu diesen Übersetzungen und Anweisungen zum Abgeben von Feedback zu den Übersetzungen finden Sie [hier](translationinfo.md). 

### Versionierungsschema

Ab Version 2024.0.0 folgt der MII-Kerndatensatz einem **Calendar Versioning (CalVer)**-Schema in einer SemVer-kompatiblen numerischen Form:

* **YYYY.MINOR.PATCH[-label]**-Format
* **YYYY** = Jahr, für das der IG anwendbar und zur Nutzung vorgesehen ist; dies ist die Major-Versionskomponente
* **MINOR** = Minor-Versionsnummer, erhöht für nicht-brechende Funktionserweiterungen oder Präzisierungen
* **PATCH** = Patch-Versionsnummer, erhöht für Korrekturen und Fehlerbehebungen
* **label** = Optionales Pre-Release- oder Build-Label, zum Beispiel `draft`, `ballot` oder `cibuild`

Stabile Releases können verglichen werden, indem die numerischen Komponenten als SemVer-artige `<major>.<minor>.<patch>`-Werte behandelt werden, wobei das Kalenderjahr als Major-Version verwendet wird. Zum Beispiel ist `2026.1.0` neuer als `2026.0.3`. Labels kennzeichnen Pre-Release- oder Build-Status; aus Labels wird keine Reihenfolge abgeleitet.

Alle veröffentlichten FHIR-Artefakte im Package verwenden dieselbe Version wie der gesamte IG bzw. das Package. Dadurch kann ein Artefakt bei einem IG-Release eine neue Version erhalten, auch wenn sich dieses einzelne Artefakt nicht geändert hat.

Die computable CRMI-Metadaten zur Deklaration von Versionsalgorithmus, Versionierungspolicy, Package-Quelle und Manifest-Parametern werden auf der Seite [Metadatenübersicht](metadata.md) beschrieben.

### Versionshistorie und Änderungen

* **[Änderungsprotokoll](changes.md)** - Detailliertes Änderungsprotokoll mit Dokumentation aller Änderungen über Versionen hinweg, organisiert nach Modulen (Person, Behandlungsfall, Diagnose, Prozedur)

