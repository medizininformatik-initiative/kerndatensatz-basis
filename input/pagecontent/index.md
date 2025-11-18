### Introduction

This implementation guide describes the FHIR representation of the core dataset (Kerndatensatz) base modules of the Medical Informatics Initiative (Medizininformatik-Initiative, MII). The specification covers the modules Person, Treatment Case, Diagnosis and Procedure. The MII core dataset aims to enable secondary use of routine clinical data in research.

#### Target Audience

This implementation guide is intended for:

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Implementers</h5>
<p>Implementers responsible for data management and integration in Data Integration Centers (DIC), software developers and system architects implementing FHIR-based solutions</p>
<ul>
  <li>→ See <a href="logical-models.html">Logical Models</a> for conceptual data models</li>
  <li>→ See <a href="uml-diagrams.html">UML Diagrams</a> for visual representations</li>
  <li>→ See <a href="artifacts.html">FHIR Artifacts</a> for technical specifications</li>
</ul>
</div>

<div style="background-color: #F0F8E8; border-left: 5px solid #91BC3D; padding: 15px; margin: 10px 0;">
<h5 style="color: #66727D; margin-top: 0;">Researchers</h5>
<p>Scientists using MII data for medical research</p>
<ul>
  <li>→ See <a href="researcher-guidance.html">Researcher Guidance</a> for guidance, descriptions and sample data for analysis</li>
  <li>→ See <a href="logical-models.html">Logical Models</a> for data structure overviews</li>
</ul>
</div>

### Background

#### Module Overview

**Person Module**

The module includes:
* Patient identifiers and demographic information ([Patient](StructureDefinition-mii-pr-person-patient.html))
* Pseudonymized patient representations for research ([Patient Pseudonymized](StructureDefinition-mii-pr-person-patient-pseudonymisiert.html))
* Vital status ([Vital Status Observation](StructureDefinition-mii-pr-person-vitalstatus.html))
* Cause of death ([Cause of Death Condition](StructureDefinition-mii-pr-person-todesursache.html))

**Treatment Case Module**  

The module includes:
* Representation of encounters (stays and visits) between patients and healthcare facilities ([Encounter](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.html))

**Diagnosis Module**

The module includes:
* Diagnoses and disease-related information ([Condition](StructureDefinition-mii-pr-diagnose-condition.html))

**Procedure Module**

The module includes:
* Documentation of operations, interventions, and other medical procedures ([Procedure](StructureDefinition-mii-pr-prozedur-procedure.html))

### Contact Information

Questions about this publication can be asked on [chat.fhir.org](https://chat.fhir.org/#narrow/stream/179307-german.2Fmi-initiative) in the stream 'german/mi-initiative' or on [mii.zulipchat.com](https://mii.zulipchat.com/#narrow/channel/430086-MII-Kerndatensatz).

Comments and criticism are always welcome in the form of issues in the [GitHub Repository](https://github.com/medizininformatik-initiative/kerndatensatz-basis).

#### Contributors

This implementation guide has been created as part of the Medical Informatics Initiative and is subject to the governance process of the Interoperability Forum and Technical Committees of HL7 Germany e.V.

### Copyright and License

© 2019+ TMF e. V., Charlottenstraße 42, 10117 Berlin

<a href="https://creativecommons.org/licenses/by/4.0/" target="_blank">
    <img src="https://licensebuttons.net/l/by/4.0/88x31.png" alt="CC BY 4.0 Logo" style="border:0;">
</a>

This work is licensed under the [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/).

For usage rights of the underlying FHIR technology, see the FHIR base specification.

Some code systems used are published and maintained by other organizations. The copyright of the respective publishers applies.

### Disclaimer

* The content of this document is public. Please note that parts of this document are based on FHIR Version R4, which is copyrighted by HL7 International.

* Although this publication was prepared with the greatest care, the authors cannot accept any liability for direct or indirect damage that may arise from the content of this specification.