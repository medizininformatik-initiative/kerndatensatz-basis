---
parent: 
---
## Referenzen

Die Modellierung des Datensatzes zum Modul DIAGNOSE enthält Referenzen zu folgenden Projekten:

* es orientiert sich zum einen zwecks Rückwärts- und Querkompatibilität am Format des [Datensatzes](https://www.g-drg.de/datenlieferung-gem.-21-khentgg) gemäß §21 KHEntgG
* Zwecks Vorwärts- und internationaler Kompatibilität stellt zum anderen die [IPS](http://hl7.org/fhir/uv/ips/STU1/) (International Patient Summary) ein Leitmodell dar. Die Abstimmung mit dem [Common Data Model](https://www.ohdsi.org/data-standardization/the-common-data-model/) von OMOP und OHDSI bleibt späteren Versionen überlassen.
* Auch der [Diagnosenleitfaden HL7 Deutschland](https://wiki.hl7.de/index.php?title=IG:Diagnoseleitfaden) wurde berücksichtigt.

Es wurden außerdem die [Kernspezifikation von HL7 FHIR](http://hl7.org/fhir/R4/), hierunter die entsprechende Ressource [Condition](http://hl7.org/fhir/R4/condition.html), und die bisherigen Arbeiten zu den [Deutschen Basisprofilen](https://ig.fhir.de/basisprofile-de/1.4.0/Home.html) berücksichtigt. 

Die vorliegende Spezifikation wurde gestaltet auf Basis der Beschreibung des MII-Kerndatensatzes in der Version vom 10.3.2017 [(PDF)](https://www.medizininformatik-initiative.de/sites/default/files/inline-files/MII_04_Kerndatensatz_1-0.pdf), sowie der Datensatzbeschreibung in [ART-DECOR](https://art-decor.org/art-decor/decor-project--mide-).


Als Klassifikationen und Terminologien sollen die ICD-10-GM, die Alpha-ID, die Orpha-Kennummern und SNOMED CT unterstützt werden. Die Nutzung der ICD-11-GM wird zum amtlich festgelegten Zeitpunkt zu berücksichtigen sein und muss bereits heute bei allen Planungen berücksichtigt werden.
