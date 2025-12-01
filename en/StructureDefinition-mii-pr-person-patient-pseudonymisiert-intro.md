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

#### Pseudonymization Identifiers

The pseudonymized patient profile uses specialized identifier types:

- **`Patient.identifier:pseudonymisierterIdentifier`**: Pseudonymized identifier for the patient
  - **MUST** be appropriately typed if the identifier is a derived pseudonym
  - Use when the identifier can be linked back to the original patient data through a controlled process
  - Typically used in research scenarios where de-pseudonymization may be necessary for specific purposes

- **`Patient.identifier:anonymisierterIdentifier`**: Anonymized identifier for the patient
  - **SHOULD** only be used when no inference about the original dataset is possible
  - Represents irreversible anonymization where re-identification is not feasible

- **`Patient.identifier:maskierterVersichertenIdentifier`**: Masked health insurance identifier
  - Used for health insurance-based analyses without revealing the actual insurance ID
  - See [Best Practice - Masked Insurance ID with IK Number](#best-practice---masked-insurance-id-with-ik-number) for implementation details

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Masked Insurance ID with IK Number</h5>

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