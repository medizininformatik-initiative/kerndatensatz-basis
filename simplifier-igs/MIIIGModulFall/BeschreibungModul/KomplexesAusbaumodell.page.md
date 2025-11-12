---
parent: 
topic: KomplexesAufbaumodell
---
| **Folgendes Modell befindet sich noch in Arbeit!** |
| --------- |

<a id="KomplexesAusbaumodell"></a>
## Komplexes Ausbaumodell

Wie im vorliegenden Diskussionspapier fortlaufend kommuniziert, unterscheiden wir im Herangehen an die Auflösung der Ballotierungskommentare zum Modulvorschlag FALL des MII KDS zwischen einem **Einfachen Aufbaumodell** (EAM) und einem **Komplexen Ausbaumodell** (KAM). 
Das Einfache Aufbaumodell mit wenigen ausgewählten Kontaktmodulen des Ärztlichen Stationsdienstes soll dazu dienen, die erste Ballotierungsrunde mit einer Übergangslösung zu beenden. Zunächst soll also das Einfache Aufbaumodell genutzt werden, die Kommentare der HL7-Ballotierung soweit wie möglich aufzulösen. Dort wo dies nicht möglich ist, werden die Kommentatorinnen auf die Weiterentwicklungen zum Komplexen Ausbaumodell verwiesen.

Das **Komplexe Ausbaumodell** des Moduls FALL soll im Anschluss an die Abnahme des **Einfachen Aufbaumodells** in einer Kooperation der Vertreter der MI-Initiative, der Industrie (BVITG) und der Standardisierungsverbünde (SITIG) abgestimmt. Die folgenden Ausführungen stellen den Bezug zum Einfachen Aufbaumodell her und mögen als Grundlage für die weitere Diskussion dienen. Das komplexere Ausbaumodell soll in einem neuen Ballot gefestigt werden.

----
## Unterschiede zwischen Einfachem Aufbaumodell und Komplexem Ausbaumodell

Zurzeit genügt für fast alle Use Cases der MII das einfache Aufbaumodell. Soweit den Verfassern des vorliegenden Diskussionspapieres bekannt, könnte das komplexere Ausbaumodell derzeit nur dem Use Case Infection Control dienlich sein, sofern von dessen eigenständiger Modeling Group darauf zurückgegriffen werden sollte. Zukünftig wird zu prüfen sein, ob das komplexere Modell - wie von den Autoren angenommen - nicht auch für differenziertere Analysen des Versorgungsgeschehen durch Arbeitswissenschaftler oder Qualitätsmanager genutzt werden kann.

Vorausstehend wurde im Wesentlichen die Implementierung des einfachen Modells beschrieben. Nachfolgend wird der Anpassungsbedarf bei Implementierung und Parametrisierung des komplexeren Ausbaumodells beschrieben.
Es bestehen sechs relevante Unterschiede:

1.	Im Komplexen Ausbaumodell sollen auf der Ebene der Einrichtungs-OEs und der Einrichtungs-Kontakte neben den bisher fokussierten stationären Bereich der Krankenhäuser auch deren ambulantes Angebot sowie auch Arztpraxen, Rettungsdienste, Therapeuten und weitere Einrichtungen berücksichtigt werden.
2.	Im Komplexen Ausbaumodell sollen auf der Ebene der Abteilungs-OEs und der Abteilungs-Kontakte nicht nur die Versorgungsbeiträge der primären medizinischen Fachabteilungen berücksichtigt werden. Vielmehr kommen die Kontakte zu Pflegeabteilungen und die Abteilungskontakte für Sekundärleistungen hinzu.
3.	Im Komplexen Ausbaumodell sollen auf der Ebene der Versorgungsstellen-OEs und der Versorgungsstellen-Kontakte entsprechend nicht nur der Ärztliche Stationsdienst der bettenführenden Abteilungen als Versorgungsstelle berücksichtigt, sondern auch die Versorgungsbeiträge durch pflegerische Organisationseinheiten und durch nicht-bettenführenden Fachabteilungen. Folgerichtig werden von den primären Abteilungen auch deren Einsatz im OP-Bereich, in den Untersuchungsbereichen, in den Ambulanzen und im Konsiliardienst einbezogen.
4.	Ins Komplexe Ausbaumodell gehen auch vor- und nachstationäre Kontakte als Kontaktsegmente ein.
5.	Für die partiellen Diskrepanzen zwischen „nicht fallzusammengeführten“ Einrichtungskontakten und fallzusammengeführten Abrechnungsfällen wird eine konsistente Lösung erarbeitet.
6.	Im komplexen Ausbaumodell können die Versorgungsorte in die Darstellung einbezogen werden. Dabei wird auf den Unterschied zwischen den teilweise abstrakten Organisationseinheiten der Versorgungsstellen (z.B. Ärztlicher Dienst ohne räumliche Zuordnung oder Pflegedienst Station(OE) mit räumlicher Bindung) und den Versorgungsorten als Location (z.B. Station(Ort)) zu achten sein.

