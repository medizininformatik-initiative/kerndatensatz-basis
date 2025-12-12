Profile: MII_PR_Fall_KontaktGesundheitseinrichtung
Parent: Encounter
Id: mii-pr-fall-kontakt-gesundheitseinrichtung
Title: "MII PR Fall Kontakt mit einer Gesundheitseinrichtung"
Description: "Kontakt zu einer Einrichtung, Abteilung oder Versorgungsstelle"
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung"
* insert Translation(^title, de-DE, Fall - Kontakt mit einer Gesundheitseinrichtung)
* insert Translation(^title, en-US, Treatment case - Encounter with Health Care Facility)
* insert PR_CS_VS_Version
* insert LicenseCodeableCCBY40
* obeys mii-enc-1 and mii-enc-2 and mii-enc-3 and mii-enc-4 and mii-enc-5 and mii-enc-6 and mii-enc-7
* ^date = "2025-12-12"
* id MS
* id ^definition = "Angabe OPTIONAL, vom Server automatisch vergebene system-abhängige ID"
* meta MS
* meta ^definition = "Angabe OPTIONAL zur Provenance und zum Profil"
* meta.source MS
* meta.profile MS
* extension contains $ExtensionAufnahmegrund named Aufnahmegrund 0..1 MS and
  http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedStartDate named plannedStartDate 0..1 and 
  http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedEndDate named plannedEndDate 0..1
* extension[Aufnahmegrund] ^short = "Aufnahmegrund"
* insert Translation(extension[Aufnahmegrund] ^short, de-DE, Aufnahmegrund)
* insert Translation(extension[Aufnahmegrund] ^short, en-US, Admission reason)
* extension[Aufnahmegrund] ^definition = """
    OPTIONAL, Aufnahmegrund entsprechend Schlüssel 1 der Anlage 2 der Datenübermittlung nach § 301 Abs. 3 SGB V
    """
* insert Translation(extension[Aufnahmegrund] ^definition, de-DE, Aufnahmegrund nach Schlüssel 1\, Anlage 2\, Datenübermittlung nach § 301 Abs. 3 SGB V)
* insert Translation(extension[Aufnahmegrund] ^definition, en-US, Admission reason according to key 1\, appendix 2\, data transmission according to § 301 para. 3 SGB V)
* extension[Aufnahmegrund].extension[ErsteUndZweiteStelle] MS
* extension[Aufnahmegrund].extension[ErsteUndZweiteStelle] ^short = "1. und 2. Stelle"
* insert Translation(extension[Aufnahmegrund].extension[ErsteUndZweiteStelle] ^short, de-DE, 1. und 2. Stelle)
* insert Translation(extension[Aufnahmegrund].extension[ErsteUndZweiteStelle] ^short, en-US, 1st and 2nd position)
* extension[Aufnahmegrund].extension[ErsteUndZweiteStelle] ^definition = """
    OPTIONAL, Aufnahmegrund (1. und 2. Stelle), Datenübermittlung nach § 301 Abs. 3 SGB V.
    """
* insert Translation(extension[Aufnahmegrund].extension[ErsteUndZweiteStelle] ^definition, de-DE, Aufnahmegrund 1. und 2. Stelle)
* insert Translation(extension[Aufnahmegrund].extension[ErsteUndZweiteStelle] ^definition, en-US, Admission reason 1st and 2nd position)
* extension[Aufnahmegrund].extension[DritteStelle] MS
* extension[Aufnahmegrund].extension[DritteStelle] ^short = "3. Stelle"
* insert Translation(extension[Aufnahmegrund].extension[DritteStelle] ^short, de-DE, 3. Stelle)
* insert Translation(extension[Aufnahmegrund].extension[DritteStelle] ^short, en-US, 3rd position)
* extension[Aufnahmegrund].extension[DritteStelle] ^definition = """
    OPTIONAL, Aufnahmegrund (3. Stelle), Datenübermittlung nach § 301 Abs. 3 SGB V.
    """
* insert Translation(extension[Aufnahmegrund].extension[DritteStelle] ^definition, de-DE, Aufnahmegrund 3. Stelle)
* insert Translation(extension[Aufnahmegrund].extension[DritteStelle] ^definition, en-US, Admission reason 3rd position)
* extension[Aufnahmegrund].extension[VierteStelle] MS
* extension[Aufnahmegrund].extension[VierteStelle] ^short = "4. Stelle"
* insert Translation(extension[Aufnahmegrund].extension[VierteStelle] ^short, de-DE, 4. Stelle)
* insert Translation(extension[Aufnahmegrund].extension[VierteStelle] ^short, en-US, 4th position)
* extension[Aufnahmegrund].extension[VierteStelle] ^definition = """
    OPTIONAL, Aufnahmegrund (4. Stelle), Datenübermittlung nach § 301 Abs. 3 SGB V.
    """
