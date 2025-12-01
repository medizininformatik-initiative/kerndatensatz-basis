**Example Usage Scenarios:**

- Document the vital status (alive/deceased) of a patient at specific points in time
- Track the last known alive timepoint for patients in clinical and research contexts
- Record vital status observations at each hospital admission and discharge
- Support mortality analyses and survival studies in research use cases
- Maintain vital status history through multiple observation instances over time

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the MII Vital Status Profile.

#### Observation Instance Requirements

**Multiple Observations:**
- A **new** Observation instance **MUST** be created for each observation/documentation of a patient's vital status
- All Observation instances **MUST** have `status='final'`
- Each instance represents a point-in-time assertion about the patient's vital status

**Frequency of Documentation:**
- Vital status ("last known alive timepoint") **SHOULD** be documented as an event-based Observation at least at each admission/discharge
- Frequency of vital status assessment is otherwise not strictly regulated and may vary
- Source data is often difficult to obtain and may require manual research (e.g., contact attempts, public information such as death notices)

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Vital Status Data Sources</h5>

<p><strong>Administrative Discharge:</strong> Administrative discharge of a patient due to death <strong>SHOULD</strong> be documented (see Fall module - Entlassungsgrund/discharge disposition) and <strong>CAN</strong> serve as a useful data source for vital status.</p>

<p><strong>Integration:</strong> Systems should establish workflows to automatically create vital status observations when discharge disposition indicates death, ensuring consistency between administrative and clinical documentation.</p>

<p><strong>Manual Research:</strong> In cases where vital status is unclear, manual research may be necessary (contact attempts, public records). Document the information source appropriately in associated metadata (Provenance resource).</p>
</div>

#### Required Elements

**Fixed Values:**
- **`Observation.category`**: Fixed value `survey` **MUST** be present; additional codings are OPTIONAL
- **`Observation.code`**: Fixed LOINC code `67162-8` (Vitalstatus [Minimum Data Set]) **MUST** be present; additional codings are OPTIONAL

**Patient Reference:**
- **`Observation.subject`**: Reference to Patient **MUST** always be provided
- Vital status is inherently patient-specific and cannot exist without this reference

**Effective DateTime:**
- **`Observation.effectiveDateTime`**: [Mandatory] precise specification of the last known alive timepoint
  - **MAY** contain partial date specifications (year, year-month) when exact date is unknown
  - **Does NOT** represent the time of death (see `Patient.deceased[x]` for death documentation)
  - Represents the point in time when the patient was known to be in the documented vital status

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - effectiveDateTime vs. Patient.deceased[x]</h5>

<p><strong>Distinction:</strong> <code>Observation.effectiveDateTime</code> represents the <strong>last known alive timepoint</strong> or the time when vital status was assessed, NOT the time of death.</p>

<p><strong>Death Documentation:</strong> Use <code>Patient.deceased[x]</code> (preferably <code>deceasedDateTime</code>) to document the actual time of death.</p>

<p><strong>Example Scenario:</strong></p>
<ul>
  <li>Patient discharged alive on 2024-03-15 → Vital status Observation with <code>effectiveDateTime = 2024-03-15</code> and <code>valueCodeableConcept = "L" (lebend/alive)</code></li>
  <li>Patient confirmed deceased on 2024-04-20 → Update <code>Patient.deceasedDateTime = 2024-04-20</code> and create new Vital status Observation with <code>effectiveDateTime = 2024-04-20</code> and <code>valueCodeableConcept = "T" (tot/deceased)</code></li>
</ul>
</div>

#### Value Documentation

**`Observation.valueCodeableConcept`:**
- Uses codes from the MII Vitalstatus CodeSystem:
  - `L` = lebend (alive)
  - `T` = tot (deceased)
  - `X` = unbekannt (unknown)

See [Formal Views] for the complete ValueSet binding.

{% include link-list.md %}