Einrichtungskontakt und Abrechnungsfall sowie die bestehenden Abteilungskontakte und -module des stationären Bereichs bleiben beim Wechsel vom einfachen Aufbaumodell zum komplexen Ausbaumodell zunächst im Prinzip und im Wesentlichen unberührt. 

Die sich aus den Erweiterungen ergebende kombinatorische Ausweitung wird durch die folgende Abbildung angedeutet. Während im einfachen Aufbaumodell jeweils nur eine Variante von Einrichtungen (Krankenhäuser), Abteilungen (bettenführende medizinische Fachabteilungen) und Versorgungsstellen (Ärztlicher Stationsdienst) vorgesehen waren, ergibt sich Komplexen Ausbaumodell ein merkliches Spektrum von Varianten und deren Kombination.

---
## Matrix aus Kontakt-Ebenen und Kontakt-Klassen im Komplexen Ausbaumodell

Die Erweiterungen und die sich daraus ergebenden alten und neuen Kombinationen von Kontaktebenen und Kontaktklassen werden im Folgenden aus der Perspektive der Abteilungs- und Versorgungsstellenkontakte betrachtet.

Bei den Abteilungskontakten der primären Fachabteilungen (beispielsweise zur Versorgung durch eine Klinik für Gastroenterologie oder eine Klinik für Visceralchirurgie) sollen neben der bed-side-Versorgung durch den ärztlichen Stationsdienst im Stationsbereich auch die Untersuchungen und Behandlungen in dezentralen Versorgungsstellen (Organisationsbereichen) wie dem Endoskopie-Labor und dem OP-Bereich berücksichtigt werden. Ohnehin sind weiterhin Versorgung auf Normalstationen, Intermediärstationen und  Intensivstationen zu unterscheiden.

Patientinnen werden aber nicht nur durch ihre primär verantwortlichen Fachabteilungen versorgt. Beispielsweise können gastroenterologische Patienten von Visceralchirugen operiert werden, pneumologische Patienten von Thoraxchirurgen und kardiologische Patienten von Herzchirurgen. In diesen Beispielen ist die Inanspruchnahme einer Versorgungsstelle mit der Inanspruchnahme einer sekundärleistenden anderen Fachabteilung verbunden, die unter Umständen für andere Patienten die Primärkliniken sind. Ähnlich gilt, dass Kontakte zu Anästhesiologen, Radiologen und so weiter neben der Inanspruchnahme der einschlägigen Versorgungsstelle zugleich die Inanspruchnahme einer anderen Fachabteilung darstellt.

Und schließlich ist die Organisation der Pflege in den meisten Krankenhäusern eigenständig mit eigenen Pflegeabteilungen organisiert. Dies erlaubt die Interpretation, dass der Kontakt zu Pflegeabteilungen parallel zum Kontakt zu Fachabteilungen gesehen werden und die Inanspruchnahme von Pflegeleistungen gestuft als Kontakt zu Pflegeabteilungen und Kontakt zu Pflegeversorgungsstellen (oft in Form bettenführender Stationen) gesehen werden kann.

Der Gliederung in Kontakt-Ebenen folgt hierbei eine Ausdifferenzierung der Kontakt-Klassen.

In der Fortschreibung des **Einfachen Aufbaumodells**  unterscheiden wir bei der Kontakt-Ebene Einrichtungskontakt die Klassen *stationär*, *ambulant* und *teilstationär* sowie die ambulante Sonderform *nur vorstationär*.

