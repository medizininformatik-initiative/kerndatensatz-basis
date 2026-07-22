**Beispielhafte Anwendungsszenarien:**

- Bereitstellung pseudonymisierter Patientendaten für die Sekundärnutzung in Forschungskontexten unter Wahrung der Patientenidentität
- Unterstützung föderierter Analysen über mehrere MII-Standorte hinweg ohne Offenlegung identifizierender Patienteninformationen
- Ermöglichung krankenkassenbasierter Analysen (z.B. NUM-CON-MON Use Case) mittels IK-Nummern ohne Offenlegung individueller Versicherten-IDs
- Aufrechterhaltung grober demografischer Granularität für die Bildung von Forschungskohorten unter Vermeidung von Re-Identifikation

<div style="background-color: #FFE5E5; border-left: 5px solid #D32F2F; padding: 15px; margin: 10px 0;">
<h5 style="color: #C62828; margin-top: 0;">⚠️ Wichtig: Einschränkungen bei der Pseudonymisierungs-Validierung</h5>

<p>Dieses Profil <strong>enthält keine Regeln zur Prüfung der korrekten Pseudonymisierung</strong>. Ein erfolgreiches Validieren gegen dieses Profil bedeutet daher <strong>nicht</strong>, dass eine fachlich oder datenschutzrechtlich korrekte Pseudonymisierung erfolgt ist.</p>

<p>Anforderungen an die Pseudonymisierung können je nach Projektkontext variieren und lassen sich nicht vollständig in einem einzigen FHIR-Profil abbilden. Für umfassende Hinweise zur Pseudonymisierung konsultieren Sie das <a href="https://medizininformatik-initiative.github.io/mii-interface-module-pseudonymization/">MII Pseudonymization Interface</a>.</p>
</div>

### Profilspezifische Implementierungshinweise

Dieser Abschnitt enthält detaillierte Implementierungshinweise für das MII-Profil für pseudonymisierte Patientendaten.

#### Pseudonymisierungs-Identifier

Das pseudonymisierte Patientenprofil verwendet spezialisierte Identifier-Typen:

- **`Patient.identifier:pseudonymisierterIdentifier`**: Pseudonymisierter Identifier für die PatientIn
  - **MUSS** entsprechend typisiert werden, falls der Identifier ein abgeleitetes Pseudonym ist
  - Zu verwenden, wenn der Identifier durch einen kontrollierten Prozess mit den originalen Patientendaten verknüpft werden kann
  - Typischerweise in Forschungsszenarien verwendet, in denen eine De-Pseudonymisierung für spezifische Zwecke notwendig sein kann
  - **`identifier.type.coding:pseuded`** (`PSEUDED`, Pflicht): Gibt an, dass der Wert ein Pseudonym ist
  - **`identifier.type.coding:mr`** (`MR`, optional): SOLL zusätzlich gesetzt werden, wenn das Pseudonym einen organisationsinternen Patienten-Identifier (Medical Record Number) ersetzt. Dies ermöglicht es Konsumenten, die pseudonymisierte Patientennummer standortübergreifend aufzufinden, ohne das standortspezifische `identifier.system` zu kennen. Siehe [Best Practice - Pseudonymisierter MR-Identifier](#best-practice---pseudonymisierter-mr-identifier) für Details.

- **`Patient.identifier:anonymisierterIdentifier`**: Anonymisierter Identifier für die PatientIn
  - **SOLL** nur verwendet werden, wenn keinerlei Rückschlüsse auf den originalen Datensatz möglich sind
  - Repräsentiert irreversible Anonymisierung, bei der eine Re-Identifikation nicht möglich ist

- **`Patient.identifier:maskierterVersichertenIdentifier`**: Maskierter Krankenversicherten-Identifier
  - Für krankenkassenbasierte Analysen ohne Offenlegung der tatsächlichen Versicherten-ID verwendet
  - Siehe [Best Practice - Maskierte Versicherten-ID mit IK-Nummer](#best-practice---maskierte-versicherten-id-mit-ik-nummer) für Implementierungsdetails

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 id="best-practice---pseudonymisierter-mr-identifier" style="color: #406A99; margin-top: 0;">Best Practice - Pseudonymisierter organisationsinterner Patienten-Identifier</h5>

<p>Wenn ein Pseudonym einen organisationsinternen Patienten-Identifier (Medical Record Number, MR) ersetzt, SOLL <code>identifier.type</code> beide Codings enthalten:</p>

<ul>
  <li><code>http://terminology.hl7.org/CodeSystem/v3-ObservationValue|PSEUDED</code> — Pflicht, signalisiert, dass der Wert ein Pseudonym ist</li>
  <li><code>http://terminology.hl7.org/CodeSystem/v2-0203|MR</code> — optional, signalisiert die funktionale Rolle des ursprünglichen Identifiers</li>
</ul>

<p>Das Setzen des <code>MR</code>-Codes wird empfohlen, da es Abfragen ermöglicht, pseudonymisierte Patientennummern standortübergreifend über einen stabilen, standortunabhängigen Typcode zu finden, ohne das proprietäre <code>identifier.system</code> des jeweiligen Standorts kennen zu müssen.</p>

<p>Hinweis: <code>MR</code> beschreibt hier die funktionale Rolle des Identifiers (d.h. was er repräsentiert), nicht die Art des pseudonymen Wertes selbst. Pseudonyme, die keine Medical Record Number ersetzen (z.B. studiespezifische Pseudonyme), SOLLEN NICHT den <code>MR</code>-Code tragen.</p>

<pre><code class="language-json">{
  "type": {
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/v3-ObservationValue",
      "code": "PSEUDED"
    },
    {
      "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
      "code": "MR"
    }]
  },
  "system": "https://ttp.example.org/pseudonyme",
  "value": "a3f2c1d9-pseudonym"
}
</code></pre>
</div>

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 id="best-practice---maskierte-versicherten-id-mit-ik-nummer" style="color: #406A99; margin-top: 0;">Best Practice - Maskierte Versicherten-ID mit IK-Nummer</h5>

<p>Für Use Cases, die eine Krankenkassen-Analyse erfordern (z.B. NUM-CON-MON), ist es notwendig, die IK-Nummer (Institutionskennzeichen) der Krankenkasse im pseudonymisierten Patientenprofil mitzuführen, ohne die tatsächliche Versicherten-ID offenzulegen.</p>

<p>Dies wird erreicht, indem:</p>
<ol>
  <li>Ein <code>Identifier</code> mit dem Typ <code>KVZ10</code> (10-stellige Krankenversicherten-ID) erstellt wird</li>
  <li>Das Element <code>Identifier.value</code> durch die Extension [Data Absent Reason] mit dem Code <code>masked</code> ersetzt wird</li>
  <li>Die IK-Nummer der Krankenkasse in <code>Identifier.assigner.identifier</code> angegeben wird</li>
</ol>

<p>Ein Beispiel für diese Modellierung findet sich in der Beispielressource.</p>
</div>

{% include link-list.md %}
