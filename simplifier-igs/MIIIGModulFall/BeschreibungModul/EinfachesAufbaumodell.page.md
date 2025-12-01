---
parent: 
topic: EinfachesAufbaumodell
---

## Einfaches Aufbaumodell 

### Abbildung in Art-Decor

[{{render:implementation-guides/ImplementationGuide-Common/images/artDecor_Fall.png}}](https://art-decor.org/art-decor/decor-datasets--mide-?id=&effectiveDate=&conceptId=&conceptEffectiveDate=)

Das Kontakt-Modell des MII KDS orientiert sich, wie oben beschrieben, an den Festlegungen zur FHIR Ressource [*Encounter*](http://hl7.org/fhir/encounter.html) der internationalen Standardisierungsgremien und deren Beachtung in den [Deutsche Basisprofilen (R4)](https://simplifier.net/basisprofil-de-r4). 

> **Aufenthalt/Besuch/Kontakt**: Der stationäre Aufenthalt oder ambulante Kontakt eines Patienten in einer Gesundheitseinrichtung wird in FHIR durch die Ressource [**Encounter**](http://hl7.org/fhir/encounter.html) abgebildet. 
(Quelle: [Deutsche Basisprofile (R4)](https://simplifier.net/basisprofil-de-r4))

Bei der Ausgestaltung des einfachen Aufbaumodells des Moduls Fall sind die Anforderungen der Mehrheit der Anwendungsszenarien (Use Cases der MII, ohne Use Case Infection Control), sowie in rudimentärer Weise die Aufbauorganisation (*Struktur*) und Ablauforganisation (*Prozesse*) der beteiligten patientendatenführenden Einrichtungen zu beachten gewesen. Die Ausbaubarkeit stellte eine relevante Nebenbedingung dar (siehe {{pagelink: KomplexesAufbaumodell, text: **Komplexes Ausbaumodell**, hint: Komplexes Aufbaumodell}}.

Der Erfüllung der Anforderungen der Use Cases und die Berücksichtigung der Aufbauorganisation, die zunächst auf eine dreistufige Hierarchie aus *Einrichtung*, *Abteilung* und *Versorgungsstelle* reduziert wird, dient der Unterscheidung von: 

1. [Einrichtungskontakte](#einrichtungskontakt): Kontakte zur Einrichtung; Behandlungsvertrag etc. 
2. [Abteilungskontakte](#abteilungskontakt): Kontakte zur Abteilung; delegierte Versorgungsverantwortung, Eigenforschungsprivilegien etc.
3. [Versorgungsstellenkontakte](#versorgungsstellenkontakt): Kontakte zu Versorgungsstellen und den eigentlich Behandelnden

Proaktiv umgesetzt werden im Einfachen Aufbaumodell zunächst nur die [*Einrichtungskontakte*](#einrichtungskontakt), die durch die Aufnahmen und Entlassungen von „Krankenhausfällen“ definiert sind, und eine definierte Auswahl von [*Versorgungsstellenkontakten*](#versorgungsstellenkontakt) – so wie sie für die Mehrheit der Use Cases benötigt werden. Die [*Abteilungskontakte*](#abteilungskontakt) können aus den *Versorgungsstellenkontakten*, die Angaben zur verantwortlichen Abteilung beinhalten, hergeleitet werden. 

-----
<a id="GemeinsameDatenelemente"></a>
### Gemeinsame Datenelemente der Kontaktebenen

**Kontakt-Ebene**

Für die Unterscheidung der Hierarchieebenen eines Kontaktes wird im Modul Fall des MII Kerndatensatzes das Merkmal der *Kontakt-Ebene* herangezogen. Es werden folgende Ausprägungen unterschieden:
1. [Einrichtungskontakt](#einrichtungskontakt)
2. [Abteilungskontakt](#abteilungskontakt)
3. [Versorgungsstellenkontakt](#versorgungsstellenkontakt)

Diese Gliederung gilt im einfachen Ausbaumodell **zunächst für stationäre Kontakte**. Die Übertragung auf ambulante und teilstationäre Kontakte muss noch abgestimmt werden. Das dazugehörige ValueSet wird von den [Deutschen Basisprofilen (R4)](https://simplifier.net/basisprofil-de-r4) vorgegeben. 

**Kontakt-Klasse**

Auf Einrichtungsebene, also auf der Kontakt-Ebene [*Einrichtungskontakt*](#einrichtungskontakt), kann die Kontakt-Klasse unter Anderem *stationär*, *ambulant* oder *teilstationär* sein. Die einzelnen Kontakt-Klassen können dann über die **Kontakt-Art** weiter ausdifferenziert werden.

Im einfachen Aufbaumodell wird bei ambulanten und teilstationären Kontakten auf eine Differenzierung über die Kontakt-Art verzichtet. Im **komplexen Ausbaumodell** des Moduls Fall kommen auf der zweiten und dritten Ebene weitere Klassen hinzu, was im Abschnitt {{pagelink: KomplexesAufbaumodell, text: **Komplexes Ausbaumodell**, hint: Komplexes Aufbaumodell}} näher erläutert wird. 

**Kontakt-Art**

Zu den einzelnen Kontakt-Klassen kann es zusätzliche Kontakt-Arten geben, diese können die Kontakt-Klasse genauer spezifizieren. So kann zum Beispiel bei der Kontakt-Klasse *stationär*, die spezifischere Kontakt-Art *intensivstationär* hinzugefügt werden. 

**Patienten-Identifikator**

Bei der internen Nutzung dient die sogenannte *Patientennummer* als Identifikator. Diese wird bei der ersten Aufnahme in die Einrichtung parallel zur ersten *Fallnummer* (**Aufnahmenummer**) vergeben. Bei jeder Wiederaufnahme (oder korrigierend danach) erfolgt eine Zuordnung zu dieser konstanten Patientennummer und die Vergabe einer neuen wechselnden Fallnummer. 

**Aufnahmenummer**

Jeder Patient erhält bei der Planung einer Aufnahme oder bei der Aufnahme selbst eine **Aufnahmenummer** (auch *Fallnummer* oder *Krankenhausinternes Kennzeichen* genannt). Im Prinzip gilt diese Aufnahmenummer von der Aufnahme bis zur Entlassung - und auch bei den zugehörigen vorstationären und nachstationären Kontakten. Sie dient bei allen digital unterstüzten Vorgängen der Zuordnung zu dem Aufenthalt des Patienten in der Einrichtung. Im MII KDS dient sie als Identifikator bzw. Referenz zum Einrichtungskontakt. 

Eine Besonderheit liegt bei geplanten Aufnahmen und bei vorstationären Kontakten vor, bei denen die Aufnahmenummer bereits vor der Aufnahme vergeben wird, was im Aufnahmeprozess zu beachten ist. Ähnliches gilt bei der Nutzung der Aufnahmenummer bei nachstationären Kontakten nach der Entlassung. Dies wird jedoch erst im Rahmen des {{pagelink: KomplexesAufbaumodell, text: **komplexen Ausbaumodells**, hint: Komplexes Aufbaumodell}} spezifiziert. 

**Beginndatum**

Das formale **Beginndatum** eines Einrichtungskontaktes ist der Aufnahmezeitpunkt. Vorhergehende vorstationäre Kontakte werden bei der Definition des Beginndatums nicht berücksichtigt. 

Auch beim Abteilungs- und Versorgungstellenkontakt gibt es jeweils  ein neues Beginndatum. Hier handelt es sich jeweils um die "Aufnahme" in die oder den Zugang zu der Fachabteilung bzw. Versorgungsstelle im Rahmen einer Verlegungskette oder auch bei interkurrenten Kontakten/Besuchen ohne formale Verlegung. 

**Enddatum**

Das formale **Enddatum** eines Einrichtungskontaktes ist der dazu gehörige Entlassungszeitpunkt. Nachgehende nachstationäre Kontakte werden bei der Definition des Enddatums nicht berücksichtigt. 

Für das Enddatum beim Abteilungs- und Versorgungstellenkontakt gilt das Analoge wie beim Beginndatum.

---
### Das temporäre Konstrukt "Organisationseinheit"

Für die vollständige Abbildung der Datenstrukturen im Modul Fall, werden Referenzen zu Datenelementen aus einem zukünftigen Modul zu Organisationseinheiten benötigt. Da dieses Modul noch nicht steht, dennoch das Modul Fall zum Einsatz kommen soll, ist hierfür das temporäre Modell *Organisationseinheit* erstellt worden. Hierin sollen erstmal nur die Datenelemente definiert werden, die für die Vervollständigung des Moduls Fall gebraucht werden und soll als kein vollständiges Modul betrachtet werden. Zu den benötigten Datenelemente gehören:

**Einrichtungsidentifikator**

Zur Vorbereitung der Kooperation mit anderen Einrichtungen soll sich der *Einrichtungsidentifikator* aus dem *Namen der Einrichtung* und *Institutionskennzeichen der Einrichtung* zusammensetzen lassen. 

**Abteilungsidentifikator**

Der Abteilungsidentifikator besteht aus dem Abteilungsnamen, dem Abteilungskürzel, der Angabe *Hauptabteilung* versus *Belegabteilung*, der Fachrichtungsbezeichnung und dem Fachrichtungsschlüssel. 

**Bis auf Weiteres wird der proprietäre deutsche  Fachabteilungsschlüssel des § 301 SGB V und des Datensatzes gemäß § 21 KHentgG als Fachrichtungsschlüssel genutzt, weil dieser in jedem Krankenhaus als |Fachabteilungsschlüssel im Einsatz ist. Der Einsatz des IHE-Fachabteilungsschlüssel wird geprüft, sobald einschlägige Anforderungen formuliert werden.**

**Versorgungsstellenidentifikator**

Im einfachen Aufbaumodell beschränkt sich die Versorgungsstelle auf den **nicht räumlich** zugeordneten ärztlichen Stationsdienst der Fachabteilungen. Die Kurzbezeichnung setzt sich aus einem Kürzel für ärztlichen Stationsdienst (ÄSD), einem Intensivversorgungsdiskriminator und dem Fachrichtungskürzel zusammen. (Beispielsweise ÄSD_N_0100 oder ÄSD_I_3600 oder ÄSD_N_2800 oder ÄSD_I_2800). 

Im weiteren Ausbau, wird der Versorgungsstellenidentifikator im Prinzip aus dem Versorgungsstellennamen und dem hausinternen Kürzel bestehen. Es sollte sich um die Bezeichnung der **Organisationseinheit** handeln. Es muss geprüft werden, wie eine Verwechslung mit der Bezeichnung des Versorungsortes zu vermeiden ist.

---
<a id="Einrichtungskontakt"></a>
## Einrichtungskontakt

Ein Einrichtungskontakt beginnt mit der Aufnahme zur stationären Behandlung (die Bestätigung einer geplanten Aufnahme ist das Gleiche) im Krankenhaus mit Abschluss eines Behandlungsvertrages und endet zunächst mit der Entlassung aus der stationären Behandlung. Das zusammenhaltende Merkmal eines Einrichtungskontaktes ist die *Aufnahmenummer* (auch *Fallnummer* genannt), die bei der Aufnahme oder der Planung einer Aufnahme vergeben wird.

**Vostationäre Kontakte** - also zeitlich vorhergehende Kontakte zu Versorgungsstellen der Einrichtung bleiben wie andere ambulante und teilstationäre Kontakte im einfachen Aufbaumodell unberücksichtigt. 

**Nachstationäre Kontakte** - also zeitlich nachgehende Kontakte zu Versorgungsstellen der Einrichtung bleiben wie andere ambulante und teilstationäre Kontakte im einfachen Aufbaumodell unberücksichtigt.

Vor- und nachstationäre Kontakte werden im **Einfachen Aufbaumodell** weggelassen, weil diese den Charakter von sekundären Versorgungsstellenbesuchen wie OP-Besuch, Röntgenbesuch und weiteren haben, die erst im {{pagelink: KomplexesAufbaumodell, text: **komplexen Ausbaumodell**, hint: Komplexes Aufbaumodell}} näher vorgestellt werden. Diese Kontakte können bei den meisten Fragestellungen vernachlässigt werden, da sie weder bei der Fallzählung (Anzahl Einrichtungskontakte), noch bei der Zuordnung von Diagnosen oder Prozeduren eine besondere Rolle spielen. Sie werden unter der gleichen *Aufnahmenummer* (Fallnummer) geführt wie der stationäre *Kernfall*. Bei der Berechnung der Verweildauer werden diese üblicherweise nicht berücksichtigt. 

Natürlich gibt es auch Fragestellungen, bei denen die vor- und nachstationäre Kontakte zu berücksichtigen sind, wie beispielsweise bei der Infektionskontrolle. Dieser Use-Case erfordert aber ohnehin die Umsetzung des {{pagelink: KomplexesAufbaumodell, text: **komplexen Ausbaumodells**, hint: Komplexes Aufbaumodell}}.

Die Einrichtungskontakt hat folgende Merkmale: 

| Nr. | Bezeichnung            | Beispiel oder Bedeutung                                           |
| --- | ---------------------- | ----------------------------------------------------------------- |
| 1.  | Kontaktebene           | Einrichtungskontakt                                               |
| 2.  | Kontaktklasse          | stationäre Versorgung                                             |
| 3.  | Patientenidentifikator | Patientennummer, lebenslange Nummer der Person in der Einrichtung |
| 4.  | Aufnahmenummer         | Fallnummer, die dem Patienten bei Aufnahme zugewiesen wird        |
| 5.  | Aufnahmeanlass         | Einweisung durch einen Arzt                                       |
| 6.  | Aufnahmegrund          | Krankenhausbehandlung, vollstationär                              |
| 7.  | Beginndatum            | Aufnahmedatum, z.B. 2020.08.15 07:45:00                           |
| 8.  | Enddatum               | Entlassungsdatum, z.B. 2020.08.17 17:45:00                        |
| 9.  | Entlassungsgrund       | 07: Verstorben                                                    |


Wie zuvor erwähnt, sind Einrichtungskontakte nach den Merkmalen (Kontaktklassen) *stationär*, *ambulant* und *teilstationär* zu unterscheiden. Im einfachen Aufbaumodell werden nur stationäre Kontakte berücksichtigt.

Neben den [gemeinsamen Datenelementen](#GemeinsameDatenelemente), sind im deutschen Gesundheitswesen eine Reihe von Merkmalen relevant, deren Ausprägungen sich an den Werten in der Tabelle FALL des Datensatzes gemäß [§ 21 KHEntgG](https://www.g-drg.de/Datenlieferung_gem._21_KHEntgG) orientieren und zum Teil dem Einrichtungskontakt zugeordnet werden können. Hierzu gehören der **Aufnahmeanlass**, der **Aufnahmegrund**, und der **Entlassungsgrund**.

Im Folgenden wird das Art-Decor Modell vorgestellt.


### Art-Decor Modell - Einrichtungskontakt

[{{render:implementation-guides/ImplementationGuide-Common/images/artDecor_Einrichtungskontakt.png}}](https://art-decor.org/art-decor/decor-datasets--mide-?id=&effectiveDate=&conceptId=&conceptEffectiveDate=)


---
<a id="Abteilungskontakt"></a>
## Abteilungskontakt

Im **einfachen Aufbaumodell** entspricht die Kette der Abteilungskontakte (Minimum und häufigster Wert: n=1) der in der Regel lückenlosen Verlegungskette in der Tabelle FAB des Datensatzes gemäß [§ 21 KHEntgG](https://www.g-drg.de/Datenlieferung_gem._21_KHEntgG). Wiedergegeben wird die Beziehung der Patienten zu den Verantwortung-, Rechte- und Pflichten-übernehmenden, primären, bettenführenden Fachabteilungen. Das Beginndatum des ersten vollstationären **Abteilungskontaktes** (ohne Kontakte der Klasse *vorstationär*) ist identisch mit dem Aufnahmedatum des **Einrichtungskontaktes**. Das Endedatum des letzten vollstationären Abteilungskontaktes (ohne Kontakte der Klasse *nachstationär*) ist identisch mit dem Entlassungsdatum des **Einrichtungskontaktes**. Im Abteilungskontakt kann die Referenz zur Fachabteilung über den **Fachabteilungsschlüssel** aufgebaut werden. 

Für das [**komplexe Ausbaumodell**](https://simplifier.net/guide/MedizininformatikInitiative-ModulFall-ImplementationGuide/KomplexesAusbaumodell) steht die Überlegung im Raume, neben den Kontakten zu den primären Fachabteilungen (wie in der Tabelle FAB) auch die Kontakte zu den sekundären Fachabteilungen (Anästhesie, Radiologie, adjuvant operierende Abteilungen) und Pflegeabteilungen zu berücksichtigen. Dies wird jedoch erst im Rahmen des [**komplexen Ausbaumodells**](https://simplifier.net/guide/MedizininformatikInitiative-ModulFall-ImplementationGuide/KomplexesAusbaumodell) bzw. des **Erweiterungsmoduls Strukturdaten** näher behandelt. 

### Art-Decor Modell - Abteilungskontakt

[{{render:implementation-guides/ImplementationGuide-Common/images/artDecor_Abteilungskontakt.png}}](https://art-decor.org/art-decor/decor-datasets--mide-?id=&effectiveDate=&conceptId=&conceptEffectiveDate=)

---
<a id="Versorgungsstellenkontakt"></a>
## Versorgungsstellenkontakt

Versorgungsstellenkontakte repräsentieren die Kontakte der Patienten zu als Versorgungsstellen dienenden **Organisationseinheiten (OE)** wie Stationen, OP-Bereichen, U&B-Bereichen. Hierbei sollte drauf geachtet werden, dass es sich um die OE handelt zu der der Versorgungsort zugeordnet ist. Im Einzelfall kann eine OE einen festen Versorgungsort haben, wodurch diese den gleichen Namen tragen können. 

Im **Einfachen Aufbaumodell** ist die Darstellung des Versorgungsstellenkontaktes **optional**. Die abstrakte OE „Ärztlicher Stationsdienst“ der bettenführenden Fachabteilungen kann wegen der 1:1 Beziehung zur Fachabteilung integriert in den Abteilungskontakt berücksichtigt werden. Über die Umsetzung im [**komplexen Ausbaumodell**](https://simplifier.net/guide/MedizininformatikInitiative-ModulFall-ImplementationGuide/KomplexesAusbaumodell) wird zum gegebenen Zeitpunkt entschieden. 

Es ist zu beachten, dass in bestimmten Fällen der Unterschied zwischen einem Abteilungskontakt und Versorgungsstellenkontakt nur in einer unterschiedlichen Granularität des Versorgungsortes (Station, Raum, Bettplatz) und des verantwortlichen Leistungserbringers besteht.

### Art-Decor Modell - Versorgungsstellenkontakt

[{{render:implementation-guides/ImplementationGuide-Common/images/artDecor_Versorgungsstellenkontakt.png}}](https://art-decor.org/art-decor/decor-datasets--mide-?id=&effectiveDate=&conceptId=&conceptEffectiveDate=)


-----

<a id="Abrechnungsfall"></a>
## Abrechnungsfall (zurückgestellt)

Für den stationären Sektor sind die Regeln für die Definition von Abrechnungsfällen durch das Fallpauschalgesetz und das Krankenhausentgeltgesetz definiert. Das Datenformat für die Entgeltermitlung und die Datenübermittlung an das Institut für Entgelte im Krankenhaus (InEK) ist im [§ 21 KHEntgG](https://www.g-drg.de/Datenlieferung_gem._21_KHEntgG) festgelegt. Darin findet sich auch die Beschreibung der Tabelle FALL. (Es gibt eine große Überschneidung mit den Formaten deS § 301 SGB V, die der Kommunikation mit den Krankenkassen dienen.)

Da wir uns bei der Festlegung der Eckpunkte des Kontaktes vom Typ **Einrichtungskontakt** eng an die Eckpunkte der Falldefinition einschließlich der Fallzusammenführungsvorschriften im Krankenhausentgeltgesetz orientiert haben, liegt eine klare Grundlage für die Modellierung des Accounts oder Abrechnungsfalles vor. Die Merkmale für die Abrechnungsfälle werden direkt aus der Tabelle FALL des § 21-Datensatzes übernommen.

Es ist vorgesehen die übrigen Tabellen der § 21-Datensatzes in einem gesonderten Erweiterungsmodul des MII KDS mitzuführen, um die innerbetriebliche Kompatibilität zu betriebssteuernden Arbeitsgruppen zu ermöglichen.

Jeder Abrechnungsfall hat ein Startdatum und ein Enddatum. Diese Daten sind oft mit dem Startdatum und Enddatum eines zugehörigen Einrichtungskontaktes identisch. Gelegentlich müssen auch nacheinanderfolgende Fälle wegen gleicher Diagnose oder bei Komplikationen zu einem gemeinsamen Abrechnungsfall zusammengeführt werden. Diese administrativen Fallzusammenführungen erfolgen gelegentlich erst nach längerer Zeit (beispielsweise nach Aufforderung durch den Medizinischen Dienst der Krankenkassen) und müssen bei der Pflege der Data Repositories in Datenintegrationszentren entsprechend berücksichtigt werden.