* insert Translation(extension[Aufnahmegrund].extension[VierteStelle] ^definition, de-DE, Aufnahmegrund 4. Stelle)
* insert Translation(extension[Aufnahmegrund].extension[VierteStelle] ^definition, en-US, Admission reason 4th position)
* identifier MS
* identifier ^short = "Identifikator"
* insert Translation(identifier ^short, de-DE, Identifikator)
* insert Translation(identifier ^short, en-US, Identifier)
* identifier ^definition = """
    Kennung/en, unter der/denen dieser Kontakt bekannt ist.
    """
* insert Translation(identifier ^definition, de-DE, Kennung/en\, unter der/denen dieser Kontakt bekannt ist.)
* insert Translation(identifier ^definition, en-US, Identifier/s by which this encounter is known.)
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier contains Aufnahmenummer 0..1 MS
* identifier[Aufnahmenummer] ^short = "Aufnahmenummer"
* insert Translation(identifier[Aufnahmenummer] ^short, de-DE, Aufnahmenummer)
* insert Translation(identifier[Aufnahmenummer] ^short, en-US, Admission number)
* identifier[Aufnahmenummer] ^definition = """
    OPTIONAL, Ein eindeutiger Identifier, der einem Patienten bei der Aufnahmeplanung oder bei der Aufnahme selbst zugewiesen wird.
    Jeder Encounter SOLLTE seine eigene eindeutige Aufnahmenummer haben. Die Aufnahmenummer ist nicht die Fallnummer, 
    welche sich auf den kompletten Abrechnungsfall bezieht. Hier wird ein Identifier angegeben, der den Kontakt eindeutig identifiziert.
    """
* insert Translation(identifier[Aufnahmenummer] ^definition, de-DE, Aufnahmenummer/Fallnummer\, die Patient:in bei einer Aufnahme bekommt.)
* insert Translation(identifier[Aufnahmenummer] ^definition, en-US, Admission number\, the patient receives during an admission.)
* identifier[Aufnahmenummer] ^patternIdentifier.type = $v2-0203#VN
* identifier[Aufnahmenummer].type 1.. MS
* identifier[Aufnahmenummer].type from mii-vs-fall-identifier-type-codes (extensible)
* identifier[Aufnahmenummer].type = $v2-0203#VN
* identifier[Aufnahmenummer].type.coding ^slicing.discriminator.type = #pattern
* identifier[Aufnahmenummer].type.coding ^slicing.discriminator.path = "$this"
* identifier[Aufnahmenummer].type.coding ^slicing.rules = #open
* identifier[Aufnahmenummer].type.coding contains vn-type 1..1 MS
* identifier[Aufnahmenummer].type.coding[vn-type] = $v2-0203#VN
* identifier[Aufnahmenummer].type.coding[vn-type].system 1.. MS
* identifier[Aufnahmenummer].type.coding[vn-type].code 1.. MS
* identifier[Aufnahmenummer].system 1.. MS
* identifier[Aufnahmenummer].value 1.. MS
* status MS
* status ^short = "Status"
* insert Translation(status ^short, de-DE, Status)
* insert Translation(status ^short, en-US, status)
* status ^definition = """
    VERPFLICHTEND, required Binding auf http://fhir.de/ValueSet/EncounterStatusDe
    """
* insert Translation(status ^definition, de-DE, geplant | im Gange | beurlaubt | abgeschlossen | abgebrochen | fehlerhafte Eingabe | unbekannt)
* insert Translation(status ^definition, en-US, planned | in-progress | onleave | finished | cancelled | entered-in-error | unknown)
* status from $EncounterStatusDe (required)
* class MS
* class ^short = "Kontaktklasse"
* insert Translation(class ^short, de-DE, Kontaktklasse)
* insert Translation(class ^short, en-US, Classification of patient encounter)
* class ^definition = """
    VERPFLICHTEND, Kontaktklasse. Required Binding auf http://fhir.de/ValueSet/EncounterClassDE. 
    Klassifizierung des Kontaktes in stationär, ambulant, teilstationär oder andere.
    """
