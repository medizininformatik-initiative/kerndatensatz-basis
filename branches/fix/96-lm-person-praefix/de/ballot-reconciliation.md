# Ballot-Kommentierung 2027.0.0-ballot - MII Implementation Guide Core Dataset Base v2027.0.0-ballot

* [**Inhaltsverzeichnis**](toc.md)
* **Ballot-Kommentierung 2027.0.0-ballot**

## Ballot-Kommentierung 2027.0.0-ballot

Diese Seite dokumentiert die Bearbeitung der Ballot-Kommentare zur Version `2027.0.0-ballot` des MII Kerndatensatz Basis. Sie listet die Tickets aus dem Ballot von HL7 Deutschland ([Jira-Abfrage](https://hl7germany.atlassian.net/issues/?jql=project%20%3D%20HDB%20AND%20created%20%3E%3D%20-200d%20AND%20%22Project%5BDropdown%5D%22%20in%20%28%22MII%20%E2%80%93%20Modul%20Basis%20%28Person%2C%20Fall%2C%20Diagnose%20%26%20Prozedur%29%22%29%20ORDER%20BY%20created%20DESC)) nach Kategorie gruppiert mit der Entscheidung und ihrer Umsetzung auf. Die einzelnen Änderungen stehen im [Changelog](changes.md) unter Version `2027.0.0`.

#### Legende

| | |
| :--- | :--- |
| **Angenommen** | Die gewünschte Änderung ist in`2027.0.0`umgesetzt. |
| **Angenommen mit Änderung** | Das Anliegen ist in`2027.0.0`berücksichtigt, aber anders als gewünscht; die Abweichung ist beschrieben. |
| **Angenommen (Doku)** | Dokumentation oder Implementierungshinweise werden geändert; keine Änderung an Konformitätsregeln. |
| **Angenommen – zurückgestellt** | Die Änderung ist beschlossen, wird aber später umgesetzt; die offene Voraussetzung ist angegeben. |
| **Für künftige Berücksichtigung** | Keine Änderung in dieser Version; das Thema wird für eine spätere Version oder einen gemeinsamen Prozess mit anderen Organisationen vorgemerkt. |
| **Abgelehnt** | Die gewünschte Änderung wird nicht vorgenommen; die Begründung ist angegeben. |

**Breaking** = **ja**, wenn Implementierungen, die zur vorherigen Version (`2026.0.x`) konform sind, nach der Änderung nicht mehr konform sind. Änderungen an Artefakten, die erst mit `2027.0.0-ballot` eingeführt wurden (z. B. das AllergyIntolerance-Profil), sind nicht breaking.

-------

### A. Profiländerungen

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| [HDB-1075](https://hl7germany.atlassian.net/browse/HDB-1075) | Extension Lebensphase in Datentyp "Range" | Die Extension Lebensphase wurde von`Condition.onsetAge`/`abatementAge`nach`onsetRange`/`abatementRange`verschoben, da ihr Kontext in`de.basisprofil.r4`1.6.0`Age`nicht erlaubt; das Mapping im logischen Modell folgt.`Age`bleibt ohne die Extension erlaubt. Der Kontext der deutschen Extension und der HL7-Europe-Extension[`periods-of-life`](https://hl7.eu/fhir/extensions/StructureDefinition-periods-of-life.html)wird auf künftige Änderungen beobachtet. | Angenommen | **ja** |
| [HDB-1069](https://hl7germany.atlassian.net/browse/HDB-1069) | Constraint "pat-cnt-2or3-char" in Adress.country | `pat-cnt-2or3-char`prüft jetzt die Extension`countryCode`(`iso21090-codedString`, ISO 3166-1 alpha-2) statt`Address.country`, sodass`country`auch andere Werte (z. B. DEÜV) enthalten darf. Die Beispiele kodieren das Land in der Extension. | Angenommen | nein |
| [HDB-935](https://hl7germany.atlassian.net/browse/HDB-935) | country constraints noch nicht angepasst? | Zusammen mit HDB-1069 umgesetzt. | Angenommen | nein |
| [HDB-1124](https://hl7germany.atlassian.net/browse/HDB-1124) | Binding Strengh in Extension individual-recordedSexOrGender anpassen | Die Binding-Stärke von`Patient.extension:recordedSexOrGender.extension:value.valueCodeableConcept`an`MII_VS_Person_recordedSexOrGender_SNOMED`wurde von**preferred**auf**extensible**geändert. | Angenommen | nein (neu im Ballot) |
| [HDB-1067](https://hl7germany.atlassian.net/browse/HDB-1067) | Verwendung der Extension "Patient Sex Parameter For Clinical Use" | `patient-sexParameterForClinicalUse`(`hl7.fhir.uv.extensions.r4`5.2.0) wurde als optionale Extension in das Patient-Profil aufgenommen, mit Must Support auf`value`und`period`. Nicht im pseudonymisierten Patient-Profil. | Angenommen | nein |
| [HDB-1073](https://hl7germany.atlassian.net/browse/HDB-1073) | Wahl der Valuesets in AllergyIntolerance.code und reaction.manifestation | Die IPS-Bindings wurden durch optionale Slices`coding:snomed-ct`(0..1, Must Support) an`AllergyIntolerance.code`und`reaction.manifestation`ersetzt,**extensible**gebunden an`KBV_VS_AllergyIntolerance_Substance_SNOMED_CT`und`KBV_VS_AllergyIntolerance_Manifestation_SNOMED_CT`(1.0.0), abgestimmt mit ISiK. Neue Abhängigkeit`kbv.all.terminology.allergyintolerance`1.0.0, nur auf dem[BfArM-ZTS](https://terminologien.bfarm.de)verfügbar; die CI installiert sie mit einer Composite Action, nachdem die Download-Bedingungen akzeptiert wurden. | Angenommen | nein (neu im Ballot) |
| [HDB-1019](https://hl7germany.atlassian.net/browse/HDB-1019) | AllergyIntolerance.code.coding:snomed-ct | Der Slice`coding:snomed-ct`wird eingeführt (siehe HDB-1073), anders als in ISiK aber**nicht verpflichtend**: Allergien können auch nur mit anderen Codes dokumentiert sein, z. B. mit einem ATC-Code für eine Substanz. | Angenommen mit Änderung | nein |
| [HDB-1072](https://hl7germany.atlassian.net/browse/HDB-1072) | Verwendung der Lebensphase Extension in AllergyIntolerance | Die Extension Lebensphase ist an`AllergyIntolerance.onsetRange`und an`AllergyIntolerance.extension:abatement.valueRange`erlaubt, konsistent mit HDB-1075. | Angenommen | nein (neu im Ballot) |
| [HDB-1074](https://hl7germany.atlassian.net/browse/HDB-1074) | BodyStructure Profile aus EU Core referenzieren | Beschlossen ist,`bodyStructure-eu-core`(`hl7.fhir.eu.base`, neue Abhängigkeit) als Ziel der`bodySite`-Extension in Condition und Procedure zu referenzieren. In den Backlog zurückgestellt: Die anderen MII-Module, die`BodyStructure`bereits verwenden, müssen zuerst prüfen, ob ihre Profile zum EU-Profil konform sind. | Angenommen – zurückgestellt | nein |

### B. Terminologie

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| [HDB-1068](https://hl7germany.atlassian.net/browse/HDB-1068) | Wahl des Valueset in Extension "Recorded Sex or Gender" | Das SNOMED-CT-ValueSet bleibt, da der primäre MII-Anwendungsfall das bei Geburt zugewiesene Geschlecht ist. Neue[ConceptMap](ConceptMap-mii-cm-person-recordedsexorgender-snomed-administrative-gender.md)von dessen Codes nach`administrative-gender`mit qualifizierten Beziehungen (**inexact**,**wider**) statt Äquivalenz. | Angenommen | nein |

### C. Diskutierte Themen

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| [HDB-1070](https://hl7germany.atlassian.net/browse/HDB-1070) | Verwendung von "pattern" Diskriminatoren | Keine Änderung: Die funktionierende Umsetzung bleibt. In R4 liefert`#value`dieselben Validierungsergebnisse wie`#pattern`; nur der Deprecation-Hinweis entfiele, während abgeleitete Profile, die ein geerbtes Slicing erneut deklarieren, ebenfalls umgestellt werden müssten. Wird mit einer späteren FHIR-Version erneut betrachtet. | Für künftige Berücksichtigung | nein |
| [HDB-1071](https://hl7germany.atlassian.net/browse/HDB-1071) | Kardinalität von Patient.birthDate | `birthDate`bleibt 0..1. Die Seite zum Patient-Profil erläutert, dass dies eine bewusste Abweichung von ISiK (1..1 mit`data-absent-reason`) ist, wegen der MII-Umgebungen und aus Datenschutzgründen. | Abgelehnt | nein |
| [HDB-1018](https://hl7germany.atlassian.net/browse/HDB-1018) | Procedure.category Invarianten | **(a)**Eine rein textuelle`Procedure.code`(ISiK`proc-ISiK-3`) wird nicht erlaubt: Konsumenten müssen sich auf eine kodierte Prozedur verlassen können.**(b)**`proc-ISiK-2`(Category für jede kodierte Prozedur) wird jetzt nicht übernommen, da es breaking wäre. Die Seite zum Procedure-Profil nennt beide Unterschiede zu ISiK 6.0.0. | (a) Abgelehnt · (b) Für künftige Berücksichtigung | nein |
| [HDB-1016](https://hl7germany.atlassian.net/browse/HDB-1016) | Encounter.type.Kontaktebene und .diagnosis.use.coding:Diagnosetyp und .hospitalization.admitSource | `type:Kontaktebene`und`diagnosis.use.coding:Diagnosetyp`behalten ihre Kardinalitäten; die Seite zum Encounter-Profil dokumentiert die Abweichungen von ISiK 6.0.0 in einer Tabelle.`hospitalization.admitSource`wird von 1..1 auf 0..1 (Must Support) gelockert, wie in ISiK und im logischen Modell, da der Aufnahmeanlass im HL7-v2-Feed oft fehlt ([#53](https://github.com/medizininformatik-initiative/kerndatensatz-basis/issues/53)). | Angenommen mit Änderung | nein |

### D. Dokumentation

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| [HDB-1048](https://hl7germany.atlassian.net/browse/HDB-1048) | Aufnahmenummer ungleich Fallnummer | **Aufnahmenummer**und**PatientenIdentifikator**im logischen Modell Fall korrigiert: Die Aufnahmenummer identifiziert einen einzelnen Kontakt; die Fallnummer identifiziert den Abrechnungsfall und steht in`Encounter.account.identifier`, wie in ISiK. | Angenommen (Doku) | nein |
| [HDB-1010](https://hl7germany.atlassian.net/browse/HDB-1010) | Fallart teilstationär Klarstellung | Die Seite zum Encounter-Profil erläutert, warum teilstationäre Kontakte`IMP`(mit Bettenallokation, z. B. Nachtklinik) oder`SS`(ohne Bettenallokation, z. B. Tagesklinik) verwenden. | Angenommen (Doku) | nein |
| [HDB-1011](https://hl7germany.atlassian.net/browse/HDB-1011) | Bettenstellplatz | Der Slice`Encounter.location:Bett`wird wie in ISiK in`Bettenstellplatz`umbenannt und als Ort beschrieben, an dem das Bett steht, nicht als Bett im Sinne eines Geräts. Diskriminator, Kardinalität und Constraints sind unverändert; bestehende Instanzen und Implementierungen sind nicht betroffen. | Angenommen mit Änderung | nein |
| [HDB-1052](https://hl7germany.atlassian.net/browse/HDB-1052) | Extension von Diagnosen ValueSet in Fall-Profile | `mii-vs-fall-diagnosis-use`bleibt unverändert. Die Seite zum Encounter-Profil weist darauf hin, dass DRG-Haupt- und -Nebendiagnosen (`principle-DRG`,`secondary-DRG`) und`hospital-main-diagnosis`wie in ISiK am Account mit`ExtensionAbrechnungsDiagnoseProzedur`angegeben werden SOLLEN, nicht in`Encounter.diagnosis.use`. | Angenommen (Doku) | nein |
| [HDB-1020](https://hl7germany.atlassian.net/browse/HDB-1020) | Condition .extension | Die Seite zum Condition-Profil beschreibt`Feststellungsdatum`und den Unterschied zu`onset[x]`und`recordedDate`(Best-Practice-Box mit Beispiel) und präzisiert`ReferenzPrimaerdiagnose`. | Angenommen (Doku) | nein |
| [HDB-1012](https://hl7germany.atlassian.net/browse/HDB-1012) | Empfehlung Diagnosen an die Kontaktebene | Die Seite zum Condition-Profil weist darauf hin, dass die empfohlene Kontaktebene (Abteilungskontakt) für ISiK Stufe 7 diskutiert wird und die MII dem Ergebnis folgt. | Angenommen (Doku) | nein |
| [HDB-1013](https://hl7germany.atlassian.net/browse/HDB-1013) | UML Referenz Modul zu Patient | Das[UML-Diagramm](uml-diagrams.md)des Moduls Fall zeigt die Assoziation vom Einrichtungskontakt zum Patient über den**Patientenidentifikator**(`Encounter.subject`). | Angenommen (Doku) | nein |
| [HDB-939](https://hl7germany.atlassian.net/browse/HDB-939) | Zuordnung - Encounter <-> Account | Die Seite zum Encounter-Profil stellt klar, dass ein Account von mehreren Einrichtungskontakten referenziert werden kann; die Hierarchie-Grafik zeigt dies bereits. | Angenommen (Doku) | nein |
| [HDB-938](https://hl7germany.atlassian.net/browse/HDB-938) | Station (Ward) -> Location vs. Organization | Die Seite zum Encounter-Profil beschreibt beide Möglichkeiten zur Abbildung einer Station, als Location (`location:Station`,`physicalType = wa`) und als Organization (`serviceProvider`), im Einklang mit ISiK 6.0.0. | Angenommen (Doku) | nein |
| [HDB-1077](https://hl7germany.atlassian.net/browse/HDB-1077) | Constraint für die Lateralitätsangabe in Procedure | Die Definition von`bodySite`wurde präzisiert: SNOMED-CT-Prozedurcodes enthalten Körperstelle und Lateralität in der Regel bereits präkoordiniert,`bodySite`SOLL diese Angaben nicht lediglich wiederholen. Die Invariante ist nicht umsetzbar: Eine redundante Seitenangabe zu erkennen, erforderte, SNOMED-CT-Beziehungen zu folgen oder`BodyStructure`-Referenzen aufzulösen, und zwei Seitenangaben sind nicht zwingend redundant (z. B. eine beidseitige Prozedur mit Referenz auf eine linksseitige Läsion). Die Seite zum Procedure-Profil erläutert dies. | Angenommen (Doku) | nein |
| [HDB-1035](https://hl7germany.atlassian.net/browse/HDB-1035) | Mutter-Kind-Beziehung | Keine Profiländerung. Neuer Abschnitt[Mutter und Neugeborenes](StructureDefinition-mii-pr-person-patient.md#mother-and-newborn)auf der Seite zum Patient-Profil: die Mutter als`RelatedPerson`(`MTH`) des Kindes, optionaler`Patient.link`(`seealso`) aus ihrem eigenen Datensatz,`Encounter.partOf`vom Kontakt des Neugeborenen zum Entbindungskontakt der Mutter (KANN, mit Regel zur Traversierung, auch auf der Seite zum Encounter-Profil), bedingte Abrechnungsfälle für Neugeborene und das HL7-v2-Mapping. Pränatale Fragen (Identifikatoren bei Geburt, pränatale Befunde, Nabelschnurblutproben) sind nicht im Scope. | Angenommen (Doku) | nein |
| [HDB-1036](https://hl7germany.atlassian.net/browse/HDB-1036) | Mehrlingsschwangerschaft | Keine Profiländerung. Derselbe Abschnitt trennt die Mehrlingsschwangerschaft (ein Befund zur Mutter, vgl. KBV MIO Mutterpass) von der Mehrlingsgeburt (`multipleBirth[x]`jedes Kindes, mit Zwillingsbeispiel); die Identifikation von Feten vor der Geburt ist nicht im Scope (HL7 IBCM, CH EPREG). | Angenommen (Doku) | nein |

### E. Antworten

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| [HDB-1017](https://hl7germany.atlassian.net/browse/HDB-1017) | Procedure Extension Durchführungsabsicht | Keine Änderung. Die Extension erfasst die Absicht einer Prozedur (z. B. kurativ, palliativ, diagnostisch) und bleibt in der MII`0..1`Must Support für die Sekundärnutzung. Bevor sie Must Support in der Versorgung (ISiK) werden könnte, wird Evidenz benötigt, in welchen Dokumentationskontexten sie erfasst wird. | Für künftige Berücksichtigung | nein |
| [HDB-1021](https://hl7germany.atlassian.net/browse/HDB-1021) | Vitalstatus | Keine Änderung. Vitalstatus ist bewusst nicht von VitalSignDE abgeleitet: Es erfasst, ob eine Person lebt, verstorben oder der Status unbekannt ist (LOINC 67162-8, Category`survey`), keinen gemessenen Vitalparameter; eine Ableitung würde`category = vital-signs`erzwingen. | Abgelehnt | nein |
| [HDB-1024](https://hl7germany.atlassian.net/browse/HDB-1024) | Vitalstatus (Observation) .note MS | Keine Änderung.`note`bleibt Must Support als Ort für die Quelle des Vitalstatus (**Informationsquelle**im logischen Modell), für die es kein strukturiertes Element gibt. Für die Relevanz in der Versorgung wird Evidenz zur tatsächlichen Nutzung benötigt. | Für künftige Berücksichtigung | nein |
| [HDB-1025](https://hl7germany.atlassian.net/browse/HDB-1025) | Warum Basis und Meta | Keine Zusammenlegung der Module. Meta enthält modulübergreifende Artefakte und Konventionen, die alle KDS-Module nachnutzen (SearchParameter-Profil, gemeinsame SearchParameter und CapabilityStatement), ohne klinische Inhalte; Basis enthält die klinischen Basisprofile und hängt von Meta ab. Basis verwendet die Meta-Lizenz-Extension`mii-ex-meta-license-codeable`nicht mehr, sondern die CRMI-Lizenz-Extension. Durch die Trennung können modulübergreifende Regeln in einem eigenen Release-Zyklus weiterentwickelt werden; Module übernehmen eine neue Meta-Version über eine ausdrückliche Aktualisierung der Abhängigkeit. | Abgelehnt | nein |
| [HDB-1026](https://hl7germany.atlassian.net/browse/HDB-1026) | Condition.clinicalStatus - KlinischerStatus | Keine Änderung.`clinicalStatus`bleibt Must Support: Es ist ein Modifier-Element, das Empfänger verstehen müssen, sobald es befüllt ist; Must Support macht es für Sender nicht verpflichtend, und auch ISiK Diagnose 6.0.0 kennzeichnet es als Must Support. | Abgelehnt | nein |
| [HDB-1022](https://hl7germany.atlassian.net/browse/HDB-1022) | ValueSets Konsolidieren | Keine ValueSet-Änderungen in dieser Version. Wir unterstützen eine gemeinsame Konsolidierung mit der gematik, dem TC Terminologie von HL7 Deutschland und dem BfArM-ZTS, mit einer verantwortlichen Stelle und einer Veröffentlichung je ValueSet. Die Bezeichnung von`bd`wurde mit HDB-1011 bearbeitet. | Für künftige Berücksichtigung | nein |
| [HDB-1023](https://hl7germany.atlassian.net/browse/HDB-1023) | Fehlende Daten | Keine Änderung in dieser Version. Wir unterstützen, die Hinweise zum Umgang mit fehlenden Daten gemeinsam mit der gematik in die Basisprofile DE einzubringen; die Basis-Seite[Umgang mit fehlenden Daten](missing-data.md)verweist dann darauf und enthält nur noch MII-spezifische Ergänzungen. | Für künftige Berücksichtigung | nein |
| [HDB-1076](https://hl7germany.atlassian.net/browse/HDB-1076) | Slicing auf Encounter.diagnosis.use.coding | Keine Änderung; die bestehende Best Practice (ein`Encounter.diagnosis`-Eintrag je Rolle, alle mit Referenz auf dieselbe Condition) bleibt. Die`coding`-Slices`Diagnosetyp`und`DiagnosesubTyp`ermöglichen die Codierung von`use`aus den jeweiligen ValueSets, die Codings eines`use`dürfen aber keine unterschiedlichen Diagnoserollen mischen: Laut[CodeableConcept](https://hl7.org/fhir/R4/datatypes.html#CodeableConcept)ist**each coding (also referred to as a 'translation') a representation of the concept**. Ein Slicing weiter oben ist nicht möglich (`use`ist 1..1) bzw. nicht sinnvoll (`Encounter.diagnosis`). | Abgelehnt | nein |

### F. Modul Meta

Diese Tickets betreffen das Modul Meta (`kerndatensatz-meta`) und werden dort umgesetzt.

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| [HDB-1014](https://hl7germany.atlassian.net/browse/HDB-1014) | Meta CpS | Die Platzhalter-Beschreibung des Meta-CapabilityStatements wird ersetzt: Es listet die vom Modul Meta definierten Ressourcentypen und SearchParameter auf, ist informativ und legt keine normativen Serveranforderungen fest. Es bleibt im Status draft. | Angenommen | nein |
| [HDB-1015](https://hl7germany.atlassian.net/browse/HDB-1015) | Externe Quelle github? | Die Links ins GitHub-Wiki im Menü Konformität sind ein vorläufiger Platzhalter. Die MII-weiten Konformitätsregeln werden als versionierte Seiten in den Meta-Leitfaden überführt. | Angenommen – zurückgestellt | nein |

