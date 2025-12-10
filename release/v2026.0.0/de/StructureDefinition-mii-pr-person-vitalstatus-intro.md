**Beispielhafte Anwendungsszenarien:**

- Dokumentation des Vitalstatus (lebend/verstorben) einer PatientIn zu bestimmten Zeitpunkten
- Nachverfolgung des letzten bekannten Lebenszeitpunktes für PatientInnen in klinischen und Forschungskontexten
- Erfassung von Vitalstatus-Observationen bei jeder Krankenhausaufnahme und Entlassung
- Unterstützung von Mortalitätsanalysen und Überlebensstudien in Forschungsanwendungen
- Pflege der Vitalstatus-Historie durch mehrere Observation-Instanzen über die Zeit

### Profilspezifische Implementierungshinweise

Dieser Abschnitt enthält detaillierte Implementierungshinweise für das MII-Vitalstatus-Profil.

#### Anforderungen an Observation-Instanzen

**Mehrere Observationen:**
- Für jede Beobachtung/Angabe des Vitalstatus einer PatientIn **MUSS** eine **neue** Observation-Instanz erzeugt werden
- Alle Observation-Instanzen **MÜSSEN** `status='final'` haben
- Jede Instanz repräsentiert eine zeitpunktbezogene Aussage über den Vitalstatus der PatientIn

**Häufigkeit der Dokumentation:**
- Der Vitalstatus ("letzter bekannter Lebenszeitpunkt") **SOLLTE** mindestens bei jeder Aufnahme/Entlassung anlassbezogen als Observation erstellt werden
- Die Häufigkeit der Erhebung ist ansonsten nicht weiter geregelt und kann variieren
- Die Quelldaten sind oft nur schwer zu erschließen und erfordern möglicherweise manuelle Recherche (z.B. Kontaktaufnahme, öffentliche Informationen wie Todesanzeigen)

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Datenquellen für Vitalstatus</h5>

<p><strong>Administrative Entlassung:</strong> Die administrative Entlassung der PatientIn aufgrund des Todes <strong>SOLLTE</strong> dokumentiert werden (siehe Modul Fall - Entlassungsgrund) und <strong>KANN</strong> als nützliche Datenquelle für den Vitalstatus dienen.</p>

<p><strong>Integration:</strong> Systeme sollten Workflows etablieren, um automatisch Vitalstatus-Observationen zu erstellen, wenn der Entlassungsgrund auf Tod hinweist, um Konsistenz zwischen administrativer und klinischer Dokumentation zu gewährleisten.</p>

<p><strong>Manuelle Recherche:</strong> In Fällen, in denen der Vitalstatus unklar ist, kann manuelle Recherche notwendig sein (Kontaktversuche, öffentliche Aufzeichnungen). Dokumentieren Sie die Informationsquelle angemessen in zugehörigen Metadaten (Provenance-Ressource).</p>
</div>

#### Verpflichtende Elemente

**Feste Werte:**
- **`Observation.category`**: Fester Wert `survey` **MUSS** vorhanden sein; weitere Codings sind OPTIONAL
- **`Observation.code`**: Fester LOINC-Code `67162-8` (Vitalstatus [Minimum Data Set]) **MUSS** vorhanden sein; weitere Codings sind OPTIONAL

**Patientenbezug:**
- **`Observation.subject`**: Referenz auf Patient **MUSS** stets gegeben sein
- Der Vitalstatus ist inhärent patientenspezifisch und kann ohne diese Referenz nicht existieren

**Effective DateTime:**
- **`Observation.effectiveDateTime`**: VERPFLICHTEND genaue Angabe des letzten Lebendzeitpunktes
  - **KANN** partielle Datumsangaben enthalten (Jahr, Jahr-Monat), wenn das genaue Datum unbekannt ist
  - Enthält **nicht** den Todeszeitpunkt (siehe `Patient.deceased[x]` für die Dokumentation des Todes)
  - Repräsentiert den Zeitpunkt, zu dem die PatientIn bekanntermaßen im dokumentierten Vitalstatus war

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - effectiveDateTime vs. Patient.deceased[x]</h5>

<p><strong>Unterscheidung:</strong> <code>Observation.effectiveDateTime</code> repräsentiert den <strong>letzten bekannten Lebendzeitpunkt</strong> oder den Zeitpunkt der Vitalstatus-Feststellung, NICHT den Todeszeitpunkt.</p>

<p><strong>Dokumentation des Todes:</strong> Verwenden Sie <code>Patient.deceased[x]</code> (vorzugsweise <code>deceasedDateTime</code>), um den tatsächlichen Todeszeitpunkt zu dokumentieren.</p>

<p><strong>Beispielszenario:</strong></p>
<ul>
  <li>PatientIn lebend entlassen am 15.03.2024 → Vitalstatus-Observation mit <code>effectiveDateTime = 2024-03-15</code> und <code>valueCodeableConcept = "L" (lebend)</code></li>
  <li>PatientIn verstorben bestätigt am 20.04.2024 → Aktualisierung <code>Patient.deceasedDateTime = 2024-04-20</code> und Erstellung einer neuen Vitalstatus-Observation mit <code>effectiveDateTime = 2024-04-20</code> und <code>valueCodeableConcept = "T" (tot)</code></li>
</ul>
</div>

#### Wert-Dokumentation

**`Observation.valueCodeableConcept`:**
- Verwendet Codes aus dem MII Vitalstatus CodeSystem:
  - `L` = lebend
  - `T` = tot
  - `X` = unbekannt

Siehe [Formal Views] für das vollständige ValueSet-Binding.

{% include link-list.md %}