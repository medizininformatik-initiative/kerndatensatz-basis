**Example Usage Scenarios:**

- Document patient demographics including name, gender, birth date, and address for clinical care and research
- Record health insurance information for administrative purposes
- Maintain organizational patient identifiers (PID) for linking patient data across systems within a healthcare organization
- Enable pseudonymized patient representations for research use cases while preserving essential demographic characteristics

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the MII Patient Profile.

#### Patient Identification

Patient identification uses multiple identifier types depending on the context:

- **`Patient.identifier:versichertenId`**: Lebenslange Krankenversicherten-ID (10-stellige KVID) for all health insurance types (GKV, PKV, Sonderkostenträger)
  - **IMPORTANT**: The Assigner element **MUST** contain the IKNR (Institutionskennzeichen) of the issuing institution
  - Always represents the current insurance number of the patient
  - Use `Identifier.type` code `KVZ10` from `http://fhir.de/CodeSystem/identifier-type-de-basis`
  - Codes `GKV` and `PKV` have status `retired` and should not be used

- **`Patient.identifier:pid`**: Organisationsinterner Patienten-Identifier - the leading (MPI) ID of the patient
  - A reference to the issuing Organization in `Patient.identifier:pid.assigner` is **RECOMMENDED**
  - Logical reference via IK-Nummer or IHE Affinity Domain OID is permitted
  - The CodeSystem [Core-Location-Identifier] for all MII sites can be used

- **`Patient.identifier`**: Any other identifiers when GKV/PKV/PID are not applicable

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Krankenversicherten-ID Changes</h5>

<p>Compared to previous versions, the Krankenversicherten-ID in <code>Patient.identifier</code> is no longer distinguished between GKV and PKV. <code>Patient.identifier:versichertenId</code> applies to all health insurance numbers, regardless of whether GKV, PKV, or special insurance carriers.</p>

<p>Use the code <code>KVZ10</code> from <code>http://fhir.de/CodeSystem/identifier-type-de-basis</code> as <code>Identifier.type</code>. The codes <code>GKV</code> and <code>PKV</code> have retired status. See constraint <strong>kvid-2</strong> in the profile <a href="https://simplifier.net/packages/de.basisprofil.r4/1.5.4/files/2879564">IdentifierKvid10</a> in the German FHIR Base Profiles.</p>
</div>

#### Patient Name

Patient names follow the [German Base Profile for HumanName]:

- **Name Components**: The breakdown of the complete name into components (e.g., Vorsatzwort, Namenszusatz, Nachname) **SHOULD** only be performed if this information is explicitly available at this granularity (e.g., through direct import based on a VSDM dataset)
- **Birth Name**: By general convention, the birth name (`name.use = maiden`) contains only the family name
- **Multiple Names**: Multiple name entries are permitted for different use cases (official, maiden, etc.)

#### Gender

Gender documentation follows the [German Base Profile for Gender]:

- **`Patient.gender`**: Administrative gender (required)
- **`Patient.gender.extension:other-amtlich`**: Official gender codes according to German regulations for cases beyond male/female/unknown

#### Birth Date and Vital Status

- **`Patient.birthDate`**: Full birth date when available. See [German Base Profile - Geburtsdatum]
- **`Patient.deceased[x]`**: 
  - `deceasedBoolean` **SHOULD** be replaced by `deceasedDateTime` when the patient is deceased and the datetime is known

#### Address Information

Address details follow the [German Base Profile - Adresse]:

- **Multiple Addresses**: Multiple addresses are permitted
- **Address History**: Systems **SHOULD** mark former addresses appropriately so that the current address of the patient is identifiable
- **Address Components**: 
  - `address.line` with extensions for Straße, Hausnummer, Adresszusatz, Postfach
  - `address.city` with extension for Gemeindeschlüssel and Stadtteil (for city-states)
  - `address.postalCode` for PLZ
  - `address.country` for Land

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Address Components</h5>

<p><strong>Stadtteil (District):</strong> The Stadtteil is not part of the <a href="https://fachportal.gematik.de/anwendungen/versichertenstammdatenmanagement">VSDM dataset</a> from Gematik. Other sources conforming to §21 KHEntgG may need to be consulted for this information.</p>

<p><strong>Address Structure:</strong> For city-states (Stadtstaaten), use <code>Patient.address.city</code> combined with <code>Patient.address.extension.Stadtteil</code> to represent <code>Person.Demographie.Adresse.Wohnort</code>.</p>
</div>

{% include link-list.md %}