* insert Translation(class ^definition, de-DE, ambulant | stationär | vorstationär | virtuell | teilstationär | häusliche Pflege)
* insert Translation(class ^definition, en-US, ambulatory | inpatient encounter | pre-admission | virtual | short stay | home health)
* class from $EncounterClassDE (required)
* type MS
* type ^short = "Kontakttyp"
* insert Translation(type ^short, de-DE, Typ des Kontaktes)
* insert Translation(type ^short, en-US, Type of encounter)
* type ^definition = "Spezifischer Typ des Kontaktes"
* insert Translation(type ^definition, de-DE, Spezifischer Typ des Kontaktes)
* insert Translation(type ^definition, en-US, Specific type of encounter)
* type ^slicing.discriminator.type = #pattern
* type ^slicing.discriminator.path = "$this"
* type ^slicing.rules = #open
* type contains
    Kontaktebene 0..1 MS and
    KontaktArt 0..1 MS
* type[Kontaktebene] ^short = "Kontaktebene"
* insert Translation(type[Kontaktebene] ^short, de-DE, Kontaktebene)
* insert Translation(type[Kontaktebene] ^short, en-US, Level of encounter)
* type[Kontaktebene] ^definition = """
    OPTIONAL, Unterscheidung der Kontakt-Hierarchieebenen Einrichtungskontakt, Abteilungskontakt, Versorgungsstellenkontakt. 
    Die Gliederung gilt für stationäre Kontakte. Required Binding auf http://fhir.de/ValueSet/kontaktebene-de"""
* insert Translation(type[Kontaktebene] ^definition, de-DE, Unterscheidung der Kontakt-Hierarchieebenen: Einrichtungskontakt | Abteilungskontakt | Versorgungsstellenkontakt)
* insert Translation(type[Kontaktebene] ^definition, en-US, Differentiation of the encounter hierarchy levels: facility contact | department contact | care provider contact)
* type[Kontaktebene] from $kontaktebene-de (required)
* type[Kontaktebene] ^patternCodeableConcept.coding.system = "http://fhir.de/CodeSystem/Kontaktebene"
* type[Kontaktebene] ^binding.description = "Kontaktebene"
* type[KontaktArt] ^short = "Kontaktart"
* insert Translation(type[KontaktArt] ^short, de-DE, Kontaktart)
* insert Translation(type[KontaktArt] ^short, en-US, Type of encounter)
* type[KontaktArt] ^definition = """
    OPTIONAL, Differenzierung zwischen verschiedenen Arten von Kontakten (z.B. vorstationär, nachstationär, intensivstationär). 
    Required Binding auf http://fhir.de/ValueSet/kontaktart-de
    """
* insert Translation(type[KontaktArt] ^definition, de-DE, Kontaktarten wie vorstationär | nachstationär | intensivstationär)
* insert Translation(type[KontaktArt] ^definition, en-US, Type of encounter such as pre-admission | post-admission | intensive care)
* type[KontaktArt] from $kontaktart-de (required)
* type[KontaktArt] ^patternCodeableConcept.coding.system = "http://fhir.de/CodeSystem/kontaktart-de"
* serviceType MS
* serviceType ^short = "Fachabteilung"
* insert Translation(serviceType ^short, de-DE, Fachabteilung)
* insert Translation(serviceType ^short, en-US, Department)
* serviceType ^definition = """
    Die Fachdisziplin bzw. Fachabteilung wird durch einen vierstelligen Fachabteilungsschlüssel klassifiziert.
    """
* insert Translation(serviceType ^definition, de-DE, Fachabteilung Klassifizierung durch Fachabteilungsschlüssel)
* insert Translation(serviceType ^definition, en-US, Department classification by department key)
* serviceType.coding MS
* serviceType.coding ^slicing.discriminator.type = #pattern
* serviceType.coding ^slicing.discriminator.path = "$this"
* serviceType.coding ^slicing.rules = #open
* serviceType.coding contains 
    Fachabteilungsschluessel 0..1 MS and 
    ErweiterterFachabteilungsschluessel 0..1 MS
* serviceType.coding[Fachabteilungsschluessel] ^short = "Fachabteilungsschlüssel"
* serviceType.coding[Fachabteilungsschluessel] ^definition = """
    OPTIONAL, required Binding auf http://fhir.de/ValueSet/dkgev/Fachabteilungsschluessel
    Fachabteilungen gemäß Anhang 1 der BPflV in der am 31.12.2003 geltenden Fassung
    """
