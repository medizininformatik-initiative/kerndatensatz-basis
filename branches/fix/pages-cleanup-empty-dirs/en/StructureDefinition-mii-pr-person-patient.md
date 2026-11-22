# MII PR Person Patient - MII Implementation Guide Core Dataset Base v2027.0.0-ballot

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII PR Person Patient**

## Resource Profile: MII PR Person Patient 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient | *Version*:2027.0.0-ballot |
| Active as of 2026-09-01 | *Computable Name*:MII_PR_Person_Patient |

 
Demographics and other administrative information about a patient. 

**Example Usage Scenarios:**

* Document patient demographics including name, gender, birth date, and address for clinical care and research
* Record health insurance information for administrative purposes
* Maintain organizational patient identifiers (PID) for linking patient data across systems within a healthcare organization
* Enable pseudonymized patient representations for research use cases while preserving essential demographic characteristics

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the MII Patient Profile.

#### Patient Identification

Patient identification uses multiple identifier types depending on the context:

* **`Patient.identifier:versichertenId`**: Lebenslange Krankenversicherten-ID (10-stellige KVID) for all health insurance types (GKV, PKV, Sonderkostenträger) 
* **IMPORTANT**: The Assigner element **MUST** contain the IKNR (Institutionskennzeichen) of the issuing institution
* Always represents the current insurance number of the patient
* Use `Identifier.type` code `KVZ10` from `http://fhir.de/CodeSystem/identifier-type-de-basis`
* Codes `GKV` and `PKV` have status `retired` and **SHOULD NOT** be used
 
