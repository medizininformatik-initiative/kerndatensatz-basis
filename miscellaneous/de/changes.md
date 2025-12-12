# Changelog - MII Implementation Guide Core Dataset Base v2026.0.0

## Changelog

 
Diese Seite enthält Übersetzungen aus der Originalsprache, in der der Leitfaden verfasst wurde. Informationen zu diesen Übersetzungen und Anweisungen zum Abgeben von Feedback zu den Übersetzungen finden Sie[hier](translationinfo.md). 

Diese Seite dokumentiert die Änderungen und Updates über Versionen des MII-Implementierungsleitfadens Kerndatensatz Basis hinweg. Dieses konsolidierte Änderungsprotokoll kombiniert Release Notes aus allen vier Basismodulen: Person, Fall, Diagnose und Prozedur.

-------

### Version 2026.0.0

**Datum:** 11.12.2026

#### Modulkonsolidierung

* **Konsolidierter Implementierungsleitfaden:** Die vier Basismodule (Person, Fall, Diagnose und Prozedur) wurden zu einem Implementierungsleitfaden zusammengeführt
* **Package-ID:** `de.medizininformatikinitiative.kerndatensatz.base`

#### Beispielkonsolidierung

* **Einheitliches Testdaten-Bundle:** Beispielressourcen wurden in einem umfassenden Testdaten-Bundle zusammengeführt
* **Modulübergreifende Beispiele:** Beispiele demonstrieren nun Beziehungen und Referenzen über alle vier Module hinweg

#### Modul Diagnose

* **Changed:** Aktualisierte Anleitung zur Verwendung von Condition.encounter zur Ausrichtung an gematik ISiK-Empfehlungen (Informationstechnische Systeme in Krankenhäusern)
* **Changed:** Condition.encounter SOLLTE nun auf einen Encounter der Ebene "Abteilungskontakt" referenzieren
* **Hinweis:** Dies stellt eine Änderung gegenüber vorherigen Versionen dar, in denen Encounter.diagnosis die primäre Verknüpfungsmethode war

#### Modul Fall

* **Changed:** Aktualisierte Anleitung zum Abrechnungsfallkontext und Account-Referenzen basierend auf der gematik ISiK-Spezifikation
* **Changed:** Erweiterte Dokumentation zur Unterscheidung zwischen Aufnahmenummer und Fallnummer
* **Changed:** Klargestellt, dass die Fallnummer den Abrechnungsfall (Account) identifiziert und als logische Referenz in `Encounter.account.identifier` angegeben werden sollte
* **Changed:** Jeder Encounter SOLLTE seine eigene eindeutige Aufnahmenummer in `Encounter.identifier:Aufnahmenummer` haben

#### Modul Prozedur

* **Changed:** Anleitung hinzugefügt mit Empfehlung zur Verwendung von `Procedure.encounter` zur Etablierung des Kontaktkontexts, abgestimmt mit den Empfehlungen des Diagnose-Moduls

#### Modul Person

* **Added:** ValueSet MII VS Person ICD-10-WHO veröffentlicht unter MII-Canonical URL für Todesursachen-Codierung

-------

### Version 2025.0.1

#### Modul Person

**Datum:** 08.10.2025

