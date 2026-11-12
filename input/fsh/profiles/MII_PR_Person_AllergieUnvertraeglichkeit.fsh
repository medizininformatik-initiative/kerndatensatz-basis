Profile: MII_PR_Person_AllergieUnvertraeglichkeit
Parent: AllergyIntolerance
Id: mii-pr-person-allergieunvertraeglichkeit
Title: "MII PR Person Allergy Intolerance"
Description: "This profile describes an allergy or intolerance in the Medical Informatics Initiative."
* ^url = "https://www.medizininformatik-initiative.de/fhir/modul-person/StructureDefinition/AllergieUnvertraeglichkeit"
* insert Translation(^title, de, Allergie / Unverträglichkeit)
* insert Translation(^description, de, Eine dokumentierte Allergie oder Unverträglichkeit der Patientin oder des Patienten.)
* insert PR_CS_VS_Version
* insert Publisher
* insert LicenseCodeableCCBY40
* insert CRMIShareableStructureDefinition
* insert CRMIPublishableStructureDefinition
* insert CRMIKnowledgeCapabilitiesStructureDefinition
* insert CRMIVersionPolicyStrict
* insert CRMIPackageSourceDefinitionalResource
* insert CRMIArtifactUsageProfile
//* insert CRMIApprovalDate(2024-03-07)
* insert CRMIResourceEffectivePeriod
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C114476)
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C71437)
* insert CRMIArtifactContributors
* ^status = #active
* ^experimental = false
* ^date = "2026-09-04"
* ^purpose = "Constrain the FHIR AllergyIntolerance resource for consistent exchange of allergy and intolerance information in the MII Person module."
* id MS
* meta MS
* meta.source MS
* meta.profile MS
* extension contains $allergyintolerance-abatement named abatement 0..1
* extension[abatement].valueDateTime ^short = "End date"
* insert Translation(extension[abatement].valueDateTime ^short, de, Enddatum)
* extension[abatement].valueDateTime MS
* extension[abatement].valueRange MS
* extension[abatement].valueRange ^short = "End as age range"
* insert Translation(extension[abatement].valueRange ^short, de, Ende als Altersbereich)
* extension[abatement].valueRange.extension contains ExtensionLebensphase named Lebensphase-Ende 0..1
* extension[abatement].valueRange.extension[Lebensphase-Ende] ^short = "Life phase in which the allergy or intolerance ended"
* insert Translation(extension[abatement].valueRange.extension[Lebensphase-Ende] ^short, de, Lebensphase des Endes)
* extension[abatement].valueRange.extension[Lebensphase-Ende] ^comment = "Alternative when a more precise period cannot be given, especially for anamnestic information."
* insert Translation(extension[abatement].valueRange.extension[Lebensphase-Ende] ^comment, de, [[Alternative Angabe, wenn genauere Eingrenzungen des Zeitraums nicht möglich sind, insbesondere im Kontext anamnestischer Angaben.]])
* extension[abatement].valueRange.extension[Lebensphase-Ende].url MS
* extension[abatement].valueRange.extension[Lebensphase-Ende].valueCodeableConcept MS
* extension[abatement].valueRange.extension[Lebensphase-Ende].valueCodeableConcept.coding MS
* extension[abatement].valueRange.extension[Lebensphase-Ende].valueCodeableConcept.coding.system MS
* extension[abatement].valueRange.extension[Lebensphase-Ende].valueCodeableConcept.coding.code MS
// Element metadata uses concise English text based on FHIR R4 Core and HL7 EU as its base value and German logical-model text as a `de` translation.
* clinicalStatus MS
* clinicalStatus ^short = "Current allergy or intolerance status"
* insert Translation(clinicalStatus ^short, de, Klinischer Status)
* clinicalStatus ^definition = "The current clinical status of the allergy or intolerance."
* insert Translation(clinicalStatus ^definition, de, [[Klinischer Zustand der Allergie oder Unverträglichkeit, beispielsweise aktiv, inaktiv oder abgeklungen.]])
* clinicalStatus.coding MS
* clinicalStatus.coding.system MS
* clinicalStatus.coding.code MS
* verificationStatus MS
* verificationStatus ^short = "Certainty"
* insert Translation(verificationStatus ^short, de, Verifikationsstatus)
* verificationStatus ^definition = "Assertion about certainty associated with the propensity or potential risk of a reaction to the identified substance, including a pharmaceutical product."
* insert Translation(verificationStatus ^definition, de, [[Grad der fachlichen Bestätigung der Allergie oder Unverträglichkeit, beispielsweise unbestätigt, bestätigt oder widerlegt.]])
* verificationStatus.coding MS
* verificationStatus.coding.system MS
* verificationStatus.coding.code MS
* type MS
* type ^short = "Type of propensity"
* insert Translation(type ^short, de, Art)
* type ^definition = "Identifies the underlying physiological mechanism for the reaction risk."
* insert Translation(type ^definition, de, [[Einordnung als Allergie oder Unverträglichkeit, sofern der zugrunde liegende Mechanismus bekannt ist.]])
* category MS
* category ^short = "Category of the identified substance"
* insert Translation(category ^short, de, Kategorie)
* category ^definition = "Category assigned to the identified substance."
* insert Translation(category ^definition, de, [[Kategorie des auslösenden Stoffes, beispielsweise Arzneimittel, Lebensmittel, Umweltstoff oder biologischer Stoff.]])
* criticality MS
* criticality ^short = "Criticality"
* insert Translation(criticality ^short, de, Kritikalität)
* criticality ^definition = "Estimate of the potential clinical harm or seriousness of a reaction to the identified substance."
* insert Translation(criticality ^definition, de, Einschätzung des potenziellen klinischen Schadens bei einer zukünftigen Exposition.)
* code 1..1 MS
* code ^short = "Code identifying the allergy or intolerance"
* insert Translation(code ^short, de, Allergie oder Unverträglichkeit gegen)
* code ^definition = "Code for an allergy or intolerance statement, including positive and negated or excluded statements. It may identify a substance, pharmaceutical product, substance class, allergy or intolerance condition, or a general categorical absence statement. A substance recorded for a specific reaction may be more specific than AllergyIntolerance.code but must remain semantically consistent with it. Implementations must be clinically safe when processing code without reaction.substance; if that consistency cannot be confirmed, reaction.substance should be ignored."
* insert Translation(code ^definition, de, [[Stoff, Produkt, Stoffklasse oder Allergie-/Unverträglichkeitsbegriff, auf den sich die dokumentierte Gefährdung bezieht.]])
* code.coding MS
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains snomed-ct 0..1 MS
* code.coding.system MS
* code.coding.code MS
* insert AddSnomedCodingTranslation(code.coding[snomed-ct])
* code.coding[snomed-ct] ^patternCoding.system = "http://snomed.info/sct"
* code.coding[snomed-ct] ^comment = "The substance ValueSet was developed by mio42 GmbH together with BfArM; it is bound extensible because its completeness cannot be guaranteed. Aligned with ISiK."
* insert Translation(code.coding[snomed-ct] ^comment, de, [[Das ValueSet der auslösenden Substanzen wurde von der mio42 GmbH gemeinsam mit dem BfArM erarbeitet; es ist extensible gebunden, da seine Vollständigkeit nicht garantiert werden kann. Abgestimmt mit ISiK.]])
* code.coding[snomed-ct] from $kbv-vs-allergy-substance (extensible)
* code.coding[snomed-ct].system 1.. MS
* code.coding[snomed-ct].code 1.. MS
* patient MS
* patient ^short = "Who the allergy or intolerance concerns"
* insert Translation(patient ^short, de, Patient)
* patient ^definition = "The patient concerned by the allergy or intolerance."
* insert Translation(patient ^definition, de, [[Patient, bei dem die Allergie oder Unverträglichkeit besteht beziehungsweise dokumentiert wurde.]])
* patient.reference MS
* encounter MS
* encounter ^short = "Encounter in which the allergy or intolerance was asserted"
* insert Translation(encounter ^short, de, Kontakt)
* encounter ^definition = "The encounter during which the allergy or intolerance was asserted."
* insert Translation(encounter ^definition, de, [[Kontakt, in dessen Zusammenhang die Allergie oder Unverträglichkeit dokumentiert wurde.]])
* encounter.reference MS
* onset[x] MS
* onset[x] ^short = "Date of onset of the allergy or intolerance"
* insert Translation(onset[x] ^short, de, Beginn)
* onset[x] ^definition = "The estimated or actual date, date-time, age, or other period when the allergy or intolerance was identified."
* insert Translation(onset[x] ^definition, de, [[Zeitpunkt, Zeitraum, Lebensalter oder andere zeitliche Angabe zum erstmaligen Auftreten der Allergie oder Unverträglichkeit.]])
* onsetDateTime MS
* onsetRange MS
* onsetRange ^short = "Onset as age range"
* insert Translation(onsetRange ^short, de, Beginn als Altersbereich)
* onsetRange.extension contains ExtensionLebensphase named Lebensphase-Beginn 0..1
* onsetRange.extension[Lebensphase-Beginn] ^short = "Life phase in which the allergy or intolerance began"
* insert Translation(onsetRange.extension[Lebensphase-Beginn] ^short, de, Lebensphase des Beginns)
* onsetRange.extension[Lebensphase-Beginn] ^comment = "Alternative when a more precise period cannot be given, especially for anamnestic information."
* insert Translation(onsetRange.extension[Lebensphase-Beginn] ^comment, de, [[Alternative Angabe, wenn genauere Eingrenzungen des Zeitraums nicht möglich sind, insbesondere im Kontext anamnestischer Angaben.]])
* onsetRange.extension[Lebensphase-Beginn].url MS
* onsetRange.extension[Lebensphase-Beginn].valueCodeableConcept MS
* onsetRange.extension[Lebensphase-Beginn].valueCodeableConcept.coding MS
* onsetRange.extension[Lebensphase-Beginn].valueCodeableConcept.coding.system MS
* onsetRange.extension[Lebensphase-Beginn].valueCodeableConcept.coding.code MS
* recordedDate MS
* recordedDate ^short = "Date when the allergy or intolerance was recorded"
* insert Translation(recordedDate ^short, de, Dokumentationsdatum)
* recordedDate ^definition = "The date when this AllergyIntolerance record was first created in the system, often generated automatically."
* insert Translation(recordedDate ^definition, de, [[Zeitpunkt, zu dem die Allergie oder Unverträglichkeit erstmals im dokumentierenden System erfasst wurde.]])
* reaction MS
* reaction ^short = "Adverse reaction events linked to substance exposure"
* insert Translation(reaction ^short, de, Unerwünschte Reaktion)
* reaction ^definition = "Details of each adverse reaction event linked to exposure to the identified substance."
* insert Translation(reaction ^definition, de, Angaben zu einer beobachteten unerwünschten Reaktion nach Exposition gegenüber dem betreffenden Stoff oder Produkt.)
* reaction.manifestation MS
* reaction.manifestation ^short = "Clinical symptoms or signs associated with the reaction event"
* insert Translation(reaction.manifestation ^short, de, Manifestation)
* reaction.manifestation ^definition = "Clinical symptoms and/or signs observed or associated with the adverse reaction event."
* insert Translation(reaction.manifestation ^definition, de, [[Klinische Symptome oder Befunde, die im Zusammenhang mit der unerwünschten Reaktion beobachtet wurden.]])
* reaction.manifestation.coding MS
* reaction.manifestation.coding ^slicing.discriminator.type = #pattern
* reaction.manifestation.coding ^slicing.discriminator.path = "$this"
* reaction.manifestation.coding ^slicing.rules = #open
* reaction.manifestation.coding contains snomed-ct 0..1 MS
* reaction.manifestation.coding.system MS
* reaction.manifestation.coding.code MS
* insert AddSnomedCodingTranslation(reaction.manifestation.coding[snomed-ct])
* reaction.manifestation.coding[snomed-ct] ^patternCoding.system = "http://snomed.info/sct"
* reaction.manifestation.coding[snomed-ct] from $kbv-vs-allergy-manifestation (extensible)
* reaction.manifestation.coding[snomed-ct].system 1.. MS
* reaction.manifestation.coding[snomed-ct].code 1.. MS
* reaction.severity MS
* reaction.severity ^short = "Reaction severity"
* insert Translation(reaction.severity ^short, de, Schweregrad)
* reaction.severity ^definition = "Clinical assessment of the severity of the reaction event as a whole, potentially taking multiple manifestations into account."
* insert Translation(reaction.severity ^definition, de, Schweregrad der tatsächlich aufgetretenen Reaktion.)
* reaction.exposureRoute MS
* reaction.exposureRoute ^short = "Route by which the subject was exposed to the substance"
* insert Translation(reaction.exposureRoute ^short, de, Expositionsweg)
* reaction.exposureRoute ^definition = "Identifies the route by which the subject was exposed to the substance."
* insert Translation(reaction.exposureRoute ^definition, de, [[Weg, über den der Patient dem auslösenden Stoff oder Produkt ausgesetzt war.]])
* reaction.exposureRoute.coding MS
* reaction.exposureRoute.coding.system MS
* reaction.exposureRoute.coding.code MS
