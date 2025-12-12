**Example Usage Scenarios:**

- Document a patient's facility contact (Einrichtungskontakt) representing the overall stay at a healthcare institution from admission to discharge, including admission reason and discharge disposition
- Track department contacts (Abteilungskontakt) when a patient is transferred between different departments within the same facility stay, capturing department codes and timing
- Record care unit contacts (Versorgungsstellenkontakt) for specific care locations such as normal ward, intensive care unit, or operating room within a department
- Model hierarchical encounter structures using `partOf` to link Versorgungsstellenkontakt → Abteilungskontakt → Einrichtungskontakt
- Support feasibility queries by counting encounters/cases with specific characteristics (e.g., inpatient cases, intensive care stays, emergency admissions)
- Document planned encounters with expected admission and discharge dates for pre-admission planning

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the MII Kontakt Gesundheitseinrichtung Profile.

#### Encounter Hierarchies and Contact Levels

The MII Fall module distinguishes three levels of encounters using `Encounter.type:Kontaktebene`:

- **Einrichtungskontakt (Facility Contact)**: Top-level encounter representing the entire stay/visit at a healthcare facility
- **Abteilungskontakt (Department Contact)**: Encounter at a specific department within the facility
- **Versorgungsstellenkontakt (Care Unit Contact)**: Encounter at a specific care unit or ward

These levels are linked using `Encounter.partOf` to create a hierarchical structure.

**Example Encounter Hierarchy:**

The following diagram illustrates how different encounter levels are linked together using `partOf` references, along with optional connections to EpisodeOfCare and Account resources:

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

In this example:
- **E0** represents the overall facility contact (Einrichtungskontakt) for the hospital stay
- **A1E** is the department contact (Abteilungskontakt) for the Emergency Department (Notaufnahme)
- **A2E** is the department contact (Abteilungskontakt) for General Surgery (Allgemeinchirurgie)
- **VS1-VS5** are care unit contacts (Versorgungsstellenkontakte) for specific locations: Emergency treatment room 3, Radiology CT, OR 4 (laparoscopic appendectomy), PACU, and Surgical Ward C3
- The hierarchy is established through `partOf` references pointing upward from care units to departments to facility
- **EP1** (EpisodeOfCare) and **A1** (Account) are shown for completeness but are not currently part of the MII Kerndatensatz specification. Note that for simplicity, only E0 is shown referencing these resources, but in practice any encounter in the hierarchy can reference the EpisodeOfCare and Account it belongs to.

#### Representation of Encounter Types in FHIR

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

##### Primary Encounters