* **Added**: Profil [Patient Pseudonymisiert](StructureDefinition-mii-pr-person-patient-pseudonymisiert.md) enthält nun einen optionalen Identifikator für maskierte Krankenversicherungsnummer unter `Patient.identifier`
* **Changed**: ValueSet MII_VS_Person_ICD10WHO wurde als redundant [zurückgezogen](http://hl7.org/fhir/R4/codesystem-publication-status.html#publication-status-retired). Das ICD-10-WHO CodeSystem referenziert bereits ein implizites ICD-10-WHO ValueSet über `CodeSystem.valueSet`. Siehe: https://github.com/medizininformatik-initiative/kerndatensatzmodul-person/issues/86
* **Changed**: Abhängigkeit aktualisiert auf [de.basisprofil.r4 1.5.4](https://simplifier.net/packages/de.basisprofil.r4/1.5.4). Diese Version der FHIR-Basisprofile enthält eine Korrektur für die kvid-2-Invariante, die auf `Patient.identifier:versichertenId.type` im Patient-Profil angewendet wird

#### Modul Fall

**Datum:** 28.10.2025

* **Changed**: `Encounter.location` erlaubt nun die Angabe früherer Behandlungsorte. Siehe: https://github.com/medizininformatik-initiative/kerndatensatzmodul-fall/issues/79

#### Modul Diagnose

**Datum:** 20.10.2025

* **Added**: `Condition.onsetAge` - Der Datentyp `Age` kann nun unter `Condition.onset[x]` verwendet werden. Siehe: https://github.com/medizininformatik-initiative/kerndatensatzmodul-diagnose/issues/78
* **Changed**: `Condition.bodySite` - Kardinalität des SNOMED-Coding-Slices von 1..1 auf 0..1 geändert. Siehe: https://github.com/medizininformatik-initiative/kerndatensatzmodul-diagnose/issues/75
* **Added**: Neue ValueSets und Bindings für ICD-10-GM (Canonical URL: `https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-icd10gm`) und AlphaID (Canonical URL: `https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-alphaid`), die über den MII-Terminologieserver (https://www.ontoserver.mii-termserv.de/) expandiert werden können, was erweiterte Validierung ermöglicht
* **Changed**: CapabilityStatement enthält nun Anforderungsdokumentation für Suchparameter `_count` und `_summary`

#### Modul Prozedur

**Datum:** 22.10.2025

* **Added**: `Procedure.bodySite` - Enthält nun optionalen SNOMED-Coding-Slice, übernimmt die Modellierung aus dem `Condition.bodySite` des Diagnose-Moduls
* **Added**: ValueSet und Binding für OPS (Canonical URL: `https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/mii-vs-prozedur-ops`). Dieses kann über den MII-Terminologieserver (https://www.ontoserver.mii-termserv.de/) expandiert werden, was erweiterte Validierung ermöglicht
* **Added**: CapabilityStatement enthält nun Anforderungsdokumentation für Suchparameter `_count` und `_summary`

-------

### Version 2025.0.0

#### Modul Person

**Datum:** 06.12.2024

* **Changed**: Abhängigkeit von de.basisprofil.r4 auf Version 1.5.0 aktualisiert 
* Dies ändert das [Patient](StructureDefinition-mii-pr-person-patient.md)-Profil im Element `Patient.identifier`: Gesetzliche und private Krankenversicherungsnummern verwenden nun ein einheitliches Identifikatorprofil [IdentifierKvid10](https://simplifier.net/packages/de.basisprofil.r4/1.5.0/files/2461154). `Patient.identifier.type` MUSS für Krankenversicherungsnummern auf `KVZ10` geändert werden. Die zuvor verwendeten Codes `GKV` und `PKV` für `Patient.identifier.type` haben den Status `retired` (siehe [CodeSystem IdentifierTypeDeBasis](https://simplifier.net/packages/de.basisprofil.r4/1.5.0/files/2461165)). Patient-Ressourcen aus Version 2024 bleiben gültig, SOLLTEN aber auf den neuen Identifikator umstellen
 
* **Removed**: Das ResearchSubject-Profil wurde [zurückgezogen](http://hl7.org/fhir/R4/codesystem-publication-status.html#publication-status-retired). Ab Version 2025.0.0 wird dieses Profil im Studien-Modul veröffentlicht und entwickelt. Implementierungen SOLLTEN auf die Modellierung aus dem Studien-Modul umstellen
* **Removed**: CodeSystem ICD-10-WHO v2019 und v2016 wurden entfernt. Diese können nun über den MII-Terminologieservice (SU-TermServ) bezogen werden: https://www.ontoserver.mii-termserv.de/
* **Removed**: Suchparameter aus diesem Modul wurden entfernt. SearchParameter-Ressourcen werden nun zentral im Meta-Modul verwaltet
* **Changed**: Profile enthalten zusätzliche Beschreibungen und Übersetzungen für Implementierer und das Forschungsdatenportal Gesundheit (FDPG)

#### Modul Fall

**Datum:** 10.12.2024

* **Changed**: Abhängigkeit von de.basisprofil.r4 auf Version 1.5.0 aktualisiert. Diese Änderung hat keine Auswirkungen auf Implementierungen dieses Moduls
* **Changed**: Profile enthalten zusätzliche Beschreibungen und Übersetzungen für Implementierer und das Forschungsdatenportal Gesundheit (FDPG)
* **Removed**: Suchparameter aus diesem Modul entfernt. SearchParameter-Ressourcen werden nun zentral im Meta-Modul verwaltet
* **Changed**: Kardinalität von `Encounter.period` im [Encounter](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md)-Profil von 1..1 auf 0..1, um geplante Behandlungsfälle darzustellen, bei denen der tatsächliche Zeitraum noch unbekannt ist. Siehe: https://github.com/medizininformatik-initiative/kerndatensatzmodul-fall/issues/56
* **Added**: Constraints prüfen nun das Vorhandensein von Start- und Endzeiten (`Encounter.period`) abhängig vom Status eines Falls
* **Added**: Erweiterung des Encounter-Profils mit zwei Extensions für geplante Start- und Enddaten in `Encounter.extension`
* **Fixed**: Korrektur des ValueSet-Bindings auf Element `Encounter.serviceType.coding:ErweiterterFachabteilungsschluessel` zu [http://fhir.de/ValueSet/dkgev/Fachabteilungsschluessel-erweitert](https://simplifier.net/packages/de.basisprofil.r4/1.4.0/files/656779)
* **Changed**: Must-Support FHIR-Datenelemente im Encounter-Profil enthalten nun erweiterte Beschreibungen unter 'Short description' und 'Definition'
* **Added**: `Encounter.diagnosis.use` hat nun ValueSet-Binding zu `https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/mii-vs-fall-diagnosis-use`
* **Changed**: In `Encounter.location`-Slices für Zimmer, Bett, Station - Kardinalität der Elemente `Encounter.location.location.identifier` und `Encounter.location.location.display` von 1..1 auf 0..1 geändert
* **Removed**: MustSupport-Labels von `Encounter.location` und `Encounter.serviceProvider` entfernt

#### Modul Diagnose

**Datum:** 09.12.2024

* **Changed**: Abhängigkeit von de.basisprofil.r4 auf [Version 1.5.0](https://simplifier.net/packages/de.basisprofil.r4/1.5.0) aktualisiert. Diese Änderung hat keine Auswirkungen auf Implementierungen dieses Moduls
* **Removed**: `Condition.code` und `Condition.bodySite` ICD-O-3-Slices entfernt. Diese werden nun vom Onkologie-Modul definiert
* **Changed**: Profile enthalten zusätzliche Beschreibungen und Übersetzungen für Implementierer und das Forschungsdatenportal Gesundheit (FDPG)
* **Removed**: Suchparameter aus diesem Modul entfernt. SearchParameter-Ressourcen werden nun zentral im Meta-Modul verwaltet
* **Changed**: Ressourcen verwenden SNOMED CT-Version `http://snomed.info/sct/900000000000207008/version/20240701` modulübergreifend, um stabile [ValueSet-Expansion](http://hl7.org/fhir/R4/valueset.html#expansion) zu gewährleisten
* **Added**: `Condition.verificationStatus` hat nun MustSupport-Label. Siehe: https://github.com/medizininformatik-initiative/kerndatensatzmodul-diagnose/issues/64

#### Modul Prozedur

**Datum:** 09.12.2024

* **Changed**: Abhängigkeit von de.basisprofil.r4 auf [Version 1.5.0](https://simplifier.net/packages/de.basisprofil.r4/1.5.0) aktualisiert. Diese Änderung hat keine Auswirkungen auf Implementierungen dieses Moduls
* **Changed**: Profile enthalten zusätzliche Beschreibungen und Übersetzungen für Implementierer und das Forschungsdatenportal Gesundheit (FDPG)
* **Removed**: Suchparameter aus diesem Modul entfernt. SearchParameter-Ressourcen werden nun zentral im Meta-Modul verwaltet
* **Removed**: CodeSystem-Ressourcen für Operationen- und Prozedurenschlüssel (OPS) wurden entfernt. Diese können nun über den MII-Terminologieservice (SU-TermServ) bezogen werden: https://www.ontoserver.mii-termserv.de/
* **Changed**: Ressourcen verwenden SNOMED CT-Version `http://snomed.info/sct/900000000000207008/version/20240701` modulübergreifend, um stabile [ValueSet-Expansion](http://hl7.org/fhir/R4/valueset.html#expansion) zu gewährleisten

-------

### Version 2024.0.1

#### Modul Fall

**Datum:** 17.04.2024

* **Fixed**: Korrektur der Versionsparameter in Konformitätsressourcen. Im zuvor veröffentlichten Paket stimmte `StructureDefinition.version` nicht einheitlich mit der Paketversion überein. Siehe: https://github.com/medizininformatik-initiative/kerndatensatzmodul-fall/issues/51

-------

### Version 2024.0.0

Alle Module haben [Calendar Versioning (CalVer)](https://calver.org/) mit dem Schema YYYY.MINOR.PATCH übernommen und damit einen jährlichen Release-Zyklus etabliert.

#### Modul Person

**Datum:** 16.04.2024

* **Changed**: Versionierungsschema auf [Calendar Versioning (CalVer)](https://calver.org/) mit Schema YYYY.MINOR.PATCH umgestellt
* **Changed**: Benennung von Konformitätsressourcen und Beispielinstanzen folgt einheitlichen [MII-Namenskonventionen](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Namenskonventionen-f%C3%BCr-FHIR%E2%80%90Ressourcen-in-der-MII)
* **Changed**: Ressourcen verwenden SNOMED CT-Version `http://snomed.info/sct/900000000000207008/version/20230731` modulübergreifend, um stabile ValueSet-Expansion zu gewährleisten
* **Changed**: Im [Patient](StructureDefinition-mii-pr-person-patient.md)-Profil wurden alle min 1.. Kardinalitäten entfernt
* **Added**: Profil [Patient Pseudonymisiert](StructureDefinition-mii-pr-person-patient-pseudonymisiert.md) ist neu seit Version 1.0. Im Vergleich zu zuvor veröffentlichten Versionen wurden alle 0..0 Kardinalitäten entfernt. Außerdem werden vom Profil keine Pseudonymisierungsregeln mehr vorgeschrieben. Die genauen Pseudonymisierungsregeln innerhalb der Medizininformatik-Initiative werden noch entwickelt und können in einer späteren Version des Profils angewendet werden. Folglich wurden die folgenden Invarianten entfernt: 
* 'GeburtsdatumRundenAufQuartal' auf **Patient.birthDate**
* 'TodesdatumKeineZeitangabe' auf **Patient.deceasedDateTime**
* 'PostleitzahlEinschraenkung' auf **Patient.address.postalCode**
 
* **Added**: Neues Profil [Todesursache](StructureDefinition-mii-pr-person-todesursache.md) zur Darstellung der Todesursache mit ICD-10-WHO
* **Changed**: Datentypen im logischen Modell wurden angepasst, um den Datentypen der Elemente im FHIR-Profil zu entsprechen, auf die sie gemappt sind

#### Modul Fall

**Datum:** 28.03.2024

* **Changed**: Versionierungsschema auf [Calendar Versioning (CalVer)](https://calver.org/) umgestellt
* **Changed**: Benennung von Konformitätsressourcen und Beispielinstanzen folgt einheitlichen MII-Namenskonventionen
* **Changed**: Anforderungsdokumentation verwendet nun Schlüsselwörter gemäß [RFC-2119](https://datatracker.ietf.org/doc/html/rfc2119)
* **Changed**: Abhängigkeit von [Version 0.9.13](https://simplifier.net/packages/de.basisprofil.r4/0.9.13) auf [Version 1.4.0](https://simplifier.net/packages/de.basisprofil.r4/1.4.0) der FHIR-Basisprofile geändert
* **Breaking Changes** beim Wechsel von Version 1.0 auf Version 2.0 (2024.0.0): 
* Aufnahmegrund wurde in Version 1.0 unter `Encounter.reasonCode` spezifiziert. Wird nun über [Extension aus German FHIR Base Profiles](https://simplifier.net/packages/de.basisprofil.r4/1.4.0/files/656695) im Element `Encounter.extension:Aufnahmegrund` erfasst
* ValueSet-Binding auf Element `Encounter.identifier.type` für Aufnahmenummer erweitert mit Code [v2-0203#VN](https://simplifier.net/resolve?scope=hl7.fhir.r4.core@4.0.1&filepath=package/CodeSystem-v2-0203.json)
* Unter `Encounter.location` gibt es nun eine Spezifikation, wie Informationen über Zimmer-, Bett- und Stationsstandorte OPTIONAL dargestellt werden können
* In Version 1.0 war `Encounter.diagnosis.use` bei der Angabe einer Diagnose OPTIONAL. Neu in dieser Version ist die Aufteilung von `Encounter.diagnosis.use.coding` in Diagnosetyp und Diagnoseuntertyp, von denen mindestens einer vorhanden sein MUSS
* In Version 1.0 enthielt `Encounter.serviceType` nur eine Spezifikation für den Fachabteilungsschlüssel. Dies wurde in dieser Version um den erweiterten Fachabteilungsschlüssel erweitert
 

#### Modul Diagnose

**Datum:** 16.04.2024

* **Changed**: Versionierungsschema auf [Calendar Versioning (CalVer)](https://calver.org/) umgestellt
* **Changed**: Benennung von Konformitätsressourcen und Beispielinstanzen folgt einheitlichen MII-Namenskonventionen
* **Changed**: Ressourcen verwenden SNOMED CT-Version `http://snomed.info/sct/900000000000207008/version/20230731` für stabile ValueSet-Expansion
* **Changed**: Anforderungsdokumentation verwendet nun Schlüsselwörter gemäß [RFC-2119](https://datatracker.ietf.org/doc/html/rfc2119)
* **Changed**: Abhängigkeit von [Version 0.9.13](https://simplifier.net/packages/de.basisprofil.r4/0.9.13) auf [Version 1.4.0](https://simplifier.net/packages/de.basisprofil.r4/1.4.0) der FHIR-Basisprofile geändert
* **Breaking Changes** beim Wechsel von Version 1.0 auf Version 2.0 (2024.0.0): 
* Für doppelt/mehrfach kodierte ICD-Codes MUSS die Darstellung der Code-Komponenten über separate Condition-Ressourcen erfolgen
* Die Verknüpfung von Condition-Ressourcen MUSS über die [Extension: Condition Related](http://hl7.org/fhir/StructureDefinition/condition-related) erfolgen
* Jeder vorhandene Mehrfachkodierungskennzeichen (`*`, `†`, `!`) MUSS vom ICD-Code getrennt und in der [Extension: Multiple Coding Indicator for ICD-10-GM](https://simplifier.net/packages/de.basisprofil.r4/1.4.0/files/656614) erfasst werden
* Die kanonische URL für das ICD-10-GM CodeSystem wurde von `http://fhir.de/CodeSystem/dimdi/icd-10-gm` auf `http://fhir.de/CodeSystem/bfarm/icd-10-gm` geändert. Die aktuelle kanonische URL MUSS im Element `Condition.code.coding.system` für ICD-10-GM-Codes verwendet werden
 
* **Added**: Im [Diagnose](StructureDefinition-mii-pr-diagnose-condition.md)-Profil wurden die Elemente `Condition.code.coding` und `Condition.bodySite.coding` jeweils mit einem OPTIONALEN Slice für ICD-O-3 erweitert
* **Added**: Im Profil unter `Condition.extension('http://hl7.org/fhir/StructureDefinition/condition-assertedDate')` gibt es nun eine Extension zur Angabe des Feststellungsdatums einer Diagnose
* **Added**: Im Profil unter `Condition.onsetPeriod.(start|end).extension` gibt es nun OPTIONAL eine Spezifikation zur Angabe der Lebensphase als Code via Extension, ab der ein Patient eine Erkrankung hat oder nicht mehr hat
* **Added**: Modul wurde um SearchParameter-Ressourcen erweitert, die die Suche nach ICD-10-GM-Codes in Kombination mit Mehrfachkodierungskennzeichen, Lateralität und diagnostischer Sicherheit ermöglichen

#### Modul Prozedur

**Datum:** 16.04.2024

* **Changed**: Versionierungsschema auf [Calendar Versioning (CalVer)](https://calver.org/) umgestellt
* **Changed**: Benennung von Konformitätsressourcen und Beispielinstanzen folgt einheitlichen MII-Namenskonventionen
* **Changed**: Ressourcen verwenden SNOMED CT-Version `http://snomed.info/sct/900000000000207008/version/20230731` für stabile ValueSet-Expansion
* **Changed**: Anforderungsdokumentation verwendet nun Schlüsselwörter gemäß [RFC-2119](https://datatracker.ietf.org/doc/html/rfc2119)
* **Changed**: Abhängigkeit von [Version 0.9.13](https://simplifier.net/packages/de.basisprofil.r4/0.9.13) auf [Version 1.4.0](https://simplifier.net/packages/de.basisprofil.r4/1.4.0) der FHIR-Basisprofile geändert
* **Breaking Changes** beim Wechsel von Version 1.0 auf Version 2.0 (2024.0.0): 
* Die kanonische URL für das OPS CodeSystem wurde von `http://fhir.de/CodeSystem/dimdi/ops` auf `http://fhir.de/CodeSystem/bfarm/ops` geändert. Die aktuelle kanonische URL MUSS im Element `Procedure.code.coding.system` für OPS-Codes verwendet werden
 
* **Breaking Change**: Im ValueSet MII_VS_Prozedur_OpsKategorien_SNOMEDCT wurde ein inaktiver SNOMED-Code `103693007 |Diagnostic procedure (procedure)|` durch `165197003 |Diagnostic assessment (procedure)|` ersetzt. Das ValueSet wird auf `Procedure.category.coding` verwendet. Falls der inaktive Code zuvor in Version 1.0 dieses Moduls implementiert wurde, MUSS dieser Code beim Wechsel auf Version 2.0 (2024.0.0) des Prozedur-Moduls geändert werden

-------

### Versionierungsschema

Ab Version 2024.0.0 verwenden alle Module [Calendar Versioning (CalVer)](https://calver.org/) mit dem Schema YYYY.MINOR.PATCH:

* **YYYY** (Jahresversion): Gibt das Jahr an, in dem das Kerndatensatzmodul angewendet wird
* **MINOR**: Veröffentlicht bei Einführung neuer Features, Erweiterungen oder wesentlicher Änderungen
* **PATCH**: Enthält Fehlerbehebungen oder textliche Korrekturen

Dies etabliert einen jährlichen Release-Zyklus, der über alle Basismodule hinweg abgestimmt ist.