* **`Patient.identifier:pid`**: Organisationsinterner Patienten-Identifier - the leading (MPI) ID of the patient 
* A reference to the issuing Organization in `Patient.identifier:pid.assigner` is **RECOMMENDED**
* Logical reference via IK-Nummer or IHE Affinity Domain OID is permitted
* The CodeSystem [Core-Location-Identifier](https://simplifier.net/packages/de.medizininformatikinitiative.kerndatensatz.meta/2025.0.0/files/2678530) for all MII sites can be used
 
* **`Patient.identifier`**: Any other identifiers when GKV/PKV/PID are not applicable

##### Best Practice - Krankenversicherten-ID Changes

Compared to previous versions, the Krankenversicherten-ID in `Patient.identifier` is no longer distinguished between GKV and PKV. `Patient.identifier:versichertenId` applies to all health insurance numbers, regardless of whether GKV, PKV, or special insurance carriers.

Use the code `KVZ10` from `http://fhir.de/CodeSystem/identifier-type-de-basis` as `Identifier.type`. The codes `GKV` and `PKV` have retired status. See constraint **kvid-2** in the profile [IdentifierKvid10](https://simplifier.net/packages/de.basisprofil.r4/1.5.4/files/2879564) in the German FHIR Base Profiles.

#### Patient Name

Patient names follow the [German Base Profile for HumanName](https://ig.fhir.de/basisprofile-de/1.5.4/ig-markdown-Ressourcen-Patient-Name.html):

* **Name Components**: The breakdown of the complete name into components (e.g., Vorsatzwort, Namenszusatz, Nachname) **SHOULD** only be performed if this information is explicitly available at this granularity (e.g., through direct import based on a VSDM dataset)
* **Birth Name**: By general convention, the birth name (`name.use = maiden`) contains only the family name
* **Multiple Names**: Multiple name entries are permitted for different use cases (official, maiden, etc.)

#### Gender

Gender documentation follows the [German Base Profile for Gender](https://ig.fhir.de/basisprofile-de/1.5.4/ig-markdown-Ressourcen-Patient.html#ig-markdown-Ressourcen-Patient-Geschlecht):

* **`Patient.gender`**: Administrative gender (required)
* **`Patient.gender.extension:other-amtlich`**: Official gender codes according to German regulations for cases beyond male/female/unknown
* **[`Patient.extension:recordedSexOrGender`](https://hl7.org/fhir/extensions/StructureDefinition-individual-recordedSexOrGender.html)**: Repeatable sex or gender statements taken from a document or other record. These statements are kept separate from the administrative gender in `Patient.gender` and can, for example, represent sex assigned at birth. 
* **`value`**: The recorded value. The [MII ValueSet Person Recorded Sex or Gender SNOMED](ValueSet-mii-vs-person-recordedsexorgender-snomed.md) is bound with `extensible` strength ([HDB-1124](https://hl7germany.atlassian.net/browse/HDB-1124)): a code from it **SHALL** be used if one fits; other codes are allowed only if none applies. It contains SNOMED CT findings related to biological sex as well as `261665006 | Unknown (qualifier value) |`. The ConceptMap [MII CM Person Recorded Sex or Gender SNOMED to Administrative Gender](ConceptMap-mii-cm-person-recordedsexorgender-snomed-administrative-gender.md) relates these codes to `Patient.gender`; none of the relationships is equivalent, because recorded sex and administrative gender are different concepts ([HDB-1068](https://hl7germany.atlassian.net/browse/HDB-1068)).
* **`type`**: Identifies the kind of recorded sex or gender. `http://loinc.org|76689-9` (Sex assigned at birth) SHOULD be used when documenting sex assigned at birth.
* **`acquisitionDate`**: Date and time when the statement was first recorded in the system.
 
* **[`Patient.extension:sexParameterForClinicalUse`](https://hl7.org/fhir/extensions/StructureDefinition-patient-sexParameterForClinicalUse.html)**: A parameter for clinical decisions that depend on sex, such as reference ranges or dosing (e.g. **specified**, **female-typical**, **male-typical**). It is not derived automatically from `Patient.gender` or `recordedSexOrGender` and is kept separate from both ([HDB-1067](https://hl7germany.atlassian.net/browse/HDB-1067)). 
* **`value`**: The parameter, coded from the ValueSet `sex-parameter-for-clinical-use`.
* **`period`**: The period during which the parameter applies.
 

`Indeterminate sex` describes a sex that could not be determined, whereas `Unknown` indicates that the value is not known or was not recorded. Implementations SHOULD preserve this distinction.

#### Citizenship and Nationality

* **`Patient.extension:patient-citizenship`**: The patient's legal status as a citizen of a country. Multiple citizenships and their respective periods can be represented.
* **`Patient.extension:patient-nationality`**: The patient's nationality. Multiple nationalities and their respective periods can be represented.

**Open clarification:** The intended use and boundary between `patient-citizenship` and `patient-nationality` still need to be clarified. In particular, it remains unresolved whether the German concept “Staatsangehörigkeit” refers specifically to legal citizenship or to nationality in a broader legal, cultural, or ethnic sense. See [#86](https://github.com/medizininformatik-initiative/kerndatensatz-basis/issues/86).

#### Birth Date, Place of Birth, and Vital Status

* **`Patient.birthDate`**: Full birth date when available. See [German Base Profile - Geburtsdatum](https://ig.fhir.de/basisprofile-de/1.5.4/ig-markdown-Ressourcen-Patient.html#ig-markdown-Ressourcen-Patient-Geburtsdatum) 
* **Deliberate deviation:** `birthDate` stays optional (0..1). Other specifications such as ISiK require it (1..1, with `data-absent-reason` if unknown). The MII deliberately does not follow this: for privacy reasons (data minimisation) it may be omitted or provided only in reduced precision ([HDB-1071](https://hl7germany.atlassian.net/browse/HDB-1071)).
 
* **`Patient.extension:birthPlace`**: The patient's registered place of birth. To represent the country of birth, use `valueAddress.country`; the `countryCode` extension supports coding with ISO 3166-1 alpha-2 codes using a `preferred` binding.

**EHDS outlook:** The use and cardinalities of the FHIR core extensions `patient-citizenship`, `patient-nationality`, and `patient-birthPlace` are aligned with [HL7 Europe Patient (EU base) 2.0.0](https://hl7.eu/fhir/base/2.0.0/StructureDefinition-patient-eu.html) and [HL7 Europe Patient (EU core) 2.0.0](https://hl7.eu/fhir/base/2.0.0/StructureDefinition-patient-eu-core.html). This supports future interoperability in an EHDS context.

* **`Patient.deceased[x]`**: 
* `deceasedBoolean` **SHOULD** be replaced by `deceasedDateTime` when the patient is deceased and the datetime is known
 

#### Mother and Newborn

After birth, mother and child are represented by separate `Patient` resources. Three different relationships are modelled separately ([FHIR R4 – Mother and newborn relationships](https://hl7.org/fhir/R4/patient.html#mother)):

* the **family relationship** between mother and child: `RelatedPerson`;
* the **maternity episode**, i.e. the encounters of mother and child: `Encounter`;
* the **billing cases**: Fallnummer in `Encounter.account.identifier` or an `Account`.

**Family relationship:**

```
%%{init: {'flowchart': {'htmlLabels': false}, 'theme': 'base', 'themeVariables': {'primaryColor': '#E8F4F8', 'primaryBorderColor': '#406A99', 'primaryTextColor': '#000000', 'lineColor': '#5C8DB3', 'fontSize': '14px'}}}%%
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

```

The mother appears twice: as a `RelatedPerson` that references the child, and, if she is a patient herself, as her own `Patient`. There is deliberately no reference from the mother's `Patient` to the child's `Patient`.

* The mother **SHOULD** be represented as a `RelatedPerson` with `RelatedPerson.patient` referencing the child's `Patient` and `RelatedPerson.relationship` = `MTH` from `http://terminology.hl7.org/CodeSystem/v3-RoleCode`. `MTH` covers a woman who conceives, gives birth to, or raises and nurtures the child; where the distinction matters, more specific codes such as `NMTH` (natural mother), `GESTM` (gestational mother), `ADOPTM` (adoptive mother) or `STPMTH` (stepmother) **SHOULD** be used.
* If the mother is also a patient, her own `Patient.link.other` **MAY** reference this `RelatedPerson` with `Patient.link.type` = `seealso`.
* `Patient.link` **SHALL NOT** be used to link the mother's `Patient` directly to the child's `Patient`: it links resources that concern the same actual person.
* **Reference profile:** [ISiKAngehoeriger 6.0.0](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0/StructureDefinition-ISiKAngehoeriger.html) is the German hospital profile for `RelatedPerson` (`patient.reference` 1..1, `relationship` Must Support). Its Must Support elements (official name, telecom, address) target relatives as letter and invoice recipients. A `RelatedPerson` built only from the mother's identifier, e.g. from HL7 v2 `PID-21`, can claim conformance to ISiKAngehoeriger only if it follows the [ISiK rules for missing data](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0/UebergreifendeFestlegungen_UmgangFehlendeDaten.html): if no name is available, `RelatedPerson.name` carries the `data-absent-reason` extension; unknown optional Must Support elements such as telecom and address are omitted.
* `Patient.contact` is a contact-party entry within the child's `Patient`; it can carry a relationship code such as `MTH` and contact details. `RelatedPerson` **SHOULD** be used when the mother needs to be independently referenceable, e.g. from her own `Patient.link` or from other resources.
* `FamilyMemberHistory` describes the clinically relevant history of relatives; it is not intended to link an identified mother.

**Encounters:**

* The newborn's Einrichtungskontakt **MAY** reference the mother's delivery Einrichtungskontakt via `Encounter.partOf`, as described in FHIR R4.
* Such a `partOf` reference to an Encounter with a different `Encounter.subject` only expresses the maternity association. It is not part of the contact hierarchy: hierarchy traversal stops at the newborn's Einrichtungskontakt (see [Encounter Hierarchies and Contact Levels](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md#encounter-partof-across-patients)).

**Billing:**

* If a separate billing case exists for the newborn, its Fallnummer can be given in the newborn's `Encounter.account.identifier`, as a logical reference even when no Account resource is available (see [Best Practice - Aufnahmenummer vs. Fallnummer](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md#best-practice-aufnahmenummer-vs-fallnummer)).
* Whether a separate case exists follows the German billing rules of the respective year, not the `partOf` reference. For 2026, [FPV 2026 § 1 (5)](https://www.g-drg.de/content/download/17465/file/2025_11_14_FPV_2026.pdf#page=3) requires a separate case and invoice for each newborn who is cared for in hospital after the delivery room, with exceptions, e.g. when the minimum length of stay is not reached.

**Multiple pregnancy and multiple birth:**

* A multiple pregnancy is a finding about the **mother**, recorded as an Observation for the pregnant patient, e.g. in the KBV MIO Mutterpass 1.1.0 profile [`KBV_PR_MIO_MR_Observation_Pregnancy_Information`](https://hub.kbv.de/spaces/MP1X1X0/pages/109842757/9.3.2.2%2BAngaben%2Bzur%2BSchwangerschaft) (SNOMED CT `370386005` with a Boolean value).
* After birth, each child is a separate `Patient`. If multiple-birth information is available, it is given in `Patient.multipleBirth[x]` (0..1). `multipleBirthInteger` is the birth order, not the number of children; `multipleBirthBoolean` = `true` only indicates a multiple birth. On the mother's `Patient`, `multipleBirth[x]` would describe her own birth.
* Each child gets its own `RelatedPerson` for the mother, as in the [CH EPREG example for multiple children](https://www.fhir.ch/ig/ch-epreg/child-relationships.html).

Example for twins:

| | |
| :--- | :--- |
| `Patient`child 1 | `multipleBirthInteger`=`1`(or`multipleBirthBoolean`=`true`if the order is unknown) |
| `Patient`child 2 | `multipleBirthInteger`=`2`(or`multipleBirthBoolean`=`true`if the order is unknown) |
| `RelatedPerson`mother for child 1 | `patient`→ child 1,`relationship`=`MTH` |
| `RelatedPerson`mother for child 2 | `patient`→ child 2,`relationship`=`MTH` |

**Out of scope:** Identifying individual fetuses during pregnancy is not covered by this module; see the [HL7 International Birth and Child Model](https://build.fhir.org/ig/HL7/fetal_records/) and CH EPREG. The same applies to the questions raised in [HDB-1035](https://hl7germany.atlassian.net/browse/HDB-1035) on assigning identifiers at birth, linking prenatal findings to the later child, and attributing cord-blood specimens to mother or child. These are deferred to obstetric and perinatal guidance.

**HL7 v2:** According to the [HL7 v2-to-FHIR mapping](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pid-to-patient.html), `PID-21` (Mother's Identifier) maps to a `RelatedPerson` for the mother, `PID-25` (Birth Order) to `multipleBirthInteger` and `PID-24` (Multiple Birth Indicator) to `multipleBirthBoolean` if `PID-25` is not valued.

#### Address Information

Address details follow the [German Base Profile - Adresse](https://ig.fhir.de/basisprofile-de/1.5.4/ig-markdown-Ressourcen-Patient.html#ig-markdown-Ressourcen-Patient-Addresse):

* **Multiple Addresses**: Multiple addresses are permitted
* **Address History**: Systems **SHOULD** mark former addresses appropriately so that the current address of the patient is identifiable
* **Address Components**: 
* `address.line` with extensions for Straße, Hausnummer, Adresszusatz, Postfach
* `address.city` with extension for Gemeindeschlüssel and Stadtteil (for city-states)
* `address.postalCode` for PLZ
* `address.country` for Land
 

**EHDS outlook:** Through the dependency on the German FHIR Base Profiles 1.6.0, the Patient address slices are based on [AddressDeBasis 1.6.0](https://simplifier.net/packages/de.basisprofil.r4/1.6.0/files/3644189). For a consistently coded country, implementations **SHOULD** use the inherited `Address.country.extension:countryCode` extension (`iso21090-codedString`) with an ISO 3166-1 alpha-2 code; source-system alpha-3 codes **MUST** be mapped to their alpha-2 equivalent when populating this extension. `AddressDeBasis` binds the extension with `required` strength to the `ISO 3166 Part 1: 2 Letter Codes` ValueSet. This uses the same extension and ValueSet as [HL7 Europe Address (EU) 2.0.0](https://hl7.eu/fhir/base/2.0.0/StructureDefinition-Address-eu.html), where the binding is `preferred`, and supports future EHDS interoperability. This recommendation concerns the coded representation in the extension; `Address.country` remains a string. The warning invariant `pat-cnt-2or3-char` on the address slices checks this extension, not `Address.country`, so `Address.country` may also carry other values such as DEÜV country codes ([HDB-1069](https://hl7germany.atlassian.net/browse/HDB-1069)).

##### Best Practice - Address Components

**Stadtteil (District):** The Stadtteil is not part of the [VSDM dataset](https://fachportal.gematik.de/anwendungen/versichertenstammdatenmanagement) from Gematik. Other sources conforming to §21 KHEntgG may need to be consulted for this information.

**Address Structure:** For city-states (Stadtstaaten), use `Patient.address.city` combined with `Patient.address.extension.Stadtteil` to represent `Person.Demographie.Adresse.Wohnort`.

**Usages:**

* Examples for this Profile: [Patient/mii-exa-person-patient-1](Patient-mii-exa-person-patient-1.md)
* CapabilityStatements using this Profile: [MII CPS Person CapabilityStatement](CapabilityStatement-mii-cps-person-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.base|current/StructureDefinition/StructureDefinition-mii-pr-person-patient.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-pr-person-patient.csv), [Excel](../StructureDefinition-mii-pr-person-patient.xlsx), [Schematron](../StructureDefinition-mii-pr-person-patient.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-person-patient",
  "meta" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license",
      "valueCode" : "CC-BY-4.0"
    },
    {
      "extension" : [{
        "url" : "packageId",
        "valueId" : "de.medizininformatikinitiative.kerndatensatz.base"
      },
      {
        "url" : "version",
        "valueString" : "2027.0.0-ballot"
      },
      {
        "url" : "uri",
        "valueUri" : "https://www.medizininformatik-initiative.de/fhir/modul-base"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/package-source"
    }],
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm",
    "valueCoding" : {
      "system" : "http://hl7.org/fhir/version-algorithm",
      "code" : "semver",
      "display" : "SemVer"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "shareable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "publishable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionPolicy",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/artifact-version-policy-codes",
        "version" : "3.0.0",
        "code" : "package",
        "display" : "Package"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-usage",
    "valueMarkdown" : "Use this profile as the technical FHIR representation of the corresponding Medical Informatics Initiative logical model. The profile constrains a base FHIR resource for the MII module context by specifying how elements are used, which elements are required or not used, which extensions and terminology bindings apply, and how the resource maps to the module-specific content model. Implementers should produce and consume resource instances that conform to this profile when exchanging data for the corresponding MII module."
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-approvalDate",
    "valueDate" : "2024-03-07"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-effectivePeriod",
    "valuePeriod" : {
      "start" : "2027"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-topic",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl",
        "code" : "C16960"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-author",
    "valueContactDetail" : {
      "telecom" : [{
        "system" : "email",
        "value" : "julian.sass@charite.de"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-editor",
    "valueContactDetail" : {
      "name" : "Taskforce Core Data Set"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-reviewer",
    "valueContactDetail" : {
      "name" : "Interoperability Working Group",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/interoperability-working-group"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-reviewer",
    "valueContactDetail" : {
      "name" : "National Steering Committee",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/national-steering-committee"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-endorser",
    "valueContactDetail" : {
      "name" : "Interoperability Working Group",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/interoperability-working-group"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-endorser",
    "valueContactDetail" : {
      "name" : "National Steering Committee",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/national-steering-committee"
      }]
    }
  }],
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient",
  "version" : "2027.0.0-ballot",
  "name" : "MII_PR_Person_Patient",
  "title" : "MII PR Person Patient",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "de-DE"
      },
      {
        "url" : "content",
        "valueString" : "Patient / Patientin"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    },
    {
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en-US"
      },
      {
        "url" : "content",
        "valueString" : "Patient"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "active",
  "experimental" : false,
  "date" : "2026-09-01",
  "publisher" : "Medical Informatics Initiative (MII)",
  "contact" : [{
    "name" : "Medical Informatics Initiative (MII)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/en"
    }]
  }],
  "description" : "Dieses Profil beschreibt eine Patient*in in der Medizininformatik-Initiative.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "de-DE"
      },
      {
        "url" : "content",
        "valueString" : "Demografische und andere administrative Informationen über eine Patientin oder einen Patienten."
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    },
    {
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en-US"
      },
      {
        "url" : "content",
        "valueString" : "Demographics and other administrative information about a patient."
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "purpose" : "Constrain the FHIR Patient resource for consistent exchange of patient information in the MII Person module.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "loinc",
    "uri" : "http://loinc.org",
    "name" : "LOINC code for the element"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Patient",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Patient",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Patient",
      "path" : "Patient",
      "constraint" : [{
        "key" : "mii-pat-1",
        "severity" : "error",
        "human" : "Falls die Geschlechtsangabe 'other' gewählt wird, muss die amtliche Differenzierung per Extension angegeben werden",
        "expression" : "gender.exists() and gender='other' implies gender.extension('http://fhir.de/StructureDefinition/gender-amtlich-de').exists()",
        "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient"
      }]
    },
    {
      "id" : "Patient.id",
      "path" : "Patient.id",
      "mustSupport" : true
    },
    {
      "id" : "Patient.meta",
      "path" : "Patient.meta",
      "mustSupport" : true
    },
    {
      "id" : "Patient.meta.profile",
      "path" : "Patient.meta.profile",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension",
      "path" : "Patient.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Patient.extension:birthPlace",
      "path" : "Patient.extension",
      "sliceName" : "birthPlace",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Geburtsort"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Birth Place"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/patient-birthPlace"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:birthPlace.url",
      "path" : "Patient.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:birthPlace.value[x]",
      "path" : "Patient.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:birthPlace.value[x].country",
      "path" : "Patient.extension.value[x].country",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Geburtsland"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Country of Birth"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:birthPlace.value[x].country.extension",
      "path" : "Patient.extension.value[x].country.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Patient.extension:birthPlace.value[x].country.extension:countryCode",
      "path" : "Patient.extension.value[x].country.extension",
      "sliceName" : "countryCode",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/iso21090-codedString"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:birthPlace.value[x].country.extension:countryCode.value[x]",
      "path" : "Patient.extension.value[x].country.extension.value[x]",
      "mustSupport" : true,
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "http://hl7.org/fhir/ValueSet/iso3166-1-2"
      }
    },
    {
      "id" : "Patient.extension:birthPlace.value[x].country.extension:countryCode.value[x].system",
      "path" : "Patient.extension.value[x].country.extension.value[x].system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:birthPlace.value[x].country.extension:countryCode.value[x].code",
      "path" : "Patient.extension.value[x].country.extension.value[x].code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship",
      "path" : "Patient.extension",
      "sliceName" : "patient-citizenship",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Staatsbürgerschaft"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Citizenship"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/patient-citizenship"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship.extension:code",
      "path" : "Patient.extension.extension",
      "sliceName" : "code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship.extension:code.url",
      "path" : "Patient.extension.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship.extension:code.value[x]",
      "path" : "Patient.extension.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship.extension:code.value[x].coding",
      "path" : "Patient.extension.extension.value[x].coding",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship.extension:code.value[x].coding.system",
      "path" : "Patient.extension.extension.value[x].coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship.extension:code.value[x].coding.code",
      "path" : "Patient.extension.extension.value[x].coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship.extension:period",
      "path" : "Patient.extension.extension",
      "sliceName" : "period",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship.extension:period.url",
      "path" : "Patient.extension.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship.extension:period.value[x]",
      "path" : "Patient.extension.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship.url",
      "path" : "Patient.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality",
      "path" : "Patient.extension",
      "sliceName" : "patient-nationality",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Nationalität"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Nationality"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/patient-nationality"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality.extension:code",
      "path" : "Patient.extension.extension",
      "sliceName" : "code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality.extension:code.url",
      "path" : "Patient.extension.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality.extension:code.value[x]",
      "path" : "Patient.extension.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality.extension:code.value[x].coding",
      "path" : "Patient.extension.extension.value[x].coding",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality.extension:code.value[x].coding.system",
      "path" : "Patient.extension.extension.value[x].coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality.extension:code.value[x].coding.code",
      "path" : "Patient.extension.extension.value[x].coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality.extension:period",
      "path" : "Patient.extension.extension",
      "sliceName" : "period",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality.extension:period.url",
      "path" : "Patient.extension.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality.extension:period.value[x]",
      "path" : "Patient.extension.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality.url",
      "path" : "Patient.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender",
      "path" : "Patient.extension",
      "sliceName" : "recordedSexOrGender",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Dokumentiertes Geschlecht"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Recorded Sex or Gender"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/individual-recordedSexOrGender"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:value",
      "path" : "Patient.extension.extension",
      "sliceName" : "value",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:value.url",
      "path" : "Patient.extension.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:value.value[x]",
      "path" : "Patient.extension.extension.value[x]",
      "mustSupport" : true,
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "https://www.medizininformatik-initiative.de/fhir/modul-person/ValueSet/mii-vs-person-recordedsexorgender-snomed"
      }
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:value.value[x].coding",
      "path" : "Patient.extension.extension.value[x].coding",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:value.value[x].coding.system",
      "path" : "Patient.extension.extension.value[x].coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:value.value[x].coding.code",
      "path" : "Patient.extension.extension.value[x].coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:type",
      "path" : "Patient.extension.extension",
      "sliceName" : "type",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:type.url",
      "path" : "Patient.extension.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:type.value[x]",
      "path" : "Patient.extension.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:type.value[x].coding",
      "path" : "Patient.extension.extension.value[x].coding",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:type.value[x].coding.system",
      "path" : "Patient.extension.extension.value[x].coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:type.value[x].coding.code",
      "path" : "Patient.extension.extension.value[x].coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:acquisitionDate",
      "path" : "Patient.extension.extension",
      "sliceName" : "acquisitionDate",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:acquisitionDate.url",
      "path" : "Patient.extension.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:acquisitionDate.value[x]",
      "path" : "Patient.extension.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.url",
      "path" : "Patient.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse",
      "path" : "Patient.extension",
      "sliceName" : "sexParameterForClinicalUse",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Geschlechtsparameter für die klinische Verwendung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Sex Parameter for Clinical Use"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/patient-sexParameterForClinicalUse"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse.extension:value",
      "path" : "Patient.extension.extension",
      "sliceName" : "value",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse.extension:value.url",
      "path" : "Patient.extension.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse.extension:value.value[x]",
      "path" : "Patient.extension.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse.extension:value.value[x].coding",
      "path" : "Patient.extension.extension.value[x].coding",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse.extension:value.value[x].coding.system",
      "path" : "Patient.extension.extension.value[x].coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse.extension:value.value[x].coding.code",
      "path" : "Patient.extension.extension.value[x].coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse.extension:period",
      "path" : "Patient.extension.extension",
      "sliceName" : "period",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse.extension:period.url",
      "path" : "Patient.extension.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse.extension:period.value[x]",
      "path" : "Patient.extension.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse.url",
      "path" : "Patient.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier",
      "path" : "Patient.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "short" : "Patienten-Identifikator",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Identifikator"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Identifier"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Ein Identifikator für den/die Patient*in",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Ein Identifikator für den/die Patient*in"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "An identifier for this patient"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId",
      "path" : "Patient.identifier",
      "sliceName" : "versichertenId",
      "short" : "Krankenversichertennummer",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Krankenversichertennummer"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Health insurance number"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Krankenversichertennummer, unabhängig, ob GKV, PKV oder Sonderkostenträger",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "10-stellige KVID"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "10-digit health insurance number"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-kvid-10"]
      }],
      "patternIdentifier" : {
        "type" : {
          "coding" : [{
            "system" : "http://fhir.de/CodeSystem/identifier-type-de-basis",
            "code" : "KVZ10"
          }]
        }
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.type",
      "path" : "Patient.identifier.type",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.type.coding",
      "path" : "Patient.identifier.type.coding",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.type.coding.system",
      "path" : "Patient.identifier.type.coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.type.coding.code",
      "path" : "Patient.identifier.type.coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.system",
      "path" : "Patient.identifier.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.value",
      "path" : "Patient.identifier.value",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.assigner",
      "path" : "Patient.identifier.assigner",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.assigner.identifier",
      "path" : "Patient.identifier.assigner.identifier",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-iknr"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.assigner.identifier.type",
      "path" : "Patient.identifier.assigner.identifier.type",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.assigner.identifier.type.coding",
      "path" : "Patient.identifier.assigner.identifier.type.coding",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.assigner.identifier.type.coding.system",
      "path" : "Patient.identifier.assigner.identifier.type.coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.assigner.identifier.type.coding.code",
      "path" : "Patient.identifier.assigner.identifier.type.coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.assigner.identifier.system",
      "path" : "Patient.identifier.assigner.identifier.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.assigner.identifier.value",
      "path" : "Patient.identifier.assigner.identifier.value",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid",
      "path" : "Patient.identifier",
      "sliceName" : "pid",
      "short" : "Patientenidentifikation",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Organisationsinterner Patienten-Identifikator"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Organization-internal patient identifier"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Patientenidentifikator innerhalb einer Organisation",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Führende ID der Patient*in in der Organisation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Medical record number of the patient in the organization"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-pid"]
      }],
      "patternIdentifier" : {
        "type" : {
          "coding" : [{
            "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code" : "MR"
          }]
        }
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.type",
      "path" : "Patient.identifier.type",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.type.coding",
      "path" : "Patient.identifier.type.coding",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.type.coding.system",
      "path" : "Patient.identifier.type.coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.type.coding.code",
      "path" : "Patient.identifier.type.coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.system",
      "path" : "Patient.identifier.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.value",
      "path" : "Patient.identifier.value",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.assigner",
      "path" : "Patient.identifier.assigner",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.assigner.identifier",
      "path" : "Patient.identifier.assigner.identifier",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.assigner.identifier.type",
      "path" : "Patient.identifier.assigner.identifier.type",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
          "code" : "XX"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.assigner.identifier.type.coding",
      "path" : "Patient.identifier.assigner.identifier.type.coding",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.assigner.identifier.type.coding.system",
      "path" : "Patient.identifier.assigner.identifier.type.coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.assigner.identifier.type.coding.code",
      "path" : "Patient.identifier.assigner.identifier.type.coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.assigner.identifier.system",
      "path" : "Patient.identifier.assigner.identifier.system",
      "constraint" : [{
        "key" : "mii-pat-2",
        "severity" : "error",
        "human" : "Entweder IKNR oder MII Core Location Identifier muss verwendet werden",
        "expression" : "$this = 'http://fhir.de/sid/arge-ik/iknr' or $this = 'https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier'",
        "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient"
      }]
    },
    {
      "id" : "Patient.name",
      "path" : "Patient.name",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "short" : "Name",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Name"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Name"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Name der Patientin oder des Patienten",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Name der Patientin oder des Patienten"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "A name associated with the patient"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:name",
      "path" : "Patient.name",
      "sliceName" : "name",
      "short" : "Personenname",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Personenname"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Person's name"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Personenname mit in Deutschland üblichen Namensbestandteilen",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Personenname mit in Deutschland üblichen Namensbestandteilen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "A person's name with components typically used in Germany"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "HumanName",
        "profile" : ["http://fhir.de/StructureDefinition/humanname-de-basis"]
      }],
      "patternHumanName" : {
        "use" : "official"
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:name.use",
      "path" : "Patient.name.use",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:name.family",
      "path" : "Patient.name.family",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:name.family.extension:namenszusatz",
      "path" : "Patient.name.family.extension",
      "sliceName" : "namenszusatz",
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:name.family.extension:nachname",
      "path" : "Patient.name.family.extension",
      "sliceName" : "nachname",
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:name.family.extension:vorsatzwort",
      "path" : "Patient.name.family.extension",
      "sliceName" : "vorsatzwort",
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:name.given",
      "path" : "Patient.name.given",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:name.prefix",
      "path" : "Patient.name.prefix",
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:name.prefix.extension:prefix-qualifier",
      "path" : "Patient.name.prefix.extension",
      "sliceName" : "prefix-qualifier",
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:geburtsname",
      "path" : "Patient.name",
      "sliceName" : "geburtsname",
      "short" : "Geburtsname",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Geburtsname"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Maiden name"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Name, der vor einer Namensänderung aufgrund von Heirat verwendet wurde",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Name, der vor einer Namensänderung aufgrund von Heirat verwendet wurde."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "A name used prior to changing name because of marriage."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "HumanName",
        "profile" : ["http://fhir.de/StructureDefinition/humanname-de-basis"]
      }],
      "patternHumanName" : {
        "use" : "maiden"
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:geburtsname.use",
      "path" : "Patient.name.use",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:geburtsname.family",
      "path" : "Patient.name.family",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:geburtsname.family.extension:namenszusatz",
      "path" : "Patient.name.family.extension",
      "sliceName" : "namenszusatz",
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:geburtsname.family.extension:nachname",
      "path" : "Patient.name.family.extension",
      "sliceName" : "nachname",
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:geburtsname.family.extension:vorsatzwort",
      "path" : "Patient.name.family.extension",
      "sliceName" : "vorsatzwort",
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:geburtsname.given",
      "path" : "Patient.name.given",
      "max" : "0"
    },
    {
      "id" : "Patient.name:geburtsname.prefix",
      "path" : "Patient.name.prefix",
      "max" : "0"
    },
    {
      "id" : "Patient.name:geburtsname.prefix.extension:prefix-qualifier",
      "path" : "Patient.name.prefix.extension",
      "sliceName" : "prefix-qualifier",
      "mustSupport" : true
    },
    {
      "id" : "Patient.gender",
      "path" : "Patient.gender",
      "short" : "Administratives Geschlecht",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Administratives Geschlecht"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Administrative gender"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "männlich | weiblich | andere | unbekannt | unbestimmt | divers",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "männlich | weiblich | andere | unbekannt | unbestimmt | divers"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "male | female | other | unknown | undetermined | diverse"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.gender.extension",
      "path" : "Patient.gender.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Patient.gender.extension:other-amtlich",
      "path" : "Patient.gender.extension",
      "sliceName" : "other-amtlich",
      "short" : "Extension Administratives Geschlecht",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Extension Administratives Geschlecht"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Extension administrative gender"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Extension zur genaueren Differenzierung des administrativen Geschlechts",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Extension zur genaueren Differenzierung des administrativen Geschlechts"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Extension for detailed differentiation of administrative gender"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://fhir.de/StructureDefinition/gender-amtlich-de"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.gender.extension:other-amtlich.url",
      "path" : "Patient.gender.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.gender.extension:other-amtlich.value[x]",
      "path" : "Patient.gender.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.gender.extension:other-amtlich.value[x].system",
      "path" : "Patient.gender.extension.value[x].system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.gender.extension:other-amtlich.value[x].code",
      "path" : "Patient.gender.extension.value[x].code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.birthDate",
      "path" : "Patient.birthDate",
      "short" : "Geburtsdatum",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Geburtsdatum"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Date of birth"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Das Geburtsdatum der Patientin oder des Patienten",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das Geburtsdatum der Patientin oder des Patienten"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "The date of birth for the individual"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.birthDate.extension",
      "path" : "Patient.birthDate.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Patient.birthDate.extension:data-absent-reason",
      "path" : "Patient.birthDate.extension",
      "sliceName" : "data-absent-reason",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/data-absent-reason"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.deceased[x]",
      "path" : "Patient.deceased[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      },
      "short" : "Verstorben",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Verstorben"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Deceased"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Gibt an, ob die Person verstorben ist oder nicht",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Gibt an, ob die Person verstorben ist oder nicht"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Indicates if the individual is deceased or not"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.deceased[x]:deceasedBoolean",
      "path" : "Patient.deceased[x]",
      "sliceName" : "deceasedBoolean",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.deceased[x]:deceasedDateTime",
      "path" : "Patient.deceased[x]",
      "sliceName" : "deceasedDateTime",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.address",
      "path" : "Patient.address",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "short" : "Adresse",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Adresse"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Address"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Eine Adresse der Patientin oder des Patienten",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Eine Adresse der Patientin oder des Patienten"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "An address for the individual"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift",
      "path" : "Patient.address",
      "sliceName" : "Strassenanschrift",
      "short" : "Straßenanschrift",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Straßenanschrift"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Street address"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Eine Straßenanschrift der Patientin oder des Patienten",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Eine Straßenanschrift der Patientin oder des Patienten"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "A street address for the individual"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Address",
        "profile" : ["http://fhir.de/StructureDefinition/address-de-basis"]
      }],
      "patternAddress" : {
        "type" : "both"
      },
      "constraint" : [{
        "key" : "pat-cnt-2or3-char",
        "severity" : "warning",
        "human" : "If the country element is present, the country SHOULD also be coded in the extension countryCode (http://hl7.org/fhir/StructureDefinition/iso21090-codedString) with a code from ValueSet ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2. Address.country itself may carry other values (e.g. DEÜV country codes).",
        "expression" : "country.empty() or country.extension('http://hl7.org/fhir/StructureDefinition/iso21090-codedString').where(value.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-2')).exists()",
        "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.extension:Stadtteil",
      "path" : "Patient.address.extension",
      "sliceName" : "Stadtteil",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.type",
      "path" : "Patient.address.type",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.line",
      "path" : "Patient.address.line",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.line.extension:Strasse",
      "path" : "Patient.address.line.extension",
      "sliceName" : "Strasse",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.line.extension:Hausnummer",
      "path" : "Patient.address.line.extension",
      "sliceName" : "Hausnummer",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.line.extension:Adresszusatz",
      "path" : "Patient.address.line.extension",
      "sliceName" : "Adresszusatz",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.line.extension:Postfach",
      "path" : "Patient.address.line.extension",
      "sliceName" : "Postfach",
      "max" : "0",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.city",
      "path" : "Patient.address.city",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.city.extension",
      "path" : "Patient.address.city.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Patient.address:Strassenanschrift.city.extension:gemeindeschluessel",
      "path" : "Patient.address.city.extension",
      "sliceName" : "gemeindeschluessel",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://fhir.de/StructureDefinition/destatis/ags"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.city.extension:gemeindeschluessel.url",
      "path" : "Patient.address.city.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.city.extension:gemeindeschluessel.value[x]",
      "path" : "Patient.address.city.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.city.extension:gemeindeschluessel.value[x].system",
      "path" : "Patient.address.city.extension.value[x].system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.city.extension:gemeindeschluessel.value[x].code",
      "path" : "Patient.address.city.extension.value[x].code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.postalCode",
      "path" : "Patient.address.postalCode",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.country",
      "path" : "Patient.address.country",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach",
      "path" : "Patient.address",
      "sliceName" : "Postfach",
      "short" : "Postfach",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Postfach"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Postbox"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Eine Postfachanschrift der Patientin oder des Patienten",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Eine Postfachanschrift der Patientin oder des Patienten"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "A postbox address for the individual"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Address",
        "profile" : ["http://fhir.de/StructureDefinition/address-de-basis"]
      }],
      "patternAddress" : {
        "type" : "postal"
      },
      "constraint" : [{
        "key" : "pat-cnt-2or3-char",
        "severity" : "warning",
        "human" : "If the country element is present, the country SHOULD also be coded in the extension countryCode (http://hl7.org/fhir/StructureDefinition/iso21090-codedString) with a code from ValueSet ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2. Address.country itself may carry other values (e.g. DEÜV country codes).",
        "expression" : "country.empty() or country.extension('http://hl7.org/fhir/StructureDefinition/iso21090-codedString').where(value.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-2')).exists()",
        "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.extension:Stadtteil",
      "path" : "Patient.address.extension",
      "sliceName" : "Stadtteil",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.type",
      "path" : "Patient.address.type",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.line",
      "path" : "Patient.address.line",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.line.extension:Strasse",
      "path" : "Patient.address.line.extension",
      "sliceName" : "Strasse",
      "max" : "0"
    },
    {
      "id" : "Patient.address:Postfach.line.extension:Hausnummer",
      "path" : "Patient.address.line.extension",
      "sliceName" : "Hausnummer",
      "max" : "0"
    },
    {
      "id" : "Patient.address:Postfach.line.extension:Adresszusatz",
      "path" : "Patient.address.line.extension",
      "sliceName" : "Adresszusatz",
      "max" : "0"
    },
    {
      "id" : "Patient.address:Postfach.line.extension:Postfach",
      "path" : "Patient.address.line.extension",
      "sliceName" : "Postfach",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.city",
      "path" : "Patient.address.city",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.city.extension",
      "path" : "Patient.address.city.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Patient.address:Postfach.city.extension:gemeindeschluessel",
      "path" : "Patient.address.city.extension",
      "sliceName" : "gemeindeschluessel",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://fhir.de/StructureDefinition/destatis/ags"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.city.extension:gemeindeschluessel.url",
      "path" : "Patient.address.city.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.city.extension:gemeindeschluessel.value[x]",
      "path" : "Patient.address.city.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.city.extension:gemeindeschluessel.value[x].system",
      "path" : "Patient.address.city.extension.value[x].system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.city.extension:gemeindeschluessel.value[x].code",
      "path" : "Patient.address.city.extension.value[x].code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.postalCode",
      "path" : "Patient.address.postalCode",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.country",
      "path" : "Patient.address.country",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.link",
      "path" : "Patient.link",
      "short" : "Verweis",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Verweis"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Link"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Verweis auf eine andere Patientenressource, die die gleiche tatsächliche Person betrifft",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Verweis auf eine andere Patientenressource, die die gleiche tatsächliche Person betrifft"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Link to another patient resource that concerns the same actual person"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.link.other",
      "path" : "Patient.link.other",
      "mustSupport" : true
    },
    {
      "id" : "Patient.link.type",
      "path" : "Patient.link.type",
      "mustSupport" : true
    }]
  }
}

```
