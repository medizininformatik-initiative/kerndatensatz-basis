**Beispielhafte Anwendungsszenarien:**

- Dokumentation von bei PatientInnen durchgeführten Prozeduren mittels OPS-Codierung (Operationen- und Prozedurenschlüssel) für Abrechnungs- und Verwaltungszwecke
- Erfassung chirurgischer Eingriffe, diagnostischer Prozeduren und therapeutischer Behandlungen in der klinischen Versorgung
- Unterstützung von Qualitätsmanagement und klinischer Forschung durch standardisierte Prozedurdokumentation
- Ermöglichung prozedurbasierter Analysen und Outcome-Forschung über Gesundheitseinrichtungen hinweg
- Darstellung von Prozeduren mittels SNOMED CT für semantische Interoperabilität neben OPS-Codierung
- Verknüpfung von Prozeduren mit spezifischen Behandlungsfällen zur zeitlichen und kontextuellen Dokumentation

### Profilspezifische Implementierungshinweise

Dieser Abschnitt enthält detaillierte Implementierungshinweise für das MII-Prozedur-Profil.

#### Codierungsanforderungen

**Verpflichtende Codierung:**
- **`Procedure.code`**: VERPFLICHTEND Kodierung entweder per OPS oder SNOMED CT
- Mindestens eine kodierte Prozedur MUSS vorhanden sein
- Weitere Kodierungen aus anderen Terminologien sind OPTIONAL

**OPS-Kodierung:**
- **`Procedure.code:ops`**: OPS (Operationen- und Prozedurenschlüssel) ist das primäre Codiersystem für Prozeduren in Deutschland
- Siehe [OPS-Kodierung - Deutsche Basisprofile] für detaillierte OPS-Codierungsanforderungen
- OPS-Codes umfassen:
  - `Procedure.code:ops.coding.code`: Vollständiger Prozedurenkode
  - `Procedure.code:ops.coding.system`: Codesystem (`http://fhir.de/CodeSystem/bfarm/ops`)
  - `Procedure.code:ops.coding.version`: OPS-Versionsjahr
  - `Procedure.code:ops.extension:seitenlokalisation`: Seitenlokalisation-Extension

**SNOMED-CT-Kodierung:**
- **`Procedure.code:sct`**: SNOMED-CT-Codierung
- Kann als primäre Codierung oder neben OPS verwendet werden

#### Kategorisierung

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - SNOMED-CT-Kategorisierung</h5>

<p><strong>Verpflichtende Kategorisierung:</strong> <code>Procedure.category</code> SNOMED-CT-Kategorisierung auf Basis des Prozedurenkodes.</p>

<p><strong>Mapping von OPS-Klassentiteln:</strong> Wenn die Prozedur per OPS kodiert wird, <strong>SOLLTE</strong> die Kategorie durch Mapping von OPS-Kapitel-/Klassentiteln auf SNOMED-CT-Konzepte abgeleitet werden. Siehe Abschnitt Terminologien in diesem IG für OPS-zu-SNOMED-CT-Kategorie-Mappings.</p>

<p><strong>Constraint proc-mii-1:</strong> Diese Anforderung ist nur relevant, wenn die Prozedur per OPS kodiert wird.</p>

<p><strong>Zweck:</strong> Die Kategorisierung ermöglicht:</p>
<ul>
  <li>Hochstufige Prozedur-Gruppierung für epidemiologische Analysen</li>
  <li>Filterung und Durchsuchen von Prozeduren nach breiten klinischen Kategorien</li>
  <li>Semantische Konsistenz über unterschiedlich kodierte Prozeduren hinweg</li>
</ul>
</div>

#### Zeitliche Informationen

**`Procedure.performed[x]`:**
- Dokumentiert, wann die Prozedur durchgeführt wurde
- **KANN** als `performedDateTime` (einzelner Zeitpunkt) oder `performedPeriod` (Start- und Endzeitpunkt) angegeben werden
- Verwenden Sie `performedPeriod`, wenn sowohl Start- als auch Endzeitpunkt bekannt sind (z.B. chirurgische Eingriffe mit dokumentiertem Start/Ende)
- Verwenden Sie `performedDateTime` für zeitpunktbezogene Prozeduren oder wenn nur ein einzelner Zeitstempel verfügbar ist

**`Procedure.extension:Dokumentationsdatum`:**
- MII-spezifische Extension für das Dokumentationsdatum
- Repräsentiert, wann die Prozedur im System dokumentiert/erfasst wurde
- Unterscheidet sich von `performed[x]`, welches repräsentiert, wann die Prozedur tatsächlich durchgeführt wurde
- Nützlich für Auditing und zeitliche Einordnung der Dokumentation

#### Dokumentation der Körperstelle

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Körperstelle vs. Seitenlokalisation</h5>

<p><strong>Zweck von bodySite:</strong> <code>Procedure.bodySite</code> bietet detaillierte Kodierung der anatomischen Lokalisation für die Prozedur mittels SNOMED CT.</p>

<p><strong>NICHT für Seitenlokalisation:</strong> <code>Procedure.bodySite</code> <strong>SOLLTE NICHT</strong> verwendet werden, um die Seitenlokalisation (links/rechts/beidseitig) abzubilden. Die Seitenlokalisation ist eine Eigenschaft des Prozedurenkodes selbst.</p>

<p><strong>Darstellung der Seitenlokalisation:</strong></p>
<ul>
  <li>Für OPS-Codes: Verwenden Sie <code>Procedure.code:ops.extension:seitenlokalisation</code></li>
  <li>Für SNOMED CT: Seitenlokalisation ist im Prozedurkonzept inhärent enthalten (z.B. "Appendektomie des rechten Appendix")</li>
</ul>

<p><strong>Wann bodySite zu verwenden ist:</strong></p>
<ul>
  <li>Um zusätzliche anatomische Details bereitzustellen, die über das hinausgehen, was der Code spezifiziert</li>
  <li>Um präzise anatomische Strukturen mittels SNOMED-CT-Anatomiekonzepten zu spezifizieren</li>
</ul>
</div>

#### Durchführungsabsicht

**`Procedure.extension:Durchfuehrungsabsicht`:**
- MII-spezifische Extension für die Durchführungsabsicht/den Zweck der Prozedur
- Verwendet SNOMED-CT-Codes zur Klassifizierung der klinischen Absicht:
  - Therapeutische Prozeduren
  - Diagnostische Prozeduren
  - Prophylaktische Prozeduren
  - Palliative Prozeduren
  - etc.
- Bietet klinischen Kontext für die Prozedur über den Prozedurenkode hinaus

#### Kontaktkontext

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Prozedur-Kontakt-Beziehungen</h5>

<p><strong>Empfohlene Implementierung:</strong></p>
<p>Verwenden von <code>Procedure.encounter</code>, um von der Prozedur auf den Encounter vom Typ <strong>Abteilungskontakt</strong> zu referenzieren. Dieser Ansatz etabliert den allgemeinen Aufenthaltskontext für die Prozedur und stellt den zeitlichen und organisatorischen Kontext bereit.</p>

</div>

#### Status und Workflow

**`Procedure.status`:**
- Keine Einschränkungen bezüglich des gewählten Status (preparation, in-progress, on-hold, stopped, completed, entered-in-error, unknown)
- Die meisten Prozeduren in der retrospektiven Dokumentation haben `status='completed'`

#### Patientenbezug

**`Procedure.subject`:**
- Referenz auf Patient MUSS stets gegeben sein
- Prozeduren sind inhärent patientenspezifisch und können ohne diese Referenz nicht existieren

{% include link-list.md %}