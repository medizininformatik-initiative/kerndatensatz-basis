**Beispielhafte Anwendungsszenarien:**

- Dokumentation von Diagnosen für Patienten in der klinischen Versorgung mittels ICD-10-GM-Codierung
- Unterstützung von Abrechnungsprozessen mit codierten Diagnoseinformationen
- Ermöglichung epidemiologischer Forschung durch standardisierte Diagnosecodierung
- Darstellung seltener Erkrankungen mittels Alpha-ID oder Orphanet-Codes neben ICD-10-GM
- Verknüpfung von Diagnosen mit spezifischen Behandlungsfällen zur zeitlichen und kontextuellen Dokumentation

### Profilspezifische Implementierungshinweise

Dieser Abschnitt enthält detaillierte Implementierungshinweise für das MII-Diagnose-Profil.

#### Codierungsanforderungen

**Verpflichtende Codierung:**
- **`Condition.code`**: Mindestens eine kodierte Diagnose MUSS enthalten sein
- System frei wählbar aus: ICD-10-GM, Alpha-ID, SNOMED CT oder Orphanet
- ICD-10-GM-Codierung ist das primäre Codiersystem für Diagnosen in Deutschland

**Mehrere Codiersysteme:**
- Mehrfachcodierungen aus verschiedenen Terminologien sind erlaubt und werden, wo anwendbar, empfohlen
- Beispiel: ICD-10-GM für Abrechnungszwecke + SNOMED CT für semantische Interoperabilität + Alpha-ID/Orphanet für seltene Erkrankungen

#### ICD-10-GM-spezifische Extensions

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - ICD-10-GM-Extensions und Sonderzeichen</h5>

<p><strong>Trennung von Sonderzeichen:</strong> Das Element <code>Condition.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').code</code> <strong>SOLLTE NICHT</strong> ein Mehrfachkodierungskennzeichen oder Zusatzkennzeichen (z.B. Seitenlokalisation oder Diagnosesicherheit) enthalten.</p>

<p><strong>Verwendung von Extensions:</strong></p>
<ul>
  <li><strong>Mehrfachcodierungs-Kennzeichen:</strong> Mehrfachcodierungskennzeichen (<code>*</code>, <code>†</code>, <code>!</code>) <strong>SOLLEN</strong> von den ICD-10-GM-Codes getrennt und in der Extension "Mehrfachcodierungs-Kennzeichen" erfasst werden</li>
  <li><strong>Seitenlokalisation:</strong> Die Extension "Seitenlokalisation" <strong>SOLL</strong> zur Angabe der Seitenlokalisation in der ICD-10-GM-codierung verwendet werden</li>
  <li><strong>Diagnosesicherheit:</strong> Die Extension "Diagnosesicherheit" <strong>SOLL</strong> zur Angabe der Diagnosesicherheit in der ICD-10-GM-codierung verwendet werden</li>
</ul>

<p><strong>Referenz:</strong> Siehe <a href="https://ig.fhir.de/basisprofile-de/1.5.4/ig-markdown-Datentypen-Coding.html#ig-markdown-Datentypen-ICD-10GM-Coding">ICD-10-GM Coding-Profil</a> und <a href="https://ig.fhir.de/basisprofile-de/1.5.4/ig-markdown-ExtensionsfrCondition.html">Diagnosesicherheit Extension</a> in den Deutschen Basisprofilen für detaillierte Constraints.</p>
</div>

#### Mehrfachcodierung mit ICD-10-GM Kreuz-Stern-System

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Kreuz-Stern-System Implementierung</h5>

<p><strong>Mehrere Condition-Instanzen:</strong> Bei der Verwendung von ICD-10-GM-Codes mit dem Kreuz-Stern-System wird für <strong>jeden ICD-10-Code eine separate Condition-Instanz</strong> erstellt (Ätiologie, Manifestation, Zusatzinformation).</p>

<p><strong>Verknüpfung von Sekundär- zu Primärdiagnose:</strong></p>
<ul>
  <li>Die Primärdiagnose-Condition (Ätiologie mit †-Kennzeichen) ist die Hauptinstanz</li>
  <li>Sekundärdiagnose-Conditions (Manifestation mit *-Kennzeichen, Zusatzinformation mit !-Kennzeichen) nutzen die <a href="http://hl7.org/fhir/R4/extension-condition-related.html">Extension Condition Related</a>, um auf die Primärdiagnose zu referenzieren</li>
  <li>Dies erstellt eine explizite Beziehungskette: Manifestation → Ätiologie</li>
