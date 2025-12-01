---
parent: 
---
## Beschreibung von Szenarien für die Anwendung des Moduls FALL

Die Modellierung und die FHIR-Profilierung der Basismodule des MII Kerndatensatzes einschließlich des Moduls FALL zielen darauf, möglischst generische Informationsmodelle für ein breites Spektrum von Anwendungsszenarien zu erzeugen. 

Zum Modul FALL:

Die in den Krankenhausinformationssystemen als wichtigster Datenquelle der MII erfassten Versorgungsdaten sind stets Person- und Fall-bezogen. Jede Querschnittbetrachtung betrachtet Fälle (mit unterschiedlicher Länge). Und fast jede Längsschnittbetrachtung fußt auf der Aneinanderreihung von Fällen.

In MII-Use Cases mit Feasibility-Studien werden Fälle gezählt. Die Entdeckung von Wissen in Daten beruht auf Falldaten und die Anwendung von Wissen auf Patienten (Decision support) zielt auf konkrete Fälle. In Tumorboards werden Fälle vorgestellt und bei der Infektionskontrolle werden nosokomiale Infektionen bei Fällen bekämpft.

---
## Beispiele des einfachen Aufbaumodells

Als der einfachste und zugleich eine der häufigen Varianten des Aufenthaltes im Krankenhaus kann die Versorgung durch eine bettenführende Abteilung wie „Klinik für Innere Medizin“, bei der der größte Teil von Untersuchung und Behandlung durch den Stationsdienst der Klinik umgesetzt werden. 

Die Inanspruchnahme des Ärztlichen Stationsdienstes der Klinik für Innere Medizin mit einem Beginndatum und einem Enddatum definiert den „stationären Aufenthalt des  Patienten in der Einrichtung, der in FHIR durch die Ressource [**Encounter**](http://hl7.org/fhir/encounter.html) abgebildet wird."

Die Aufenthaltsdauer beziehungsweise die zeitliche Länge des Versorgungstellenkontaktes (in der Versorgungsstelle als Organisationseinheit), des Abteilungskontaktes in der Fachabteilung und des Einrichtungskontaktes kann einfach als Differenz zwischen Enddatum und Beginndatum ermittelt werden. Bei der Berechnung der „offiziellen“ Verweildauer oder der „offiziellen“ Belegungstage sind eventuell abweichende Regeln zu beachten; dies kann man aber auf den hier nicht beschriebenen **Abrechnungsfall** zur selben Aufnahmenummer (Fallnummer) verlagern.

Die tragende Säule des einfachen Aufbaumodells ist das **Versorgungsstellenkontakt**, das den Kontakt der Patienten zu ausgewählten fachabteilungsbezogenen Versorgungseinheiten mit der Angabe von Beginn und Ende beschreibt. Implizit sind dadurch auch die Kontakte zu Fachabteilungen (**Abteilungskontakte**) und zur Einrichtung (**Einrichtungskontakte**) dargestellt. Der Einrichtungskontakt sollte gleichwohl parallel berücksichtigt werden.

Diese Hierarchie ist für diese einfache, aber häufige Konstellation mit nur einem **Versorgungsstellenkontakt** in der folgenden Abbildung wiedergegeben: 

{{render:implementation-guides/ImplementationGuide-Common/images/aufbaumodell_einfachesBsp.png}}

Hierbei beschreibt der Einrichtungskontakt den Kontakt zur Einrichtung *KH Berolina*. Dieser ist bestimmt durch den Behandlungsvertrag. Der Einrichtungskontakt enthält den Abteilungskontakt. Der Abteilungskontakt beschreibt den Kontakt zur Abteilung *Chirurgie*. Dieser ist bestimmt durch die Übertragung der Verantwortung von der Einrichtung *KH Berolina* auf die Abteilung *Chirurgie*. Der Abteilungskontakt enthält den Versorgungsstellenkontakt *stationäre Versorgung Chirurgie*. In den Versorgungsstellen (Stationsdienst, OP-Dienst, Untersuchungslabor, Ambulanz) findet die eigentliche Versorgung statt.

Das nächste Beispiel gibt ebenfalls eine gängige Form des Aufenthalts in einem Krankenhaus wieder, die aus drei (Haupt-)Versorgungsstellenkontakten besteht. 

Der Einrichtungskontakt beginnt mit einem *normalmedizinischen* Aufenthalt auf einer Normalstation (=Versorgungsstelle) eines schneidenden Faches (=Abteilung, z.B. Klinik für Chirurgie, Fachrichtung Allgemeinchirurgie, 1500). Es folgt ein *intensivmedizinischer* Aufenthalt auf einer Intensivstation (=Versorgungsstelle) einer Intensivabteilung (z.B. Klinik für Intensivmedizin und Anästhesiologie, Fachrichtung Intensivmedizin, 3600). Der Einrichtungskontakt wird abgerundet durch einen in *normalmedizinischen* Aufenthalt auf einer Normalstation (=Versorgungsstelle) derselben Fachabteilung wie am Anfang (=Abteilung, z.B. Klinik für Chirurgie, Fachrichtung Allgemeinchirurgie, 1500). Es ergibt sich ein Einrichtungskontakt mit drei Abteilungskontakten und drei Versorgungsstellenkontakten. 

{{render:implementation-guides/ImplementationGuide-Common/images/aufbaumodell_interneVerlegungskette.png}}


---



