Auf der Kontakt-Ebene der Abteilungskontakte finden wir im Ausbaumodell weiterhin die Klassen *vorstationär*, *vollstationär* und *nachstationär*. Hinzu kommen jedoch zur Berücksichtigung von internen Fremdkontakten die Klasse *Sekundärversorgung* und zur Berücksichtigung der Kontakte zu Pflegeabteilungen die Klassen *Sekundär* und *Pflege* hinzu, des Weiteren *ambulant* und *teilstationär*. Dabei soll beispielsweise bei Operationen durch „fremde Fachabteilungen“ von Sekundärleistungen die Rede sein und nicht von „Ambulanten Besuchen".

Die Ausweitung der dritten Encounter-Ebene Versorgungsstelle erfordert neue Encounter-Klassen. Als vorläufiger Ansatz wird für die stationären Encounter das ValueSet Normalmedizin, Intensivmedizin, Normalpflege, Intensivpflege, OP, U&B und Konsil vorgeschlagen; für teilstationäre Encounter das verkürzte ValueSet Normalmedizin, Normalpflege, OP, U&B und Konsil; 
für ambulante Encounter zunächst nur U&B, Konsil und OP.

**Encounter-Klassen nach Sektoren (Die Vorschläge sind nicht final!!)**

| Encounter-Level/Typ | stationär | teilstationär | ambulant inkl. "nur vorstationär" |
|--|--|--|--|
| Ebene 1: Einrichtung | stationär | teilstationär | ambulant inkl. "nur vorstationär"|
| | vorstationär, vollstationär | teilstationär | ambulant, "nur vorstationär" |
| Ebene 2: Abteilung | Sekundärversorgung, Pflege, nachstationär | | | 
| Ebene 3: Versorgungsstelle | Normalmedizin, Intensivmedizin, Normalpflege, Intensivpflege, OP, U&B, Konsil | Normalmedizin, Normalpflege, OP, U&B, Konsil | U&B, Konsil | 

---
## Beginn- und Endedaten im komplexen Ausbaumodell

Im komplexen Ausbaumodell finden sich Einrichtungskontakte und primäre Abteilungskontakte, bei denen die Regeln für Beginn- und Endedaten unangetastet vom einfachen Aufbaumodell übernommen werden. (Der Umgang mit „zusammengeführten Fällen“ muss gesondert erarbeitet werden.)
Synchron dazu werden die Beginn- und Endedaten bei der stationären Pflege entsprechend den im Krankenhausinformationssystemen eingetragen Werte übernommen. Temporäre Abwesenheiten – zum Beispiel zu Untersuchungen, Behandlungen und Operationen - werden nicht berücksichtigt. Das bedeutet, dass wie bei den primären Fachabteilungskontakten in der Vollstationären Phase das Beginndatum des ersten Pflegeabteilungskontaktes mit dem Beginndatum der Einrichtungskontaktes, dem Datum der Aufnahme ins Haus, übereinstimmt. Analog gilt auch, dass das Endedatum des letzten Pflegeabteilungskontaktes mit dem Ende des Einrichtungskontaktes, also dem Datum der Entlassung aus dem Haus, übereinstimmt, und dass die Pflegeabteilungskontakte in der Regel eine lückenlose Kette bilden.

Anders verhält es sich mit den Fachabteilungskontakten für interne Fremdleistungen (Sekundärleistungen). Hier werden nach Möglichkeit genaue Präsenzzeiten notiert, die wie eine parallele Anwesenheit aussehen, aber nur parallele Verantwortlichkeiten wiederspiegeln.
Dieses Bild der sequentiellen und parallelen Kontakte auf der Abteilungsebene wird sich auf Versorgungsstellenebene wiederspiegeln. Dabei kann wie beim „Ärztlichen Stationsdienst“, der bereits im Einfachen Aufbaumodell Berücksichtigung gefunden hat, auch bei weiteren Kontakten oft von 1:1-Beziehungen ausgegangen werden. 