Based on the [FHIR DE Basisprofile guidance](https://ig.fhir.de/basisprofile-de/1.4.0/Ressourcen-AmbulanterStationaererFall.html):

<table class="encounter-type-table">
<thead>
<tr>
<th>Encounter Type (German)</th>
<th>HL7 V2 Code</th>
<th>FHIR Representation</th>
</tr>
</thead>
<tbody>
<tr>
<td>Ambulant (Outpatient)</td>
<td>O</td>
<td><code>Encounter.class = AMB</code></td>
</tr>
<tr>
<td>Ambulantes Operieren (Outpatient Surgery)</td>
<td>O</td>
<td><code>Encounter.class = AMB</code><br/><code>Encounter.type = operation</code></td>
</tr>
<tr>
<td>Stationär (Inpatient)</td>
<td>I</td>
<td><code>Encounter.class = IMP</code></td>
</tr>
<tr>
<td>Normalstationär (Normal Ward)</td>
<td>I</td>
<td><code>Encounter.class = IMP</code><br/><code>Encounter.type = normalstationaer</code></td>
</tr>
<tr>
<td>Intensivstationär (Intensive Care)</td>
<td>I</td>
<td><code>Encounter.class = IMP</code><br/><code>Encounter.type = intensivstationaer</code></td>
</tr>
<tr>
<td>Wiederaufnahme (Readmission)</td>
<td>R</td>
<td><code>Encounter.class = IMP</code><br/><code>Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle = 07</code></td>
</tr>
<tr>
<td>Voraufnahme (Pre-admission)</td>
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

##### Secondary Encounters During Inpatient Stay

<table class="encounter-type-table">
<thead>
<tr>
<th>Encounter Type (German)</th>
<th>HL7 V2 Code</th>
<th>FHIR Representation</th>
</tr>
</thead>
<tbody>
<tr>
<td>Untersuchung und Behandlung (Examination and Treatment)</td>
<td>-</td>
<td><code>Encounter.class = IMP</code><br/><code>Encounter.type = ub</code></td>
</tr>
<tr>
<td>Konsil (Consultation)</td>
<td>-</td>
<td><code>Encounter.class = IMP</code><br/><code>Encounter.type = konsil</code></td>
</tr>
<tr>
<td>Operation (Surgery)</td>
<td>-</td>
<td><code>Encounter.class = IMP</code><br/><code>Encounter.type = operation</code></td>
</tr>
</tbody>
</table>

#### Encounter Diagnosis

The `Encounter.diagnosis` element establishes the relationship between encounters and diagnoses/procedures, specifying their role within the encounter context.

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Diagnosis-Encounter Relationships</h5>

<p>The reference from <code>Encounter.diagnosis</code> to <code>Condition</code> should be used when the Condition has a specific role during the Encounter (e.g., primary diagnosis, secondary diagnosis).</p>

<p><strong>Recommended Implementation:</strong></p>
<p>Use <code>Condition.encounter</code> to reference from the Condition to the Encounter of type <strong>Abteilungskontakt (Department Contact)</strong>. This approach establishes the general encounter context for the diagnosis, while <code>Encounter.diagnosis</code> can be used to specify particular diagnosis roles when needed.</p>
</div>

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Encounter.diagnosis.use</h5>

<p>Since <code>Encounter.diagnosis.use</code> has cardinality 1..1, a diagnosis with multiple roles within an encounter requires multiple <code>Encounter.diagnosis</code> entries, each with a different <code>use</code> value.</p>

<p><strong>Example:</strong> If a Condition serves as both a Diagnosetyp and a Diagnosesubtyp (or additional roles such as CC/CM), create separate <code>Encounter.diagnosis</code> references for each role, all pointing to the same Condition resource. A single Condition can be referenced multiple times with different <code>use</code> values.</p>

<p><strong>Note on CC/CM Classification:</strong> If you want to classify a diagnosis as CC (Complication or Comorbidity) or CM (Comorbidity), this is typically billing-related information and should be placed in the Account resource rather than in <code>Encounter.diagnosis</code>. The Account resource is the appropriate location for billing case context and DRG-relevant classifications.</p>
</div>

#### Encounter Location

- Location details (room, bed, ward) can be specified using `Encounter.location`.
- The physical type **SHOULD** use the MII-specific ValueSet for location physical types.
- Location details are primarily relevant for Versorgungsstellenkontakt (care unit contacts).

#### Planned Encounters

Planned encounters are represented with `Encounter.status = planned` and **SHOULD** include:
- `Encounter.extension:plannedStartDate` for the planned start date
- `Encounter.extension:plannedEndDate` for the planned end date

#### Admission and Discharge

- **Admission source** (Aufnahmeanlass) is mandatory when hospitalization data is provided and uses codes from § 301 SGB V.
- **Admission reason** (Aufnahmegrund) with four-part structure (erste und zweite Stelle, dritte Stelle, vierte Stelle) according to § 301 SGB V.
- **Discharge disposition** with Entlassungsgrund extension provides detailed discharge/transfer reasons.

#### Encounter Identification

Each Encounter **SHOULD** have a unique identifier. When encounters are organized in a hierarchy:
- Ensure correct encounter linking via `Encounter.partOf`
- Each encounter **SHOULD** have a distinct identifier with different systems or values

**Case Number Representation:**

The "Fallnummer" (case number) is frequently used in inpatient care to establish the case context for medical documentation, particularly in HL7 V2 communication.

In most cases, the "Fallnummer" is a unique identifier for the billing case (Account). Therefore, the Fallnummer should be seen as an identifier of the Account and is not suitable for uniquely identifying an Encounter. To find the correct Encounter, additional criteria such as period (`Encounter.period`), class (`Encounter.class`), or status (`Encounter.status`) must be considered.

**Previous Recommendation:**

Previously, it was recommended that the Aufnahmenummer (admission number) should be provided across all Encounter resources regardless of contact level and type. However, this recommendation did not clearly distinguish between Aufnahmenummer and Fallnummer.

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Aufnahmenummer vs. Fallnummer</h5>

<p><em>Note: This guidance is based on the <a href="https://simplifier.net/packages/de.gematik.isik/5.1.0/files/3020028" target="_blank">ISiK specification</a>.</em></p>

<p>It is important to distinguish between:</p>
<ul>
  <li><strong>Aufnahmenummer (Admission Number):</strong> A unique identifier assigned to a patient during admission planning or at admission itself. Each Encounter <strong>SHOULD</strong> have its own unique Aufnahmenummer in <code>Encounter.identifier:Aufnahmenummer</code> where applicable.</li>
  <li><strong>Fallnummer (Case Number):</strong> Typically identifies the billing case (Account), not individual encounters.</li>
</ul>

<p><strong>Account References and Billing Context:</strong></p>
<p>The reference to an Account establishes the billing context for one or more Encounters. Using the Account reference, multiple encounters can be grouped together into a single billing case (e.g., a "DRG-Fall" comprising pre-inpatient, inpatient, and post-inpatient visits).</p>

<p><strong>Note:</strong> If you want to implement the billing case (Abrechnungsfall), it is recommended to use the <a href="https://simplifier.net/packages/de.gematik.isik/5.1.0/files/3019857" target="_blank">ISiK Account profile</a>.</p>

<p><strong>Important Note for Implementers:</strong> In German healthcare terminology, the term "Fall" (case) usually refers to the billing context, not individual encounters. Therefore, the "Fallnummer" is not the identifier of the Encounter, but rather the identifier of the Account that the Encounter references. This enables multiple encounters to be associated with a single Fallnummer.</p>

<p><strong>Logical References for Search:</strong></p>
<p>Since the Fallnummer is a frequently used search criterion, it <strong>SHOULD</strong> be provided as a logical reference (<code>account.identifier</code>) in the Encounter. This ensures that the Fallnummer is available as a search parameter for finding Encounters, even when:</p>
<ul>
  <li>Individual systems do not support chaining</li>
  <li>Individual users lack viewing permissions for billing data</li>
  <li>Users in the care context need to search for Encounters using the associated Fallnummer</li>
</ul>
</div>

{% include link-list.md %}