* insert Translation(serviceType.coding[Fachabteilungsschluessel] ^short, de-DE, Fachabteilungsschlüssel)
* insert Translation(serviceType.coding[Fachabteilungsschluessel] ^short, en-US, Department key)
* insert Translation(serviceType.coding[Fachabteilungsschluessel] ^definition, de-DE, Fachabteilungen gemäß Anhang 1 der Bundespflegesatzverordnung)
* insert Translation(serviceType.coding[Fachabteilungsschluessel] ^definition, en-US, Departments according to appendix 1 of the Bundespflegesatzverordnung)
* serviceType.coding[Fachabteilungsschluessel] from $FachabteilungsschluesselVS (required)
* serviceType.coding[Fachabteilungsschluessel] ^patternCoding.system = "http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel"
* serviceType.coding[Fachabteilungsschluessel].system 1.. MS
* serviceType.coding[Fachabteilungsschluessel].code 1.. MS
* serviceType.coding[ErweiterterFachabteilungsschluessel] ^short = "Erweiterter Fachabteilungsschlüssel"
* serviceType.coding[ErweiterterFachabteilungsschluessel] ^definition = """
    OPTIONAL, required Binding auf http://fhir.de/ValueSet/dkgev/Fachabteilungsschluessel-erweitert
    Fachabteilungen gemäß Anhang 1 der BPflV in der am 31.12.2003 geltenden Fassung inkl. Spezialisierungen.
    """
* insert Translation(serviceType.coding[ErweiterterFachabteilungsschluessel] ^short, de-DE, Erweiterter Fachabteilungsschlüssel)
* insert Translation(serviceType.coding[ErweiterterFachabteilungsschluessel] ^short, en-US, Extended department key)
* insert Translation(serviceType.coding[ErweiterterFachabteilungsschluessel] ^definition, de-DE, Fachabteilungen gemäß Anhang 1 der Bundespflegesatzverordnung)
* insert Translation(serviceType.coding[ErweiterterFachabteilungsschluessel] ^definition, en-US, Departments according to appendix 1 of the Bundespflegesatzverordnung)
* serviceType.coding[ErweiterterFachabteilungsschluessel] from $FachabteilungsschluesselErweitertVS (required)
* serviceType.coding[ErweiterterFachabteilungsschluessel] ^patternCoding.system = "http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel-erweitert"
* serviceType.coding[ErweiterterFachabteilungsschluessel].system 1.. MS
* serviceType.coding[ErweiterterFachabteilungsschluessel].code 1.. MS
* subject 1.. MS
* subject ^short = "Patientenidentifikator"
* subject ^definition = "VERPFLICHTEND, Referenz auf Patient:in."
//* subject only $MII-Reference
* period 0..1 MS
* period ^short = "Zeitraum des Kontaktes"
* insert Translation(period ^short, de-DE, Zeitraum des Kontaktes)
* insert Translation(period ^short, en-US, Period of encounter)
* period ^definition = """Beginn- und Endzeitpunkt des Kontaktes. 
    DARF NICHT vorhanden sein, kann OPTIONAL oder VERPFLICHTEND sein, 
    abhängig vom Status des Kontaktes - siehe Invarianten auf Ebene Encounter.
    """
* insert Translation(period ^definition, de-DE, Beginn- und Endzeitpunkt des Kontaktes.)
* insert Translation(period ^definition, en-US, Start and end time of the encounter.)
* period.start MS
* period.start ^short = "Beginndatum"
* period.start ^definition = """
    Start des Kontaktzeitraums. DARF NICHT vorhanden sein, kann OPTIONAL oder VERPFLICHTEND sein, 
    abhängig vom Status des Kontaktes - siehe Invarianten auf Ebene Encounter.
    """
* period.end MS
* period.end ^short = "Enddatum"
* period.end ^definition = """
    Ende des Kontaktzeitraums. DARF NICHT vorhanden sein, kann OPTIONAL oder VERPFLICHTEND sein, 
    abhängig vom Status des Kontaktes - siehe Invarianten auf Ebene Encounter.
    """
* diagnosis MS
* diagnosis ^short = "Diagnosen"
* insert Translation(diagnosis ^short, de-DE, Diagnosen)
* insert Translation(diagnosis ^short, en-US, Diagnoses)
* diagnosis ^definition = """
    OPTIONAL, Verweis auf Diagnosen/Prozeduren, die eine besondere Rolle im Kontext eines Encounters haben.
    Der Fallbezug von Diagnosen und Prozeduren wird über das jeweilige encounter-Element der Condition bzw. Procedure-Ressource hinreichend etabliert. 
    Die zusätzliche Rückverlinkung von Encounter.diagnosis auf Condition/Procedure wird nur dann verwendet, 
    wenn einer Diagnose bzw. Prozedur im Kontext eines Aufenthaltes eine besondere Rolle zugewiesen werden soll, 
    z.B. Haupt-/Neben-/Aufnahme- oder Überweisungsdiagnose).
    """
