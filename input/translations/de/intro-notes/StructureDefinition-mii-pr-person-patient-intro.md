**Beispielhafte Anwendungsszenarien:**

- Dokumentation demografischer Patientendaten einschließlich Name, Geschlecht, Geburtsdatum und Adresse für klinische Versorgung und Forschung
- Erfassung von Krankenversicherungsinformationen für administrative Zwecke
- Verwaltung organisationsinterner Patienten-Identifikatoren (PID) zur Verknüpfung von Patientendaten über Systeme innerhalb einer Gesundheitseinrichtung hinweg
- Ermöglichung pseudonymisierter Patientendarstellungen für Forschungszwecke unter Beibehaltung wesentlicher demografischer Merkmale

### Profilspezifische Implementierungshinweise

Dieser Abschnitt enthält detaillierte Implementierungshinweise für das MII-Patient-Profil.

#### Patienten-Identifikation

Die Patienten-Identifikation verwendet je nach Kontext verschiedene Identifier-Typen:

- **`Patient.identifier:versichertenId`**: Lebenslange Krankenversicherten-ID (10-stellige KVID) für alle Krankenversicherungsarten (GKV, PKV, Sonderkostenträger)
  - **WICHTIG**: Das Assigner-Element MUSS die IKNR (Institutionskennzeichen) der ausgebenden Institution enthalten
  - Repräsentiert stets die aktuelle Versicherungsnummer der PatientIn
  - Verwenden Sie als `Identifier.type` den Code `KVZ10` aus `http://fhir.de/CodeSystem/identifier-type-de-basis`
  - Die Codes `GKV` und `PKV` haben den Status `retired` und **SOLLEN NICHT** verwendet werden

- **`Patient.identifier:pid`**: Organisationsinterner Patienten-Identifier - die führende (MPI) ID der PatientIn
  - Eine Referenz auf die ausgebende Organization in `Patient.identifier:pid.assigner` ist EMPFOHLEN
  - Logische Referenz per IK-Nummer oder IHE Affinity Domain OID ist zulässig
  - Das CodeSystem [Core-Location-Identifier] für alle MII-Standorte kann verwendet werden

- **`Patient.identifier`**: Jegliche weiteren Identifier, falls GKV/PKV/PID nicht zutreffend ist

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Änderungen bei der Krankenversicherten-ID</h5>

<p>Im Vergleich zu Vorversionen wird die Krankenversicherten-ID in <code>Patient.identifier</code> nicht mehr in GKV und PKV unterschieden. <code>Patient.identifier:versichertenId</code> gilt für alle Krankenversichertennummern, unabhängig davon, ob es sich um GKV, PKV oder Sonderkostenträger handelt.</p>

<p>Als <code>Identifier.type</code> SOLL der Code <code>KVZ10</code> aus <code>http://fhir.de/CodeSystem/identifier-type-de-basis</code> verwendet werden. Die Codes <code>GKV</code> und <code>PKV</code> haben den Status <code>retired</code>. Siehe Constraint <strong>kvid-2</strong> im Profil <a href="https://simplifier.net/packages/de.basisprofil.r4/1.5.4/files/2879564">IdentifierKvid10</a> in den Deutschen FHIR-Basisprofilen.</p>
</div>

#### Patientenname

Patientennamen folgen dem [Deutschen FHIR-Basis-Profil für den Datentyp HumanName]:

- **Namensbestandteile**: Die Aufteilung des vollständigen Namens in seine Bestandteile (z.B. Vorsatzwort, Namenszusatz, Nachname) SOLL nur durchgeführt werden, falls diese Informationen explizit in dieser Granularität zur Verfügung stehen (z.B. durch einen direkten Import auf Basis eines VSDM-Datensatzes)
- **Geburtsname**: Per allgemeiner Konvention enthält der Geburtsname (`name.use = maiden`) nur den Familiennamen
- **Mehrere Namen**: Mehrere Namenseinträge sind für verschiedene Anwendungsfälle erlaubt (official, maiden, etc.)

#### Geschlecht

Die Geschlechtsdokumentation folgt den Vorgaben der [Deutschen FHIR-Basis-Profile für Geschlecht]:

