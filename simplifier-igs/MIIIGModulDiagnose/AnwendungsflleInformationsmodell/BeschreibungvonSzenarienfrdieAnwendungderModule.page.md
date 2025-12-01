---
parent: 
---
## Beschreibung von Szenarien für die Anwendung des Moduls DIAGNOSE

Die Modellierung und die FHIR-Profilierung der Basismodule des MII Kerndatensatzes einschließlich des Moduls DIAGNOSE zielen darauf, möglischst generische Informationsmodelle für ein breites Spektrum von Anwendungsszenarien zu erzeugen. Prioritäre Berücksichtigung haben die konsortialen Use Cases der vier Konsortien der [Medizininformatik-Initiative](https://www.medizininformatik-initiative.de) (MII) [DIFUTURE](https://difuture.de), [HiGHmed](https://www.highmed.org), [MIRACUM](https://www.miracum.org) und [SMITH](https://www.smith.care/de/) und der beiden transkonsortialen Verbundvorhaben [CORD-MI](https://www.medizininformatik-initiative.de/CORD) und [POLAR-MI](https://www.medizininformatik-initiative.de/POLAR) gefunden. Einen großen Einfluss auf die Gestaltung hat auch gehabt, dass  die digital gespeicherten (oder zu speichernden) Patientendaten aus den Versorgungsprozessen in den beteiligten 34 Universitätsklinika die wesentliche Grundlage der Medizininformatik-Initiative bilden.

Zum Modul DIAGNOSE: In jedem Use Case der MII spielen Diagnosen eine zentrale Rolle.

---

### *Zu den Szenarien der Konsortien im Einzelnen:*

* DIFUTURE:
Der DIFUTURE-Ansatz ist Use-Case-getrieben, wobei Use Cases mit konkreten Krankheitsbildern verknüpft sind. Der Fokus liegt auf den neurologischen Krankheitsentitäten Multiple Sklerose und Parkinson Disease, aber auch auf onkologischen und kardiologischen Indikationen. Multiple Sklerose und Parkinson Disease lassen sich relativ differenziert mit den Diagnose-Codes des ICD-10 (ggf. auch Alpha-ID) kennzeichnen. Auch die anderen Parameter des Moduls DIAGNOSE sind in den DIFUTURE Use Cases maßgebend. 

* HiGHmed:
Mangels feingranularer Diagnosen, die für die Versorgung anstelle der Abrechnung dokumentiert wurden, werden auch in HiGHmed die für die Abrechnung kodierten Diagnosen genutzt. Diagnosen spielen in allen HiGHmed Use Cases eine wichtige Rolle, vor allem aber in den Use Cases Kardiologie und Onkologie um Comorbiditäten einbeziehen zu können.

* MIRACUM:
In allen Use Cases des MIRACUM Konsortiums stehen Erkrankungen der Patientinnen und Patienten und die darauf basierenden kodierten Diagnosen im Vordergrund. Im Use Case 1 "IT Support für die Patienten Rekrutierung" sind sie ein wichtiges Kriterium zum Ein- bwz. Ausschluss von Patienten in Studien; im Use Case 2 "Prädiktion klinischer Verläufe" gehen sie in die zu entwickelnden Modelle als Kriterium für die untersuchte Population und ihre Komorbiditäten ein und im Use Case 3 "IT Unterstützung für Molekulare Tumorboards" werden Tumorentitäten neben anderen Klassifikationssystemen primär durch die ICD-Kodierung beschrieben.

* SMITH:
Im SMITH-Use-Case ASIC stehen Patienten mit Acute Respiratory Distress Syndrome (ARDS) im Mittelpunkt, deren Diagnose entsprechend inklusive konkreter Schweregradbestimmung kodiert zu erfassen ist. HELP als zweiter Use Case ist im Umfeld der Antibiotic Stewardship anzusiedeln – hier sind Komplikationen mit konkreter Diagnosestellung wie Endokarditis, Sepsis oder septischer Schock relevant. Bei der Phenotyping Pipeline (PheP) schließlich spielt die Ermittlung und Konkretisierung von verschiedensten Diagnosen im Rahmen der Phänotypisierung von Patienten eine wichtige Rolle.

* CORD-MI:
Im Rahmen von CORD-MI wird die Weiterentwicklung der Diagnosendokumentation für Patienten mit seltenen Erkrankungen durch breite Stärkung von Orpha-Kennummern im Versorgungskontext betrieben. In spezifischen Auswertungen zur Mukoviszidose, Phenylketonurie, Morbus Fabry, Sagittalsynostosen, POMC-Mangel und Neuromyelitis optica sowie unspezifischen Auswertungen zu Verbreitung von und Datenqualität bei mehreren Diagnosen sollen Entwicklungen des Projektfortschrittes abbildbar werden.

* POLAR-MI:
Im Use Case POLAR-MI haben Diagnosen eine doppelte Bedeutung. Zum einen sind sie die Begründung für die Applikation von Arzneimitteln. Zum anderen repräsentieren sie Unerwünschte Arzneimittelwirkungen. Und Beiträge zu deren Reduzierung zu leisten, ist das zentrale Anliegen von POLAR-MI.



