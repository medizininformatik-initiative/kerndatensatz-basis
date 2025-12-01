# Home - MII Implementation Guide Core Dataset Base v2026.0.0-dev.1

## Home

### Introduction

This implementation guide describes the FHIR representation of the core dataset (CDS) base modules of the Medical Informatics Initiative (MII). The specification covers the modules Person, Treatment Case, Diagnosis and Procedure. The MII core dataset aims to enable secondary use of routine clinical data in research.

#### Target Audience

This implementation guide is intended for:

##### Implementers

Implementers responsible for data management and integration in Data Integration Centers (DIC), software developers and system architects implementing FHIR-based solutions

* → See [Logical Models](logical-models.md) for conceptual data models
* → See [UML Diagrams](uml-diagrams.md) for visual representations
* → See [FHIR Artifacts](artifacts.md) for technical specifications

##### Researchers

Scientists using MII data for medical research

* → See [Researcher Guidance](researcher-guidance.md) for guidance, descriptions and sample data for analysis
* → See [Logical Models](logical-models.md) for data structure overviews

### Background

MII Core Dataset Modules

#### Module Overview

**Person Module**

The module includes:

* Patient identifiers and demographic information ([Patient](StructureDefinition-mii-pr-person-patient.md))
* Pseudonymized patient representations for research ([Patient Pseudonymized](StructureDefinition-mii-pr-person-patient-pseudonymisiert.md))
* Vital status ([Vital Status Observation](StructureDefinition-mii-pr-person-vitalstatus.md))
* Cause of death ([Cause of Death Condition](StructureDefinition-mii-pr-person-todesursache.md))

**Treatment Case Module**

The module includes:

* Representation of encounters (stays and visits) between patients and healthcare facilities ([Encounter](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md))

**Diagnosis Module**

The module includes:

* Diagnoses and disease-related information ([Condition](StructureDefinition-mii-pr-diagnose-condition.md))

**Procedure Module**

The module includes:

* Documentation of operations, interventions, and other medical procedures ([Procedure](StructureDefinition-mii-pr-prozedur-procedure.md))

### Contact Information

Questions about this publication can be asked on [chat.fhir.org](https://chat.fhir.org/#narrow/stream/179307-german.2Fmi-initiative) in the stream 'german/mi-initiative' or on [mii.zulipchat.com](https://mii.zulipchat.com/#narrow/channel/430086-MII-Kerndatensatz).

Comments and criticism are always welcome in the form of issues in the [GitHub Repository](https://github.com/medizininformatik-initiative/kerndatensatz-basis).

#### Contributors

This implementation guide has been created as part of the Medical Informatics Initiative and is subject to the governance process of the Interoperability Forum and Technical Committees of HL7 Germany e.V.

### Copyright and License

© 2019+ TMF e. V., Charlottenstraße 42, 10117 Berlin

![](https://licensebuttons.net/l/by/4.0/88x31.png)

This work is licensed under the [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/).

For usage rights of the underlying FHIR technology, see the FHIR base specification.

Some code systems used are published and maintained by other organizations. The copyright of the respective publishers applies.

### Disclaimer

* The content of this document is public. Please note that parts of this document are based on FHIR Version R4, which is copyrighted by HL7 International.
* Although this publication was prepared with the greatest care, the authors cannot accept any liability for direct or indirect damage that may arise from the content of this specification.

