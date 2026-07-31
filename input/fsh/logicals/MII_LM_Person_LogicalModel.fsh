Logical: MII_LM_Person
Parent: Element
Id: mii-lm-person
Title: "MII LM Person"
Description: "Logische Repräsentation des Basismoduls Person"
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/LogicalModel/Person"
* insert PR_CS_VS_Version
* insert Publisher
* insert LicenseCodeableCCBY40
* insert CRMIShareableStructureDefinition
* insert CRMIPublishableStructureDefinition
* insert CRMIKnowledgeCapabilitiesStructureDefinition
* insert CRMIVersionPolicyStrict
* insert CRMIPackageSourceDefinitionalResource
* insert CRMIArtifactUsageLogicalModel
* insert CRMIApprovalDate(2024-03-07)
* insert CRMIResourceEffectivePeriod
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C16960)
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C25190)
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C81239)
* insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C25717)
* insert CRMIArtifactContributors
* ^status = #active
* ^experimental = false
* ^date = "2026-06-09"
* ^purpose = "Define the person-related information model independently of a concrete FHIR resource representation."
* . ^short = "-- Überschrift --"
* . insert Translation(^short, en, -- Heading --)
* Name 0..* BackboneElement "Vollständiger Name einer Person." "Vollständiger Name einer Person."
* Name insert Translation(^short, en, Full name of a person)
  * Vorname 0..* string "Vollständiger Vorname einer Person." "Vollständiger Vorname einer Person."
  * Vorname insert Translation(^short, en, Full given name of a person)
  * Nachname 0..1 string "Nachname einer Person ohne Vor- und Zusätze. Dient z.B. der alphabetischen Einordnung des Namens." "Nachname einer Person ohne Vor- und Zusätze. Dient z.B. der alphabetischen Einordnung des Namens."
  * Nachname insert Translation(^short, en, Last name of a person without prefixes and suffixes. Serves e.g. the alphabetical classification of the name.)
  * Familienname 0..1 string "Der vollständige Familienname, einschließlich aller Vorsatz- und Zusatzwörter, mit Leerzeichen getrennt." "Der vollständige Familienname, einschließlich aller Vorsatz- und Zusatzwörter, mit Leerzeichen getrennt."
  * Familienname insert Translation(^short, en, [[The full family name, including all prefix and suffix words, separated by spaces.]])
  * Vorsatzwort 0..1 string "Vorsatzwort wie z.B.: von, van, zu Vgl. auch VSDM-Spezifikation der Gematik (Versichertenstammdatenmanagement, \"eGK\")" "Vorsatzwort wie z.B.: von, van, zu Vgl. auch VSDM-Spezifikation der Gematik (Versichertenstammdatenmanagement, \"eGK\")"
  * Vorsatzwort insert Translation(^short, en, [[Prefix word such as: \"von\", \"van\", \"zu\", cf. also VSDM specification of Gematik (Versichertenstammdatenmanagement, \"eGK\")]])
  * Namenszusatz 0..1 string "Namenszusatz als Bestandteil das Nachnamens, wie in VSDM (Versichertenstammdatenmanagement, \"eGK\") definiert. Beispiele: Gräfin, Prinz oder Fürst" "Namenszusatz als Bestandteil das Nachnamens, wie in VSDM (Versichertenstammdatenmanagement, \"eGK\") definiert. Beispiele: Gräfin, Prinz oder Fürst"
  * Namenszusatz insert Translation(^short, en, [[Name suffix as part of the last name, as defined in VSDM (Versichertenstammdatenmanagement, \"eGK\"). Examples: Countess, Prince, or Prince]])
  * Praefix 0..* string "Namensteile vor dem Vornamen, z.B. akademischer Grad" "Namensteile vor dem Vornamen, z.B. akademischer Grad"
  * Praefix insert Translation(^short, en, [[Parts of the name before the first name, e.g. academic degree]])
    * ArtdesPraefixes 0..1 code "Art des Präfixes, z.B. \"AC\" für Akademische Titel" "Art des Präfixes, z.B. \"AC\" für Akademische Titel"
    * ArtdesPraefixes insert Translation(^short, en, [[Type of prefix, e.g. \"AC\" for Academic Titel]])
  * Geburtsname 0..1 string "Familienname einer Person zum Zeitpunkt ihrer Geburt. Kann sich danach z.B. durch Heirat und Annahme eines anderen Familiennamens ändern." "Familienname einer Person zum Zeitpunkt ihrer Geburt. Kann sich danach z.B. durch Heirat und Annahme eines anderen Familiennamens ändern."
  * Geburtsname insert Translation(^short, en, [[Family name of a person at the time of his or her birth. Can change afterwards, e.g. by marriage and adoption of another family name.]])
* Demographie 0..* BackboneElement "Das Basismodul Demographie enthält demographische Parameter (Alter, Geschlecht etc.)." "Das Basismodul Demographie enthält demographische Parameter (Alter, Geschlecht etc.)."
* Demographie insert Translation(^short, en, [[The basic demography module contains demographic parameters (age, gender, etc.).]])
  * AdministrativesGeschlecht 0..1 code "Administratives Geschlecht der Person" "Administratives Geschlecht der Person"
  * AdministrativesGeschlecht insert Translation(^short, en, [[Administrative sex of the person]])
  * DokumentiertesGeschlecht 0..* BackboneElement "Dokumentierte Geschlechtsangabe einer Person." "Geschlechtsangabe einer Person aus einem Dokument oder einem anderen Datensatz einschließlich optionaler Angaben zu Art, zeitlicher Gültigkeit und Provenienz. Sie repräsentiert weder eine Geschlechtsidentität noch einen klinisch relevanten Geschlechtsparameter oder Angaben zur Sexualität."
  * DokumentiertesGeschlecht insert Translation(^short, en, [[Recorded sex or gender information for a person.]])
    * Wert 1..1 CodeableConcept "Dokumentierte Geschlechtsangabe der Person." "Geschlechtsangabe der Person, wie sie in einem Dokument oder einem anderen Datensatz erfasst wurde."
    * Wert insert Translation(^short, en, [[The recorded sex or gender value for the person.]])
    * Wert from http://hl7.org/fhir/ValueSet/administrative-gender (example)
    * Typ 0..1 CodeableConcept "Art der dokumentierten Geschlechtsangabe." "Art oder Kategorie der dokumentierten Geschlechtsangabe, zum Beispiel administratives Geschlecht, administratives biologisches Geschlecht oder bei Geburt zugewiesenes Geschlecht."
    * Typ insert Translation(^short, en, [[Type of recorded sex or gender.]])
    * Typ from http://terminology.hl7.org/ValueSet/recorded-sex-or-gender-type (example)
    * Gueltigkeitszeitraum 0..1 Period "Gültigkeitszeitraum der dokumentierten Geschlechtsangabe." "Zeitraum, in dem die dokumentierte Geschlechtsangabe für die Person gilt."
    * Gueltigkeitszeitraum insert Translation(^short, en, [[When the recorded sex or gender value applies.]])
    * Erfassungszeitpunkt 0..1 dateTime "Zeitpunkt der Erfassung." "Zeitpunkt, zu dem die dokumentierte Geschlechtsangabe im System erfasst wurde."
    * Erfassungszeitpunkt insert Translation(^short, en, [[When the recorded sex or gender value was recorded.]])
    * Quelle[x] 0..1 CodeableConcept or Reference(Organization or Device or RelatedPerson or Practitioner) "Quelle der dokumentierten Geschlechtsangabe." "Codierte Angabe oder Referenz auf die Quelle der dokumentierten Geschlechtsangabe."
    * Quelle[x] insert Translation(^short, en, [[Source of the recorded sex or gender value.]])
    * Quelldokument[x] 0..1 CodeableConcept or Reference(DocumentReference) "Quelldokument der dokumentierten Geschlechtsangabe." "Referenz auf das Quelldokument oder codierte Angabe der Dokumentart, in der die Geschlechtsangabe erstmalig erfasst wurde."
    * Quelldokument[x] insert Translation(^short, en, [[Document from which the recorded sex or gender value was acquired.]])
    * ZustaendigerRechtsraum 0..1 CodeableConcept "Zuständiger Rechtsraum der Quelle." "Rechtsraum, der für die Quelle oder das Quelldokument der erfassten Geschlechtsangabe zuständig ist."
    * ZustaendigerRechtsraum insert Translation(^short, en, [[Jurisdiction responsible for the source or source document.]])
    * ZustaendigerRechtsraum from http://terminology.hl7.org/ValueSet/jurisdiction (extensible)
  * Geburtsdatum 0..1 date "Geburtsdatum des Person." "Geburtsdatum des Person."
  * Geburtsdatum insert Translation(^short, en, [[Date of birth of the patient]])
  * Adresse 0..* BackboneElement "Vollständige Anschrift einer Person für die postlische Kommunikation." "Vollständige Anschrift einer Person für die postlische Kommunikation."
  * Adresse insert Translation(^short, en, [[Full address of a person for postal communication.]])
    * Strassenanschrift 0..* BackboneElement "Eine Adresse für die Strassenanschrift gemäß postalischer Konventionen. Bei Stadtstaaten einschließlich Bezirken." "Eine Adresse für die Strassenanschrift gemäß postalischer Konventionen. Bei Stadtstaaten einschließlich Bezirken."
    * Strassenanschrift insert Translation(^short, en, [[Postal code according to the conventions valid in the respective country. For persons from city states including the city district]])
      * Land 1..1 string "Ländercode nach ISO 3166." "Ländercode nach ISO 3166."
      * Land insert Translation(^short, en, [[Country code according to ISO 3166]])
      * PLZ 1..1 string "Postleitzahl gemäß der im jeweiligen Land gültigen Konventionen." "Postleitzahl gemäß der im jeweiligen Land gültigen Konventionen."
      * PLZ insert Translation(^short, en, [[Postal code according to the conventions valid in the respective country]])
      * Wohnort 1..1 string "Bei Personen aus Stadtstaaten inklusive des Stadtteils." "Bei Personen aus Stadtstaaten inklusive des Stadtteils."
      * Wohnort insert Translation(^short, en, [[For persons from city states including the city district]])
      * Strasse 1..1 string "Straßenname mit Hausnummer oder Postfach sowie weitere Angaben zur Zustellung." "Straßenname mit Hausnummer oder Postfach sowie weitere Angaben zur Zustellung."
      * Strasse insert Translation(^short, en, [[Street name with house number or P.O. Box and other delivery details]])
    * Postfach 0..* BackboneElement "Eine Adresse für ein Postfach gemäß postalischer Konventionen. Bei Stadtstaaten einschließlich Bezirken." "Eine Adresse für ein Postfach gemäß postalischer Konventionen. Bei Stadtstaaten einschließlich Bezirken."
    * Postfach insert Translation(^short, en, [[Postal code according for a P.O box to the conventions valid in the respective country. For persons from city states including the city district.]])
      * Land 1..1 string "Ländercode nach ISO 3166." "Ländercode nach ISO 3166."
      * Land insert Translation(^short, en, [[Country code according to ISO 3166]])
      * PLZ 1..1 string "Postleitzahl gemäß der im jeweiligen Land gültigen Konventionen." "Postleitzahl gemäß der im jeweiligen Land gültigen Konventionen."
      * PLZ insert Translation(^short, en, [[Postal code according to the conventions valid in the respective country]])
      * Wohnort 1..1 string "Bei Personen aus Stadtstaaten inklusive des Stadtteils." "Bei Personen aus Stadtstaaten inklusive des Stadtteils."
      * Wohnort insert Translation(^short, en, [[For persons from city states including the city district]])
      * Strasse 1..1 string "Straßenname mit Hausnummer oder Postfach sowie weitere Angaben zur Zustellung." "Straßenname mit Hausnummer oder Postfach sowie weitere Angaben zur Zustellung."
      * Strasse insert Translation(^short, en, [[Street name with house number or P.O. Box and other delivery details]])
  * Vitalstatus 0..* BackboneElement "Gibt an, ob ein Patient verstorben ist. Falls ja, zudem den Zeitpunkt." "Gibt an, ob ein Patient verstorben ist. Falls ja, zudem den Zeitpunkt."
  * Vitalstatus insert Translation(^short, en, [[Indicates whether a patient has died. If yes, also the time is recorded.]])
    * PatientVerstorben 0..1 boolean "Gibt an, ob der Patient am Leben oder verstorben ist." "Gibt an, ob der Patient am Leben oder verstorben ist."
    * PatientVerstorben insert Translation(^short, en, [[Indicates whether the patient is alive or deceased.]])
    * Todeszeitpunkt 0..1 dateTime "Gibt den Todeszeitpunkt des Patienten an, falls dieser im KH verstorben ist. Ansonsten \"Null Flavor\"." "Gibt den Todeszeitpunkt des Patienten an, falls dieser im KH verstorben ist. Ansonsten \"Null Flavor\"."
    * Todeszeitpunkt insert Translation(^short, en, [[Indicates the time of death of the patient, if the patient died in the hospital. Otherwise \"Null flavor\".]])
    * Informationsquelle 0..* string "Quelle des Vitalstatus." "Quelle des Vitalstatus."
    * Informationsquelle insert Translation(^short, en, [[Source of vital status]])
    * ZeitpunktFeststellungDesVitalstatus 1..1 dateTime "Letzter bekannter Zeitpunkt oder Zeitraum, zudem ein Vitalstatus festgestellt wurde" "Letzter bekannter Zeitpunkt oder Zeitraum, zudem ein Vitalstatus festgestellt wurde"
    * ZeitpunktFeststellungDesVitalstatus insert Translation(^short, en, [[Last known point in time at which a vital status was recorded]])
    * Todesursache 0..1 CodeableConcept "Todesursache mit ICD-10-WHO codiert."
    * Todesursache insert Translation(^short, en, [[Reason for patient's death. Coded per ICD-10-WHO.]])
* AllergieOderUnvertraeglichkeit 0..* BackboneElement "Allergie oder Unverträglichkeit" "Dokumentierte Einschätzung einer patientenbezogenen Allergie oder Unverträglichkeit, die mit dem Risiko einer schädlichen oder unerwünschten Reaktion bei Exposition gegenüber einem bestimmten Stoff, Produkt oder einer Stoffklasse verbunden ist."
* AllergieOderUnvertraeglichkeit insert Translation(^short, en, [[Allergy or intolerance]])
  * KlinischerStatus 0..1 CodeableConcept "Klinischer Status" "Klinischer Zustand der Allergie oder Unverträglichkeit, beispielsweise aktiv, inaktiv oder abgeklungen."
  * KlinischerStatus insert Translation(^short, en, [[Clinical status]])
  * KlinischerStatus from http://hl7.org/fhir/ValueSet/allergyintolerance-clinical (required)
  * Verifikationsstatus 0..1 CodeableConcept "Verifikationsstatus" "Grad der fachlichen Bestätigung der Allergie oder Unverträglichkeit, beispielsweise unbestätigt, bestätigt oder widerlegt."
  * Verifikationsstatus insert Translation(^short, en, [[Verification status]])
  * Verifikationsstatus from http://hl7.org/fhir/ValueSet/allergyintolerance-verification (required)
  * Art 0..1 code "Art" "Einordnung als Allergie oder Unverträglichkeit, sofern der zugrunde liegende Mechanismus bekannt ist."
  * Art insert Translation(^short, en, [[Type]])
  * Art from http://hl7.org/fhir/ValueSet/allergy-intolerance-type (required)
  * Kategorie 0..1 code "Kategorie" "Kategorie des auslösenden Stoffes, beispielsweise Arzneimittel, Lebensmittel, Umweltstoff oder biologischer Stoff."
  * Kategorie insert Translation(^short, en, [[Category]])
  * Kategorie from http://hl7.org/fhir/ValueSet/allergy-intolerance-category (required)
  * Kritikalitaet 0..1 code "Kritikalität" "Einschätzung des potenziellen klinischen Schadens bei einer zukünftigen Exposition."
  * Kritikalitaet insert Translation(^short, en, [[Criticality]])
  * Kritikalitaet from http://hl7.org/fhir/ValueSet/allergy-intolerance-criticality (required)
  * AllergieOderUnvertraeglichkeitGegen 1..1 CodeableConcept "Allergie oder Unverträglichkeit gegen" "Stoff, Produkt, Stoffklasse oder Allergie-/Unverträglichkeitsbegriff, auf den sich die dokumentierte Gefährdung bezieht."
  * AllergieOderUnvertraeglichkeitGegen insert Translation(^short, en, [[Substance, product, class, or allergy or intolerance concept]])
  * AllergieOderUnvertraeglichkeitGegen from http://hl7.org/fhir/ValueSet/allergyintolerance-code (example)
  * Patient 1..1 Reference(Patient) "Patient" "Patient, bei dem die Allergie oder Unverträglichkeit besteht beziehungsweise dokumentiert wurde."
  * Patient insert Translation(^short, en, [[Patient with the allergy or intolerance]])
  * Kontakt 0..1 Reference(Encounter) "Kontakt" "Kontakt, in dessen Zusammenhang die Allergie oder Unverträglichkeit dokumentiert wurde."
  * Kontakt insert Translation(^short, en, [[Encounter associated with the allergy or intolerance]])
  * Beginn[x] 0..1 dateTime or Age or Period or Range or string "Beginn" "Zeitpunkt, Zeitraum, Lebensalter oder andere zeitliche Angabe zum erstmaligen Auftreten der Allergie oder Unverträglichkeit."
  * Beginn[x] insert Translation(^short, en, [[Onset of the allergy or intolerance]])
  * Dokumentationsdatum 0..1 dateTime "Dokumentationsdatum" "Zeitpunkt, zu dem die Allergie oder Unverträglichkeit erstmals im dokumentierenden System erfasst wurde."
  * Dokumentationsdatum insert Translation(^short, en, [[Date when the allergy or intolerance was first recorded]])
  * UnerwuenschteReaktion 0..* BackboneElement "Unerwünschte Reaktion" "Angaben zu einer beobachteten unerwünschten Reaktion nach Exposition gegenüber dem betreffenden Stoff oder Produkt."
  * UnerwuenschteReaktion insert Translation(^short, en, [[Observed adverse reaction]])
    * Manifestation 1..* CodeableConcept "Manifestation" "Klinische Symptome oder Befunde, die im Zusammenhang mit der unerwünschten Reaktion beobachtet wurden."
    * Manifestation insert Translation(^short, en, [[Clinical manifestation of the adverse reaction]])
    * Manifestation from http://hl7.org/fhir/ValueSet/clinical-findings (example)
    * Schweregrad 0..1 code "Schweregrad" "Schweregrad der tatsächlich aufgetretenen Reaktion."
    * Schweregrad insert Translation(^short, en, [[Severity of the observed reaction]])
    * Schweregrad from http://hl7.org/fhir/ValueSet/reaction-event-severity (required)
    * Expositionsweg 0..1 CodeableConcept "Expositionsweg" "Weg, über den der Patient dem auslösenden Stoff oder Produkt ausgesetzt war."
    * Expositionsweg insert Translation(^short, en, [[Route of exposure]])
    * Expositionsweg from http://hl7.org/fhir/ValueSet/route-codes (example)
* PatientIn 0..* BackboneElement "Person, die in einer oder mehreren Gesundheitseinrichtungen behandelt wird" "Person, die in einer oder mehreren Gesundheitseinrichtungen behandelt wird"
* PatientIn insert Translation(^short, en, [[Person receiving treatment in one or more health care facilities]])
  * PatientenIdentifikator 0..* BackboneElement "Identifikation des Patienten in Verschiedenen Gesundheitseinrichtungen, Einrichtungskennzeichen kann als \"Codesystem\" gesehen werden, und Patienten-Identifikator als \"Code\"" "Identifikation des Patienten in Verschiedenen Gesundheitseinrichtungen, Einrichtungskennzeichen kann als \"Codesystem\" gesehen werden, und Patienten-Identifikator als \"Code\""
    * PatientenIdentifikator 0..* Identifier "Gesundheitseinrichtungs-eigene Identifikationsnummer für einen Patienten" "Gesundheitseinrichtungs-eigene Identifikationsnummer für einen Patienten"
    * PatientenIdentifikator insert Translation(^short, en, [[Health facility unique identification number for a patient.]])
    * PatientenIdentifikatorKontext 1..1 CodeableConcept "Der Kontext des Patienten-Identifikators um den Patienten-Identifikator zu Beschreiben, da der Patient innerhalb einer Gesundheitseinrichtung möglicherweise pro System eine Nummer (Im Krankenhaus: Labor, Radiologie, Internistische Station etc.) bekommt." "Der Kontext des Patienten-Identifikators um den Patienten-Identifikator zu Beschreiben, da der Patient innerhalb einer Gesundheitseinrichtung möglicherweise pro System eine Nummer (Im Krankenhaus: Labor, Radiologie, Internistische Station etc.) bekommt."
    * PatientenIdentifikatorKontext insert Translation(^short, en, [[The context of the patient identifier to describe the patient identifier, since the patient within a healthcare facility may be assigned a number per system (in the hospital: \"laboratory\", \"radiology\", \"internal medicine ward\", etc.).]])
  * Versicherung 0..* BackboneElement "Aktuell gültige Versicherung der Patient:in welcher zur Abrechnung der Behandlungsleistung verwendet wird." "Aktuell gültige Versicherung der Patient:in welcher zur Abrechnung der Behandlungsleistung verwendet wird."
  * Versicherung insert Translation(^short, en, [[Patient's current valid insurance which is used to bill the medical healthcare services.]])
    * InstitutionskennzeichenDerKrankenkasse 0..* string "Die Institutionskennzeichen (kurz: IK) sind bundesweit eindeutige, neunstellige Zahlen, mit deren Hilfe Abrechnungen und Qualitätssicherungsmaßnahmen im Bereich der deutschen Sozialversicherung einrichtungsübergreifend abgewickelt werden können." "Die Institutionskennzeichen (kurz: IK) sind bundesweit eindeutige, neunstellige Zahlen, mit deren Hilfe Abrechnungen und Qualitätssicherungsmaßnahmen im Bereich der deutschen Sozialversicherung einrichtungsübergreifend abgewickelt werden können."
    * InstitutionskennzeichenDerKrankenkasse insert Translation(^short, en, [[The institutional identifiers (IK for short) are nationwide unique nine-digit numbers that can be used to process billing and quality assurance measures across institutions in the German social insurance sector.]])
    * InstitutionskennzeichenDerKrankenkasse ^maxLength = 9
    * Versicherungstyp 1..1 CodeableConcept "Versicherungstyp des Patienten" "Versicherungstyp des Patienten"
    * Versicherungstyp insert Translation(^short, en, [[Insurance type of the patient]])
    * Versichertennummer 0..1 BackboneElement "Angaben zur Identifikation der versicherten Person" "Angaben zur Identifikation der versicherten Person"
    * Versichertennummer insert Translation(^short, en, [[Information for the identification of the insured person]])
      * VersichertenIDGKV 0..1 string "Unveränderlicher Teil der Krankenversichertennummer (VersichertenID) bei GKV Patienten. Diese findet sich z.B. auf der Mitgliedskarte der Krankenkasse." "Unveränderlicher Teil der Krankenversichertennummer (VersichertenID) bei GKV Patienten. Diese findet sich z.B. auf der Mitgliedskarte der Krankenkasse."
      * VersichertenIDGKV insert Translation(^short, en, [[Unchangeable part of the health insurance number (insured ID) for SHI patients. This can be found, for example, on the health insurance compan's membership card.]])
      * VersichertennummerPKV 0..1 string "Versichertennummer bei PKV Patienten. Vergabe erfolgt durch die jeweilige Private Krankenversicherung." "Versichertennummer bei PKV Patienten. Vergabe erfolgt durch die jeweilige Private Krankenversicherung."
      * VersichertennummerPKV insert Translation(^short, en, [[Insurance number for private health insurance patients. The number is assigned by the respective private health insurance company.]])
* ProbandIn 0..* BackboneElement "Person, die an einer Studie teilnimmt (unter Umständen, während sie Patient:in in einer Gesundheitseinrichtung ist)" "Person, die an einer Studie teilnimmt (unter Umständen, während sie Patient:in in einer Gesundheitseinrichtung ist)"
* ProbandIn insert Translation(^short, en, [[Person participating in a study (in some circumstances, while being a patient in a health care facility)]])
  * SubjektIdentifizierungscode 0..* Identifier "Eindeutiger Identifikator eines Patienten im Kontext eines Forschungsprojekts (klinische Studie, Use Case)" "Eindeutiger Identifikator eines Patienten im Kontext eines Forschungsprojekts (klinische Studie, Use Case)"
  * SubjektIdentifizierungscode insert Translation(^short, en, [[Unique identifier of a patient in the context of a research project (clinical study, use case)]])
  * Rechtsgrundlage 0..* Reference(Consent) "Rechtsgrundlage (z.B. Einwilligung) aufgrund die PatientIn in die Studie eingeschlossen werden darf." "Rechtsgrundlage (z.B. Einwilligung) aufgrund die PatientIn in die Studie eingeschlossen werden darf."
  * Rechtsgrundlage insert Translation(^short, en, [[Legal basis (e.g. consent) on the basis of which the patient may be included in the study.]])
  * BeginnTeilnahme 1..1 dateTime "Beginn der Teilnahme der Person an der Studie." "Beginn der Teilnahme der Person an der Studie."
  * BeginnTeilnahme insert Translation(^short, en, [[Start of the person's participation in the study]])
  * EndeTeilnahme 0..1 dateTime "Ende der Teilnahme der Person an der Studie." "Ende der Teilnahme der Person an der Studie."
  * EndeTeilnahme insert Translation(^short, en, [[End of the person's participation in the study]])
  * StatusDerTeilnahme 1..1 code "Stand der Teilnahme einer Person an der Studie, z.B. eingeschlossen, widerrufen, abgeschlossen etc." "Stand der Teilnahme einer Person an der Studie, z.B. eingeschlossen, widerrufen, abgeschlossen etc."
  * StatusDerTeilnahme insert Translation(^short, en, [[Status of a person's participation in the study, e.g., \"included\", \"revoked\", \"completed\", etc.]])
  * BezeichnungDerStudie 0..* Identifier "Identifikator der Studie" "Identifikator der Studie"
  * BezeichnungDerStudie insert Translation(^short, en, [[Unique id of the study]])
* PatientInPseudonym 0..* BackboneElement "Pseudonymisierte Repräsentation einer dazueghörigen Patient:in" "Pseudonymisierte Repräsentation einer dazueghörigen Patient:in"
* PatientInPseudonym insert Translation(^short, en, [[Pseudonymised representation of a corresponding Patient]])
  * Pseudonym 0..* Identifier "Neu generierte Identifikation der PatientIn mit Bezug zum Original-Identifikator in einer Treuhandstelle." "Neu generierte Identifikation der PatientIn mit Bezug zum Original-Identifikator in einer Treuhandstelle."
  * Pseudonym insert Translation(^short, en, [[Newly generated identification of the patient with reference to the original identifier in a trust center.]])
  //* GeburtsdatumQuartal 0..* date "Vergröberung auf Quartal und Jahr." "Vergröberung auf Quartal und Jahr."
  //* GeburtsdatumQuartal insert Translation(^short, en, [[Rounded up to quarter and year.]])
  //* Todesdatum 0..* dateTime "Zeitpunkt des Todes begrenzt auf Jahr, Monat und Tag." "Zeitpunkt des Todes begrenzt auf Jahr, Monat und Tag."
  //* Todesdatum insert Translation(^short, en, [[Time of death limited to year, month and day.]])
  //* VergroebertePLZ 0..* string "Erste zwei Stellen der Postleitzahl" "Erste zwei Stellen der Postleitzahl"
  //* VergroebertePLZ insert Translation(^short, en, [[First two digits of the postal code]])

Mapping: Person-LogicalModel
Id: FHIR
Title: "Person LogicalModel FHIR Mapping"
Source: MII_LM_Person
Target: "http://hl7.org/fhir/StructureDefinition/Patient|4.0.1"
* PatientIn.Versicherung.Versichertennummer.VersichertenIDGKV -> "Patient.identifier:versichertenId_GKV"
* PatientIn.Versicherung.Versichertennummer.VersichertennummerPKV -> "Patient.identifier:versicherungsnummer_pkv"
* PatientIn.Versicherung -> "Patient.identifier:default"
* PatientIn.PatientenIdentifikator.PatientenIdentifikator -> "Patient.identifier:pid"
* Name -> "Patient.name"
  * Vorname -> "Patient.name.given"
  * Familienname -> "Patient.name.family"
  * Nachname -> "Patient.name.family.extension.nachname"
  * Vorsatzwort -> "Patient.name.family.extension.vorsatzwort"
  * Namenszusatz -> "Patient.name.family.extension.namenszusatz"
  * Praefix -> "Patient.name.prefix"
    * ArtdesPraefixes -> "Patient.name.prefix.extension-prefix-qualifier"
  * Geburtsname -> "Patient.name.use"
* Demographie.AdministrativesGeschlecht -> "Patient.gender"
* Demographie.DokumentiertesGeschlecht -> "Patient.extension:recordedSexOrGender"
  * Wert -> "Patient.extension:recordedSexOrGender.extension:value.valueCodeableConcept"
  * Typ -> "Patient.extension:recordedSexOrGender.extension:type.valueCodeableConcept"
  * Gueltigkeitszeitraum -> "Patient.extension:recordedSexOrGender.extension:effectivePeriod.valuePeriod"
  * Erfassungszeitpunkt -> "Patient.extension:recordedSexOrGender.extension:acquisitionDate.valueDateTime"
  * Quelle[x] -> "Patient.extension:recordedSexOrGender.extension:source.value[x]"
  * Quelldokument[x] -> "Patient.extension:recordedSexOrGender.extension:sourceDocument.value[x]"
  * ZustaendigerRechtsraum -> "Patient.extension:recordedSexOrGender.extension:jurisdiction.valueCodeableConcept"
* Demographie.Geburtsdatum -> "Patient.birthDate"
* Demographie.Vitalstatus.PatientVerstorben -> "Patient.deceased[x]"
* Demographie.Vitalstatus.Todeszeitpunkt -> "Patient.deceased[x]"
* Demographie.Adresse -> "Patient.address"
  * Strassenanschrift.Land -> "Patient.address.country"
  * Strassenanschrift.PLZ -> "Patient.address.postalCode"
  * Strassenanschrift.Wohnort -> "Patient.address.city + Patient.address.extension.Stadtteil"
  * Strassenanschrift.Strasse -> "Patient.address.line"
  * Postfach.Land -> "Patient.address.country"
  * Postfach.PLZ -> "Patient.address.postalCode"
  * Postfach.Wohnort -> "Patient.address.city + Patient.address.extension.Stadtteil"
  * Postfach.Strasse -> "Patient.address.line"
* PatientInPseudonym
  * Pseudonym -> "Patient.identifier:PseudonymisierterIdentifier"

Mapping: Person-AllergyIntolerance-LogicalModel
Id: AllergyIntolerance
Title: "Person LogicalModel AllergyIntolerance Mapping"
Source: MII_LM_Person
Target: "http://hl7.org/fhir/StructureDefinition/AllergyIntolerance|4.0.1"
* AllergieOderUnvertraeglichkeit -> "AllergyIntolerance"
  * KlinischerStatus -> "AllergyIntolerance.clinicalStatus"
  * Verifikationsstatus -> "AllergyIntolerance.verificationStatus"
  * Art -> "AllergyIntolerance.type"
  * Kategorie -> "AllergyIntolerance.category"
  * Kritikalitaet -> "AllergyIntolerance.criticality"
  * AllergieOderUnvertraeglichkeitGegen -> "AllergyIntolerance.code"
  * Patient -> "AllergyIntolerance.patient"
  * Kontakt -> "AllergyIntolerance.encounter"
  * Beginn[x] -> "AllergyIntolerance.onset[x]"
  * Dokumentationsdatum -> "AllergyIntolerance.recordedDate"
  * UnerwuenschteReaktion -> "AllergyIntolerance.reaction"
    * Manifestation -> "AllergyIntolerance.reaction.manifestation"
    * Schweregrad -> "AllergyIntolerance.reaction.severity"
    * Expositionsweg -> "AllergyIntolerance.reaction.exposureRoute"
