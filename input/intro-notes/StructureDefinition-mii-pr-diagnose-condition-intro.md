**Example Usage Scenarios:**

- Document diagnoses for patients in clinical care using ICD-10-GM coding
- Support billing and administrative processes with coded diagnosis information
- Enable epidemiological research and disease surveillance through standardized diagnosis coding
- Represent rare diseases using Alpha-ID or Orphanet codes alongside ICD-10-GM
- Link diagnoses to specific encounters for temporal and contextual documentation

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the MII Diagnose (Diagnosis) Profile.

#### Coding Requirements

**Mandatory Coding:**
- **`Condition.code`**: At least one coded diagnosis **MUST** be present
- Code system may be freely selected from: ICD-10-GM, Alpha-ID, SNOMED CT, or Orphanet
- ICD-10-GM coding is the primary coding system for diagnoses in Germany

**Multiple Code Systems:**
- Multiple codings from different terminologies are permitted and encouraged where applicable
- Example: ICD-10-GM for billing/administrative purposes + SNOMED CT for semantic interoperability + Alpha-ID/Orphanet for rare diseases

#### ICD-10-GM Specific Extensions

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - ICD-10-GM Extensions and Special Characters</h5>

<p><strong>Separation of Special Characters:</strong> The element <code>Condition.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').code</code> <strong>SHOULD NOT</strong> contain multi-coding markers or additional markers (e.g., laterality or diagnostic certainty).</p>

<p><strong>Extension Usage:</strong></p>
<ul>
  <li><strong>Mehrfachcodierungs-Kennzeichen:</strong> Multi-coding markers (<code>*</code>, <code>†</code>, <code>!</code>) <strong>SHOULD</strong> be separated from ICD-10-GM codes and captured in the "Mehrfachcodierungs-Kennzeichen" extension</li>
  <li><strong>Seitenlokalisation:</strong> The "Seitenlokalisation" extension <strong>SHOULD</strong> be used to specify laterality in ICD-10-GM coding</li>
  <li><strong>Diagnosesicherheit:</strong> The "Diagnosesicherheit" extension <strong>SHOULD</strong> be used to specify diagnostic certainty in ICD-10-GM coding</li>
</ul>

<p><strong>Reference:</strong> See <a href="https://ig.fhir.de/basisprofile-de/1.5.4/ig-markdown-Datentypen-Coding.html#ig-markdown-Datentypen-ICD-10GM-Coding">ICD-10-GM Coding Profile</a> and <a href="https://ig.fhir.de/basisprofile-de/1.5.4/ig-markdown-ExtensionsfrCondition.html">Diagnosesicherheit Extension</a> in the German Base Profiles for detailed constraints.</p>
</div>

#### Multi-Coding with ICD-10-GM Cross-Dagger System

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Cross-Dagger (Kreuz-Stern) System Implementation</h5>

<p><strong>Multiple Condition Instances:</strong> When using ICD-10-GM codes with the cross-dagger system (Kreuz-Stern), create a <strong>separate Condition instance for each ICD-10 code</strong> (etiology, manifestation, additional information).</p>

<p><strong>Linking Secondary to Primary:</strong></p>
<ul>
  <li>The primary diagnosis Condition (etiology/Ätiologie with † marker) is the main instance</li>
  <li>Secondary diagnosis Conditions (manifestation/Manifestation with * marker, additional information with ! marker) use the <a href="http://hl7.org/fhir/R4/extension-condition-related.html">Condition Related Extension</a> to reference the primary diagnosis</li>
  <li>This creates an explicit relationship chain: manifestation → etiology</li>
</ul>

<p><strong>Alpha-ID and Orphanet Codes:</strong></p>
<ul>
  <li>When Alpha-ID or Orphanet codes are mapped to combined ICD-10-GM codes, include them <strong>only in the primary diagnosis Condition instance</strong></li>
  <li>Do not duplicate Alpha-ID/Orphanet codes in secondary Condition instances</li>
</ul>

<p><strong>Diagnostic Certainty Considerations:</strong></p>
<ul>
  <li>If diagnostic certainty differs between primary and secondary diagnoses, ensure the certainty of the primary Condition applies to the associated Alpha-ID</li>
  <li>This prevents inconsistencies when rare disease codes (Alpha-ID/Orphanet) are associated with uncertain etiological diagnoses</li>
</ul>

<p><strong>Example:</strong> See example resources for Alpha-ID <code>I97525</code> with ICD-10-GM <code>A54.4†</code> (etiology) and <code>M73.09*</code> (manifestation).</p>
</div>

#### Body Site Documentation

**`Condition.bodySite`:**
- OPTIONAL element
- If used, body site **SHOULD** be coded with at least one SNOMED CT code
- **DO NOT** include laterality in `bodySite` - use the Seitenlokalisation extension on `Condition.code.coding:icd10-gm` instead

#### Encounter Linkage

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Best Practice - Diagnosis-Encounter Relationships</h5>

<p><strong>Change from Previous Version:</strong> In previous versions of this implementation guide, it was recommended to use <code>Encounter.diagnosis</code> to link diagnoses to encounters. This guidance has been updated to align with gematik ISiK (Informationssysteme im Krankenhaus) recommendations.</p>

<p><strong>Current Recommendation - Condition.encounter:</strong></p>
<ul>
  <li>The link to an Encounter resource documents the reference to a hospital stay and enables important API functions such as chained search, (reverse) include, etc.</li>
  <li><strong>Department Contact Level:</strong> The reference <strong>SHOULD</strong> be to an Encounter at the "Abteilungskontakt" (department contact) level.</li>
  <li>When selecting the Encounter, note that multiple Encounters may be grouped under a single (billing) case number (<code>Encounter.account</code>), such as an inpatient visit with multiple pre- and post-hospitalization contacts</li>
</ul>

<p><strong>Assessment Date Mapping:</strong></p>
<ul>
  <li>The logical data element "Feststellungsdatum" (assessment/determination date) maps to <code>Encounter.period.start</code>, NOT to an element in the Condition resource</li>
  <li>Therefore, the Encounter reference represents both the technical documentation context and the temporal context of when the diagnosis was established</li>
</ul>

</div>

#### Temporal Information

**`Condition.onset[x]`:**
- **MAY** be captured as Period or dateTime
- OPTIONAL: Use the extension to specify life phase as code when exact timepoints are unknown
- Represents when the condition began or was first noticed

**`Condition.recordedDate`:**
- Represents when the diagnosis was recorded in the system

{% include link-list.md %}