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
  - **`value`**: Der dokumentierte Wert. Das [MII ValueSet Person Recorded Sex or Gender SNOMED](ValueSet-mii-vs-person-recordedsexorgender-snomed.html) ist mit der Bindungsstärke `preferred` gebunden und enthält SNOMED-CT-Codes zum biologischen Geschlecht sowie `261665006 | Unknown (qualifier value) |`.
  - **`type`**: Kennzeichnet die Art der dokumentierten Geschlechtsangabe. Für das bei der Geburt zugewiesene Geschlecht SOLL `http://loinc.org|76689-9` (Sex assigned at birth) verwendet werden.
  - **`acquisitionDate`**: Zeitpunkt, zu dem die Angabe erfasst wurde.

`Indeterminate sex` bezeichnet ein nicht bestimmbares Geschlecht, während `Unknown` bedeutet, dass die Angabe nicht bekannt ist oder nicht dokumentiert wurde. Implementierungen SOLLEN diese Unterscheidung beibehalten.

#### Staatsbürgerschaft und Nationalität

- **`Patient.extension:patient-citizenship`**: Rechtlicher Status des Patienten als Staatsbürger eines Landes. Mehrere Staatsbürgerschaften und ihre jeweiligen Gültigkeitszeiträume können abgebildet werden.
- **`Patient.extension:patient-nationality`**: Nationalität des Patienten. Mehrere Nationalitäten und ihre jeweiligen Gültigkeitszeiträume können abgebildet werden.

**Offener Klärungsbedarf:** Die vorgesehene Verwendung und Abgrenzung von `patient-citizenship` und `patient-nationality` muss noch geklärt werden. Insbesondere ist offen, ob der deutsche Begriff „Staatsangehörigkeit“ spezifisch die rechtliche Staatsbürgerschaft oder Nationalität in einem weiter gefassten rechtlichen, kulturellen oder ethnischen Sinn bezeichnet. Siehe [#86](https://github.com/medizininformatik-initiative/kerndatensatz-basis/issues/86).

#### Geburtsdatum, Geburtsort und Vitalstatus

- **`Patient.birthDate`**: Vollständiges Geburtsdatum, wenn verfügbar. Siehe [Basisprofil - Geburtsdatum]
- **`Patient.extension:birthPlace`**: Registrierter Geburtsort der PatientIn. Zur Abbildung des Geburtslandes ist `valueAddress.country` zu verwenden; die Extension `countryCode` unterstützt die Codierung mit ISO-3166-1-Alpha-2-Codes über ein `preferred` Binding.

**EHDS-Ausblick:** Die Verwendung der FHIR-Core-Extensions `patient-citizenship`, `patient-nationality` und `patient-birthPlace` mit diesen Kardinalitäten ist an [HL7 Europe Patient (EU base) 2.0.0](https://hl7.eu/fhir/base/2.0.0/StructureDefinition-patient-eu.html) und [HL7 Europe Patient (EU core) 2.0.0](https://hl7.eu/fhir/base/2.0.0/StructureDefinition-patient-eu-core.html) ausgerichtet. Dies unterstützt die zukünftige Interoperabilität im EHDS-Kontext.

- **`Patient.deceased[x]`**: 
  - `deceasedBoolean` SOLL, wo möglich, durch `deceasedDateTime` ersetzt werden, wenn die PatientIn verstorben ist und der Zeitpunkt bekannt ist

#### Adressinformationen

Adressdetails folgen dem [Basisprofil - Adresse]:

- **Mehrere Adressen**: Mehrere Adressen sind erlaubt
- **Adressverlauf**: Systeme SOLLEN ehemalige Adressen als solche kennzeichnen, sodass die aktuelle Adresse der PatientIn erkennbar ist
- **Adressbestandteile**: 
  - `address.line` mit Extensions für Straße, Hausnummer, Adresszusatz, Postfach
  - `address.city` mit Extension für Gemeindeschlüssel und Stadtteil (bei Stadtstaaten)
  - `address.postalCode` für PLZ
  - `address.country` für Land

**EHDS-Ausblick:** Über die Abhängigkeit von den Deutschen FHIR-Basisprofilen 1.6.0 basieren die Adress-Slices des Patient-Profils auf [AddressDeBasis 1.6.0](https://simplifier.net/packages/de.basisprofil.r4/1.6.0/files/3644189). Für eine einheitlich codierte Länderangabe **SOLLTEN** Implementierungen die geerbte Extension `Address.country.extension:countryCode` (`iso21090-codedString`) mit einem ISO-3166-1-Alpha-2-Code verwenden; Alpha-3-Codes aus Quellsystemen **MÜSSEN** beim Befüllen dieser Extension in den entsprechenden Alpha-2-Code überführt werden. `AddressDeBasis` bindet den Wert der Extension mit der Bindungsstärke `required` an das ValueSet `ISO 3166 Part 1: 2 Letter Codes`. Damit werden dieselbe Extension und dasselbe ValueSet wie in [HL7 Europe Address (EU) 2.0.0](https://hl7.eu/fhir/base/2.0.0/StructureDefinition-Address-eu.html) verwendet, wo die Bindungsstärke `preferred` ist; dies unterstützt die zukünftige EHDS-Interoperabilität. Diese Empfehlung betrifft die codierte Darstellung in der Extension; `Address.country` bleibt ein String.

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Adressbestandteile</h5>

<p><strong>Stadtteil:</strong> Der Stadtteil ist nicht Bestandteil des <a href="https://fachportal.gematik.de/anwendungen/versichertenstammdatenmanagement">VSDM-Datensatzes</a> der Gematik. Andere Quellen konform zu §21 KHEntgG müssen eventuell hinzugezogen werden.</p>

<p><strong>Adressstruktur:</strong> Für Stadtstaaten verwenden Sie <code>Patient.address.city</code> kombiniert mit <code>Patient.address.extension.Stadtteil</code>, um <code>Person.Demographie.Adresse.Wohnort</code> darzustellen.</p>
</div>

{% include link-list.md %}
