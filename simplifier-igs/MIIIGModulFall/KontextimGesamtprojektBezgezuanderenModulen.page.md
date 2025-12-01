---
parent: 
topic: KontextImGesamtprojekt
---

## Relationen anderer MII KDS Module zum Modul Fall

| Modul | Ressourcentyp | Element | Kontaktebene |
|----
| **Person** | Patient | | |
| | ResearchSubject |||
| | Condition | Condition.encounter | Einrichtungskontakt, Abteilungskontakt, Versorgungsstellenkontakt |
| | Observation | Observation.encounter | Einrichtungskontakt, Abteilungskontakt, Versorgungsstellenkontakt |
| **Diagnose** | Condition | Condition.encounter | Einrichtungskontakt, Abteilungskontakt, Versorgungsstellenkontakt |
| **Prozedur** | Procedure | Procedure.encounter | Einrichtungskontakt, Abteilungskontakt, Versorgungsstellenkontakt |
| **Medikation** | MedicationStatement | MedicationStatement.context | Einrichtungskontakt |
| | List | List.encounter | Einrichtungskontakt |
| | MedicationRequest | MedicationRequest.encounter | Abteilungsstellen (oder besser auch Versorgungsstellen) |
| | MedicationAdministration | MedicationAdministration.context | Versorgungsstellenkontakt |
| **Labor** | DiagnosticReport | DiagnosticReport.encounter | Einrichtungskontakt, Abteilungskontakt, Versorgungsstellenkontakt | 
| | Observation | Observation.encounter | Einrichtungskontakt, Abteilungskontakt, Versorgungsstellenkontakt |
| | ServiceRequest | ServiceRequest.encounter | Einrichtungskontakt, Abteilungskontakt, Versorgungsstellenkontakt |
| **Consent** | Consent | | | 
| | DocumentReference | DocumentReference.context.encounter | Einrichtungskontakt, Abteilungskontakt, Versorgungsstellenkontakt | 
| | Provenance | | | 


## Kontext im Gesamtprojekt / Bezüge zu anderen Modulen

Wie bereist einleitend erwähnt, strukturieren die Kontakt-Entitäten die Dokumentation in den wichtigsten Quellen der Medizininformatik-Initiative, den Krankenhausinformationssystemen der beteiligten Universitätsklinika. Aus diesen Quelldokumentationen stammen auch Angaben zu Diagnosen, Untersuchungen (z.B. Laborbefunde) und Behandlungen (Prozeduren und Medikationen). In den Quellen beziehen sich die Angaben überwiegend primär auf die jeweils aktuellen Aufenthalte (Kontakte/Fälle). Im MII Kerndatensatz wie in der IPS und der EPA der KBV werden die Angaben dagegen den *Patientinnen* im Modul Person zugeordnet.

