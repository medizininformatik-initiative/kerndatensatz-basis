**Example Usage Scenarios:**

- Document procedures performed on patients using OPS (Operationen- und Prozedurenschlüssel) coding for billing and administrative purposes
- Record surgical interventions, diagnostic procedures, and therapeutic treatments in clinical care
- Support quality management and clinical research through standardized procedure documentation
- Enable procedure-based analyses and outcome research across healthcare facilities
- Represent procedures using SNOMED CT for semantic interoperability alongside OPS coding
- Link procedures to specific encounters for temporal and contextual documentation

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the MII Procedure (Prozedur) Profile.

#### Coding Requirements

**Mandatory Coding:**
- **`Procedure.code`**: [Mandatory] coding using either OPS or SNOMED CT
- At least one coded procedure **MUST** be present
- Additional codings from other terminologies are OPTIONAL

**OPS Coding:**
- **`Procedure.code:ops`**: OPS (Operationen- und Prozedurenschlüssel) is the primary coding system for procedures in Germany
- See [OPS Coding - German Base Profiles] for detailed OPS coding requirements
- OPS codes include:
  - `Procedure.code:ops.coding.code`: Complete procedure code
  - `Procedure.code:ops.coding.system`: Code system (`http://fhir.de/CodeSystem/bfarm/ops`)
  - `Procedure.code:ops.coding.version`: OPS version year
  - `Procedure.code:ops.extension:seitenlokalisation`: Laterality extension

**SNOMED CT Coding:**
- **`Procedure.code:sct`**: SNOMED CT coding
- Can be used as primary coding or alongside OPS

#### Category Classification

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - SNOMED CT Categorization</h5>

<p><strong>Mandatory Categorization:</strong> <code>Procedure.category</code> SNOMED CT categorization based on the procedure code.</p>

<p><strong>OPS Class Title Mapping:</strong> When the procedure is coded using OPS, the category <strong>SHOULD</strong> be derived by mapping OPS chapter/class titles to SNOMED CT concepts. See the Terminologies section in this IG for OPS-to-SNOMED CT category mappings.</p>

<p><strong>Constraint proc-mii-1:</strong> This requirement is only relevant when the procedure is coded using OPS.</p>

<p><strong>Purpose:</strong> Category classification enables:</p>
<ul>
  <li>High-level procedure grouping for epidemiological analyses</li>
  <li>Filtering and browsing procedures by broad clinical categories</li>
  <li>Semantic consistency across differently coded procedures</li>
</ul>
</div>

#### Temporal Information

**`Procedure.performed[x]`:**
- Documents when the procedure was performed
- **MAY** be specified as `performedDateTime` (single point in time) or `performedPeriod` (start and end times)
- Use `performedPeriod` when both start and end times are known (e.g., surgical procedures with documented start/end)
- Use `performedDateTime` for point-in-time procedures or when only a single timestamp is available

**`Procedure.extension:Dokumentationsdatum`:**
- MII-specific extension for documentation date
- Represents when the procedure was documented/recorded in the system
- Distinct from `performed[x]` which represents when the procedure actually occurred
- Useful for auditing and temporal ordering of documentation

#### Body Site Documentation

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Body Site vs. Laterality</h5>

<p><strong>Body Site Purpose:</strong> <code>Procedure.bodySite</code> provides detailed anatomical location coding for the procedure using SNOMED CT.</p>

<p><strong>NOT for Laterality:</strong> <code>Procedure.bodySite</code> <strong>SHOULD NOT</strong> be used to represent laterality (left/right/bilateral). Laterality is a property of the procedure code itself.</p>

<p><strong>Laterality Representation:</strong></p>
<ul>
  <li>For OPS codes: Use <code>Procedure.code:ops.extension:seitenlokalisation</code></li>
  <li>For SNOMED CT: Laterality is inherent in the procedure concept (e.g., "Appendectomy of right appendix")</li>
</ul>

<p><strong>When to Use bodySite:</strong></p>
<ul>
  <li>To provide additional anatomical detail beyond what the code specifies</li>
  <li>To specify precise anatomical structures using SNOMED CT anatomy concepts</li>
</ul>
</div>

#### Procedure Intent

**`Procedure.extension:Durchfuehrungsabsicht`:**
- MII-specific extension for procedure intent/purpose
- Uses SNOMED CT codes to classify the clinical intent:
  - Therapeutic procedures
  - Diagnostic procedures
  - Prophylactic procedures
  - Palliative procedures
  - etc.
- Provides clinical context for the procedure beyond the procedural code itself

#### Encounter Context

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Procedure-Encounter Relationships</h5>

<p><strong>Recommended Implementation:</strong></p>
<p>Use <code>Procedure.encounter</code> to reference from the Procedure to the Encounter of type <strong>Abteilungskontakt (Department Contact)</strong>. This approach establishes the general encounter context for the procedure, providing temporal and organizational context.</p>

</div>

#### Status and Workflow

**`Procedure.status`:**
- No restrictions on status values (preparation, in-progress, on-hold, stopped, completed, entered-in-error, unknown)
- Most procedures in retrospective documentation will have `status='completed'`

#### Patient Reference

**`Procedure.subject`:**
- Reference to Patient **MUST** always be provided
- Procedures are inherently patient-specific and cannot exist without this reference

{% include link-list.md %}