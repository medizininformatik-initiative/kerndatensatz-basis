**Beispielhafte Anwendungsszenarien:**

- Dokumentation der Todesursache für verstorbene PatientInnen für klinische Dokumentation und Mortalitätsstatistiken
- Unterstützung epidemiologischer Forschung und öffentlicher Gesundheitsüberwachung durch standardisierte Todesursachen-Codierung
- Ermöglichung von Mortalitätsanalysen über Gesundheitseinrichtungen hinweg mittels international vergleichbarer ICD-10-WHO-Codes
- Verknüpfung von Todesursachen-Informationen mit Vitalstatus-Observationen und Patient.deceased[x]-Dokumentation

### Profilspezifische Implementierungshinweise

Dieser Abschnitt enthält detaillierte Implementierungshinweise für das MII-Todesursachen-Profil.

#### ICD-10-WHO-Codierungsanforderung

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - ICD-10-WHO vs. ICD-10-GM</h5>

<p><strong>Verpflichtendes Codiersystem:</strong> Die Todesursache <strong>MUSS</strong> mittels ICD-10-WHO (<code>http://hl7.org/fhir/sid/icd-10</code>) codiert werden.</p>

<p><strong>Abweichung vom Diagnose-Modul:</strong> Das Condition-Profil für die Todesursache unterscheidet sich an der Stelle <code>Condition.code</code> bewusst vom Condition-Profil im Modul Diagnose. Das Diagnose-Modul verwendet die ICD-10-GM (deutsche Modifikation), während Todesursache die ICD-10-WHO (internationale Version) verwendet.</p>

<p><strong>Gesetzliche Anforderung:</strong> In Deutschland ist die ICD-10-WHO als Grundlage für die Todesursachenstatistik vom Gesetzgeber vorgeschrieben. Siehe <a href="https://www.bfarm.de/DE/Kodiersysteme/Klassifikationen/ICD/ICD-10-WHO/Todesursachenstatistik/_node.html">BfArM ICD-10-WHO</a> für Details zu den Anforderungen der deutschen Todesursachenstatistik.</p>

<p><strong>Zusätzliche Codierungen:</strong> Während die ICD-10-WHO-Codierung verpflichtend ist, sind zusätzliche Codierungen (z.B. SNOMED CT) OPTIONAL und können zur Bereitstellung ergänzender semantischer Informationen hinzugefügt werden.</p>
</div>

#### Verpflichtende Elemente

**Feste Category-Werte:**
- **`Condition.category`**: Fester LOINC-Code `79378-6` (Cause of death) und SNOMED-CT-Code `16100001` (Death diagnosis) **MÜSSEN** vorhanden sein
- Weitere Category-Codings sind OPTIONAL
- Diese festen Codes stellen sicher, dass die Condition eindeutig als Todesursache identifiziert wird

**Code-Element:**
- **`Condition.code`**: ICD-10-WHO-Codierung ist VERPFLICHTEND
  - Verwenden Sie das Codesystem `http://hl7.org/fhir/sid/icd-10` (ICD-10-WHO)
  - Weitere Codierungen aus anderen Terminologien (SNOMED CT, etc.) sind OPTIONAL
  - Weitere Informationen siehe <a href="https://www.bfarm.de/DE/Kodiersysteme/Klassifikationen/ICD/ICD-10-WHO/Todesursachenstatistik/_node.html">BfArM ICD-10-WHO</a> für offizielle Codierungshinweise und Anforderungen der Todesursachenstatistik

**Patientenbezug:**
- **`Condition.subject`**: Referenz auf Patient **MUSS** stets gegeben sein
- Die Todesursache ist inhärent patientenspezifisch und kann ohne diese Referenz nicht existieren
- Die referenzierte PatientIn **SOLLTE** `Patient.deceased[x]` ausgefüllt haben, um den Tod anzuzeigen

{% include link-list.md %}