Der Bezug zu den Einrichtungskontakten und teilweise zu den Abteilungskontakten geht aber nicht gänzlich verloren, sondern wird in den Relationen der Module [Diagnose](https://simplifier.net/mii-basismodul-diagnose-2024), [Prozedur](https://simplifier.net/mii-basismodul-prozedur-2024); [Medikation](https://simplifier.net/mii-basismodul-medikation-2024), [Laborbefund](https://simplifier.net/medizininformatikinitiative-modullabor) und weiteren zu diesen Kontaktentitäten Rechnung getragen. Dabei geht es jedoch nicht primär um die Verfolgung der "Provenance", sondern um die kontextspezifische Bedeutung der Angaben. 

---

## Relation zu ISiK

Die Spezifikation [ISiK (Informationssysteme im Krankenhaus)](https://www.gematik.de/anwendungen/isik) wird von der gematik erarbeitet und definiert eine standardisierte Schnittstelle auf Basis von HL7 FHIR für den Austausch von Gesundheitsdaten für informationstechnische Systeme in Krankenhäusern. In mehreren Ausbaustufen wird dieser Standard verbindlich für Krankenhausinformationssysteme in Deutschland eingeführt. Das ISiK-Basismodul definiert, ebenso wie das hier vorliegende MII Modul, einen Fall und beschreibt die Use Cases:
* Suche nach dem aktuellen Aufenthalt eines Patienten
* Suche nach Fallinformationen anhand einer Fallnummer

Die Modellierungen des Falls bei gematik und MII beeinflussen sich gegenseitig und die Organisationen sind im Austausch, die Spezifikationen zu harmonisieren.

-------

## Relation zu internationalen Projekten

In der wichtigsten Referenz des MII-Kerndatensatzes, der [International Patient Summary](http://hl7.org/fhir/uv/ips/STU1/), findet sich kein Äquivalent für die Elemente des Moduls Fall. Dort sind Diagnosen und Prozeduren direkt den Personen zugeordnet.

Im MII-Kerndatensatz wird das Modul Fall aber benötigt, um die Bezüge zum Versorgungsgeschehen und insbesondere zu den Fachabteilungen herzustellen. Die Beziehung fußt ganz wesentlich auf dem Umstand, dass die wichtigsten Datenquellen der Medizininformatik-Initiative die Krankenhausinformationssysteme und Klinische Arbeitsplatzsysteme der beteiligten Standorte sind.

Bei internationalen Vergleichen wird, wie innerhalb dieser Spezifikation beschrieben, zu beachten sein, dass nicht nur der *Abrechnungsfall*, sondern in gewissen Sinne auch die verschiedenen *Kontaktebenen* Konstrukte des deutschen Gesundheitswesens sind. 

------
## Relation zum Modul Diagnose

Für den stationären und den teilstationären Kontext werden folgende Aspekte berücksichtigt. Im Zuge des Aufnahmeprozesses ins Krankenhaus (einschließlich der digitalen Kommunikation mit den Krankenkassen) werden initial Diagnosen als Voraussetzung für die Kostenübernahme duch die Krankenkassen erfasst. Dabei beschreibt die Kategorie *Einweisungsdiagnose* die Krankheitsangabe des einweisenden Arztes. Die Kategorie *Aufnahmediagnose* gibt die (vorläufige) Einschätzung des aunehmenden Hauses wieder. 

Regelmäßig werden auch im Laufe des Versorgungsprozesses Diagnoseangaben notiert - zum Beispiel als *Fachabteilungshaupt-* und *Fachabteilungsnebendiagnosen*, oder zur Begründung von Leistungsanforderungen und therapeutischen Maßnahmen, einschließlich Medikationen. 

Die fast abschließende Diagnosedokumentation erfolgt im Zuge der Entlassung aus dem Krankenhaus. Die dabei erfassten Diagnosen erfahren eine Überprüfung durch leitende Ärzte und Controller, sowie (gefärbt durch Abrechnungsregeln) eine Unterscheidung von *Krankenhaushaupt-* und *Krankenhausnebendiagnosen*. Dabei verbieten die Deutschen Kodierrichtlinien die Berücksichtigung von Angaben zu Diagnosen in der Kommunikation mit den Kostenträgern, wenn diese während des stationären Aufenthaltes keine Aufwände erzeugt haben. Im Bezug zum Abrechnungsfall kommen diese Diagnosen also nicht vor. 

Sofern die erfassten, aber nicht-abrechnungskompatiblen Diagnosen nicht gelöscht werdern (was im Prinzip verboten ist), sollten sie in den Relationen zu den Einrichtungskontakten und nach Möglichkeit zu den Abteilungskontakten berücksichtigt werden. Geprüft werden darf nach Möglichkeit der Unterscheidung nach den Diagnoserelationstypen mit den Ausprägungen *Hauptdiagnose*, *Nebendiagnose* und *nicht abrechnungskompatibel*. 

Von den konditionalen Begriffen Einweisungs- und Aufnahmediagnose, zu denen nur einzelne Diagnosen einen Flag gesetzt bekommen, wird zukünftig (spätestens bei der Einführung der ICD-11) das Merkmal "Vorhanden-bei-Aufnahme" ("Present-on-admission, POA") für alle Diagnosen zu unterscheiden sein. Es soll verpflichtend werden, dieses Ja-Nein-Kennzeichen zu jeder Diagnose mitzuführen, die einem Einrichtungskontakt zugeordnet ist. Entsprechend soll zu jeder Versorgungsfall-Diagnose auch ein Kennzeichen "vorhanden bei Entlassung" ("present-on-discharge", POD) zur gelegentlichen Nutzung vorgesehen werden.

In den FHIR Profilen sieht das wie folgt aus. Die Relation zum Diagnose Profil kann sowohl vom Fall Profil aus gemacht werden, als auch aus dem Diagnose Profil. Jedoch sind diese zwei Alternativen nicht gleich bedeutend. Ein Encounter kann auf keine bis zu mehreren Diagnosen verweisen, dabei kann jeder dieser Diagnosereferenzen eine sogenannte [*Diagnose-Rolle*](http://hl7.org/fhir/R4/valueset-diagnosis-role.html) zugeordnet bekommen. Diese *Rolle* soll vor allem ausdrücken ob die referenzierte Diagnose für die Kontaktinstanz eine Haupt- oder eine Nebendiagnose ist. Die Hauptdiagnose wird hier als *Chief Complaint (CC)* kodiert, während die Nebendiagnose als *Comorbidity (CM)* kodiert werden kann (für weitere Infos siehe [DiagnosisRole](http://hl7.org/fhir/R4/valueset-diagnosis-role.html)).  


------
## Relation zum Modul Prozedur
 
Eigentlich haben Prozeduren immer einen Bezug zu einem Versorgungsort. So werden einige Prozeduren in den "Basisversorgungsorten" vom Typ "Station" erbracht. Für viele Prozeduren, namentlich "Operationen", gibt es speziell ausgestattete räumliche Infrastrukturen, namentlich "OP-Säle", wo sie durchgeführt werden. Im initialen MII-Kerndatensatz wird auf die Zuordnung von Prozeduren zu Versorgungsorten verzichtet. Die Gestaltung dieser Zuordnung wird bis zur nächsten Version des MII KDS zurückgestellt, in der diese Zuordnung für konkrete Use Cases eine Rolle spielt. (siehe auch {{pagelink:KomplexesAufbaumodell, text: **komplexes Ausbaumodell**}})

Neben der Fallklasse "Versorgungsfall" kennt der MII KDS die Fallklasse "Abrechnungsfall". Obwohl Prozeduren im stationären Sektor des deutschen Gesundheitssystems merklich abrechnungsrelevant sind, wird im initialen Basismodul des MII-Kerndatensatz  auf die Zuordnung von Prozeduren zu *Abrechnungsfällen* verzichtet. Die Gestaltung dieser Zuordnung wird bis zur nächsten Version des MII KDS zurückgestellt, in der diese Zuordnung für konkrete Use Cases eine Rolle spielt. Eine komplementäre Zuordnung von Prozeduren zu (Abrechnungs-)Fällen ist für ein Erweiterungsmodul mit § 21-Daten vorgesehen.
