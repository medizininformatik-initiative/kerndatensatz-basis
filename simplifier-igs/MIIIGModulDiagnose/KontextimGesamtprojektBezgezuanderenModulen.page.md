---
parent: 
---
## Kontext im Gesamtprojekt / Bezüge zu anderen Modulen

Diagnosen stellen die zentrale Entität bei der Beschreibung von Gesundheit und Krankheit in allen Use Cases der MII dar. Unter 'Beschreibung von Szenarien für die Anwendung der Module' findet sich die Beschreibung der Anwendung des Moduls DIAGNOSE in den einzelnen Konsortien.

---


**Modul PERSON**

Da die Grundlage der MII die Real-World-Daten der beteiligten Universitätsklinika bilden, existiert neben dem allgemeinen Personenbezug immer ein Bezug zur hausspezifischen Personenentität **PATIENT**.<br> 


**Modul FALL**

Für den stationären und den teilstationären Kontext werden folgende Aspekte berücksichtigt. Im Zuge des Aufnahmeprozesses ins Krankenhaus (einschließlich der digitalen Kommunikation mit den Krankenkassen) werden initial Diagnosen als Voraussetzung für die Kostenübernahme duch die Krankenkassen erfasst. Dabei beschreibt die Kategorie *Einweisungsdiagnose* die Krankheitsangabe des einweisenden Arztes. Die Kategorie *Aufnahmediagnose* gibt die (vorläufige) Einschätzung des aunehmenden Hauses wieder. 

Regelmäßig werden auch im Laufe des Versorgungsprozesses Diagnoseangaben notiert - zum Beispiel als *Fachabteilungshaupt-* und *Fachabteilungsnebendiagnosen*, oder zur Begründung von Leistungsanforderungen und therapeutischen Maßnahmen, einschließlich Medikationen. 

Die fast abschließende Diagnosedokumentation erfolgt im Zuge der Entlassung aus dem Krankenhaus. Die dabei erfassten Diagnosen erfahren eine Überprüfung durch leitende Ärzte und Controller, sowie (gefärbt durch Abrechnungsregeln) eine Unterscheidung von *Krankenhaushaupt-* und *Krankenhausnebendiagnosen*. Dabei verbieten die Deutschen Kodierrichtlinien die Berücksichtigung von Angaben zu Diagnosen in der Kommunikation mit den Kostenträgern, wenn diese während des stationären Aufenthaltes keine Aufwände erzeugt haben. Im Bezug zum Abrechnungsfall kommen diese Diagnosen also nicht vor. 

Sofern die erfassten, aber nicht-nichtabrechnungskompatiblen Diagnosen nicht gelöscht werdern (was im Prinzip verboten ist), sollten sie in den Relationen zu den Einrichtungskontakten und nach Möglichkeit zu den Abteilungskontakten berücksichtigt werden. Geprüft werden darf nach Möglichkeit der Unterscheidung nach den Diagnoserelationstypen mit den Ausprägungen *Hauptdiagnose*, *Nebendiagnose* und *nicht abrechnungskompatibel*. 

Von den konditionalen Begriffen Einweisungs- und Aufnahmediagnose, zu denen nur einzelne Diagnosen einen Flag gesetzt bekommen, wird zukünftig (spätestens bei der Einführung der ICD-11) das Merkmal "Vorhanden-bei-Aufnahme" ("Present-on-admission, POA") für alle Diagnosen zu unterscheiden sein. Es soll verpflichtend werden, dieses Ja-Nein-Kennzeichen zu jeder Diagnose mitzuführen, die einem Einrichtungskontakt zugeordnet ist. Entsprechend soll zu jeder Versorgungsfall-Diagnose auch ein Kennzeichen "vorhanden bei Entlassung" ("present-on-discharge", POD) zur gelegentlichen Nutzung vorgesehen werden.

