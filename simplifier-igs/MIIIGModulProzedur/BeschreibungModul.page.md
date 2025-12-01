## **Beschreibung Modul PROZEDUR**

{{render:implementation-guides/ImplementationGuide-Common/images/5_Abbilding_Prozedur_de.jpg}}

---

## **Einleitung**

Das Basismodul PROZEDUR enthält Datenelemente zur Dokumentation von Operationen, Eingriffen und sonstigen medizinischen Prozeduren sowie ausgewählter medikamentöser Therapien. 

Das Modul wird verwendet, um die Details aktueller und historischer Eingriffe aufzuzeichnen. Eine Prozedur ist eine Tätigkeit, die im Rahmen der Versorgung an, mit oder für einen Patienten durchgeführt wird. 

*Beispiele hierfür sind chirurgische Verfahren, diagnostische Verfahren, geburtshilfliche Unterstützung, endoskopische Verfahren, Biopsien, Beratung, Physiotherapie, persönliche Unterstützungsdienste, Tagespflegedienste für Erwachsene, Nicht-Notfalltransporte, Heimmodifikationen, Übungen usw.* 

Die Eingriffe können von einer medizinischen Fachkraft, einem Dienstleister, einem Freund oder Verwandten oder in einigen Fällen vom Patienten selbst durchgeführt werden. 

Aus historischen und abrechnungstechnischen Gründen (Zusatzentgelte) zählen in Deutschland auch ausgewählte teure Medikamente als eigenständige Prozedur.

---

## **Abbildung Modul PROZEDUR in ART-DECOR**

Das Modul sieht folgende Merkmale einer Prozedur vor, die zur automatisierten Verarbeitung der Prozedureninformationen benötigt werden: 