</ul>

<p><strong>Alpha-ID und Orphanet-Codes:</strong></p>
<ul>
  <li>Wenn Alpha-ID- oder Orphanet-Codes zu kombinierten ICD-10-GM-Codes gemappt sind, werden sie <strong>nur in der Primärdiagnose-Condition-Instanz</strong> angegeben</li>
  <li>Alpha-ID/Orphanet-Codes werden nicht in Sekundärdiagnose-Condition-Instanzen dupliziert</li>
</ul>

<p><strong>Aspekte zur Diagnosesicherheit:</strong></p>
<ul>
  <li>Bei abweichenden Diagnosesicherheiten zwischen Primär- und Sekundärdiagnose MUSS sichergestellt werden, dass die Diagnosesicherheit der Primärcondition auf die assoziierte Alpha-ID zutrifft</li>
  <li>Dies verhindert Inkonsistenzen, wenn bspw. Seltene-Erkrankungen-Codes (Alpha-ID/Orphanet) mit unsicheren ätiologischen Diagnosen verknüpft sind</li>
</ul>

<p><strong>Beispiel:</strong> Siehe Beispielressourcen für Alpha-ID <code>I97525</code> mit ICD-10-GM <code>A54.4†</code> (Ätiologie) und <code>M73.09*</code> (Manifestation).</p>
</div>

#### Dokumentation der Körperstelle

**`Condition.bodySite`:**
- OPTIONALES Element
- Falls dieses optionale Element verwendet wird, SOLL die Körperstelle mindestens mit einem SNOMED CT-Code codiert werden
- Hierbei DARF NICHT die Lateralität angegeben werden - verwenden Sie stattdessen die Extension Seitenlokalisation auf `Condition.code.coding:icd10-gm`

#### Verknüpfung mit dem Fall

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Diagnose-Fall-Beziehungen</h5>

<p><strong>Änderung gegenüber vorheriger Version:</strong> In früheren Versionen dieses Implementierungsleitfadens wurde empfohlen, <code>Encounter.diagnosis</code> zur Verknüpfung von Diagnosen mit Behandlungsfällen zu verwenden. Diese Empfehlung wurde aktualisiert, um sich an die gematik ISiK-Empfehlungen (Informationssysteme im Krankenhaus) anzupassen.</p>

<p><strong>Aktuelle Empfehlung - Condition.encounter:</strong></p>
<ul>
  <li>Die Verlinkung auf eine Encounter-Ressource dokumentiert die Referenz zu einem Aufenthalt und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.</li>
  <li><strong>Ebene Abteilungskontakt:</strong> Die Zuordnung <strong>SOLLTE</strong> auf einen Encounter der Ebene "Abteilungskontakt" erfolgen</li>
  <li>Bei der Auswahl des Encounters ist zu beachten, dass unter einer (Abrechnungs-)"Fallnummer" (hier: <code>Encounter.account</code>) unter Umständen mehrere Encounter gruppiert sein können (z.B. stationärer Besuch mit mehreren vor- und nachstationären Aufenthalten)</li>
</ul>

<p><strong>Mapping des Feststellungsdatums:</strong></p>
<ul>
  <li>Das logische Datenelement "Feststellungsdatum" wird auf <code>Encounter.period.start</code> gemappt, NICHT auf ein Element in der Condition-Ressource</li>
  <li>Somit repräsentiert die Encounter-Referenz sowohl den technischen Dokumentationskontext als auch den zeitlichen Kontext, wann die Diagnose festgestellt wurde</li>
</ul>

</div>

#### Zeitliche Informationen

**`Condition.onset[x]`:**
- **KANN** als Period oder dateTime erfasst werden
- OPTIONAL zusätzlich Angabe von Lebensphase als Code mittels Extension, falls genaue Zeitpunkte nicht bekannt sind
- Repräsentiert, wann die Erkrankung begann oder erstmals bemerkt wurde

**`Condition.recordedDate`:**
- Repräsentiert, wann die Diagnose im System erfasst wurde
- Dient der zeitlichen Einordnung der Diagnose

{% include link-list.md %}