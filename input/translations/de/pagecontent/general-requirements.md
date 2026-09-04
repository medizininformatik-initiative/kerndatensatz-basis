Diese Seite dokumentiert Anforderungen, die für alle MII-Akteure in diesem Leitfaden gelten. Die verwendeten Konformitätsverben - **MUSS**, **SOLL**, **KANN** - sind in den [FHIR Conformance Rules](http://hl7.org/fhir/R4/conformance-rules.html#conflang) definiert.

### MII-Konformitätsartefakte

Die Seite [Profile und Extensions](profiles-and-extensions.html) listet die für diesen Implementierungsleitfaden definierten MII-Profile auf. MII-Profil-[StructureDefinitions](http://hl7.org/fhir/R4/structuredefinition.html) definieren die *minimalen* Elemente, Extensions, Vokabulare und ValueSets, die vorhanden sein **MÜSSEN**, und schränken ein, wie die Elemente bei Verwendung des Profils verwendet werden.

Die MII-Profilelemente umfassen *verpflichtende* und *Must Support* Anforderungen. Verpflichtende Elemente sind erforderlich und haben eine Mindest-Kardinalität von 1 (min=1). Must Support Element Server- und Client-Erwartungen werden von der MII definiert. Die Seite [Must Support](must-support.html) definiert die Server- und Client-Erwartungen für die Verarbeitung dieser Elementanforderungen und veranschaulicht, wie sie angezeigt und dokumentiert werden.

Die Seite [CapabilityStatements](capability-statements.html) zeigt Konformitätsanforderungen und -erwartungen für MII-Server und Client-Anwendungen. Die MII-CapabilityStatements identifizieren die spezifischen Profile und RESTful-Transaktionen, die unterstützt werden müssen. Die MII-Profile identifizieren die strukturellen Einschränkungen, Terminologiebindungen und Invarianten. Implementierer müssen die CapabilityStatements für Details zu den RESTful-Transaktionen, spezifischen Profilen und den für jeden MII-Akteur anwendbaren Suchparametern konsultieren.

### Standards und Harmonisierung

Die MII-Kerndatensatz-Spezifikationen basieren, wo möglich, auf internationalen Standards und Terminologien. Insbesondere werden folgende Standards hervorgehoben:

* **[International Patient Summary (IPS)](http://hl7.org/fhir/uv/ips/)** - Internationaler Standard für Patientenkurzakten
* **[German Base Profiles (Basisprofil DE R4)](https://ig.fhir.de/basisprofile-de/)** - Profile für Anpassung an die Rahmenbedingungen des deutschen Gesundheitswesens
* **[KBV FHIR Spezifikationen](https://simplifier.net/organization/kassenrztlichebundesvereinigungkbv)** - Kompatibilität mit Spezifikationen der Kassenärztlichen Bundesvereinigung
* **[gematik FHIR Spezifikationen](https://simplifier.net/organization/gematik)** - Kompatibilität mit gematik-Spezifikationen
* **[ISiK (Informationssysteme im Krankenhaus)](https://fachportal.gematik.de/informationen-fuer/isik)** - Referenzspezifikation für Informationssysteme im Krankenhaus

Alle Elemente des Kerndatensatzes, angepasst an die Details und Anforderungen für die Anwendungsfälle der Medizininformatik-Initiative, werden nachfolgend in Form von FHIR StructureDefinitions beschrieben. Die Notwendigkeit der Anpassung der FHIR-Profile wird auf jeder Profilseite in Textform erläutert.

### Konformitätsverben

Anforderungen in dieser Spezifikation werden durch die folgenden Schlüsselwörter angezeigt, die in Großbuchstaben geschrieben sind und auf [RFC-2119](https://datatracker.ietf.org/doc/html/rfc2119) basieren:

<table style="border-collapse: collapse; width: 100%;">
  <thead>
    <tr style="background-color: #f2f2f2;">
      <th style="border: 1px solid #ddd; padding: 8px; text-align: left;">Deutsch</th>
      <th style="border: 1px solid #ddd; padding: 8px; text-align: left;">Englisch</th>
      <th style="border: 1px solid #ddd; padding: 8px; text-align: left;">Bedeutung</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="border: 1px solid #ddd; padding: 8px;">MUSS / MÜSSEN</td>
      <td style="border: 1px solid #ddd; padding: 8px;">MUST / SHALL</td>
      <td style="border: 1px solid #ddd; padding: 8px;">Erforderlich, verpflichtend</td>
    </tr>
    <tr style="background-color: #f9f9f9;">
      <td style="border: 1px solid #ddd; padding: 8px;">DARF NICHT / DÜRFEN NICHT</td>
      <td style="border: 1px solid #ddd; padding: 8px;">MUST NOT / SHALL NOT</td>
      <td style="border: 1px solid #ddd; padding: 8px;">Verboten</td>
    </tr>
    <tr>
      <td style="border: 1px solid #ddd; padding: 8px;">VERPFLICHTEND</td>
      <td style="border: 1px solid #ddd; padding: 8px;">REQUIRED</td>
      <td style="border: 1px solid #ddd; padding: 8px;">Durch Spezifikation erforderlich</td>
    </tr>
    <tr style="background-color: #f9f9f9;">
      <td style="border: 1px solid #ddd; padding: 8px;">SOLL / SOLLEN</td>
      <td style="border: 1px solid #ddd; padding: 8px;">SHOULD</td>
      <td style="border: 1px solid #ddd; padding: 8px;">Empfohlen</td>
    </tr>
    <tr>
      <td style="border: 1px solid #ddd; padding: 8px;">SOLL NICHT / SOLLEN NICHT</td>
      <td style="border: 1px solid #ddd; padding: 8px;">SHOULD NOT</td>
      <td style="border: 1px solid #ddd; padding: 8px;">Nicht empfohlen</td>
    </tr>
    <tr style="background-color: #f9f9f9;">
      <td style="border: 1px solid #ddd; padding: 8px;">EMPFOHLEN</td>
      <td style="border: 1px solid #ddd; padding: 8px;">RECOMMENDED</td>
      <td style="border: 1px solid #ddd; padding: 8px;">Empfohlen</td>
    </tr>
    <tr>
      <td style="border: 1px solid #ddd; padding: 8px;">KANN / OPTIONAL</td>
      <td style="border: 1px solid #ddd; padding: 8px;">MAY</td>
      <td style="border: 1px solid #ddd; padding: 8px;">Optional</td>
    </tr>
  </tbody>
</table>

### Beanspruchung der Konformität zu MII-Profilen

#### Profilunterstützung

Systeme können ein oder mehrere MII-Profile zur Repräsentation klinischer Informationen bereitstellen und unterstützen. Sie verwenden das Inhaltsmodell des Profils ohne Erwartung, die MII-Interaktionen zu implementieren.

Um ein MII-Profil zu unterstützen:

* Ein Server **MUSS** in der Lage sein, alle Profildatenelemente zu befüllen, die verpflichtend sind und als Must Support gekennzeichnet sind, wie in der StructureDefinition dieses Profils definiert
* Ein Server **SOLL** die Unterstützung für ein MII-Profil deklarieren, indem er dessen offizielle URL im Element `CapabilityStatement.rest.resource.supportedProfile` des Servers einschließt
  * Die offizielle oder "kanonische" URL des MII-Profils befindet sich auf jeder MII-Profilseite

#### Profilunterstützung + Interaktionsunterstützung

Systeme können ein oder mehrere MII-Profile zur Darstellung klinischer Informationen bereitstellen und unterstützen *und* die für diese Ressourcen definierten RESTful-Interaktionen unterstützen.

Ein konformer Server:

* **MUSS** in der Lage sein, alle Profildatenelemente zu befüllen, die verpflichtend sind und/oder als Must Support gekennzeichnet sind, wie in der StructureDefinition dieses Profils definiert
* **SOLL** Konformität mit dem entsprechenden MII-CapabilityStatement deklarieren, indem er dessen offizielle URL im Element `CapabilityStatement.instantiates` des Servers einschließt
* **MUSS** die vollständigen Fähigkeitsdetails aus dem MII-CapabilityStatement spezifizieren, das er zu implementieren behauptet
  * Deklarieren Sie die Unterstützung für das MII-Profil, indem Sie dessen offizielle URL im Element `CapabilityStatement.rest.resource.supportedProfile` des Servers einschließen
  * Deklarieren Sie die Unterstützung für die FHIR-RESTful-Transaktionen des MII-Profils

### Verwendung von Codes in MII-Profilen

Die folgenden Regeln fassen die durch [FHIR Terminology](http://hl7.org/fhir/R4/terminologies.html) definierten Anforderungen für kodierte Elemente (CodeableConcept-, Coding- und code-Datentypen) zusammen.

#### Required Bindings für codierte Elemente

[Required binding](http://hl7.org/fhir/R4/terminologies.html#required) zu einer ValueSet-Definition bedeutet, dass einer der Codes aus dem angegebenen ValueSet verwendet werden **MUSS**. Für `CodeableConcept`, das mehrere Codierungen und ein Textelement zulässt, gilt diese Regel für *mindestens* eine der Codierungen, und nur Text ist *nicht* gültig.

Bei Beanspruchung der Konformität zu einem Profil mit Required Bindings:

* MII-Server **MÜSSEN** mindestens einen Code aus dem gebundenen ValueSet bereitstellen (zusätzliche Codes aus anderen Systemen **KÖNNEN** bereitgestellt werden)
* MII-Clients **MÜSSEN** in der Lage sein, den Code aus dem gebundenen ValueSet zu verarbeiten

#### Extensible Binding für codierte Elemente

[Extensible binding](http://hl7.org/fhir/R4/terminologies.html#extensible) bedeutet, dass einer der Codes aus dem angegebenen ValueSet verwendet werden **MUSS**, wenn ein anwendbares Konzept vorhanden ist. Wenn kein geeigneter Code im ValueSet existiert, können alternative Code(s) angegeben werden. Für `CodeableConcept`, das mehrere Codierungen und ein Textelement zulässt, gilt diese Regel für *mindestens* eines der Codings. Wenn nur Text verfügbar ist und dieser keine konzeptionelle Überschneidung mit den gebundenen codierten Werten hat, kann nur Text verwendet werden.

Bei Beanspruchung der Konformität zu einem Profil mit Extensible Bindings:

* MII-Server **MÜSSEN** Folgendes bereitstellen:
  * Einen Code aus dem gebundenen ValueSet *wenn das Konzept* im ValueSet existiert
  * Oder einen alternativen Code *wenn das Konzept nicht* im ValueSet existiert
  * Oder Text, wenn nur Text verfügbar ist
* MII-Clients **MÜSSEN** in der Lage sein, Codes aus dem gebundenen ValueSet oder alternative Codes oder Text zu verarbeiten

#### Verwendung mehrerer Codes mit dem CodeableConcept-Datentyp

Alternative Codes können zusätzlich zu den in Required- oder Extensible-ValueSets definierten Standardcodes bereitgestellt werden. Diese alternativen Codes werden als "zusätzliche Codierungen" bezeichnet. Sie können in ihrer Bedeutung dem Standard-Konzeptcode entsprechen oder enger gefasst sein.

Beispielsweise kann eine Diagnose sowohl einen ICD-10-GM-Code als auch einen SNOMED CT-Code enthalten:

```json
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

Es gibt Situationen, in denen Informationen zu einem bestimmten Datenelement fehlen und das Quellsystem den Grund für das Fehlen der Daten nicht kennt. Siehe die Seite [Fehlende Daten](missing-data.html) für detaillierte Leitlinien zum Umgang mit fehlenden Daten in MII-Profilen.

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
  * Der Client **MUSS** Werte mit Genauigkeit auf den *Tag* für Elemente des Datentyps `date` und auf die *Sekunde + Zeitverschiebung* für Elemente des Datentyps `dateTime` bereitstellen
  * Der Server **MUSS** Werte mit Genauigkeit auf den *Tag* für Elemente des Datentyps `date` und auf die *Sekunde + Zeitverschiebung* für Elemente des Datentyps `dateTime` unterstützen

### Modifier-Elemente

Ein FHIR-[Modifier-Element](http://hl7.org/fhir/R4/conformance-rules.html#isModifier) ist ein Element, das die Bedeutung eines Ressourcenelements modifiziert. Obwohl Server und Clients in der Lage sein **MÜSSEN**, verpflichtende oder Must Support Elemente zu verarbeiten, sind nicht alle Modifier-Elemente verpflichtend oder Must Support, und es besteht keine Anforderung, sie zu unterstützen.

FHIR-Clients müssen sich unerwarteter Modifier-Elemente in den empfangenen Daten bewusst sein, da diese die Bedeutung der Daten verändern können und bei unsachgemäßer Handhabung potenziell zu Fehlern oder sogar Sicherheitsrisiken führen können. Sofern ein Client nicht feststellt, dass er sie sicher verarbeiten kann, ist die Ablehnung typischerweise die einzige sichere Maßnahme, wenn unerwartete Modifier-Elemente vorhanden sind.

Einige Beispiele für Modifier, die in MII-Profilen möglicherweise keine Must Support Elemente sind:

* `modifierExtension`-Element, das allen Profilen gemeinsam ist
* `Observation.valueQuantity.comparator`
* `Patient.active`

Implementierer **SOLLEN** die Profilseiten sorgfältig überprüfen, um zu verstehen, welche Elemente Modifier sind und wie sie die Interpretation der Ressource beeinflussen.

### Umgang mit Storno-Kennzeichen aus Quellsystemen

Quellsysteme können technische Storno- oder Löschkennzeichen (z.B. ein SAP-Storno-Flag) für Kontakte, Bewegungen, Diagnosen, Prozeduren, Dokumente und andere Datensätze verwenden. Ein solches Kennzeichen ist selbst kein FHIR-Lebenszyklusstatus und kann nicht ressourcenübergreifend einheitlich abgebildet werden. Seine Bedeutung kann von einem geplanten, aber nicht stattgefundenen Ereignis über eine unterbrochene Aktivität bis hin zu einem Duplikat oder einem anderweitig fehlerhaften Datensatz reichen.

Der Zeitpunkt, zu dem das Storno erfasst wurde, reicht nicht aus, um einen FHIR-Status auszuwählen. Insbesondere belegt ein nach dem geplanten Beginn erfasstes Storno nicht, dass ein Kontakt oder eine Prozedur begonnen hat. Implementierer **SOLLEN** die fachliche Bedeutung für jedes Quellsystem, jeden Quellobjekttyp und, soweit vorhanden, jeden Stornogrund ermitteln und dokumentieren. Eine generische Regel, die jedes Storno-Kennzeichen aus einem Quellsystem auf `cancelled` oder `entered-in-error` abbildet, **SOLL NICHT** verwendet werden.

Die folgende Tabelle wendet diese Unterscheidung auf die Profile dieses Leitfadens an:

| Bedeutung im Quellsystem | Abbildung in FHIR R4 | Interpretation |
|---|---|---|
| Der Datensatz wurde irrtümlich angelegt und hätte nie Teil der Patientenakte sein sollen, z.B. wegen einer doppelten Erfassung oder einer Zuordnung zur falschen Person | `Encounter.status = entered-in-error`; `Procedure.status = entered-in-error`; oder `Condition.verificationStatus = entered-in-error` | Die Ressource ist ungültig und **SOLL** von der regulären klinischen und wissenschaftlichen Nutzung ausgeschlossen werden. Bei einer Condition mit `entered-in-error` **DARF** `Condition.clinicalStatus` **NICHT** vorhanden sein. |
| Ein korrekt geplanter Kontakt hat nicht begonnen, einschließlich Nichterscheinen der Patientin oder des Patienten | `Encounter.status = cancelled` | Der Kontakt hat nicht stattgefunden. Dies gilt unabhängig davon, ob das Storno vor oder nach dem geplanten Beginn erfasst wurde. |
| Ein Kontakt hat begonnen und wurde anschließend beendet, auch früher als geplant | `Encounter.status = finished`; vorangegangene Lebenszyklusphasen **KÖNNEN** über `Encounter.statusHistory` abgebildet werden | Der Kontakt hat stattgefunden und **SOLL NICHT** als `cancelled` abgebildet werden. In FHIR R4 gibt es für Encounter keinen Status `discontinued`. |
| Die Hauptaktivität einer Prozedur hat nicht begonnen; Vorbereitungen können stattgefunden haben | `Procedure.status = not-done`; `Procedure.statusReason` verwenden, wenn der Grund bekannt ist | Die Prozedur wurde nicht durchgeführt. |
| Eine Prozedur wurde vorübergehend unterbrochen und soll fortgesetzt werden | `Procedure.status = on-hold`; `Procedure.statusReason` verwenden, wenn der Grund bekannt ist | Der Status ist nicht terminal; die Prozedur soll fortgesetzt werden. |
| Eine Prozedur wurde endgültig beendet, nachdem ein Teil der Hauptaktivität stattgefunden hat | `Procedure.status = stopped`; `Procedure.statusReason` verwenden, wenn der Grund bekannt ist | Die Prozedur hat zumindest teilweise stattgefunden und **SOLL NICHT** als `not-done` behandelt werden. |
| Eine Diagnose wurde aufgrund diagnostischer und klinischer Evidenz ausgeschlossen | `Condition.verificationStatus = refuted` | Dies ist eine gültige negative klinische Aussage und kein fehlerhafter Datensatz. |
| Eine zuvor gültige Diagnose ist nicht mehr aktiv | Den zutreffenden `Condition.clinicalStatus` verwenden, z.B. `inactive`, `remission` oder `resolved` | Die Diagnose bleibt eine gültige historische Diagnose und ist kein fehlerhafter Datensatz. |
| Die Bedeutung des Storno-Kennzeichens aus dem Quellsystem kann nicht ermittelt werden | Es gibt keine sichere generische Statusabbildung | Der Datensatz **SOLL NICHT** mit einem Status exportiert werden, der Gültigkeit oder Durchführung behauptet. `unknown` ist kein Synonym für ein Storno-Kennzeichen und **SOLL** nur verwendet werden, wenn seine Definition für die jeweilige Ressource zutrifft. |

Für nicht in der Tabelle aufgeführte Ressourcentypen **SOLLEN** Implementierer die ressourcenspezifischen Lebenszyklus- und Statusdefinitionen von FHIR R4 anwenden, anstatt eine Abbildung von einem anderen Ressourcentyp zu übertragen.

#### Initialbefüllung und nachträgliche Korrekturverarbeitung

Wenn bereits vor der Initialbefüllung bekannt ist, dass ein Quelldatensatz eine fehlerhafte Eingabe darstellt, und keine Audit-Anforderung seine Abbildung im FHIR-Zielsystem erfordert, **SOLL** der Datensatz im ETL-Prozess herausgefiltert und nicht in das Zielsystem geladen werden. Ein abgesagter geplanter Kontakt oder eine nicht durchgeführte Prozedur kann dagegen eine relevante Information sein und **KANN** mit dem entsprechenden FHIR-Status geladen werden.

Wird das Storno erst bekannt, nachdem die Ressource bereits in das FHIR-Zielsystem geladen wurde, **SOLL** ein nachfolgender ETL- oder Korrekturlauf sicherstellen, dass der aktuelle Datenbestand keinen unzutreffenden Zustand mehr enthält. Sofern ein fachlich korrekter FHIR-Status vorhanden ist, **SOLL** die bestehende Ressource unter Beibehaltung ihrer logischen ID aktualisiert werden. Wenn keine sichere Statusabbildung existiert, **SOLL** die Ressource aus dem aktuellen Datenbestand entfernt werden, z.B. über die FHIR-RESTful-Interaktion `delete`, sofern das Zielsystem diese unterstützt und lokale Aufbewahrungs- und Audit-Anforderungen dies zulassen. Aktualisierungen und Löschungen **SOLLEN** in nachgelagerte oder replizierte Datenbestände propagiert werden. Ein Statuswert **SOLL NICHT** lediglich als Ersatz für eine technisch aufwendige Löschung ausgewählt werden. Diese Leitlinie begründet keine zusätzlichen Anforderungen an die RESTful-Interaktionen `update` oder `delete`; die [MII-CapabilityStatements](capability-statements.html) definieren die von diesem Leitfaden geforderten Interaktionen.

Statusänderungen gelten für jede Ressource einzeln und werden nicht automatisch über Referenzen weitergegeben. Beispielsweise bestimmt die Kennzeichnung einer Encounter-Ressource als `entered-in-error` nicht von selbst den Status verknüpfter Condition- oder Procedure-Ressourcen; jede verknüpfte Ressource **SOLL** anhand ihrer eigenen Quellinformationen und ihrer fachlichen Bedeutung bewertet werden.

#### Anforderungen an die Datennutzung

Status- und Verifikationselemente, die [Modifier-Elemente](http://hl7.org/fhir/R4/conformance-rules.html#isModifier) sind, dürfen nicht ignoriert werden. Abfragen, Exporte und Auswertungen **SOLLEN** deshalb ressourcenspezifische Filter definieren und dokumentieren. Mit `entered-in-error` gekennzeichnete Datensätze **SOLLEN** standardmäßig ausgeschlossen werden. Andere Status erfordern eine anwendungsfallspezifische Behandlung: `cancelled` und `not-done` repräsentieren keine durchgeführten Ereignisse, `stopped` kann eine teilweise durchgeführte Aktivität abbilden und `refuted` ist eine gültige Aussage darüber, dass eine Diagnose ausgeschlossen wurde.

Weitere Details enthalten die FHIR-R4-Hinweise zum [Ressourcenlebenszyklus und entered-in-error](http://hl7.org/fhir/R4/lifecycle.html#error), die [Implementer's Safety Check List](http://hl7.org/fhir/R4/safety.html) sowie die Definitionen der Status für [Encounter](http://hl7.org/fhir/R4/codesystem-encounter-status.html), [Ereignisse](http://hl7.org/fhir/R4/codesystem-event-status.html) und die [Verifikation von Conditions](http://hl7.org/fhir/R4/codesystem-condition-ver-status.html).

---

Weitere Informationen finden Sie unter:
* [Must Support](must-support.html) - Detaillierte Must Support Anforderungen
* [Allgemeine Anforderungen](general-requirements.html) - Zusätzliche allgemeine Anforderungen
* [Fehlende Daten](missing-data.html) - Leitfaden für den Umgang mit fehlenden Daten
* [CapabilityStatements](capability-statements.html) - Server- und Client-Fähigkeitsanforderungen