[{{render:implementation-guides/ImplementationGuide-Common/images/ArtDecorProzedur.png}}](https://art-decor.org/art-decor/decor-datasets--mide-?id=&effectiveDate=&conceptId=&conceptEffectiveDate=)

---

Eine Prozedur ist „eine Aktion, die an oder für einen Patienten durchgeführt wird oder wurde. Dies kann ein physischer Eingriff wie eine Operation sein, oder weniger invasiv wie Langzeit-dienste, Beratung oder Hypnotherapie.“ (siehe http://hl7.org/fhir/R4/procedure.html)

Angaben zur Prozedur können von der bloßen Erfassung eines Prozedurenkodes bei einem Behandlungsfall bis hin zu einer detaillierten strukturierten OP-Dokumentation mit Hauptprozedur und Nebenprozeduren inklusive Anästhesie und Lagerungspflege mit Einzelerfassung von OP-Datum, Gesamt-OP-Zeit, Anästhesiezeit, Schnitt-Naht-Zeit, Operateuren, Anästhesisten, OP-Pflegern, Medikationen und weiterem reichen. 

Im vorliegenden Implementation Guide für das Modul PROZEDUR in der initialen Fassung des MII-Kerndatensatzes fokussieren wir auf die grundlegenden Notwendigkeiten für die Use Cases der MI-Initiative. Wir beschränken uns im wesentlichen auf die Grundmerkmale Prozedur und Datum. Ergänzt werden können eine Freitextbeschreibung und eine Körperstelle. Wir lassen somit bewusst Raum für die spätere Ausgestaltung des Moduls.

---

## **1. Fokussierte Basisangaben zur Prozedur**

Wie einleitend angekündigt, fokussieren sich die Angaben im Modul PROZEDUR auf die wesentlichen Merkmale wie sie in den Use Cases der MII benötigt werden. Eine Beschreibung dieser Use Cases findet sich nachgfolgend im Abschnitt "Beschreibung von Szenarien für die Anwendung der Moduls PROZEDUR". Zunächst ist hier hauptsächlich die Prozedur selber und ein zugehöriges Durchführungsdatum zu nennen.
Durchgeführte Operationen sollen durch ein Tripel aus einem Prozedurenkode, dem zugehörigen Katalog und dem Katalogtext eindeutig dargestellt werden. Eine Freitexteschreibung und die Angabe einer Seitenlokalisation können implizit vorhanden sein. 

In der Regel wird in den Quellsystemen der beteiligten Universitätsklinika für die Kodierung von Prozeduren der proprietär-deutschen [OPS-Kataloge](https://www.bfarm.de/DE/Kodiersysteme/Klassifikationen/OPS-ICHI/OPS/_node.html) vom BfArM benutzt. Als Wegmarke für die Weiterentwicklung der Dokumentation haben wir (wie im Modul [DIAGNOSE](https://simplifier.net/mii-basismodul-diagnose-2024)) die ausführliche Nomenklatur SNOMED CT als erlaubtes Kodesystem ergänzt.

### Freitextbeschreibung
Sofern in den Quelldokumentationen vorhanden, erlaubt das Informationsmodell des MII-Kerndatensatzes diese abzuspeichern und zu präsentieren.
Für die ergänzende Kodierung können der OPS-Katalog und/oder SNOMED CT benutzt werden.

### OPS Prozedur kodiert

[{{render:implementation-guides/ImplementationGuide-Common/images/ArtDecorOps.jpg}}](https://art-decor.org/art-decor/decor-datasets--mide-?id=&effectiveDate=&conceptId=&conceptEffectiveDate=)

Die führende Klassifikation und Nomenklatur für Operationen und sonstige Prozeduren (Eingriffe, Behandlungen, Untersuchungen) in Deutschland ist der Operationen- und Prozedurenschlüssel (OPS) vom DIMDI. <br> Der OPS ist eine fachgebietsübergreifende, monohierarchisch strukturierte, alphanumerische Klassifikation für Operationen und Prozeduren mit bis zu 6 Hierarchieebenen. 
Die Systematik des OPS enthält in der aktuellen Fassung sechs Kapitel (1, 3, 5, 6, 8 und 9), die den Bereich aller kodierbaren medizinischen Maßnahmen abdecken. Aus historischen Gründen (Bezug zur ICPM) sind bei den Kapitelnummern Lücken; auch sind nicht alle vierstelligen Schlüsselnummern innerhalb der Kapitel belegt, die freien Stellen ermöglichen Erweiterungen.

Kapitel 5 Operationen ist topographisch-anatomisch gegliedert, Eingriffe sind also unter dem jeweiligen Organkapitel zu finden. Die übrigen Kapitel sind nach den Verfahren strukturiert.

| Kap.-Nr. | Kode-Bereich | Klassentitel                            |
|----------|--------------|-----------------------------------------|
| 1        | 1-00... 1-99 | Diagnostische Maßnahmen                 |
| 3        | 3-03... 3-99 | Bildgebende Diagnostik                  |
| 5        | 5-01... 5-99 | Operationen                             |
| 6        | 6-00... 6-00 | Medikamente                             |
| 8        | 8-01... 8-99 | Nichtoperative therapeutische Maßnahmen |
| 9        | 9-20... 9-99 | Ergänzende Maßnahmen                    |

Bei der allgemeinen Kodierung müssen die ["Hinweise für die Benutzung"](https://www.bfarm.de/DE/Kodiersysteme/Klassifikationen/OPS-ICHI/OPS/_node.html) beachtet werden. Bei Kodierung für Abrechnungszwecke im stationären Bereich ist die Anwendung der [Deutschen Kodierrichtlinien (DKR und DKR-Psych) der Selbstverwaltungspartner](https://www.g-drg.de/ag-drg-system-2023/kodierrichtlinien) erforderlich.

#### Vollständiger Prozedurenkode
Wie bei anderen Kodierungen auch genügt für die eindeutige Dokumention einer Prozedur nicht die Angabe eines Kodes.
Unter dem *Vollständigen Prozedurenkode* versteht sich ein Tripel, welches den **OPS-Kode**, das entsprechende **Kodesystem** (= OPS-Katalog mit Gültigkeitsjahr) und den **Katalogtext** des Prozedurenkodes vereinigt. 

#### Seitenlokalisation
Da der OPS keine präkoordinierten Seitenangaben enthält, wird diese in der Regel mit den Ausprägungen [Rechts, Links, Beidseits] gesondert dokumentiert, was in den Datensenken mit dem Informationsmodell des MII-Kerndatensatzes entsprechend berücksichtigt werden muss.

--- 

### SNOMED Prozedur kodiert

[{{render:implementation-guides/ImplementationGuide-Common/images/ArtDecorSct.png}}](https://art-decor.org/art-decor/decor-datasets--mide-?id=&effectiveDate=&conceptId=&conceptEffectiveDate=)

Die Aufnahme der Nomenklatur SNOMED CT in den Kanon der Kodesysteme für Diagnosen, Prozeduren und weitere medizinische Entitäten folgt dem Beschluss des Nationalen Steuerungsgremium der MII, der Unterstützung durch das BMBF und den Zielen des BMG, die im [Referentenentwurf für das Patientendatenschutzgesetz](https://www.bundesgesundheitsministerium.de/fileadmin/Dateien/3_Downloads/Gesetze_und_Verordnungen/GuV/P/Referentenentwurf_Patientendaten-Schutzgesetz__PDSG.pdf) dargestellt sind.
Zur Zeit der Veröfffentlichung dieses ImplementationGuides wird SNOMED CT in Deutschland kaum benutzt. Die Aufnahme in den Kanon der Kodesysteme stellt also eher eine Wegmarke für eine international interoperable und besser mehrfach nutzbare Dokumentation dar, die bald erreicht werden soll.


#### Vollständiger Prozedurenkode
Wie bei anderen Kodesystemen wird auch bei SNOMED CT vollständige Komposition erwartet, obwohl der SNOMED-CT-Kode an sich schon eindeutig ist.
Unter dem *Vollständigem Prozedurenkode* versteht sich ein Tripel, welches den **SNOMED-CT-Kode**, das **Kodesystem** SNOMED CT, bei dem wegen seiner Stabilität keine Orts- und Zeitangabe erforderlich ist und den **Präferierten Namen** des Kodes, wie der Katalogtext hier heißt, vereinigt. 

Wegen der Präkoordination der Seitenangabe im multiaxialen SNOMED-CT-Kode ist ein gesondertes Merkmal Seitenlokalisation nicht erforderlich. Wohl aber ist eine gesonderte Übernahme der Angabe zu Körperstelle (Linkes Schulterblatt, Endglied des rechten Zeigefingers, Tikuspedalklappe) möglich und sinnvoll, wenn sie in einer Dokumentation vorhanden ist.

--- 

#### Körperstelle

Über die *Körperstelle* kann angegeben werden, in welchem Bereich des Körpers eine Prozedur durchgeführt wurde (Topographische Information). Die *Körperstelle* wurde bewusst aus *SNOMED Prozedur kodiert* ausgegliedert, damit auch bei einer Kodierung mittels OPS-Kode die Möglichkeit der Kodierung der Körperstelle besteht. Die Angabe der Körperstelle erfolgt dann zwar mittels SNOMED CT, erfordert aber keinen vollständigen SNOMED-CT-Prozeduren-Kode.

---

## **2. Ergänzende Aspekte**

### **Zeitliche Zuordnung**

####  Durchführungsdatum

Die initiale Gestaltung des Moduls PROZEDUR beschränkt die zeitliche Zuordnung auf den Zeitpunkt, zu dem eine Prozedur durchgeführt wurde beziehungsweise begonnen worden ist.

####  Dokumentationsdatum
Immer öfter werden Operationen und sonstige Prozeduren prozedurbegleitend dokumentiert. Die gesonderte Angabe eines Dokumentationsdatums erlaubt, Abweichungen davon festzuhalten.