Das weitere Vorgehen bei der Modellierung der sekundären Abbildung des Versorgungsgeschehen im Kerndatensatz wird einerseits von den Fragestellungen und andererseits von den verfügbaren Daten und drittens von der Abwägung zwischen transaktionaler und analyse-orientierter Speicherung und Nutzung der Daten abhängen. Es darf angenommen werden, dass hinsichtlich Beginndatum und Endedatum der Kontakte zu Pflegeleistungenstellen sequentielle Datierungen gewählt werden, während die zeitliche Zurordnung zu sekundären Versorgungsstellen (OP, Röntgen, Endoskopie) oft als parallele Ereignisse dargestellt werden werden.

---
## Berücksichtigung der Versorgungsorte im komplexen Ausbaumodell

Bereits beim Einfachen Aufbaumodell wurde darauf hingewiesen, dass Versorgungsorte als Location und Versorgungsstellen als Organisationseinheiten zu unterscheiden sind. Dies wird ein wichtiger Aspekt des **Moduls Strukturdaten** im MII Kerndatensatz sein.
Versorgungsorte im engeren Sinne sind die baulichen Einheiten eines Krankenhauses wie Gebäude, Etagen, Flur, Raumgruppen und Räume. Je nach Fragestellung werden aber auch Elemente innerhalb von Räumen wie Betten, OP-Tische, Untersuchungskammern und Untersundungsstühle als Versorgungsorte anzusehen sein.

An dieser Stelle kann vorüberlegt werden, dass im Versorgungsprozess wie bei der Beziehung zwischen Abteilung und Versorgungsstelle auch bei der Beziehung Versorgungsstelle und Versorgungsort oft 1:1-Relationen kommen wird. Prominente Beispiele sind StationOE und StationOrt sowie OPOE und OPOrt. Diese 1:1-Relation relativiert sich aber, wenn in unterschiedlichen Anwendungsszenarien auch verschiedene Details wie Stellplatz und Bett oder Vorbereitungsliege und OP-Tisch und Aufwachraumbett zu berücksichtigen sein werden.
Die Modellierung des Komplexen Aufbaumodells bietet auch an dieser Stelle ein breites Spektrum von Optionen und sollte daher zum gegebenen Zeitpunkt anforderungsgerecht umgesetzt werden.

---

<a id="Abrechnungsfall"></a>
## Abrechnungsfall (zurückgestellt)

Für den stationären Sektor sind die Regeln für die Definition von Abrechnungsfällen durch das Fallpauschalgesetz und das Krankenhausentgeltgesetz definiert. Das Datenformat für die Entgeltermitlung und die Datenübermittlung an das Institut für Entgelte im Krankenhaus (InEK) ist im [§ 21 KHEntgG](https://www.g-drg.de/Datenlieferung_gem._21_KHEntgG) festgelegt. Darin findet sich auch die Beschreibung der Tabelle FALL. (Es gibt eine große Überschneidung mit den Formaten deS § 301 SGB V, die der Kommunikation mit den Krankenkassen dienen.)

Da wir uns bei der Festlegung der Eckpunkte des Kontaktes vom Typ **Einrichtungskontakt** eng an die Eckpunkte der Falldefinition einschließlich der Fallzusammenführungsvorschriften im Krankenhausentgeltgesetz orientiert haben, liegt eine klare Grundlage für die Modellierung des Accounts oder Abrechnungsfalles vor. Die Merkmale für die Abrechnungsfälle werden direkt aus der Tabelle FALL des § 21-Datensatzes übernommen.

Es ist vorgesehen die übrigen Tabellen der § 21-Datensatzes in einem gesonderten Erweiterungsmodul des MII KDS mitzuführen, um die innerbetriebliche Kompatibilität zu betriebssteuernden Arbeitsgruppen zu ermöglichen.

Jeder Abrechnungsfall hat ein Startdatum und ein Enddatum. Diese Daten sind oft mit dem Startdatum und Enddatum eines zugehörigen Einrichtungskontaktes identisch. Gelegentlich müssen auch nacheinanderfolgende Fälle wegen gleicher Diagnose oder bei Komplikationen zu einem gemeinsamen Abrechnungsfall zusammengeführt werden. Diese administrativen Fallzusammenführungen erfolgen gelegentlich erst nach längerer Zeit (beispielsweise nach Aufforderung durch den Medizinischen Dienst der Krankenkassen) und müssen bei der Pflege der Data Repositories in Datenintegrationszentren entsprechend berücksichtigt werden.


