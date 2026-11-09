# Ballot Reconciliation 2027.0.0-ballot - MII Implementation Guide Core Dataset Base v2027.0.0-ballot

* [**Table of Contents**](toc.md)
* **Ballot Reconciliation 2027.0.0-ballot**

## Ballot Reconciliation 2027.0.0-ballot

This page is a **working document** for the reconciliation of the ballot comments on version `2027.0.0-ballot` of the MII Kerndatensatz Basis. It lists the open tickets from the HL7 Germany ballot ([Jira query](https://hl7germany.atlassian.net/issues/?jql=project%20%3D%20HDB%20AND%20created%20%3E%3D%20-200d%20AND%20%22Project%5BDropdown%5D%22%20in%20%28%22MII%20%E2%80%93%20Modul%20Basis%20%28Person%2C%20Fall%2C%20Diagnose%20%26%20Prozedur%29%22%29%20ORDER%20BY%20created%20DESC)), grouped by category, with a **proposed** resolution for each.

#### Legend

| | |
| :--- | :--- |
| **Proposed: accept** | Proposal to implement the change for`2027.0.0`; to be ratified in the meeting. |
| **Proposed: accept (docs)** | Proposal to change documentation or guidance only, no artefact changes; to be ratified. |
| **Discuss** | No proposed resolution yet; to be discussed in the meeting. |
| **Planned reply** | Question or cross-organisational topic; a reply in Jira is planned (draft or evidence still needed is given), no change in this IG. |

**Breaking** = **yes** if implementations conforming to the previous release (`2026.0.x`) no longer conform after the change. Changes to artefacts first introduced in `2027.0.0-ballot` (e.g. the AllergyIntolerance profile) are not breaking.

-------

### A. Proposed: accept – profile changes

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| [HDB-1075](https://hl7germany.atlassian.net/browse/HDB-1075) | Extension Lebensphase in Datentyp "Range" | Move the Lebensphase extension from`Condition.onsetAge`/`abatementAge`to`onsetRange`/`abatementRange`. The extension context in`de.basisprofil.r4`1.6.0 only allows`dateTime`,`Period.start`,`Period.end`and`Range`, so the current placement is invalid. Update the logical model mapping accordingly. | Proposed: accept | **yes** |
| [HDB-1069](https://hl7germany.atlassian.net/browse/HDB-1069) | Constraint "pat-cnt-2or3-char" in Adress.country | Rewrite`pat-cnt-2or3-char`to check the`countryCode`extension (`iso21090-codedString`) instead of`Address.country`, so`country`may carry other values (e.g. DEÜV). | Proposed: accept | no |
| [HDB-935](https://hl7germany.atlassian.net/browse/HDB-935) | country constraints noch nicht angepasst? | Resolved together with HDB-1069. | Proposed: accept | no |
| [HDB-1124](https://hl7germany.atlassian.net/browse/HDB-1124) | Binding Strengh in Extension individual-recordedSexOrGender anpassen | Change the binding of`Patient.extension:recordedSexOrGender.extension:value.valueCodeableConcept`to`MII_VS_Person_recordedSexOrGender_SNOMED`from**preferred**to**extensible**. See HDB-1068 for the background of the binding. | Proposed: accept | no (new in ballot) |
| [HDB-1067](https://hl7germany.atlassian.net/browse/HDB-1067) | Verwendung der Extension "Patient Sex Parameter For Clinical Use" | Add`patient-sexParameterForClinicalUse`(hl7.fhir.uv.extensions.r4 5.2.0) to the Patient profile as an optional extension. | Proposed: accept | no |
| [HDB-1073](https://hl7germany.atlassian.net/browse/HDB-1073) | Wahl der Valuesets in AllergyIntolerance.code und reaction.manifestation | Replace the IPS bindings (currently**preferred**) with the KBV ValueSets, aligned with the pending ISiK change (ISiK`main-stufe-6`; ISiK Basis 6.0.0 itself still uses FHIR core example bindings):`AllergyIntolerance.code.coding:snomed-ct`from`https://fhir.kbv.de/ValueSet/KBV_VS_AllergyIntolerance_Substance_SNOMED_CT|1.0.0`(**extensible**) and`AllergyIntolerance.reaction.manifestation.coding:snomed-ct`from`https://fhir.kbv.de/ValueSet/KBV_VS_AllergyIntolerance_Manifestation_SNOMED_CT|1.0.0`(**extensible**), matching the ISiK development source. Package identified: both ValueSets are in`kbv.all.terminology.allergyintolerance#1.0.0`(BfArM, protected: download requires accepting the conditions and a token); validation setup pending. | Proposed: accept | no (new in ballot) |
| [HDB-1019](https://hl7germany.atlassian.net/browse/HDB-1019) | AllergyIntolerance.code.coding:snomed-ct | Align with ISiK Basis 6.0.0:`AllergyIntolerance.code.coding`1..*, with a**mandatory**slice`coding:snomed-ct`1..1 (bound as in HDB-1073). Allergies coded only in other systems would then no longer conform. This is a substantive MII policy choice and needs an explicit decision in the meeting. | Proposed: accept | no against`2026.0.x`(new in ballot), but stricter than the published ballot profile |
| [HDB-1072](https://hl7germany.atlassian.net/browse/HDB-1072) | Verwendung der Lebensphase Extension in AllergyIntolerance | Allow the Lebensphase extension on`AllergyIntolerance.onsetRange`and on`AllergyIntolerance.extension:abatement.valueRange`(the`allergyintolerance-abatement`extension allows`Range`), consistent with HDB-1075. | Proposed: accept | no (new in ballot) |
| [HDB-1074](https://hl7germany.atlassian.net/browse/HDB-1074) | BodyStructure Profile aus EU Core referenzieren | Recommendation: reference the EU profile`http://hl7.eu/fhir/base/StructureDefinition/bodyStructure-eu-core`(`hl7.fhir.eu.base`2.0.1, new dependency)**directly**as the target of`Condition.bodySite.extension:bodySite.valueReference`and`Procedure.bodySite.extension:bodySite.valueReference`. An MII-specific derived profile is only needed if MII-specific constraints are required. | Proposed: accept | no (new in ballot) |

### B. Proposed: accept – terminology additions

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| [HDB-1068](https://hl7germany.atlassian.net/browse/HDB-1068) | Wahl des Valueset in Extension "Recorded Sex or Gender" | Background: the upstream extension`individual-recordedSexOrGender`has only an**example**binding (`administrative-gender`) on`value`. The MII Patient profile binds`value`to the SNOMED CT ValueSet`MII_VS_Person_recordedSexOrGender_SNOMED`with**preferred**strength (**extensible**proposed in HDB-1124). The extension covers recorded sex or gender in general; the primary MII use case is the sex assigned at birth, which is why SNOMED CT codes are used rather than administrative gender. Proposal: add a ConceptMap from the SNOMED CT codes to`administrative-gender`with qualified relationships (e.g.**wider**,**narrower**,**inexact**) instead of implying equivalence. | Proposed: accept | no |

### C. To be discussed

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| [HDB-1070](https://hl7germany.atlassian.net/browse/HDB-1070) | Verwendung von "pattern" Diskriminatoren | `pattern`is deprecated from R5 on.**Tested in R4 (SUSHI 3.21.0, IG Publisher 2.3.4):**`#value`with the values kept in`pattern[x]`gives the same validation results as`#pattern`for`Coding`,`CodeableConcept`and`Identifier`slicings on`$this`; SUSHI keeps`pattern[x]`(only`(exactly)`produces`fixed[x]`). Only the deprecation notice for`#pattern`disappears. Affects 23 slicings. Caveat: derived profiles that re-declare an inherited slicing with`#pattern`fail snapshot generation ("Slicing rules on differential … do not match those on base") and must switch too, e.g. Onkologie`mii-pr-onko-diagnose-primaertumor`(`bodySite.coding`). | Discuss | no (instances); migration note for derived profiles |
| [HDB-1071](https://hl7germany.atlassian.net/browse/HDB-1071) | Kardinalität von Patient.birthDate | Making`birthDate`1..1 (with`data-absent-reason`) needs discussion: the MII infrastructure is neither the ePA nor ISiK, and its data sources differ. | Discuss | **yes** |
| [HDB-1018](https://hl7germany.atlassian.net/browse/HDB-1018) | Procedure.category Invarianten | Two separate decisions:**(a)**allow a text-only`Procedure.code`(ISiK`proc-ISiK-3`) – this**relaxes**`sct-ops-1`and`code.coding`1..*, so consumers can no longer rely on a coded procedure;**(b)**adopt`proc-ISiK-2`(`code.coding.exists() implies category.coding.exists()`) – this**tightens**the rules: a SNOMED CT coded procedure without`category`currently conforms (`proc-mii-1`only requires a category for OPS codes) but would fail. The maintainers do not favour (a). | Discuss | (a) consumer impact · (b)**yes** |
| [HDB-1016](https://hl7germany.atlassian.net/browse/HDB-1016) | Encounter.type.Kontaktebene und .diagnosis.use.coding:Diagnosetyp und .hospitalization.admitSource | Cardinalities have deliberately not been tightened so far, for backwards compatibility. Discuss whether to align with ISiK and document the deviations. | Discuss | **yes**if tightened |

### D. Proposed: accept – documentation only

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| [HDB-1048](https://hl7germany.atlassian.net/browse/HDB-1048) | Aufnahmenummer ungleich Fallnummer | Correct the description of**Aufnahmenummer**in the logical model Fall: admission number and case number are different identifiers. Coordinate with the ISiK encounter concept. | Proposed: accept (docs) | no |
| [HDB-1010](https://hl7germany.atlassian.net/browse/HDB-1010) | Fallart teilstationär Klarstellung | Document why day-care cases can use`IMP`(with bed allocation, e.g. night clinic) or`SS`(without bed allocation). | Proposed: accept (docs) | no |
| [HDB-1011](https://hl7germany.atlassian.net/browse/HDB-1011) | Bettenstellplatz | Use the term "Bettenstellplatz" for`Encounter.location:Bett`to distinguish the location from the device. The slice name stays unchanged. | Proposed: accept (docs) | no |
| [HDB-1052](https://hl7germany.atlassian.net/browse/HDB-1052) | Extension von Diagnosen ValueSet in Fall-Profile | `mii-vs-fall-diagnosis-use`already includes`DiagnoseTyp`,`Diagnosesubtyp`(CodeSystem KontaktDiagnoseProzedur) and`diagnosis-role`(extensible binding). Document this and add an example. | Proposed: accept (docs) | no |
| [HDB-1020](https://hl7germany.atlassian.net/browse/HDB-1020) | Condition .extension | Describe the use of`ReferenzPrimaerdiagnose`and`Feststellungsdatum`, and the difference between`Feststellungsdatum`(clinical diagnosis date) and`onset`(start of symptoms), based on the discussion in Jira. | Proposed: accept (docs) | no |
| [HDB-1012](https://hl7germany.atlassian.net/browse/HDB-1012) | Empfehlung Diagnosen an die Kontaktebene | Add a note on the recommendation to link diagnoses to the department encounter, taking the ongoing ISiK discussion (Stufe 7) into account. | Proposed: accept (docs) | no |
| [HDB-1013](https://hl7germany.atlassian.net/browse/HDB-1013) | UML Referenz Modul zu Patient | Add the link between Fall and Patient (via**Patientenidentifikator**) to the UML diagram. | Proposed: accept (docs) | no |
| [HDB-939](https://hl7germany.atlassian.net/browse/HDB-939) | Zuordnung - Encounter <-> Account | Make clear in the diagram or text that one Account can be linked to several facility encounters. | Proposed: accept (docs) | no |
| [HDB-938](https://hl7germany.atlassian.net/browse/HDB-938) | Station (Ward) -> Location vs. Organization | Describe both options for representing a ward: as`Location`(`physicalType = wa`) or via the service provider`Organization`. | Proposed: accept (docs) | no |
| [HDB-1077](https://hl7germany.atlassian.net/browse/HDB-1077) | Constraint für die Lateralitätsangabe in Procedure | No invariant: a FHIRPath constraint can hardly detect double laterality reliably from the instance alone. The laterality in the OPS extension (`Seitenlokalisation`) can be checked directly, but for a SNOMED CT procedure code the validation would have to follow the modelled`Procedure site`relationships to the anatomical concepts and derive the laterality there; for a referenced`BodyStructure`it would first have to resolve the reference and, where applicable, derive the laterality from the SNOMED CT body site code. Even if both laterality statements can be determined, their simultaneous presence does not prove redundancy: a bilateral procedure can, for example, reference a specific left-sided lesion as`BodyStructure`. Proposal: clarify the profile description and keep the avoidance of redundant laterality statements as a modelling note. | Proposed: accept (docs) | no |

### E. Planned reply

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| [HDB-1017](https://hl7germany.atlassian.net/browse/HDB-1017) | Procedure Extension Durchführungsabsicht | Draft: the extension records the intended purpose of a procedure (e.g. curative, palliative, diagnostic).**Evidence needed:**in which documentation contexts sites capture it, to judge whether it is suitable as Must Support in care (ISiK). | Planned reply | no |
| [HDB-1021](https://hl7germany.atlassian.net/browse/HDB-1021) | Vitalstatus | Draft: the profile is not derived from VitalSignDE because it is a different concept – VitalSignDE covers vital signs (e.g. blood pressure, heart rate), while the Vitalstatus profile records whether a patient is alive or deceased (LOINC 67162-8). | Planned reply | no |
| [HDB-1024](https://hl7germany.atlassian.net/browse/HDB-1024) | Vitalstatus (Observation) .note MS | Draft:`note`carries additional free-text information on the vital status (e.g. the source of the information).**Evidence needed:**whether sites use it in practice, to judge its relevance for care. | Planned reply | no |
| [HDB-1025](https://hl7germany.atlassian.net/browse/HDB-1025) | Warum Basis und Meta | Draft (to be confirmed): the Meta module holds module-independent specifications and conventions that all KDS modules reuse; the Basis module contains the base clinical profiles. The split lets cross-module rules evolve in their own release cycle; modules adopt a new Meta version through an explicit dependency update and compatibility assessment. | Planned reply | no |
| [HDB-1026](https://hl7germany.atlassian.net/browse/HDB-1026) | Condition.clinicalStatus - KlinischerStatus | `clinicalStatus`is a modifier element (`isModifier = true`): removing the Must Support flag does not remove the element, and a receiver still has to understand it whenever a sender populates it, because it changes the meaning of the Condition (e.g.**resolved**,**inactive**).**Evidence needed:**how often DIZ sites receive a clinical status from the source systems. Then reply on whether the Must Support flag is justified. | Planned reply | no |
| [HDB-1022](https://hl7germany.atlassian.net/browse/HDB-1022) | ValueSets Konsolidieren | Draft: we support a joint consolidation of ValueSets with gematik, HL7 Germany TC Terminology and the BfArM terminology server (ZTS) and propose to agree on a joint curation process. The`bd`wording is handled with HDB-1011. | Planned reply | no |
| [HDB-1023](https://hl7germany.atlassian.net/browse/HDB-1023) | Fehlende Daten | Draft: we support bringing the guidance on missing data into the German base profiles jointly with gematik, so it can be maintained in one place. | Planned reply | no |
| [HDB-1035](https://hl7germany.atlassian.net/browse/HDB-1035) | Mutter-Kind-Beziehung | Draft: no profile change in this release. Reply with the recommended modelling, aligned with ISiK`ISiKAngehoeriger`and the[FHIR R4 mother/newborn guidance](https://hl7.org/fhir/R4/patient.html#mother): a`RelatedPerson`for the mother with`patient`→ child and`relationship`=`MTH`; if the mother is also a patient, her`Patient.link.other`→ this`RelatedPerson`(type`seealso`); one`RelatedPerson`per child for twins. A direct link from the mother's`Patient`to the child's`Patient`is not correct, because`Patient.link`links records of the same person. R4 worked example:[CH EPREG](https://www.fhir.ch/ig/ch-epreg/child-relationships.html). | Planned reply | no |
| [HDB-1036](https://hl7germany.atlassian.net/browse/HDB-1036) | Mehrlingsschwangerschaft | Draft: no profile change in this release; the reply separates three facts: (1)**the mother has a multiple pregnancy**: a finding about the mother, cf. KBV MIO Mutterpass 1.1.0 (`KBV_PR_MIO_MR_Observation_Pregnancy_Information`); (2)**the child was born in a multiple birth**: the child's`Patient.multipleBirth[x]`(the integer is the birth order, not the number of fetuses; on the mother it would describe her own birth); (3)**identifying individual fetuses during the pregnancy**: out of scope, reference[HL7 IBCM](https://build.fhir.org/ig/HL7/fetal_records/)(R5, ballot) and CH EPREG. The Mutterpass Patient profiles cannot be reused directly (`Patient.link`and`multipleBirth[x]`are`0..0`). | Planned reply | no |
| [HDB-1076](https://hl7germany.atlassian.net/browse/HDB-1076) | Slicing auf Encounter.diagnosis.use.coding | Draft: no change; the existing best-practice note in the Encounter profile notes (one`Encounter.diagnosis`entry per role, all referencing the same Condition) is correct and stays. The`coding`slices`Diagnosetyp`and`DiagnosesubTyp`allow`use`to be coded from the respective ValueSets, but the codings of one`use`must not mix different diagnosis roles (e.g. admission and discharge diagnosis): per the FHIR definition of[CodeableConcept](https://hl7.org/fhir/R4/datatypes.html#CodeableConcept),**each coding (also referred to as a 'translation') is a representation of the concept as described above and may have slightly different granularity due to the differences in the definitions of the underlying codes**. Slicing higher up in the tree is not possible (`use`is a single CodeableConcept, 1..1) or useful (`Encounter.diagnosis`). | Planned reply | no |

### F. Meta module

These tickets concern the Meta module (`kerndatensatz-meta`).

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| [HDB-1014](https://hl7germany.atlassian.net/browse/HDB-1014) | Meta CpS | Concerns the CapabilityStatement of the Meta module. | Discuss | no |
| [HDB-1015](https://hl7germany.atlassian.net/browse/HDB-1015) | Externe Quelle github? | Concerns the conformance section of the Meta module. | Discuss | no |