- **`Patient.gender`**: Administratives Geschlecht (verpflichtend)
- **`Patient.gender.extension:other-amtlich`**: Amtliche Geschlechtscodes gemäß deutscher Vorschriften für Fälle jenseits von männlich/weiblich/unbekannt
- **[`Patient.extension:recordedSexOrGender`](https://hl7.org/fhir/extensions/StructureDefinition-individual-recordedSexOrGender.html)**: Wiederholbare Geschlechtsangaben, die aus einem Dokument oder einer anderen Aufzeichnung übernommen wurden. Diese Angaben werden getrennt vom administrativen Geschlecht in `Patient.gender` geführt und können beispielsweise das bei der Geburt zugewiesene Geschlecht abbilden.
  - **`value`**: Der dokumentierte Wert. Das [MII ValueSet Person Recorded Sex or Gender SNOMED](ValueSet-mii-vs-person-recordedsexorgender-snomed.html) ist mit der Bindungsstärke `extensible` gebunden ([HDB-1124](https://hl7germany.atlassian.net/browse/HDB-1124)): Passt ein Code daraus, **MUSS** er verwendet werden; andere Codes sind nur zulässig, wenn keiner passt. Es enthält SNOMED-CT-Codes zum biologischen Geschlecht sowie `261665006 | Unknown (qualifier value) |`. Die ConceptMap [MII CM Person Recorded Sex or Gender SNOMED to Administrative Gender](ConceptMap-mii-cm-person-recordedsexorgender-snomed-administrative-gender.html) setzt diese Codes in Beziehung zu `Patient.gender`; keine der Beziehungen ist äquivalent, da dokumentiertes und administratives Geschlecht unterschiedliche Konzepte sind ([HDB-1068](https://hl7germany.atlassian.net/browse/HDB-1068)).
  - **`type`**: Kennzeichnet die Art der dokumentierten Geschlechtsangabe. Für das bei der Geburt zugewiesene Geschlecht SOLL `http://loinc.org|76689-9` (Sex assigned at birth) verwendet werden.
  - **`acquisitionDate`**: Zeitpunkt, zu dem die Angabe erfasst wurde.
- **[`Patient.extension:sexParameterForClinicalUse`](https://hl7.org/fhir/extensions/StructureDefinition-patient-sexParameterForClinicalUse.html)**: Ein Parameter für klinische Entscheidungen, die vom Geschlecht abhängen, etwa Referenzbereiche oder Dosierungen (z. B. *specified*, *female-typical*, *male-typical*). Er wird nicht automatisch aus `Patient.gender` oder `recordedSexOrGender` abgeleitet und von beiden getrennt geführt ([HDB-1067](https://hl7germany.atlassian.net/browse/HDB-1067)).
  - **`value`**: Der Parameter, codiert aus dem ValueSet `sex-parameter-for-clinical-use`.
  - **`period`**: Der Zeitraum, für den der Parameter gilt.

`Indeterminate sex` bezeichnet ein nicht bestimmbares Geschlecht, während `Unknown` bedeutet, dass die Angabe nicht bekannt ist oder nicht dokumentiert wurde. Implementierungen SOLLEN diese Unterscheidung beibehalten.

#### Staatsbürgerschaft und Nationalität

- **`Patient.extension:patient-citizenship`**: Rechtlicher Status des Patienten als Staatsbürger eines Landes. Mehrere Staatsbürgerschaften und ihre jeweiligen Gültigkeitszeiträume können abgebildet werden.
- **`Patient.extension:patient-nationality`**: Nationalität des Patienten. Mehrere Nationalitäten und ihre jeweiligen Gültigkeitszeiträume können abgebildet werden.

**Offener Klärungsbedarf:** Die vorgesehene Verwendung und Abgrenzung von `patient-citizenship` und `patient-nationality` muss noch geklärt werden. Insbesondere ist offen, ob der deutsche Begriff „Staatsangehörigkeit“ spezifisch die rechtliche Staatsbürgerschaft oder Nationalität in einem weiter gefassten rechtlichen, kulturellen oder ethnischen Sinn bezeichnet. Siehe [#86](https://github.com/medizininformatik-initiative/kerndatensatz-basis/issues/86).

#### Geburtsdatum, Geburtsort und Vitalstatus

- **`Patient.birthDate`**: Vollständiges Geburtsdatum, wenn verfügbar. Siehe [Basisprofil - Geburtsdatum]
  - **Bewusste Abweichung:** `birthDate` bleibt optional (0..1). Andere Spezifikationen wie ISiK fordern es verpflichtend (1..1, bei unbekanntem Datum mit `data-absent-reason`). Die MII folgt dem bewusst nicht: aus Datenschutzgründen (Datenminimierung) kann es weggelassen oder nur mit reduzierter Genauigkeit übermittelt werden ([HDB-1071](https://hl7germany.atlassian.net/browse/HDB-1071)).
- **`Patient.extension:birthPlace`**: Registrierter Geburtsort der PatientIn. Zur Abbildung des Geburtslandes ist `valueAddress.country` zu verwenden; die Extension `countryCode` unterstützt die Codierung mit ISO-3166-1-Alpha-2-Codes über ein `preferred` Binding.

**EHDS-Ausblick:** Die Verwendung der FHIR-Core-Extensions `patient-citizenship`, `patient-nationality` und `patient-birthPlace` mit diesen Kardinalitäten ist an [HL7 Europe Patient (EU base) 2.0.0](https://hl7.eu/fhir/base/2.0.0/StructureDefinition-patient-eu.html) und [HL7 Europe Patient (EU core) 2.0.0](https://hl7.eu/fhir/base/2.0.0/StructureDefinition-patient-eu-core.html) ausgerichtet. Dies unterstützt die zukünftige Interoperabilität im EHDS-Kontext.

- **`Patient.deceased[x]`**: 
  - `deceasedBoolean` SOLL, wo möglich, durch `deceasedDateTime` ersetzt werden, wenn die PatientIn verstorben ist und der Zeitpunkt bekannt ist

#### Mutter und Neugeborenes {#mother-and-newborn}

Nach der Geburt werden Mutter und Kind durch getrennte `Patient`-Ressourcen abgebildet. Drei unterschiedliche Beziehungen werden getrennt modelliert ([FHIR R4 – Mother and newborn relationships](https://hl7.org/fhir/R4/patient.html#mother)):

- die **familiäre Beziehung** zwischen Mutter und Kind: `RelatedPerson`;
- die **geburtshilfliche Episode**, d. h. die Kontakte von Mutter und Kind: `Encounter`;
- die **Abrechnungsfälle**: Fallnummer in `Encounter.account.identifier` oder ein `Account`.

**Familiäre Beziehung:**

<pre class="language-mermaid"><code class="language-mermaid">%%{init: {'flowchart': {'htmlLabels': false}, 'theme': 'base', 'themeVariables': {'primaryColor': '#E8F4F8', 'primaryBorderColor': '#406A99', 'primaryTextColor': '#000000', 'lineColor': '#5C8DB3', 'fontSize': '14px'}}}%%
flowchart TD
  M["`**Patient**
      Eigener Datensatz der Mutter`"]
  R["`**RelatedPerson**
      Mutter dieses Kindes
      relationship.coding.code = MTH`"]
  C["`**Patient**
      Eigener Datensatz des Kindes`"]

  M -.->|"`link.other (optional)
      link.type = seealso`"| R
  R -->|"`RelatedPerson.patient`"| C
</code></pre>

Die Mutter erscheint zweimal: als `RelatedPerson`, die auf das Kind verweist, und, wenn sie selbst Patientin ist, als eigener `Patient`. Eine Referenz vom `Patient` der Mutter auf den `Patient` des Kindes gibt es bewusst nicht.

- Die Mutter **SOLL** als `RelatedPerson` abgebildet werden, mit `RelatedPerson.patient` als Referenz auf den `Patient` des Kindes und `RelatedPerson.relationship` = `MTH` aus `http://terminology.hl7.org/CodeSystem/v3-RoleCode`. `MTH` umfasst eine Frau, die das Kind gezeugt, geboren oder großgezogen hat; wo die Unterscheidung relevant ist, **SOLLEN** spezifischere Codes wie `NMTH` (leibliche Mutter), `GESTM` (austragende Mutter), `ADOPTM` (Adoptivmutter) oder `STPMTH` (Stiefmutter) verwendet werden.
- Ist die Mutter selbst Patientin, **KANN** ihr eigenes `Patient.link.other` mit `Patient.link.type` = `seealso` auf diese `RelatedPerson` verweisen.
- `Patient.link` **DARF NICHT** verwendet werden, um den `Patient` der Mutter direkt mit dem `Patient` des Kindes zu verknüpfen: Es verknüpft Ressourcen, die dieselbe tatsächliche Person betreffen.
- **Referenzprofil:** [ISiKAngehoeriger 6.0.0](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0/StructureDefinition-ISiKAngehoeriger.html) ist das deutsche Krankenhausprofil für `RelatedPerson` (`patient.reference` 1..1, `relationship` Must Support). Seine Must-Support-Elemente (offizieller Name, Telekommunikation, Adresse) zielen auf Angehörige als Brief- und Rechnungsempfänger. Eine `RelatedPerson`, die nur aus dem Identifikator der Mutter gebildet wird, z. B. aus HL7 v2 `PID-21`, kann Konformität zu ISiKAngehoeriger nur beanspruchen, wenn sie den [ISiK-Regeln zum Umgang mit fehlenden Daten](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0/UebergreifendeFestlegungen_UmgangFehlendeDaten.html) folgt: Liegt kein Name vor, trägt `RelatedPerson.name` die Extension `data-absent-reason`; unbekannte optionale Must-Support-Elemente wie Telekommunikation und Adresse werden weggelassen.
- `Patient.contact` ist ein Eintrag für eine Kontaktperson innerhalb des `Patient` des Kindes; er kann einen Beziehungscode wie `MTH` und Kontaktdaten enthalten. `RelatedPerson` **SOLL** verwendet werden, wenn die Mutter eigenständig referenzierbar sein muss, z. B. aus ihrem eigenen `Patient.link` oder aus anderen Ressourcen.
- `FamilyMemberHistory` beschreibt die klinisch relevante Vorgeschichte von Angehörigen; es dient nicht der Verknüpfung mit einer identifizierten Mutter.

**Kontakte:**

- Der Einrichtungskontakt des Neugeborenen **KANN** über `Encounter.partOf` auf den Entbindungs-Einrichtungskontakt der Mutter verweisen, wie in FHIR R4 beschrieben.
- Eine solche `partOf`-Referenz auf einen Encounter mit anderem `Encounter.subject` drückt nur die geburtshilfliche Zuordnung aus. Sie ist nicht Teil der Kontakthierarchie: Die Traversierung der Hierarchie endet am Einrichtungskontakt des Neugeborenen (siehe [Kontakthierarchien und Kontaktebenen](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.html#encounter-partof-across-patients)).

**Abrechnung:**

- Besteht für das Neugeborene ein eigener Abrechnungsfall, kann dessen Fallnummer in `Encounter.account.identifier` des Neugeborenen angegeben werden, als logische Referenz auch ohne verfügbare Account-Ressource (siehe [Best Practice - Aufnahmenummer vs. Fallnummer](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.html#best-practice-aufnahmenummer-vs-fallnummer)).
- Ob ein eigener Fall besteht, richtet sich nach den Abrechnungsregeln des jeweiligen Jahres, nicht nach der `partOf`-Referenz. Für 2026 sieht [FPV 2026 § 1 Abs. 5](https://www.g-drg.de/content/download/17465/file/2025_11_14_FPV_2026.pdf#page=3) für jedes Neugeborene, das nach der Versorgung im Kreißsaal weiter im Krankenhaus versorgt wird, einen eigenen Fall und eine eigene Rechnung vor, mit Ausnahmen, z. B. wenn die Mindestverweildauer nicht erreicht wird.

**Mehrlingsschwangerschaft und Mehrlingsgeburt:**

- Eine Mehrlingsschwangerschaft ist ein Befund der **Mutter** und wird als Observation zur schwangeren Patientin erfasst, z. B. im KBV-MIO-Mutterpass-1.1.0-Profil [`KBV_PR_MIO_MR_Observation_Pregnancy_Information`](https://hub.kbv.de/spaces/MP1X1X0/pages/109842757/9.3.2.2%2BAngaben%2Bzur%2BSchwangerschaft) (SNOMED CT `370386005` mit booleschem Wert).
- Nach der Geburt ist jedes Kind ein eigener `Patient`. Liegen Angaben zur Mehrlingsgeburt vor, werden sie in `Patient.multipleBirth[x]` (0..1) angegeben. `multipleBirthInteger` ist die Geburtsreihenfolge, nicht die Anzahl der Kinder; `multipleBirthBoolean` = `true` zeigt nur eine Mehrlingsgeburt an. Am `Patient` der Mutter würde `multipleBirth[x]` ihre eigene Geburt beschreiben.
- Jedes Kind erhält eine eigene `RelatedPerson` für die Mutter, wie im [CH-EPREG-Beispiel für mehrere Kinder](https://www.fhir.ch/ig/ch-epreg/child-relationships.html).

Beispiel für Zwillinge:

| Ressource | Inhalt |
|---|---|
| `Patient` Kind 1 | `multipleBirthInteger` = `1` (oder `multipleBirthBoolean` = `true`, wenn die Reihenfolge unbekannt ist) |
| `Patient` Kind 2 | `multipleBirthInteger` = `2` (oder `multipleBirthBoolean` = `true`, wenn die Reihenfolge unbekannt ist) |
| `RelatedPerson` Mutter für Kind 1 | `patient` → Kind 1, `relationship` = `MTH` |
| `RelatedPerson` Mutter für Kind 2 | `patient` → Kind 2, `relationship` = `MTH` |

**Nicht im Umfang:** Die Identifikation einzelner Feten während der Schwangerschaft ist nicht Gegenstand dieses Moduls; siehe [HL7 International Birth and Child Model](https://build.fhir.org/ig/HL7/fetal_records/) und CH EPREG. Gleiches gilt für die in [HDB-1035](https://hl7germany.atlassian.net/browse/HDB-1035) aufgeworfenen Fragen zur Vergabe von Identifikatoren bei der Geburt, zur Verknüpfung pränataler Befunde mit dem späteren Kind und zur Zuordnung von Nabelschnurblut-Proben zu Mutter oder Kind. Diese werden an geburtshilfliche und perinatale Leitfäden verwiesen.

**HL7 v2:** Gemäß dem [HL7-v2-to-FHIR-Mapping](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pid-to-patient.html) wird `PID-21` (Mother's Identifier) auf eine `RelatedPerson` für die Mutter abgebildet, `PID-25` (Birth Order) auf `multipleBirthInteger` und `PID-24` (Multiple Birth Indicator) auf `multipleBirthBoolean`, wenn `PID-25` nicht befüllt ist.

#### Adressinformationen

Adressdetails folgen dem [Basisprofil - Adresse]:

- **Mehrere Adressen**: Mehrere Adressen sind erlaubt
- **Adressverlauf**: Systeme SOLLEN ehemalige Adressen als solche kennzeichnen, sodass die aktuelle Adresse der PatientIn erkennbar ist
- **Adressbestandteile**: 
  - `address.line` mit Extensions für Straße, Hausnummer, Adresszusatz, Postfach
  - `address.city` mit Extension für Gemeindeschlüssel und Stadtteil (bei Stadtstaaten)
  - `address.postalCode` für PLZ
  - `address.country` für Land

**EHDS-Ausblick:** Über die Abhängigkeit von den Deutschen FHIR-Basisprofilen 1.6.0 basieren die Adress-Slices des Patient-Profils auf [AddressDeBasis 1.6.0](https://simplifier.net/packages/de.basisprofil.r4/1.6.0/files/3644189). Für eine einheitlich codierte Länderangabe **SOLLTEN** Implementierungen die geerbte Extension `Address.country.extension:countryCode` (`iso21090-codedString`) mit einem ISO-3166-1-Alpha-2-Code verwenden; Alpha-3-Codes aus Quellsystemen **MÜSSEN** beim Befüllen dieser Extension in den entsprechenden Alpha-2-Code überführt werden. `AddressDeBasis` bindet den Wert der Extension mit der Bindungsstärke `required` an das ValueSet `ISO 3166 Part 1: 2 Letter Codes`. Damit werden dieselbe Extension und dasselbe ValueSet wie in [HL7 Europe Address (EU) 2.0.0](https://hl7.eu/fhir/base/2.0.0/StructureDefinition-Address-eu.html) verwendet, wo die Bindungsstärke `preferred` ist; dies unterstützt die zukünftige EHDS-Interoperabilität. Diese Empfehlung betrifft die codierte Darstellung in der Extension; `Address.country` bleibt ein String. Die Invariante `pat-cnt-2or3-char` (Schweregrad warning) an den Adress-Slices prüft diese Extension und nicht `Address.country`, sodass `Address.country` auch andere Werte wie DEÜV-Länderschlüssel enthalten darf ([HDB-1069](https://hl7germany.atlassian.net/browse/HDB-1069)).

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Adressbestandteile</h5>

<p><strong>Stadtteil:</strong> Der Stadtteil ist nicht Bestandteil des <a href="https://fachportal.gematik.de/anwendungen/versichertenstammdatenmanagement">VSDM-Datensatzes</a> der Gematik. Andere Quellen konform zu §21 KHEntgG müssen eventuell hinzugezogen werden.</p>

<p><strong>Adressstruktur:</strong> Für Stadtstaaten verwenden Sie <code>Patient.address.city</code> kombiniert mit <code>Patient.address.extension.Stadtteil</code>, um <code>Person.Demographie.Adresse.Wohnort</code> darzustellen.</p>
</div>

{% include link-list.md %}
