---
parent: 
---
## Beschreibung Modul FALL

{{render:implementation-guides/ImplementationGuide-Common/images/13_Abbildung_Fall_de.jpg}}


---

## Einleitung

Im Modul FALL des MII KDS benutzen wir den Begriff *Fall* nur als ungenauen Oberbegriff und folgen darin dem [**Leitfaden Basis DE (R4)**](https://ig.fhir.de/basisprofile-de/1.5.0/ig-markdown-Ressourcen-AmbulanterStationaererFall.html), dem Implementation Guide (IG) der Deutschen FHIR Basisprofile des HL7 Deutschland e.V. Dort wird die differenzierte Verwendung der FHIR Begriffe [**EpisodeOfCare**](http://hl7.org/fhir/R4/episodeofcare.html), [**Encounter**](http://hl7.org/fhir/R4/encounter.html) und [**Account**](http://hl7.org/fhir/R4/account.html) vorgeschlagen: 

>Der Begriff "Fall" gruppiert im Sprachgebrauch verschiedene Konzepte, die in FHIR durch unterschiedliche Ressourcen repräsentiert werden:
>
>1. **Aufenthalt/Besuch**: Der stationäre Aufenthalt oder ambulante Besuch eines Patienten in einer Einrichtung wird in FHIR durch die Ressource [*Encounter*](http://hl7.org/fhir/R4/encounter.html) abgebildet.
> 
>2. **Abrechnungsfall**: Der Fall im Sinne einer Gruppierung von medizinischen Leistungen, die in einem gemeinsamen Kontext abgerechnet werden, sind in FHIR durch die Ressource [*Account*](http://hl7.org/fhir/R4/account.html) repräsentiert. Ein Abrechnungsfall kann mehrere [*Encounter*](http://hl7.org/fhir/R4/encounter.html) umfassen (z.B. vorstationärer Besuch, stationärer Aufenthalt und nachstationärer Besuch).
>
>3. **Medizinischer Fall**: Der medizinische Fall gruppiert Informationen, die im Kontext einer gemeinsamen (Dauer-)Diagnose stehen und wird in FHIR durch die [*EpisodeOfCare*](http://hl7.org/fhir/R4/episodeofcare.html) dargestellt.

Im Mittelpunkt des vorliegenden IG stehen die Aufenthalte und Besuche von Patient*innen bei Gesundheitseinrichtungen. Aufenthalte und Besuche werden nachfolgend unter dem Begriff **Kontakt** zusammengefasst und durch verschiedene Beiworte differenziert. 

Anders als es die schlanke Zuweisung der FHIR-Ressource [*Encounter*](http://hl7.org/fhir/R4/encounter.html) zu stationären Aufenthalt und ambulanten Besuchen suggeriert, kann die Darstellung der Versorgung in Gesundheitseinrichtungen in einem Modul FALL beinahe beliebig komplex gestaltet werden. 

Zum einen ist zu berücksichtigen, dass Patienten bei einem „stationären Aufenthalt“ in einem Krankenhaus auf eine komplexe hierarchische Organisation treffen. Der Behandlungsvertrag wird mit der Einrichtung (obere Hierarchieebene) geschlossen. Zahlreiche Pflichten und Rechte werden an die medizinischen Fachabteilungen (mittlere Hierarchieebene) delegiert – zum Teil durch die Einrichtungen, zum Teil qua Gesetz (z.B. strukturelle und prozedurale Qualitätsanforderungen, teilweise Eigenforschungsprivilegien). Die eigentliche Versorgung aber findet durch die handelnden Personen in den Versorgungsstellen (untere Hierarchieebene) statt. Im ambulanten Sektor, der im Wesentlichen durch Arztpraxen und die „ambulanten Besuche“ der Patient*innen darin repräsentiert wird, sind die Strukturen und Prozesse in der Regel weniger komplex. Das hilft aber bei der Modellierung wenig, da der stationäre und der ambulante Sektor gemeinsam im Modell der Medizininformatik-Initative abgebildet werden soll.

Zum anderen soll die Modellierung und FHIR-Profilierung des Moduls FALL eine Reihe verschiedener Anwendungsszenarien in der Versorgung und der Forschung unterstützen, bei denen es um die Zuordnung von Rechten und Pflichten (z.B. Zugriff auf Patientendaten und Eigenforschungsprivilegien), um Kontakte zum Personal (z.B. Hygienemaßnahmen und Infektionsnachverfolgung), um aktuelle Aufenthaltsorte (z.B. Zusendung von Medikamenten und Material), um historische Aufenthaltsorte (z.B. Analyse von Infektionsketten) oder um innerbetriebliche Kosten- und Leistungsrechnung gehen kann.

In der Medizininformatik-Initiative wird nicht in jedem Anwendungsfall das vollständige Spektrum der Kontaktdetails benötigt. Es gibt auch in der MII Konstellationen, in denen nur einfaches Modell FALL (z.B. zur Ermittlung der Qualitätssicherungsverantwortung oder der Eigenforschungsprivilegien) benötigt wird oder die Datenlage nur ein einfaches Modul FALL erlaubt (z.B. Generierung aus dem Datensatz gemäß [§ 21 KHEntgG](https://www.g-drg.de/Datenlieferung_gem._21_KHEntgG)). Daher unterscheidet der vorliegende IG zwischen zwei Modellentwicklungsphasen:

* {{pagelink: EinfachesAufbaumodell, text: **Einfaches Aufbaumodell**, hint: Einfaches Aufbaumodell}} mit Fokussierung auf die primären Abteilungskontakte
* {{pagelink: KomplexesAufbaumodell, text: **Komplexes Ausbaumodell**, hint: Komplexes Aufbaumodell}} mit einer ausführlicheren Darstellung von Patient-Behandler-Kontakten.

Im ersten Kapitel des vorliegenden IG wird **nur das einfache Aufbaumodell** und seine Verwandtschaft mit den Tabellen FALL und FAB des Datensatzes gemäß [§ 21 KHEntgG](https://www.g-drg.de/Datenlieferung_gem._21_KHEntgG) beschrieben. Das komplexe Ausbaumodell des Moduls FALL erfordert, dass zunächst ein Strukturmodell für die Einrichtungen erarbeitet wird. Daher wird es im vorliegenden IG erstmal nur skizziert.

Gemeinsam ist dem vorgestellten einfachen Aufbaumodell und dem skizzierten komplexen Ausbaumodell die vorläufig dreistufige Hierarchie mit der Unterscheidung der Organisationseinheiten Einrichtung, Abteilung und Versorgungsstelle in der Darstellung der Organisationsstrukturen und der komplementären Kontakttypen **Einrichtungskontakt**, **Abteilungskontakt** und **Versorgungsstellenkontakt** im {{pagelink:EinfachesAufbaumodell, text: einfachen Aufbaumodell}} in der Darstellung des Rückgrates der Versorgungsprozesse.

Bereits das rudimentäre Aufbaumodell erlaubt in Ansätzen die Ergänzung der Angabe von Versorgungsorten. Sinnvoll ist die Lokalisierung der Versorgung aber erst im komplexen Ausbaumodell, in dem auch die Organisationseinheiten wie OP-Dienst, Poliklinik-Dienst, Ambulanzdienst, Röntgenstelle usw. mit den entsprechenden Orten in das Modell aufgenommen werden. Daher findet sich auch die Ergänzung der Angaben zum Versorgungsort erst im Schlusskapitel des vorliegenden IG.

Das MII-KDS-Modul FALL wird vervollständigt durch die Relationen zu anderen Basismodulen wie [**Diagnose**](https://simplifier.net/mii-basismodul-diagnose-2024) und [**Prozedur**](https://simplifier.net/mii-basismodul-prozedur-2024), und zu Erweiterungsmodulen wie dem Modul [**Strukturdaten**](https://simplifier.net/medizininformatikinitiative-modulstrukturdaten), welches die Organisationseinheit und den Versorgungsort der Patienten modelliert. Weitere Informationen hierzu sind im Abschnit {{pagelink: KontextImGesamtprojekt, text: **Kontext im Gesamtprojekt / Bezüge zu anderen Modulen**}} zu finden.

Eine weitere zentrale Entität des MII-KDS-Moduls Fall ist der [**Account**](http://hl7.org/fhir/account.html), das "Konto" des Abrechnungsfalls. Dieser wird jedoch erst im {{pagelink:KomplexesAufbaumodell, text: **komplexen Ausbaumodell**}} berücksichtigt.

Zu beachten ist auch das Referenzprojekt [ISiK (Informationssysteme im Krankenhaus) der Gematik](https://www.gematik.de/anwendungen/isik), in dem es das Konzept FALL gibt.

---
## Zielsetzung

Aufgabe des Moduls Fall ist die use-case-orientierte Abbildung der Kontakte (Aufenthalte und Besuche) zwischen Patienten und Einrichtungen mit den Hauptfragen „wer“, „wann“, „bei wem“. In der Medizininformatik-Initiative spielt die Nachverfolgung der Kontakte oft keine Rolle, gelegentlich ist es notwendig, die verantwortliche Fachabteilung mit Rechten und Pflichten zu kennen.

Bei Trennung von {{pagelink:EinfachesAufbaumodell, text: **einfachem Aufbaumodell**}} und {{pagelink:KomplexesAufbaumodell, text: **komplexem Ausbaumodell**}} kann sich das einfache Modell auf die Kontakte zu den Fachabteilungen konzentrieren. Beispiele für den Bedarf sind in einigen Bundesländern die Zuordnung der Eigenforschungsprivilegien und allgemein das Interesse an Fachabteilungsbezogenen Diagnosestatistiken und ähnlichem.

Bei der Gestaltung der einfachen Aufbauvariante des Moduls Fall, erfolgt eine Orientierung an den Tabellen FALL und FAB des Datensatzes gemäß [§ 21 KHEntgG](https://www.g-drg.de/Datenlieferung_gem._21_KHEntgG), damit aus diesen Datensätzen eine Übergangslösung generiert werden kann.
