**Example Usage Scenarios:**

- Document the cause of death for deceased patients for clinical documentation and mortality statistics
- Support epidemiological research and public health surveillance through standardized cause of death coding
- Enable mortality analyses across healthcare facilities using internationally comparable ICD-10-WHO codes
- Link cause of death information to vital status observations and Patient.deceased[x] documentation

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the MII Cause of Death (Todesursache) Profile.

#### ICD-10-WHO Coding Requirement

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - ICD-10-WHO vs. ICD-10-GM</h5>

<p><strong>Mandatory Code System:</strong> Cause of death <strong>MUST</strong> be coded using ICD-10-WHO (<code>http://hl7.org/fhir/sid/icd-10</code>).</p>

<p><strong>Deviation from Diagnose Module:</strong> This Condition profile for cause of death deliberately differs from the Condition profile in the Diagnose module at <code>Condition.code</code>. The Diagnose module uses ICD-10-GM (German modification), while Todesursache uses ICD-10-WHO (international version).</p>

<p><strong>Legal Requirement:</strong> In Germany, ICD-10-WHO is legally mandated as the basis for cause of death statistics. See <a href="https://www.bfarm.de/DE/Kodiersysteme/Klassifikationen/ICD/ICD-10-WHO/Todesursachenstatistik/_node.html">BfArM ICD-10-WHO</a> for details on the German cause of death statistics requirements.</p>

<p><strong>Additional Codings:</strong> While ICD-10-WHO coding is mandatory, additional codings (e.g., SNOMED CT) are OPTIONAL and may be included to provide supplementary semantic information.</p>
</div>

#### Required Elements

**Fixed Category Values:**
- **`Condition.category`**: Fixed LOINC code `79378-6` (Cause of death) and SNOMED CT code `16100001` (Death diagnosis) **MUST** be present
- Additional category codings are OPTIONAL
- These fixed codes ensure the Condition is unambiguously identified as a cause of death

**Code Element:**
- **`Condition.code`**: ICD-10-WHO coding is [Mandatory]
  - Use code system `http://hl7.org/fhir/sid/icd-10` (ICD-10-WHO)
  - Additional codings from other terminologies (SNOMED CT, etc.) are OPTIONAL
  - Refer to <a href="https://www.bfarm.de/DE/Kodiersysteme/Klassifikationen/ICD/ICD-10-WHO/Todesursachenstatistik/_node.html">BfArM ICD-10-WHO</a> for official coding guidance and cause of death statistics requirements

**Patient Reference:**
- **`Condition.subject`**: Reference to Patient **MUST** always be provided
- Cause of death is inherently patient-specific and cannot exist without this reference
- The referenced Patient **SHOULD** have `Patient.deceased[x]` populated to indicate death

{% include link-list.md %}