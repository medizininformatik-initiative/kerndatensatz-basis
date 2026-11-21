# Ballot Reconciliation 2027.0.0-ballot - MII Implementation Guide Core Dataset Base v2027.0.0-ballot

* [**Table of Contents**](toc.md)
* **Ballot Reconciliation 2027.0.0-ballot**

## Ballot Reconciliation 2027.0.0-ballot

This page documents the reconciliation of the ballot comments on version `2027.0.0-ballot` of the MII Kerndatensatz Basis. It lists the tickets from the HL7 Germany ballot ([Jira query](https://hl7germany.atlassian.net/issues/?jql=project%20%3D%20HDB%20AND%20created%20%3E%3D%20-200d%20AND%20%22Project%5BDropdown%5D%22%20in%20%28%22MII%20%E2%80%93%20Modul%20Basis%20%28Person%2C%20Fall%2C%20Diagnose%20%26%20Prozedur%29%22%29%20ORDER%20BY%20created%20DESC)), grouped by category, with the decision and its implementation. The individual changes are listed in the [changelog](changes.md) under version `2027.0.0`.

#### Legend

| | |
| :--- | :--- |
| **Accepted** | The requested change is implemented in`2027.0.0`. |
| **Accepted with modification** | The concern is addressed in`2027.0.0`, but differently from the request; the difference is described. |
| **Accepted (docs)** | Documentation or implementation guidance is changed; no change to conformance rules. |
| **Accepted – deferred** | The change is agreed, but implemented later; the open precondition is given. |
| **Considered for future use** | No change in this release; the topic is kept for a later release or a joint process with other organisations. |
| **Rejected** | The requested change is not made; the reason is given. |

**Breaking** = **yes** if implementations conforming to the previous release (`2026.0.x`) no longer conform after the change. Changes to artefacts first introduced in `2027.0.0-ballot` (e.g. the AllergyIntolerance profile) are not breaking.

-------

### A. Profile changes

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| [HDB-1075](https://hl7germany.atlassian.net/browse/HDB-1075) | Extension Lebensphase in Datentyp "Range" | The Lebensphase extension moved from`Condition.onsetAge`/`abatementAge`to`onsetRange`/`abatementRange`, because its context in`de.basisprofil.r4`1.6.0 does not allow`Age`; the logical model mapping follows.`Age`stays allowed without the extension. The context of the German extension and of the HL7 Europe extension[`periods-of-life`](https://hl7.eu/fhir/extensions/StructureDefinition-periods-of-life.html)is monitored for future changes. | Accepted | **yes** |
| [HDB-1069](https://hl7germany.atlassian.net/browse/HDB-1069) | Constraint "pat-cnt-2or3-char" in Adress.country | `pat-cnt-2or3-char`now checks the`countryCode`extension (`iso21090-codedString`, ISO 3166-1 alpha-2) instead of`Address.country`, so`country`may carry other values (e.g. DEÜV). Examples code the country in the extension. | Accepted | no |
| [HDB-935](https://hl7germany.atlassian.net/browse/HDB-935) | country constraints noch nicht angepasst? | Resolved together with HDB-1069. | Accepted | no |
| [HDB-1124](https://hl7germany.atlassian.net/browse/HDB-1124) | Binding Strengh in Extension individual-recordedSexOrGender anpassen | The binding of`Patient.extension:recordedSexOrGender.extension:value.valueCodeableConcept`to`MII_VS_Person_recordedSexOrGender_SNOMED`changed from**preferred**to**extensible**. | Accepted | no (new in ballot) |
| [HDB-1067](https://hl7germany.atlassian.net/browse/HDB-1067) | Verwendung der Extension "Patient Sex Parameter For Clinical Use" | `patient-sexParameterForClinicalUse`(`hl7.fhir.uv.extensions.r4`5.2.0) added to the Patient profile as an optional extension, with Must Support on`value`and`period`. Not added to the pseudonymised Patient profile. | Accepted | no |
| [HDB-1073](https://hl7germany.atlassian.net/browse/HDB-1073) | Wahl der Valuesets in AllergyIntolerance.code und reaction.manifestation | The IPS bindings are replaced by optional slices`coding:snomed-ct`(0..1, Must Support) on`AllergyIntolerance.code`and`reaction.manifestation`, bound**extensible**to`KBV_VS_AllergyIntolerance_Substance_SNOMED_CT`and`KBV_VS_AllergyIntolerance_Manifestation_SNOMED_CT`(1.0.0), aligned with ISiK. New dependency`kbv.all.terminology.allergyintolerance`1.0.0, available only on the[BfArM ZTS](https://terminologien.bfarm.de); the CI installs it with a composite action after the download conditions are accepted. | Accepted | no (new in ballot) |
| [HDB-1019](https://hl7germany.atlassian.net/browse/HDB-1019) | AllergyIntolerance.code.coding:snomed-ct | The`coding:snomed-ct`slice is introduced (see HDB-1073), but**not as mandatory**, unlike ISiK: allergies may be documented with other codes only, e.g. an ATC code for a substance. | Accepted with modification | no |
| [HDB-1072](https://hl7germany.atlassian.net/browse/HDB-1072) | Verwendung der Lebensphase Extension in AllergyIntolerance | The Lebensphase extension is allowed on`AllergyIntolerance.onsetRange`and on`AllergyIntolerance.extension:abatement.valueRange`, consistent with HDB-1075. | Accepted | no (new in ballot) |
| [HDB-1074](https://hl7germany.atlassian.net/browse/HDB-1074) | BodyStructure Profile aus EU Core referenzieren | Agreed to reference`bodyStructure-eu-core`(`hl7.fhir.eu.base`, new dependency) as the target of the`bodySite`extension in Condition and Procedure. Deferred to the backlog: the other MII modules that already use`BodyStructure`first have to check whether their profiles conform to the EU profile. | Accepted – deferred | no |

### B. Terminology

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| [HDB-1068](https://hl7germany.atlassian.net/browse/HDB-1068) | Wahl des Valueset in Extension "Recorded Sex or Gender" | The SNOMED CT ValueSet stays, because the primary MII use case is the sex assigned at birth. New[ConceptMap](ConceptMap-mii-cm-person-recordedsexorgender-snomed-administrative-gender.md)from its codes to`administrative-gender`with qualified relationships (**inexact**,**wider**) instead of equivalence. | Accepted | no |

### C. Discussed topics

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| [HDB-1070](https://hl7germany.atlassian.net/browse/HDB-1070) | Verwendung von "pattern" Diskriminatoren | No change: the working implementation stays. In R4,`#value`gives the same validation results as`#pattern`; only the deprecation notice would disappear, while derived profiles that re-declare an inherited slicing would have to switch too. To be revisited with a later FHIR version. | Considered for future use | no |
| [HDB-1071](https://hl7germany.atlassian.net/browse/HDB-1071) | Kardinalität von Patient.birthDate | `birthDate`stays 0..1. The Patient page explains that this is a deliberate deviation from ISiK (1..1 with`data-absent-reason`), because of the MII environments and privacy reasons. | Rejected | no |
| [HDB-1018](https://hl7germany.atlassian.net/browse/HDB-1018) | Procedure.category Invarianten | **(a)**A text-only`Procedure.code`(ISiK`proc-ISiK-3`) is not allowed: consumers must be able to rely on a coded procedure.**(b)**`proc-ISiK-2`(category for every coded procedure) is not adopted now, because it would be breaking. The Procedure page notes both differences to ISiK 6.0.0. | (a) Rejected · (b) Considered for future use | no |
| [HDB-1016](https://hl7germany.atlassian.net/browse/HDB-1016) | Encounter.type.Kontaktebene und .diagnosis.use.coding:Diagnosetyp und .hospitalization.admitSource | `type:Kontaktebene`and`diagnosis.use.coding:Diagnosetyp`keep their cardinalities; the Encounter page documents the deviations from ISiK 6.0.0 in a table.`hospitalization.admitSource`is relaxed from 1..1 to 0..1 (Must Support), as in ISiK and the logical model, because the admission source is often missing in the HL7 v2 feed ([#53](https://github.com/medizininformatik-initiative/kerndatensatz-basis/issues/53)). | Accepted with modification | no |

### D. Documentation

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| [HDB-1048](https://hl7germany.atlassian.net/browse/HDB-1048) | Aufnahmenummer ungleich Fallnummer | Corrected**Aufnahmenummer**and**PatientenIdentifikator**in the logical model Fall: the admission number identifies a single encounter; the case number (Fallnummer) identifies the billing case and is given in`Encounter.account.identifier`, as in ISiK. | Accepted (docs) | no |
| [HDB-1010](https://hl7germany.atlassian.net/browse/HDB-1010) | Fallart teilstationär Klarstellung | The Encounter page explains why partial inpatient encounters use`IMP`(with bed allocation, e.g. night clinic) or`SS`(without bed allocation, e.g. day clinic). | Accepted (docs) | no |
| [HDB-1011](https://hl7germany.atlassian.net/browse/HDB-1011) | Bettenstellplatz | The slice`Encounter.location:Bett`is renamed to`Bettenstellplatz`, as in ISiK, and described as the location where the bed stands, not the bed as a device. Discriminator, cardinality and constraints are unchanged, so existing instances and implementations are unaffected. | Accepted with modification | no |
| [HDB-1052](https://hl7germany.atlassian.net/browse/HDB-1052) | Extension von Diagnosen ValueSet in Fall-Profile | `mii-vs-fall-diagnosis-use`is unchanged. The Encounter page notes that DRG main and secondary diagnoses (`principle-DRG`,`secondary-DRG`) and`hospital-main-diagnosis`SHOULD be given on the Account with`ExtensionAbrechnungsDiagnoseProzedur`, as in ISiK, not in`Encounter.diagnosis.use`. | Accepted (docs) | no |
| [HDB-1020](https://hl7germany.atlassian.net/browse/HDB-1020) | Condition .extension | The Condition page describes`Feststellungsdatum`and how it differs from`onset[x]`and`recordedDate`(best-practice box with example), and clarifies`ReferenzPrimaerdiagnose`. | Accepted (docs) | no |
| [HDB-1012](https://hl7germany.atlassian.net/browse/HDB-1012) | Empfehlung Diagnosen an die Kontaktebene | The Condition page notes that the recommended contact level (department contact) is under discussion for ISiK stage 7 and that the MII will follow its outcome. | Accepted (docs) | no |
| [HDB-1013](https://hl7germany.atlassian.net/browse/HDB-1013) | UML Referenz Modul zu Patient | The[UML diagram](uml-diagrams.md)of the Treatment Case module shows the association from Einrichtungskontakt to Patient via**Patientenidentifikator**(`Encounter.subject`). | Accepted (docs) | no |
| [HDB-939](https://hl7germany.atlassian.net/browse/HDB-939) | Zuordnung - Encounter <-> Account | The Encounter page states that one Account can be referenced by several facility encounters; the hierarchy figure already shows this. | Accepted (docs) | no |
| [HDB-938](https://hl7germany.atlassian.net/browse/HDB-938) | Station (Ward) -> Location vs. Organization | The Encounter page describes both ways to represent a ward, as Location (`location:Station`,`physicalType = wa`) and as Organization (`serviceProvider`), in line with ISiK 6.0.0. | Accepted (docs) | no |
| [HDB-1077](https://hl7germany.atlassian.net/browse/HDB-1077) | Constraint für die Lateralitätsangabe in Procedure | The`bodySite`definition is clarified: SNOMED CT procedure codes usually include body site and laterality precoordinated, and`bodySite`SHOULD NOT merely repeat them. The invariant is not feasible: detecting redundant laterality would require following SNOMED CT relationships or resolving`BodyStructure`references, and two laterality statements are not necessarily redundant (e.g. a bilateral procedure referencing a left-sided lesion). The Procedure page explains this. | Accepted (docs) | no |
| [HDB-1035](https://hl7germany.atlassian.net/browse/HDB-1035) | Mutter-Kind-Beziehung | No profile change. New section[Mother and Newborn](StructureDefinition-mii-pr-person-patient.md#mother-and-newborn)on the Patient page: the mother as`RelatedPerson`(`MTH`) of the child, optional`Patient.link`(`seealso`) from her own record,`Encounter.partOf`from the newborn's to the mother's delivery encounter (MAY, with a traversal rule, also noted on the Encounter page), conditional newborn billing cases and the HL7 v2 mapping. Prenatal questions (identifiers at birth, prenatal findings, cord-blood specimens) are out of scope. | Accepted (docs) | no |
| [HDB-1036](https://hl7germany.atlassian.net/browse/HDB-1036) | Mehrlingsschwangerschaft | No profile change. The same section separates the multiple pregnancy (a finding about the mother, cf. KBV MIO Mutterpass) from the multiple birth (`multipleBirth[x]`of each child, with a twin example); identifying fetuses before birth is out of scope (HL7 IBCM, CH EPREG). | Accepted (docs) | no |

### E. Replies

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| [HDB-1017](https://hl7germany.atlassian.net/browse/HDB-1017) | Procedure Extension Durchführungsabsicht | No change. The extension records the intended purpose of a procedure (e.g. curative, palliative, diagnostic) and stays`0..1`Must Support in MII for secondary use. Before it could become Must Support in care (ISiK), evidence is needed on which documentation contexts capture it. | Considered for future use | no |
| [HDB-1021](https://hl7germany.atlassian.net/browse/HDB-1021) | Vitalstatus | No change. Vitalstatus is deliberately not derived from VitalSignDE: it records whether a patient is alive, deceased or unknown (LOINC 67162-8, category`survey`), not a measured vital sign, and deriving it would force`category = vital-signs`. | Rejected | no |
| [HDB-1024](https://hl7germany.atlassian.net/browse/HDB-1024) | Vitalstatus (Observation) .note MS | No change.`note`stays Must Support as the place for the source of the vital status (**Informationsquelle**in the logical model), for which no structured element exists. Evidence of real use is needed to judge its relevance for care. | Considered for future use | no |
| [HDB-1025](https://hl7germany.atlassian.net/browse/HDB-1025) | Warum Basis und Meta | No merge of the modules. Meta holds module-independent artefacts and conventions that all KDS modules reuse (SearchParameter profile, shared SearchParameters and CapabilityStatement) and has no clinical content; Basis holds the base clinical profiles and depends on Meta. Basis no longer uses the Meta license extension`mii-ex-meta-license-codeable`, but the CRMI license extension. The split lets cross-module rules evolve in their own release cycle; modules adopt a new Meta version through an explicit dependency update. | Rejected | no |
| [HDB-1026](https://hl7germany.atlassian.net/browse/HDB-1026) | Condition.clinicalStatus - KlinischerStatus | No change.`clinicalStatus`stays Must Support: it is a modifier element that receivers must understand whenever it is populated, Must Support does not make it mandatory for senders, and ISiK Diagnose 6.0.0 also marks it Must Support. | Rejected | no |
| [HDB-1022](https://hl7germany.atlassian.net/browse/HDB-1022) | ValueSets Konsolidieren | No ValueSet changes in this release. We support a joint consolidation with gematik, HL7 Germany TC Terminology and the BfArM ZTS, with one owner and one publication per ValueSet. The`bd`wording was handled with HDB-1011. | Considered for future use | no |
| [HDB-1023](https://hl7germany.atlassian.net/browse/HDB-1023) | Fehlende Daten | No change in this release. We support bringing the guidance on missing data into the German base profiles jointly with gematik; the Basis page[Handling Missing Data](missing-data.md)will then reference it and keep only MII-specific additions. | Considered for future use | no |
| [HDB-1076](https://hl7germany.atlassian.net/browse/HDB-1076) | Slicing auf Encounter.diagnosis.use.coding | No change; the existing best practice (one`Encounter.diagnosis`entry per role, all referencing the same Condition) stays. The`coding`slices`Diagnosetyp`and`DiagnosesubTyp`allow`use`to be coded from the respective ValueSets, but the codings of one`use`must not mix different diagnosis roles: per[CodeableConcept](https://hl7.org/fhir/R4/datatypes.html#CodeableConcept),**each coding (also referred to as a 'translation') is a representation of the concept**. Slicing higher up is not possible (`use`is 1..1) or useful (`Encounter.diagnosis`). | Rejected | no |

### F. Meta module

These tickets concern the Meta module (`kerndatensatz-meta`) and are implemented there.

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| [HDB-1014](https://hl7germany.atlassian.net/browse/HDB-1014) | Meta CpS | The placeholder description of the Meta CapabilityStatement is replaced: it lists the resource types and SearchParameters defined by the Meta module, is informative and does not define normative server requirements. It stays draft. | Accepted | no |
| [HDB-1015](https://hl7germany.atlassian.net/browse/HDB-1015) | Externe Quelle github? | The GitHub wiki links in the Conformance menu are a temporary placeholder. The MII-wide conformance rules will move into the Meta IG as versioned pages. | Accepted – deferred | no |

