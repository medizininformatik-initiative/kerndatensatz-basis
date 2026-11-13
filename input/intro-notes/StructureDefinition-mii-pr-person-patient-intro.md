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
  - Codes `GKV` and `PKV` have status `retired` and **SHOULD NOT** be used

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
- **[`Patient.extension:recordedSexOrGender`](https://hl7.org/fhir/extensions/StructureDefinition-individual-recordedSexOrGender.html)**: Repeatable sex or gender statements taken from a document or other record. These statements are kept separate from the administrative gender in `Patient.gender` and can, for example, represent sex assigned at birth.
  - **`value`**: The recorded value. The [MII ValueSet Person Recorded Sex or Gender SNOMED](ValueSet-mii-vs-person-recordedsexorgender-snomed.html) is bound with `extensible` strength ([HDB-1124](https://hl7germany.atlassian.net/browse/HDB-1124)): a code from it **SHALL** be used if one fits; other codes are allowed only if none applies. It contains SNOMED CT findings related to biological sex as well as `261665006 | Unknown (qualifier value) |`. The ConceptMap [MII CM Person Recorded Sex or Gender SNOMED to Administrative Gender](ConceptMap-mii-cm-person-recordedsexorgender-snomed-administrative-gender.html) relates these codes to `Patient.gender`; none of the relationships is equivalent, because recorded sex and administrative gender are different concepts ([HDB-1068](https://hl7germany.atlassian.net/browse/HDB-1068)).
  - **`type`**: Identifies the kind of recorded sex or gender. `http://loinc.org|76689-9` (Sex assigned at birth) SHOULD be used when documenting sex assigned at birth.
  - **`acquisitionDate`**: Date and time when the statement was first recorded in the system.
- **[`Patient.extension:sexParameterForClinicalUse`](https://hl7.org/fhir/extensions/StructureDefinition-patient-sexParameterForClinicalUse.html)**: A parameter for clinical decisions that depend on sex, such as reference ranges or dosing (e.g. *specified*, *female-typical*, *male-typical*). It is not derived automatically from `Patient.gender` or `recordedSexOrGender` and is kept separate from both ([HDB-1067](https://hl7germany.atlassian.net/browse/HDB-1067)).
  - **`value`**: The parameter, coded from the ValueSet `sex-parameter-for-clinical-use`.
  - **`period`**: The period during which the parameter applies.

`Indeterminate sex` describes a sex that could not be determined, whereas `Unknown` indicates that the value is not known or was not recorded. Implementations SHOULD preserve this distinction.

#### Citizenship and Nationality

- **`Patient.extension:patient-citizenship`**: The patient's legal status as a citizen of a country. Multiple citizenships and their respective periods can be represented.
- **`Patient.extension:patient-nationality`**: The patient's nationality. Multiple nationalities and their respective periods can be represented.

**Open clarification:** The intended use and boundary between `patient-citizenship` and `patient-nationality` still need to be clarified. In particular, it remains unresolved whether the German concept “Staatsangehörigkeit” refers specifically to legal citizenship or to nationality in a broader legal, cultural, or ethnic sense. See [#86](https://github.com/medizininformatik-initiative/kerndatensatz-basis/issues/86).

#### Birth Date, Place of Birth, and Vital Status

- **`Patient.birthDate`**: Full birth date when available. See [German Base Profile - Geburtsdatum]
  - **Deliberate deviation:** `birthDate` stays optional (0..1). Other specifications such as ISiK require it (1..1, with `data-absent-reason` if unknown). The MII deliberately does not follow this: for privacy reasons (data minimisation) it may be omitted or provided only in reduced precision ([HDB-1071](https://hl7germany.atlassian.net/browse/HDB-1071)).
- **`Patient.extension:birthPlace`**: The patient's registered place of birth. To represent the country of birth, use `valueAddress.country`; the `countryCode` extension supports coding with ISO 3166-1 alpha-2 codes using a `preferred` binding.

**EHDS outlook:** The use and cardinalities of the FHIR core extensions `patient-citizenship`, `patient-nationality`, and `patient-birthPlace` are aligned with [HL7 Europe Patient (EU base) 2.0.0](https://hl7.eu/fhir/base/2.0.0/StructureDefinition-patient-eu.html) and [HL7 Europe Patient (EU core) 2.0.0](https://hl7.eu/fhir/base/2.0.0/StructureDefinition-patient-eu-core.html). This supports future interoperability in an EHDS context.

- **`Patient.deceased[x]`**: 
  - `deceasedBoolean` **SHOULD** be replaced by `deceasedDateTime` when the patient is deceased and the datetime is known

#### Mother and Newborn {#mother-and-newborn}

After birth, mother and child are represented by separate `Patient` resources. Three different relationships are modelled separately ([FHIR R4 – Mother and newborn relationships](https://hl7.org/fhir/R4/patient.html#mother)):

- the **family relationship** between mother and child: `RelatedPerson`;
- the **maternity episode**, i.e. the encounters of mother and child: `Encounter`;
- the **billing cases**: Fallnummer in `Encounter.account.identifier` or an `Account`.

**Family relationship:**

<pre class="language-mermaid"><code class="language-mermaid">%%{init: {'flowchart': {'htmlLabels': false}, 'theme': 'base', 'themeVariables': {'primaryColor': '#E8F4F8', 'primaryBorderColor': '#406A99', 'primaryTextColor': '#000000', 'lineColor': '#5C8DB3', 'fontSize': '14px'}}}%%
flowchart TD
  M["`**Patient**
      Mother's own record`"]
  R["`**RelatedPerson**
      Mother in relation to this child
      relationship.coding.code = MTH`"]
  C["`**Patient**
      Child's own record`"]

  M -.->|"`link.other (optional link)
      link.type = seealso`"| R
  R -->|"`RelatedPerson.patient`"| C
</code></pre>

The mother appears twice: as a `RelatedPerson` that references the child, and, if she is a patient herself, as her own `Patient`. There is deliberately no reference from the mother's `Patient` to the child's `Patient`.

- The mother **SHOULD** be represented as a `RelatedPerson` with `RelatedPerson.patient` referencing the child's `Patient` and `RelatedPerson.relationship` = `MTH` from `http://terminology.hl7.org/CodeSystem/v3-RoleCode`. `MTH` covers a woman who conceives, gives birth to, or raises and nurtures the child; where the distinction matters, more specific codes such as `NMTH` (natural mother), `GESTM` (gestational mother), `ADOPTM` (adoptive mother) or `STPMTH` (stepmother) **SHOULD** be used.
- If the mother is also a patient, her own `Patient.link.other` **MAY** reference this `RelatedPerson` with `Patient.link.type` = `seealso`.
- `Patient.link` **SHALL NOT** be used to link the mother's `Patient` directly to the child's `Patient`: it links resources that concern the same actual person.
- **Reference profile:** [ISiKAngehoeriger 6.0.0](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0/StructureDefinition-ISiKAngehoeriger.html) is the German hospital profile for `RelatedPerson` (`patient.reference` 1..1, `relationship` Must Support). Its Must Support elements (official name, telecom, address) target relatives as letter and invoice recipients. A `RelatedPerson` built only from the mother's identifier, e.g. from HL7 v2 `PID-21`, can claim conformance to ISiKAngehoeriger only if it follows the [ISiK rules for missing data](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0/UebergreifendeFestlegungen_UmgangFehlendeDaten.html): if no name is available, `RelatedPerson.name` carries the `data-absent-reason` extension; unknown optional Must Support elements such as telecom and address are omitted.
- `Patient.contact` is a contact-party entry within the child's `Patient`; it can carry a relationship code such as `MTH` and contact details. `RelatedPerson` **SHOULD** be used when the mother needs to be independently referenceable, e.g. from her own `Patient.link` or from other resources.
- `FamilyMemberHistory` describes the clinically relevant history of relatives; it is not intended to link an identified mother.

**Encounters:**

- The newborn's Einrichtungskontakt **MAY** reference the mother's delivery Einrichtungskontakt via `Encounter.partOf`, as described in FHIR R4.
- Such a `partOf` reference to an Encounter with a different `Encounter.subject` only expresses the maternity association. It is not part of the contact hierarchy: hierarchy traversal stops at the newborn's Einrichtungskontakt (see [Encounter Hierarchies and Contact Levels](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.html#encounter-partof-across-patients)).

**Billing:**

- If a separate billing case exists for the newborn, its Fallnummer can be given in the newborn's `Encounter.account.identifier`, as a logical reference even when no Account resource is available (see [Best Practice - Aufnahmenummer vs. Fallnummer](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.html#best-practice-aufnahmenummer-vs-fallnummer)).
- Whether a separate case exists follows the German billing rules of the respective year, not the `partOf` reference. For 2026, [FPV 2026 § 1 (5)](https://www.g-drg.de/content/download/17465/file/2025_11_14_FPV_2026.pdf#page=3) requires a separate case and invoice for each newborn who is cared for in hospital after the delivery room, with exceptions, e.g. when the minimum length of stay is not reached.

**Multiple pregnancy and multiple birth:**

- A multiple pregnancy is a finding about the **mother**, recorded as an Observation for the pregnant patient, e.g. in the KBV MIO Mutterpass 1.1.0 profile [`KBV_PR_MIO_MR_Observation_Pregnancy_Information`](https://hub.kbv.de/spaces/MP1X1X0/pages/109842757/9.3.2.2%2BAngaben%2Bzur%2BSchwangerschaft) (SNOMED CT `370386005` with a Boolean value).
- After birth, each child is a separate `Patient`. If multiple-birth information is available, it is given in `Patient.multipleBirth[x]` (0..1). `multipleBirthInteger` is the birth order, not the number of children; `multipleBirthBoolean` = `true` only indicates a multiple birth. On the mother's `Patient`, `multipleBirth[x]` would describe her own birth.
- Each child gets its own `RelatedPerson` for the mother, as in the [CH EPREG example for multiple children](https://www.fhir.ch/ig/ch-epreg/child-relationships.html).

Example for twins:

| Resource | Content |
|---|---|
| `Patient` child 1 | `multipleBirthInteger` = `1` (or `multipleBirthBoolean` = `true` if the order is unknown) |
| `Patient` child 2 | `multipleBirthInteger` = `2` (or `multipleBirthBoolean` = `true` if the order is unknown) |
| `RelatedPerson` mother for child 1 | `patient` → child 1, `relationship` = `MTH` |
| `RelatedPerson` mother for child 2 | `patient` → child 2, `relationship` = `MTH` |

**Out of scope:** Identifying individual fetuses during pregnancy is not covered by this module; see the [HL7 International Birth and Child Model](https://build.fhir.org/ig/HL7/fetal_records/) and CH EPREG. The same applies to the questions raised in [HDB-1035](https://hl7germany.atlassian.net/browse/HDB-1035) on assigning identifiers at birth, linking prenatal findings to the later child, and attributing cord-blood specimens to mother or child. These are deferred to obstetric and perinatal guidance.

**HL7 v2:** According to the [HL7 v2-to-FHIR mapping](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pid-to-patient.html), `PID-21` (Mother's Identifier) maps to a `RelatedPerson` for the mother, `PID-25` (Birth Order) to `multipleBirthInteger` and `PID-24` (Multiple Birth Indicator) to `multipleBirthBoolean` if `PID-25` is not valued.

#### Address Information

Address details follow the [German Base Profile - Adresse]:

- **Multiple Addresses**: Multiple addresses are permitted
- **Address History**: Systems **SHOULD** mark former addresses appropriately so that the current address of the patient is identifiable
- **Address Components**: 
  - `address.line` with extensions for Straße, Hausnummer, Adresszusatz, Postfach
  - `address.city` with extension for Gemeindeschlüssel and Stadtteil (for city-states)
  - `address.postalCode` for PLZ
  - `address.country` for Land

**EHDS outlook:** Through the dependency on the German FHIR Base Profiles 1.6.0, the Patient address slices are based on [AddressDeBasis 1.6.0](https://simplifier.net/packages/de.basisprofil.r4/1.6.0/files/3644189). For a consistently coded country, implementations **SHOULD** use the inherited `Address.country.extension:countryCode` extension (`iso21090-codedString`) with an ISO 3166-1 alpha-2 code; source-system alpha-3 codes **MUST** be mapped to their alpha-2 equivalent when populating this extension. `AddressDeBasis` binds the extension with `required` strength to the `ISO 3166 Part 1: 2 Letter Codes` ValueSet. This uses the same extension and ValueSet as [HL7 Europe Address (EU) 2.0.0](https://hl7.eu/fhir/base/2.0.0/StructureDefinition-Address-eu.html), where the binding is `preferred`, and supports future EHDS interoperability. This recommendation concerns the coded representation in the extension; `Address.country` remains a string. The warning invariant `pat-cnt-2or3-char` on the address slices checks this extension, not `Address.country`, so `Address.country` may also carry other values such as DEÜV country codes ([HDB-1069](https://hl7germany.atlassian.net/browse/HDB-1069)).

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Address Components</h5>

<p><strong>Stadtteil (District):</strong> The Stadtteil is not part of the <a href="https://fachportal.gematik.de/anwendungen/versichertenstammdatenmanagement">VSDM dataset</a> from Gematik. Other sources conforming to §21 KHEntgG may need to be consulted for this information.</p>

<p><strong>Address Structure:</strong> For city-states (Stadtstaaten), use <code>Patient.address.city</code> combined with <code>Patient.address.extension.Stadtteil</code> to represent <code>Person.Demographie.Adresse.Wohnort</code>.</p>
</div>

{% include link-list.md %}
