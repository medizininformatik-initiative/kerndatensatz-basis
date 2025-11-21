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
  - Die Codes `GKV` und `PKV` haben den Status `retired` und sollten nicht verwendet werden

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

- **Namensbestandteile**: Die Aufteilung des vollständigen Namens in seine Bestandteile (z.B. Vorsatzwort, Namenszusatz, Nachname) SOLLTE nur durchgeführt werden, falls diese Informationen explizit in dieser Granularität zur Verfügung stehen (z.B. durch einen direkten Import auf Basis eines VSDM-Datensatzes)
- **Geburtsname**: Per allgemeiner Konvention enthält der Geburtsname (`name.use = maiden`) nur den Familiennamen
- **Mehrere Namen**: Mehrere Namenseinträge sind für verschiedene Anwendungsfälle erlaubt (official, maiden, etc.)

#### Geschlecht

Die Geschlechtsdokumentation folgt den Vorgaben der [Deutschen FHIR-Basis-Profile für Geschlecht]:

- **`Patient.gender`**: Administratives Geschlecht (verpflichtend)
- **`Patient.gender.extension:other-amtlich`**: Amtliche Geschlechtscodes gemäß deutscher Vorschriften für Fälle jenseits von männlich/weiblich/unbekannt

#### Geburtsdatum und Vitalstatus

- **`Patient.birthDate`**: Vollständiges Geburtsdatum, wenn verfügbar. Siehe [Basisprofil - Geburtsdatum]
- **`Patient.deceased[x]`**: 
  - `deceasedBoolean` SOLLTE, wo möglich, durch `deceasedDateTime` ersetzt werden, wenn die PatientIn verstorben ist und der Zeitpunkt bekannt ist

#### Adressinformationen

Adressdetails folgen dem [Basisprofil - Adresse]:

- **Mehrere Adressen**: Mehrere Adressen sind erlaubt
- **Adressverlauf**: Systeme SOLLTEN ehemalige Adressen als solche kennzeichnen, sodass die aktuelle Adresse der PatientIn erkennbar ist
- **Adressbestandteile**: 
  - `address.line` mit Extensions für Straße, Hausnummer, Adresszusatz, Postfach
  - `address.city` mit Extension für Gemeindeschlüssel und Stadtteil (bei Stadtstaaten)
  - `address.postalCode` für PLZ
  - `address.country` für Land

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Adressbestandteile</h5>

<p><strong>Stadtteil:</strong> Der Stadtteil ist nicht Bestandteil des <a href="https://fachportal.gematik.de/anwendungen/versichertenstammdatenmanagement">VSDM-Datensatzes</a> der Gematik. Andere Quellen konform zu §21 KHEntgG müssen eventuell hinzugezogen werden.</p>

<p><strong>Adressstruktur:</strong> Für Stadtstaaten verwenden Sie <code>Patient.address.city</code> kombiniert mit <code>Patient.address.extension.Stadtteil</code>, um <code>Person.Demographie.Adresse.Wohnort</code> darzustellen.</p>
</div>

{% include link-list.md %}
