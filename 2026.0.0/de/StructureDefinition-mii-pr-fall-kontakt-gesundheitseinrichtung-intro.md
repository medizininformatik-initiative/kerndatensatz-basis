**Beispielhafte Anwendungsszenarien:**

- Dokumentation eines Einrichtungskontakts, der den gesamten Aufenthalt eines Patienten in einer Gesundheitseinrichtung von Aufnahme bis Entlassung repräsentiert, inklusive Aufnahmegrund und Entlassungsgrund
- Nachverfolgung von Abteilungskontakten bei Verlegung eines Patienten zwischen verschiedenen Abteilungen innerhalb desselben Aufenthalts, mit Erfassung von Fachabteilungsschlüsseln und Zeitangaben
- Erfassung von Versorgungsstellenkontakten für spezifische Behandlungsorte wie Normalstation, Intensivstation oder OP-Saal innerhalb einer Abteilung
- Modellierung hierarchischer Kontaktstrukturen mittels `partOf` zur Verknüpfung von Versorgungsstellenkontakt → Abteilungskontakt → Einrichtungskontakt
- Unterstützung von Machbarkeitsabfragen durch Zählung von Kontakten mit spezifischen Merkmalen (z.B. stationäre Fälle, Intensivaufenthalte, Notfallaufnahmen)
- Dokumentation geplanter Kontakte mit erwarteten Aufnahme- und Entlassungsdaten für die Aufnahmeplanung

### Profilspezifische Implementierungshinweise

Dieser Abschnitt enthält detaillierte Implementierungshinweise für das MII-Kontakt-Gesundheitseinrichtung-Profil.

#### Kontakthierarchien und Kontaktebenen

Das MII-Fall-Modul unterscheidet drei Ebenen von Kontakten mittels `Encounter.type:Kontaktebene`:

- **Einrichtungskontakt**: Kontakt auf oberster Ebene, der den gesamten Aufenthalt/Besuch in einer Gesundheitseinrichtung repräsentiert
- **Abteilungskontakt**: Kontakt in einer spezifischen Abteilung innerhalb der Einrichtung
- **Versorgungsstellenkontakt**: Kontakt an einer spezifischen Versorgungsstelle oder Station

Diese Ebenen werden mittels `Encounter.partOf` verknüpft, um eine hierarchische Struktur zu erstellen.

**Beispiel einer Kontakthierarchie:**

Das folgende Diagramm veranschaulicht, wie verschiedene Kontaktebenen mittels `partOf`-Referenzen miteinander verknüpft werden, zusammen mit optionalen Verbindungen zu EpisodeOfCare- und Account-Ressourcen:

<pre class="language-mermaid"><code class="language-mermaid">%%{init: {'flowchart': {'htmlLabels': false}, 'theme': 'base', 'themeVariables': {'primaryColor': '#E8F4F8', 'primaryBorderColor': '#406A99', 'primaryTextColor': '#000000', 'lineColor': '#5C8DB3', 'fontSize': '14px'}}}%%
graph BT

  %% TOP LAYER
  EP1["`**EpisodeOfCare EP1**
       Appendizitis`"]
  
  A1["`**Account A1**
      DRG G23B
      Appendektomie ohne schwere CC`"]

  %% FACILITY LEVEL
  E0["`**Encounter E0**
      _(Einrichtungskontakt)_`"]

  E0 -->|episodeOfCare| EP1
  E0 -->|account| A1

  %% DEPARTMENT LEVEL
  A1E["`**Encounter A1**
       _(Abteilungskontakt)_
       Notaufnahme`"]
  
  A2E["`**Encounter A2**
       _(Abteilungskontakt)_
       Allgemeinchirurgie`"]

  A1E -->|partOf| E0
  A2E -->|partOf| E0

  %% CARE UNIT LEVEL
  VS1["`**Encounter VS1**
       Notaufnahme
       Behandlungsraum 3`"]
  
  VS2["`**Encounter VS2**
       Radiologie
       CT Abdomen`"]
  
  VS3["`**Encounter VS3**
       OP-Saal 4
       Laparoskopische Appendektomie`"]
  
  VS4["`**Encounter VS4**
       Aufwachraum PACU`"]
  
  VS5["`**Encounter VS5**
       Chirurgische Station C3`"]

  VS1 -->|partOf| A1E
  VS2 -->|partOf| A2E
  VS3 -->|partOf| A2E
  VS4 -->|partOf| A2E
  VS5 -->|partOf| A2E
</code></pre>

In diesem Beispiel:
- **E0** repräsentiert den gesamten Einrichtungskontakt für den Krankenhausaufenthalt
- **A1E** ist der Abteilungskontakt für die Notaufnahme
- **A2E** ist der Abteilungskontakt für die Allgemeinchirurgie
- **VS1-VS5** sind Versorgungsstellenkontakte für spezifische Orte: Notaufnahme Behandlungsraum 3, Radiologie CT, OP-Saal 4 (laparoskopische Appendektomie), Aufwachraum PACU und Chirurgische Station C3
- Die Hierarchie wird durch `partOf`-Referenzen etabliert, die von Versorgungsstellen zu Abteilungen zur Einrichtung verweisen
- **EP1** (EpisodeOfCare) und **A1** (Account) werden der Vollständigkeit halber gezeigt, sind aber derzeit nicht Teil der MII-Kerndatensatz-Spezifikation. Aus Vereinfachungsgründen wird nur E0 als referenzierend auf diese Ressourcen dargestellt, aber in der Praxis kann jeder Kontakt in der Hierarchie auf die EpisodeOfCare und das Account verweisen, zu denen er gehört.

#### Repräsentation der Fallarten in FHIR

<style>
.encounter-type-table {
  border-collapse: collapse;
  width: 100%;
  margin: 20px 0;
}
.encounter-type-table th,
.encounter-type-table td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
}
.encounter-type-table th {
  background-color: #f2f2f2;
  font-weight: bold;
}
.encounter-type-table tr:nth-child(even) {
  background-color: #f9f9f9;
}
</style>

##### Primärkontakte

Siehe auch Leitfaden [FHIR DE Basisprofile](https://ig.fhir.de/basisprofile-de/1.4.0/Ressourcen-AmbulanterStationaererFall.html):

<table class="encounter-type-table">
<thead>
<tr>
<th>Fallart</th>
<th>Code in HL7 V2</th>
<th>Repräsentation in FHIR</th>
</tr>
</thead>
<tbody>
<tr>
<td>Ambulant</td>
<td>O</td>
<td><code>Encounter.class = AMB</code></td>
</tr>
<tr>
<td>Ambulantes Operieren</td>
<td>O</td>
<td><code>Encounter.class = AMB</code><br/><code>Encounter.type = operation</code></td>
</tr>
<tr>
<td>Stationär</td>
<td>I</td>
<td><code>Encounter.class = IMP</code></td>
</tr>
<tr>
<td>Normalstationär</td>
<td>I</td>
<td><code>Encounter.class = IMP</code><br/><code>Encounter.type = normalstationaer</code></td>
</tr>
<tr>
<td>Intensivstationär</td>
<td>I</td>
<td><code>Encounter.class = IMP</code><br/><code>Encounter.type = intensivstationaer</code></td>
</tr>
<tr>
<td>Wiederaufnahme</td>
<td>R</td>
<td><code>Encounter.class = IMP</code><br/><code>Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle = 07</code></td>
</tr>
<tr>
<td>Voraufnahme</td>
<td>P</td>
<td><code>Encounter.class = PRENC</code></td>
</tr>
<tr>
<td>Virtuell (Virtual)</td>
<td>-</td>
<td><code>Encounter.class = VR</code></td>
</tr>
<tr>
<td>Vorstationär (Pre-inpatient)</td>
<td>V</td>
<td><code>Encounter.class = AMB</code><br/><code>Encounter.type = vorstationaer</code></td>
</tr>
<tr>
<td>Nachstationär (Post-inpatient)</td>
<td>NS</td>
<td><code>Encounter.class = AMB</code><br/><code>Encounter.type = nachstationaer</code></td>
</tr>
<tr>
<td>Teilstationär (Partial Inpatient)</td>
<td>TS</td>
<td><code>Encounter.class = IMP</code> or <code>SS</code><br/><code>Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle = 03</code><br/><code>Encounter.type = teilstationaer | tagesklinik | nachtklinik</code></td>
</tr>
<tr>
<td>Begleitperson (Accompanying Person)</td>
<td>H</td>
<td><code>Encounter.class = IMP</code><br/><code>Encounter.type = begleitperson</code></td>
</tr>
<tr>
<td>Stationsäquivalent (Hospital-equivalent Home Care)</td>
<td>-</td>
<td><code>Encounter.class = HH</code><br/><code>Encounter.type = stationsaequivalent</code><br/><code>Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle = 10</code></td>
</tr>
<tr>
<td>Entbindung (Delivery)</td>
<td>-</td>
<td><code>Encounter.class = IMP</code><br/><code>Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle = 05</code></td>
</tr>
<tr>
<td>Notfall (Emergency)</td>
<td>-</td>
<td><code>Encounter.class = AMB</code><br/><code>Encounter.extension:Aufnahmegrund.VierteStelle = 7</code><br/><br/>If subsequent inpatient admission occurs: <code>Encounter.hospitalization.admitSource = "N"</code><br/><br/>To emphasize treatment urgency: <code>Encounter.priority = http://terminology.hl7.org/CodeSystem/v3-ActPriority|EM</code></td>
</tr>
</tbody>
</table>

##### Sekundärkontakte bei stationärem Aufenthalt

<table class="encounter-type-table">
<thead>
<tr>
<th>Fallart</th>
<th>Code in HL7 V2</th>
<th>Repräsentation in FHIR</th>
</tr>
</thead>
<tbody>
<tr>
<td>Untersuchung und Behandlung</td>
<td>-</td>
<td><code>Encounter.class = IMP</code><br/><code>Encounter.type = ub</code></td>
</tr>
<tr>
<td>Konsil</td>
<td>-</td>
<td><code>Encounter.class = IMP</code><br/><code>Encounter.type = konsil</code></td>
</tr>
<tr>
<td>Operation</td>
<td>-</td>
<td><code>Encounter.class = IMP</code><br/><code>Encounter.type = operation</code></td>
</tr>
</tbody>
</table>

#### Angaben zu Diagnosen

Das Element `Encounter.diagnosis` stellt die Beziehung zwischen Kontakten und Diagnosen/Prozeduren her und spezifiziert deren Rolle im Kontaktkontext.

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Diagnose-Kontakt-Beziehungen</h5>

<p>Die Referenz von <code>Encounter.diagnosis</code> zu <code>Condition</code> sollte verwendet werden, wenn die Condition eine spezifische Rolle während des Encounters hat (z.B. Hauptdiagnose, Nebendiagnose).</p>

<p><strong>Empfohlene Implementierung:</strong></p>
<p>Verwenden Sie <code>Condition.encounter</code>, um von der Condition auf den Encounter vom Typ <strong>Abteilungskontakt</strong> zu referenzieren. Dieser Ansatz etabliert den allgemeinen Kontaktkontext für die Diagnose, während <code>Encounter.diagnosis</code> verwendet werden kann, um bei Bedarf spezifische Diagnoserollen anzugeben.</p>
</div>

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Encounter.diagnosis.use</h5>

<p>Da <code>Encounter.diagnosis.use</code> die Kardinalität 1..1 hat, benötigt eine Diagnose mit mehreren Rollen innerhalb eines Kontakts mehrere <code>Encounter.diagnosis</code>-Einträge, jeweils mit unterschiedlichem <code>use</code>-Wert.</p>

<p><strong>Beispiel:</strong> Wenn eine Condition sowohl als Diagnosetyp als auch als Diagnosesubtyp (oder zusätzliche Rollen wie CC/CM) dient, erstellen Sie separate <code>Encounter.diagnosis</code>-Referenzen für jede Rolle, die alle auf dieselbe Condition-Ressource verweisen. Eine einzelne Condition kann mehrfach mit unterschiedlichen <code>use</code>-Werten referenziert werden.</p>

<p><strong>Hinweis zur CC/CM-Klassifikation:</strong> Wenn Sie eine Diagnose als CC (Komplikation oder Komorbidität) oder CM (Komorbidität) klassifizieren möchten, handelt es sich hierbei typischerweise um abrechnungsrelevante Informationen, die in der Account-Ressource und nicht in <code>Encounter.diagnosis</code> platziert werden sollten. Die Account-Ressource ist der geeignete Ort für Abrechnungsfallkontext und DRG-relevante Klassifikationen.</p>
</div>

#### Kontaktort

- Details zum Kontaktort (Zimmer, Bett, Station) können mittels `Encounter.location` angegeben werden.
- Der physische Typ SOLL das MII-spezifische ValueSet für location physical types verwenden.
- Angaben zum Kontaktort sind primär relevant für Versorgungsstellenkontakte.

#### Geplante Kontakte

Geplante Kontakte werden mit `Encounter.status = planned` abgebildet und SOLLTEN zusätzlich angeben:
- `Encounter.extension:plannedStartDate` für das geplante Startdatum
- `Encounter.extension:plannedEndDate` für das geplante Enddatum

#### Aufnahme und Entlassung

- **Aufnahmeanlass** ist verpflichtend, wenn Hospitalisierungsdaten angegeben werden, und verwendet Codes aus § 301 SGB V.
- **Aufnahmegrund** mit vierteiliger Struktur (erste und zweite Stelle, dritte Stelle, vierte Stelle) gemäß § 301 SGB V.
- **Entlassungsgrund** mit Entlassungsgrund-Extension liefert detaillierte Entlassungs-/Verlegungsgründe.

#### Identifikation von Kontakten

Jeder Encounter SOLLTE einen eindeutigen Identifier haben. Wenn Encounters in einer Hierarchie organisiert sind:
- Stellen Sie die korrekte Encounter-Verlinkung über `Encounter.partOf` sicher
- Jeder Encounter SOLLTE einen eigenständigen Identifier mit unterschiedlichen Systemen oder Werten enthalten

**Abbildung der Fallnummer:**

Die "Fallnummer" wird in der stationären Versorgung häufig verwendet, um den Fallkontext für die medizinische Dokumentation zu etablieren, insbesondere in der HL7 V2-Kommunikation.

In den meisten Fällen ist die "Fallnummer" ein eindeutiger Identifier für den Abrechnungsfall (Account). Daher sollte die Fallnummer als Identifier des Accounts gesehen werden und ist nicht geeignet, um einen Encounter eindeutig zu identifizieren. Um den korrekten Encounter zu finden, müssen zusätzliche Kriterien wie Zeitraum (`Encounter.period`), Klasse (`Encounter.class`) oder Status (`Encounter.status`) berücksichtigt werden.

**Frühere Empfehlung:**

Früher wurde empfohlen, dass die Aufnahmenummer in allen Encounter-Ressourcen unabhängig von Kontaktebene und Kontakttyp angegeben werden sollte. Diese Empfehlung unterschied jedoch nicht klar zwischen Aufnahmenummer und Fallnummer.

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Aufnahmenummer vs. Fallnummer</h5>

<p><em>Hinweis: Diese Empfehlung basiert auf der <a href="https://simplifier.net/packages/de.gematik.isik/5.1.0/files/3020028" target="_blank">ISiK-Spezifikation</a>.</em></p>

<p>Es ist wichtig zu unterscheiden zwischen:</p>
<ul>
  <li><strong>Aufnahmenummer:</strong> Ein eindeutiger Identifier, der einem Patienten bei der Aufnahmeplanung oder bei der Aufnahme selbst zugewiesen wird. Jeder Encounter <strong>SOLLTE</strong> seine eigene eindeutige Aufnahmenummer in <code>Encounter.identifier:Aufnahmenummer</code> haben, wo anwendbar.</li>
  <li><strong>Fallnummer:</strong> Identifiziert typischerweise den Abrechnungsfall (Account), nicht einzelne Encounters.</li>
</ul>

<p><strong>Account-Referenzen und Abrechnungskontext:</strong></p>
<p>Der Bezug zu einem Account stellt den Abrechnungskontext für einen oder mehrere Encounter her. Mittels der Account-Referenz können zum Beispiel ein vorstationärer, ein stationärer und ein nachstationärer Besuch zu einem "DRG-Fall" zusammengefasst werden.</p>

<p><strong>Hinweis:</strong> Wenn man den Abrechnungsfall implementieren möchte, wird empfohlen, das <a href="https://simplifier.net/packages/de.gematik.isik/5.1.0/files/3019857" target="_blank">ISiK Account-Profil</a> zu verwenden.</p>

<p><strong>Wichtiger Hinweis für Implementierer:</strong> Im deutschen Sprachgebrauch ist unter dem Begriff "Fall" meist der Abrechnungskontext gemeint, nicht der einzelne Besuch. Die "Fallnummer" ist daher nicht der Identifier des Encounters, sondern der des Accounts auf den der Encounter referenziert. Auf diesem Wege können mehrere Besuche einer Fallnummer zugeordnet werden.</p>

<p><strong>Logische Referenzen für die Suche:</strong></p>
<p>Da die Fallnummer ein häufig verwendetes Suchkriterium darstellt, ist diese als logische Referenz (<code>account.identifier</code>) im Encounter zu hinterlegen. Damit wird sichergestellt, dass diese als Suchparameter für die Suche nach Encountern zur Verfügung steht, auch wenn:</p>
<ul>
  <li>Einzelne Systeme kein Chaining unterstützen</li>
  <li>Einzelne Benutzer keine Sichtberechtigung auf Abrechnungsdaten haben</li>
  <li>Benutzer im Versorgungskontext dennoch Encounter anhand der assoziierten Fallnummer suchen möchten</li>
</ul>
</div>

{% include link-list.md %}