* insert Translation(diagnosis ^definition, de-DE, Angaben zu für den Kontakt relevanten Diagnosen)
* insert Translation(diagnosis ^definition, en-US, Information about diagnoses relevant for the encounter)
* diagnosis.condition 1.. MS
* diagnosis.condition ^short = "Referenz zu Diagnose-Ressource"
* diagnosis.condition ^definition = """
    VERPFLICHTEND, wenn Diagnosedaten angegeben werden, dann MUSS diese referenziert werden. 
    Bei ICD-10 Primär- und Sekundärcodes SOLLTE nur die Primärdiagnose referenziert werden.
    """
* diagnosis.use 1.. MS
* diagnosis.use ^short = "Diagnosetyp"
* diagnosis.use ^definition = """
        Attribute wie Aufnahme- oder Entlassdiagnose sind immer im Kontext eines stationären Aufenthaltes zu betrachten
        und werden daher als Eigenschaft des Encounters modelliert. 
        VERPFLICHTEND mindestens die Angabe eines Codings. EMPFOHLEN ist die Angabe mittels Diagnosetyp- und DiagnosesubTyp-Coding. 
        Weitere Codings OPTIONAL. Extensible Binding auf `http://hl7.org/fhir/ValueSet/diagnosis-role`
        """
//* diagnosis.use ^binding.strength = #extensible
* diagnosis.use from mii-vs-fall-diagnosis-use (extensible)
* diagnosis.use.coding 1.. MS
* diagnosis.use.coding ^slicing.discriminator.type = #pattern
* diagnosis.use.coding ^slicing.discriminator.path = "$this"
* diagnosis.use.coding ^slicing.rules = #open
* diagnosis.use.coding contains 
      Diagnosetyp 0..1 MS and 
      DiagnosesubTyp 0..1 MS
* diagnosis.use.coding[Diagnosetyp] from $DiagnoseTyp (required)
* diagnosis.use.coding[Diagnosetyp] ^short = "Diagnosetyp"
* diagnosis.use.coding[Diagnosetyp] ^definition = "Einweisungs-/Überweisungsdiagnose | Behandlungsrelevante Diagnosen"
* diagnosis.use.coding[DiagnosesubTyp] from $Diagnosesubtyp (required)
* diagnosis.use.coding[DiagnosesubTyp] ^short = "Diagnosesubtyp"
* diagnosis.use.coding[DiagnosesubTyp] ^definition = "Operationsdiagnose | Abteilung Hauptdiagnose | Todesursache | Infektionsschutzdiagnose +"
* diagnosis.rank MS
* diagnosis.rank ^short = "Rangfolge"
* diagnosis.rank ^definition = "OPTIONAL, Rangfolge der Diagnose"
* account MS
* account ^short = "Abrechnungskontext"
* account ^definition = """
        OPTIONAL. Referenz auf den Abrechnungsfall. Eine logische Referenz ist ausreichend zur Abbildung des Abrechnungskontextes.
        """
* insert Translation(account ^short, de-DE, Abrechnungskontext)
* insert Translation(account ^short, en-US, Billing Context)
* insert Translation(account ^definition, de-DE, Referenz auf den Abrechnungsfall.)
* insert Translation(account ^definition, en-US, Reference to the billing case.)
* insert Translation(hospitalization ^short, de-DE, Klinikaufenthalt)
* insert Translation(hospitalization ^short, en-US, Hospitalization)
* hospitalization MS
* hospitalization ^short = "Klinikaufenthalt"
* insert Translation(hospitalization ^short, de-DE, Klinikaufenthalt)
* insert Translation(hospitalization ^short, en-US, Hospitalization)
* hospitalization ^definition = "OPTIONAL, Details zur Aufnahme und Entlassung"
* insert Translation(hospitalization ^definition, de-DE, Details zur Aufnahme und Entlassung)
* insert Translation(hospitalization ^definition, en-US, Details about admission and discharge)
* hospitalization.admitSource 1.. MS
* hospitalization.admitSource ^short = "Aufnahmeanlass"
* hospitalization.admitSource ^definition = """
        VERPFLICHTEND, Aufnahmeanlass. Preferred Binding auf http://fhir.de/ValueSet/dgkev/Aufnahmeanlass
        """
