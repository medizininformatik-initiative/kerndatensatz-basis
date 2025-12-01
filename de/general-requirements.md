# Allgemeine Anforderungen - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Allgemeine Anforderungen

 
Diese Seite enthält Übersetzungen aus der Originalsprache, in der der Leitfaden verfasst wurde. Informationen zu diesen Übersetzungen und Anweisungen zum Abgeben von Feedback zu den Übersetzungen finden Sie[hier](translationinfo.md). 

Diese Seite dokumentiert Anforderungen, die für alle MII-Akteure in diesem Leitfaden gelten. Die verwendeten Konformitätsverben - **MUSS**, **SOLLTE**, **KANN** - sind in den [FHIR Conformance Rules](http://hl7.org/fhir/R4/conformance-rules.html#conflang) definiert.

### MII-Konformitätsartefakte

Die Seite [Profile und Extensions](profiles-and-extensions.md) listet die für diesen Implementierungsleitfaden definierten MII-Profile auf. MII-Profil-[StructureDefinitions](http://hl7.org/fhir/R4/structuredefinition.html) definieren die **minimalen** Elemente, Extensions, Vokabulare und ValueSets, die vorhanden sein **MÜSSEN**, und schränken ein, wie die Elemente bei Verwendung des Profils verwendet werden.

Die MII-Profilelemente umfassen **verpflichtende** und **Must Support** Anforderungen. Verpflichtende Elemente sind erforderlich und haben eine Mindest-Kardinalität von 1 (min=1). Must Support Element Server- und Client-Erwartungen werden von der MII definiert. Die Seite [Must Support](must-support.md) definiert die Server- und Client-Erwartungen für die Verarbeitung dieser Elementanforderungen und veranschaulicht, wie sie angezeigt und dokumentiert werden.

Die Seite [CapabilityStatements](capability-statements.md) zeigt Konformitätsanforderungen und -erwartungen für MII-Server und Client-Anwendungen. Die MII-CapabilityStatements identifizieren die spezifischen Profile und RESTful-Transaktionen, die unterstützt werden müssen. Die MII-Profile identifizieren die strukturellen Einschränkungen, Terminologiebindungen und Invarianten. Implementierer müssen die CapabilityStatements für Details zu den RESTful-Transaktionen, spezifischen Profilen und den für jeden MII-Akteur anwendbaren Suchparametern konsultieren.

### Standards und Harmonisierung

Die MII-Kerndatensatz-Spezifikationen basieren, wo möglich, auf internationalen Standards und Terminologien. Insbesondere werden folgende Standards hervorgehoben:

* **[International Patient Summary (IPS)](http://hl7.org/fhir/uv/ips/)** - Internationaler Standard für Patientenkurzakten
* **[German Base Profiles (Basisprofil DE R4)](https://ig.fhir.de/basisprofile-de/)** - Profile für Anpassung an die Rahmenbedingungen des deutschen Gesundheitswesens
* **[KBV FHIR Spezifikationen](https://simplifier.net/organization/kassenrztlichebundesvereinigungkbv)** - Kompatibilität mit Spezifikationen der Kassenärztlichen Bundesvereinigung
* **[gematik FHIR Spezifikationen](https://simplifier.net/organization/gematik)** - Kompatibilität mit gematik-Spezifikationen
* **[ISiK (Informationssysteme im Krankenhaus)](https://fachportal.gematik.de/informationen-fuer/isik)** - Referenzprojekt für Krankenhausinformationssysteme

Alle Elemente des Kerndatensatzes, angepasst an die Details und Anforderungen für die Anwendungsfälle der Medizininformatik-Initiative, werden nachfolgend in Form von FHIR StructureDefinitions beschrieben. Die Notwendigkeit der Anpassung der FHIR-Profile wird auf jeder Profilseite in Textform erläutert.

### Konformitätsverben

Anforderungen in dieser Spezifikation werden durch die folgenden Schlüsselwörter angezeigt, die in Großbuchstaben geschrieben sind und auf [RFC-2119](https://datatracker.ietf.org/doc/html/rfc2119) basieren:

| | | |
| :--- | :--- | :--- |
| MUSS / MÜSSEN | MUST / SHALL | Erforderlich, verpflichtend |
| DARF NICHT / DÜRFEN NICHT | MUST NOT / SHALL NOT | Verboten |
| VERPFLICHTEND | REQUIRED | Durch Spezifikation erforderlich |
| SOLLTE / SOLLTEN | SHOULD | Empfohlen |
| SOLLTE NICHT / SOLLTEN NICHT | SHOULD NOT | Nicht empfohlen |
| EMPFOHLEN | RECOMMENDED | Empfohlen |
| KANN / OPTIONAL | MAY | Optional |

### Beanspruchung der Konformität zu MII-Profilen

#### Profilunterstützung

Systeme können ein oder mehrere MII-Profile zur Repräsentation klinischer Informationen bereitstellen und unterstützen. Sie verwenden das Inhaltsmodell des Profils ohne Erwartung, die MII-Interaktionen zu implementieren.

Um ein MII-Profil zu unterstützen, **MUSS** ein Server:

* **in der Lage sein**, alle Profildatenelemente zu befüllen, die verpflichtend sind und als Must Support gekennzeichnet sind, wie in der StructureDefinition dieses Profils definiert
* **SOLLTE** die Unterstützung für ein MII-Profil deklarieren, indem er dessen offizielle URL im Element `CapabilityStatement.rest.resource.supportedProfile` des Servers einschließt 
* Die offizielle oder "kanonische" URL des MII-Profils befindet sich auf jeder MII-Profilseite
 

#### Profilunterstützung + Interaktionsunterstützung

Systeme können ein oder mehrere MII-Profile zur Darstellung klinischer Informationen bereitstellen und unterstützen **und** die für diese Ressourcen definierten RESTful-Interaktionen unterstützen.

Ein konformer Server:

* **MUSS** in der Lage sein, alle Profildatenelemente zu befüllen, die verpflichtend sind und/oder als Must Support gekennzeichnet sind, wie in der StructureDefinition dieses Profils definiert
* **SOLLTE** Konformität mit dem entsprechenden MII-CapabilityStatement deklarieren, indem er dessen offizielle URL im Element `CapabilityStatement.instantiates` des Servers einschließt
* **MUSS** die vollständigen Fähigkeitsdetails aus dem MII-CapabilityStatement spezifizieren, das er zu implementieren behauptet 
* Deklarieren Sie die Unterstützung für das MII-Profil, indem Sie dessen offizielle URL im Element `CapabilityStatement.rest.resource.supportedProfile` des Servers einschließen
* Deklarieren Sie die Unterstützung für die FHIR-RESTful-Transaktionen des MII-Profils
 

### Verwendung von Codes in MII-Profilen

Die folgenden Regeln fassen die durch [FHIR Terminology](http://hl7.org/fhir/R4/terminologies.html) definierten Anforderungen für kodierte Elemente (CodeableConcept-, Coding- und code-Datentypen) zusammen.

#### Required Bindings für codierte Elemente

[Required binding](http://hl7.org/fhir/R4/terminologies.html#required) zu einer ValueSet-Definition bedeutet, dass einer der Codes aus dem angegebenen ValueSet verwendet werden **MUSS**. Für `CodeableConcept`, das mehrere Codierungen und ein Textelement zulässt, gilt diese Regel für **mindestens** eine der Codierungen, und nur Text ist **nicht** gültig.

Bei Beanspruchung der Konformität zu einem Profil mit Required Bindings:

* MII-Server **MÜSSEN** mindestens einen Code aus dem gebundenen ValueSet bereitstellen (zusätzliche Codes aus anderen Systemen **KÖNNEN** bereitgestellt werden)
* MII-Clients **MÜSSEN** in der Lage sein, den Code aus dem gebundenen ValueSet zu verarbeiten

#### Extensible Binding für codierte Elemente

[Extensible binding](http://hl7.org/fhir/R4/terminologies.html#extensible) bedeutet, dass einer der Codes aus dem angegebenen ValueSet verwendet werden **MUSS**, wenn ein anwendbares Konzept vorhanden ist. Wenn kein geeigneter Code im ValueSet existiert, können alternative Code(s) angegeben werden. Für `CodeableConcept`, das mehrere Codierungen und ein Textelement zulässt, gilt diese Regel für **mindestens** eines der Codings. Wenn nur Text verfügbar ist und dieser keine konzeptionelle Überschneidung mit den gebundenen codierten Werten hat, kann nur Text verwendet werden.

Bei Beanspruchung der Konformität zu einem Profil mit Extensible Bindings:

* MII-Server **MÜSSEN** Folgendes bereitstellen: 
* Einen Code aus dem gebundenen ValueSet **wenn das Konzept** im ValueSet existiert
* Oder einen alternativen Code **wenn das Konzept nicht** im ValueSet existiert
* Oder Text, wenn nur Text verfügbar ist
 
* MII-Clients **MÜSSEN** in der Lage sein, Codes aus dem gebundenen ValueSet oder alternative Codes oder Text zu verarbeiten

#### Verwendung mehrerer Codes mit dem CodeableConcept-Datentyp

Alternative Codes können zusätzlich zu den in Required- oder Extensible-ValueSets definierten Standardcodes bereitgestellt werden. Diese alternativen Codes werden als "zusätzliche Codierungen" bezeichnet. Sie können in ihrer Bedeutung dem Standard-Konzeptcode entsprechen oder enger gefasst sein.

Beispielsweise kann eine Diagnose sowohl einen ICD-10-GM-Code als auch einen SNOMED CT-Code enthalten:

```
"code": {
  "coding": [
    {
      "system": "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "code": "E11.90",
      "display": "Diabetes mellitus, Typ 2, ohne Komplikationen"
    },
    {
      "system": "http://snomed.info/sct",
      "code": "44054006",
      "display": "Diabetes mellitus type 2"
    }
  ]
}

```

### Fehlende Daten

Es gibt Situationen, in denen Informationen zu einem bestimmten Datenelement fehlen und das Quellsystem den Grund für das Fehlen der Daten nicht kennt. Siehe die Seite [Fehlende Daten](missing-data.md) für detaillierte Leitlinien zum Umgang mit fehlenden Daten in MII-Profilen.

### FHIR RESTful Search API Anforderungen

Für alle unterstützten Suchinteraktionen in diesem Leitfaden:

* Server **MÜSSEN** die HTTP-`POST`-basierte Suche unterstützen
* Server **MÜSSEN** die `GET`-basierte Suche unterstützen

Bei der Suche mit verschiedenen Suchparametertypen:

* **Token-Suchparameter** - [(Anleitung zur Token-Suche)](http://hl7.org/fhir/R4/search.html#token) 
* Der Client **MUSS** mindestens einen Code-Wert bereitstellen und **KANN** sowohl System- als auch Code-Werte bereitstellen
* Der Server **MUSS** beides unterstützen
 
* **Referenz-Suchparameter** - [(Anleitung zur Referenz-Suche)](http://hl7.org/fhir/R4/search.html#reference) 
* Der Client **MUSS** mindestens einen ID-Wert bereitstellen und **KANN** sowohl Typ- als auch ID-Werte bereitstellen
* Der Server **MUSS** beides unterstützen
 
* **Datums-Suchparameter** - [(Anleitung zur Datumssuche)](http://hl7.org/fhir/R4/search.html#date) 
* Der Client **MUSS** Werte mit Genauigkeit auf den **Tag** für Elemente des Datentyps `date` und auf die **Sekunde + Zeitverschiebung** für Elemente des Datentyps `dateTime` bereitstellen
* Der Server **MUSS** Werte mit Genauigkeit auf den **Tag** für Elemente des Datentyps `date` und auf die **Sekunde + Zeitverschiebung** für Elemente des Datentyps `dateTime` unterstützen
 

### Modifier-Elemente

Ein FHIR-[Modifier-Element](http://hl7.org/fhir/R4/conformance-rules.html#isModifier) ist ein Element, das die Bedeutung eines Ressourcenelements modifiziert. Obwohl Server und Clients in der Lage sein **MÜSSEN**, verpflichtende oder Must Support Elemente zu verarbeiten, sind nicht alle Modifier-Elemente verpflichtend oder Must Support, und es besteht keine Anforderung, sie zu unterstützen.

FHIR-Clients müssen sich unerwarteter Modifier-Elemente in den empfangenen Daten bewusst sein, da diese die Bedeutung der Daten verändern können und bei unsachgemäßer Handhabung potenziell zu Fehlern oder sogar Sicherheitsrisiken führen können. Sofern ein Client nicht feststellt, dass er sie sicher verarbeiten kann, ist die Ablehnung typischerweise die einzige sichere Maßnahme, wenn unerwartete Modifier-Elemente vorhanden sind.

Einige Beispiele für Modifier, die in MII-Profilen möglicherweise keine Must Support Elemente sind:

* `implicitRules`-Element, das allen Profilen gemeinsam ist
* `modifierExtension`-Element, das allen Profilen gemeinsam ist
* `Observation.value[x].comparator`
* `Patient.active`

Implementierer **SOLLTEN** die Profilseiten sorgfältig überprüfen, um zu verstehen, welche Elemente Modifier sind und wie sie die Interpretation der Ressource beeinflussen.

-------

Weitere Informationen finden Sie unter:

* [Must Support](must-support.md) - Detaillierte Must Support Anforderungen
* [Allgemeine Anforderungen](general-requirements.md) - Zusätzliche allgemeine Anforderungen
* [Fehlende Daten](missing-data.md) - Leitfaden für den Umgang mit fehlenden Daten
* [CapabilityStatements](capability-statements.md) - Server- und Client-Fähigkeitsanforderungen

