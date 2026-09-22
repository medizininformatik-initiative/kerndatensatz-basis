**Example Usage Scenarios:**

- Provide pseudonymized patient data for secondary use in research contexts while protecting patient identity
- Support federated analyses across multiple MII sites without exposing identifying patient information
- Enable health insurance-based analyses (e.g., NUM-CON-MON use case) using IK numbers without revealing individual insurance IDs
- Maintain coarse demographic granularity for research cohort formation while preventing re-identification

<div style="background-color: #FFE5E5; border-left: 5px solid #D32F2F; padding: 15px; margin: 10px 0;">
<h5 style="color: #C62828; margin-top: 0;">⚠️ Important: Pseudonymization Validation Limitations</h5>

<p>This profile <strong>does not contain rules to validate correct pseudonymization</strong>. Successful validation against this profile does <strong>not</strong> guarantee that technically or legally compliant pseudonymization has been performed.</p>

<p>Pseudonymization requirements vary by project context and cannot be fully represented in a single FHIR profile. For comprehensive pseudonymization guidance, consult the <a href="https://medizininformatik-initiative.github.io/mii-interface-module-pseudonymization/">MII Pseudonymization Interface</a>.</p>
</div>

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the MII Pseudonymized Patient Profile.

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">FHIR Core Extension Note</h5>

<p>The pseudonymized Patient profile also carries the FHIR core Patient extensions <code>patient-birthPlace</code>, <code>patient-citizenship</code>, and <code>patient-nationality</code> to represent the patient's place of birth, legal citizenship, and nationality where available under the pseudonymized representation.</p>
</div>

#### Pseudonymization Identifiers

The pseudonymized patient profile uses specialized identifier types:

- **`Patient.identifier:pseudonymisierterIdentifier`**: Pseudonymized identifier for the patient
  - **MUST** be appropriately typed if the identifier is a derived pseudonym
  - Use when the identifier can be linked back to the original patient data through a controlled process
  - Typically used in research scenarios where de-pseudonymization may be necessary for specific purposes
  - **`identifier.type.coding:pseuded`** (`PSEUDED`, required): Indicates the value is a pseudonym
  - **`identifier.type.coding:mr`** (`MR`, optional): **SHOULD** additionally be set when the pseudonym replaces an organization-internal patient identifier (Medical Record Number). This allows consumers to locate the pseudonymized patient number without knowing the site-specific `identifier.system`. See [Best Practice - Pseudonymized MR Identifier](#best-practice---pseudonymized-mr-identifier) for details.

- **`Patient.identifier:anonymisierterIdentifier`**: Anonymized identifier for the patient
  - **SHOULD** only be used when no inference about the original dataset is possible
  - Represents irreversible anonymization where re-identification is not feasible

- **`Patient.identifier:maskierterVersichertenIdentifier`**: Masked health insurance identifier
  - Used for health insurance-based analyses without revealing the actual insurance ID
  - See [Best Practice - Masked Insurance ID with IK Number](#best-practice---masked-insurance-id-with-ik-number) for implementation details

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 id="best-practice---pseudonymized-mr-identifier" style="color: #406A99; margin-top: 0;">Best Practice - Pseudonymized Medical Record Number Identifier</h5>

<p>When a pseudonym replaces an organization-internal patient identifier (Medical Record Number, MR), the <code>identifier.type</code> SHOULD carry both codings:</p>

<ul>
  <li><code>http://terminology.hl7.org/CodeSystem/v3-ObservationValue|PSEUDED</code> — required, signals that the value is a pseudonym</li>
  <li><code>http://terminology.hl7.org/CodeSystem/v2-0203|MR</code> — optional, signals the functional role of the original identifier</li>
</ul>

<p>Setting the <code>MR</code> code is recommended because it allows queries to locate pseudonymized patient numbers across sites using a stable, site-independent type code, without needing to know each site's proprietary <code>identifier.system</code> value.</p>

<p>Note: <code>MR</code> here describes the functional role of the identifier (i.e., what it represents), not the nature of the pseudonymous value itself. Pseudonyms that do not replace a Medical Record Number (e.g., study-specific pseudonyms) SHOULD NOT carry the <code>MR</code> code.</p>

<pre><code class="language-json">{
  "type": {
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/v3-ObservationValue",
      "code": "PSEUDED"
    },
    {
      "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
      "code": "MR"
    }]
  },
  "system": "https://ttp.example.org/pseudonyms",
  "value": "a3f2c1d9-pseudonym"
}
</code></pre>
</div>

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 id="best-practice---masked-insurance-id-with-ik-number" style="color: #406A99; margin-top: 0;">Best Practice - Masked Insurance ID with IK Number</h5>

<p>For use cases requiring health insurance analysis (e.g., NUM-CON-MON), it is necessary to include the IK number (Institutionskennzeichen) of the health insurance provider in the pseudonymized patient profile without exposing the actual insurance ID.</p>

<p>This is achieved by:</p>
<ol>
  <li>Creating an <code>Identifier</code> with type <code>KVZ10</code> (10-digit health insurance ID)</li>
  <li>Replacing the <code>Identifier.value</code> element with the [Data Absent Reason] extension using code <code>masked</code></li>
  <li>Providing the IK number of the health insurance provider in <code>Identifier.assigner.identifier</code></li>
</ol>

<p>See the example resource for this modeling approach.</p>
</div>

{% include link-list.md %}