* hospitalization.admitSource from $AufnahmeanlassVS (preferred)
* hospitalization.dischargeDisposition MS
* hospitalization.dischargeDisposition ^short = "Entlassung"
* hospitalization.dischargeDisposition ^definition = "OPTIONAL Daten zur Entlassung"
* hospitalization.dischargeDisposition.extension contains $EntlassungsgrundExt named Entlassungsgrund 0..1 MS
* hospitalization.dischargeDisposition.extension[Entlassungsgrund] ^short = "Entlassungsgrund"
* hospitalization.dischargeDisposition.extension[Entlassungsgrund] ^definition = """
        OPTIONAL, Entlassungs-/Verlegungsgrund nach § 301 Abs. 3 SGB V
        """
* location //MS
* location ^short = "Kontaktort"
* insert Translation(location ^short, de-DE, Kontaktort)
* insert Translation(location ^short, en-US, Location)
* insert Translation(location ^definition, de-DE, Details zum Kontaktort wie Zimmer\, Bett\, Station)
* insert Translation(location ^definition, en-US, Details about location such as room\, bed\, ward)
* location ^definition = "OPTIONAL, Details zum Kontaktort wie Zimmer, Bett, Station"
  * physicalType from mii-vs-fall-location-physical-type (extensible)
  * physicalType ^short = "Kontaktorttyp"
  * physicalType ^definition = """
        SOLL, extensible Binding auf https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/location-physical-type
        """
* location ^slicing.discriminator[+].type = #pattern
* location ^slicing.discriminator[=].path = "physicalType"
* location ^slicing.discriminator[+].type = #pattern
* location ^slicing.discriminator[=].path = "status"
* location ^slicing.rules = #open
* location contains  Zimmer 0..1 and Bett 0..1 and Station 0..1
* location[Station]
* location[Station] ^short = "Station"
* location[Station] ^definition = "Die Station, auf welcher der Patient oder die Patientin während des Kontaktes behandelt wurde."
  * location 1.. 
    //* identifier 1.. MS
    //* display 1.. MS
  * physicalType 1..1 //MS
  * physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#wa
  * status MS
  * status = #active
* location[Zimmer]
* location[Zimmer] ^short = "Zimmer"
* location[Zimmer] ^definition = "Von Patient oder Patientin während des Kontaktes belegtes Zimmer auf einer Station."
  * location 1.. 
    //* identifier 1.. MS
    //* display 1.. MS
  * physicalType 1..1 //MS
  * physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#ro
  * status MS
  * status = #active
* location[Bett]
* location[Bett] ^short = "Bett"
* location[Bett] ^definition = "Von Patient oder Patientin während des Kontaktes belegter Bettenstellplatz."
  * location 1.. //MS
    //* identifier 1.. MS
    //* display 1.. MS
  * physicalType 1..1 //MS
  * physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#bd
  * status MS
  * status = #active
* serviceProvider //MS
* serviceProvider ^short = "Leistungserbringer"
* insert Translation(serviceProvider ^short, de-DE, Leistungserbringer)
* insert Translation(serviceProvider ^short, en-US, Service Provider)
* serviceProvider ^definition = """
        OPTIONAL. Leistungserbringer, der für den Kontakt verantwortlich ist. 
        Referenz auf eine Organisation
        """
* insert Translation(serviceProvider ^definition, de-DE, Leistungserbringer\, der für den Kontakt verantwortlich ist.)
* insert Translation(serviceProvider ^definition, en-US, Service provider responsible for the encounter.)
* partOf MS
* partOf ^short = "Teil von Kontakt"
* insert Translation(partOf ^short, de-DE, Teil von Kontakt)
* insert Translation(partOf ^short, en-US, Part of encounter)
* partOf ^definition = """
        OPTIONAL. Abbildung der Hierarchie zwischen Kontaktebenen durch Referenz auf weitere Kontakte, 
        wenn bspw. ein Versorgungsstellenkontakt Teil eines Abteilungskontaktes 
        oder ein Abteilungskontakt Teil eines Einrichtungskontaktes ist.
        """
* insert Translation(partOf ^definition, de-DE, Abbildung der Hierarchie zwischen Kontaktebenen durch Referenz auf weitere Kontakte.)
* insert Translation(partOf ^definition, en-US, Hierarchy between encounter levels by referencing further encounters.)