In den FHIR Profilen sieht das wie folgt aus. Die Relation zum Diagnose Profil kann sowohl vom Fall Profil aus gemacht werden, als auch aus dem Diagnose Profil. Jedoch sind diese zwei Alternativen nicht gleich bedeutend. Ein Encounter kann auf keine bis zu mehreren Diagnosen verweisen, dabei kann jeder dieser Diagnosereferenzen eine sogenannte [*Diagnose-Rolle*](http://hl7.org/fhir/valueset-diagnosis-role.html) zugeordnet bekommen. Diese *Rolle* soll vor allem ausdrücken ob die referenzierte Diagnose für die Kontaktinstanz eine Haupt- oder eine Nebendiagnose ist. Die Hauptdiagnose wird hier als *Chief Complaint (CC)* kodiert, während die Nebendiagnose als *Comorbidity (CM)* kodiert werden kann (für weitere Infos siehe [DiagnosisRole](http://hl7.org/fhir/valueset-diagnosis-role.html)). 

Für die Referenz von der Diagnose aus zum Fall, muss beachtet werden, dass eine Diagnose zwar auf einen Fall referenzieren darf, es sich hierbei jedoch um den Fall/Kontakt handeln muss im Rahmen dessen die Diagnose auch festgestellt wurde. Anders gesagt, darf eine Diagnose nicht auf einen Einrichtungskontakt verweisen, sondern auf den zutreffenden Abteilungs-/Versorgungsstellenkontakt.


**Sonstige Relationen**

In der Regel liegen in den verfügbaren Real-World-Daten keine direkten Relationen der Diagnosen zu Versorgungsorten, Prozeduren, Medikationen und Laborbefunden vor, obwohl diese natürlich beispielsweise therapeutisch, physiologisch oder ätiologisch bestehen. 
Der Zusammenhang ist in der Regel über den Versorgungskontext (*Einrichtungskontakt*, *Abteilungskontakt*) oder über die zeitlichen Zusammenhänge herzustellen.

Die Berücksichtigung solcher Bezüge ist der Weiterentwicklung des Moduls DIAGNOSE und seiner Relationen vorbehalten.

---

## **Auslagerung**

### *Diagnosetyp*

Über den Diagnosetyp wird angegeben, um welche Art von Diagnose es sich handelt. Der Diagnosetyp wird codiert angegeben. 

Es ergeben sich folgende Diagnosetypen für die Datenübermittlung nach §301 SGB V:

* Aufnahmediagnose
* Einweisungsdiagnose
* Fachabteilungsdiagnose
* Nachfolgediagnose (mit anschließender Arbeitsunfähigkeit)
* Entlassungsdiagnose
* Fachabteilungszusatzdiagnose
* Überweisungsdiagnose
* Behandlungsdiagnose

* Haupt- und Nebendiagnosen (im Wesentlichen abrechnungstechnisch definiert) sowie Primär- und Sekundär¬diagnose werden über zusätzliche Attribute abgebildet.

Das Attribut Diagnosetyp wird laut den [Deutschen Basisprofilen](https://ig.fhir.de/basisprofile-de/1.4.0/Ressourcen-DiagnosenCondition.html#Diagnose-Typen) als Eigenschaft des Encounters modelliert und ist somit nicht Teil des Diagnoseprofils.

### *Vorhanden-bei-Aufnahme* und *Vorhanden-bei-Entlassung*

Gelegentlich beginnt eine Diagnose auch erst während eines stationären Aufenthaltes (z.B. bei einer nosokomialen Infektion oder einem Sturz). Dies kann durch das Ja-Nein-Merkmal "Vorhanden-bei-Aufnahme" unterschieden werden, sofern es erfasst wurde. Die Gültigkeit einer Diagnose über den Fallabschluss hinaus, kann durch das Ja-Nein-Merkmal "Vorhanden-bei-Entlassung" ausgedrückt werden. 

Auch dieser Aspekt wird zunächst aus dem Modul DIAGNOSE ausgelagert. Allerdings wird mit der 11. Version der ICD *Vorhanden-bei-Aufnahme* und *Vorhanden-bei-Entlassung* als Zusatzkennzeichen eingeführt und sollte dann in das Modul aufgenommen werden.
