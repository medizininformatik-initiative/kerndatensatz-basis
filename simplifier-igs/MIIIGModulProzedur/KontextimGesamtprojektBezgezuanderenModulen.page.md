## Kontext im Gesamtprojekt / Bezüge zu anderen Modulen

Diagnostische, therapeutische und weitere Prozeduren stellen einen Kernprozess der Routineversorgung dar und finden an allen Standorten der Medizininformatik-Initiative statt. 

Am detailliertesten und in der Regel digital erfolgt die Operationen- und Prozedurendokumentation an allen Standorten in den zentralen OP-Bereichen. Regelmäßig erfolgt die Dokumentation nach lokalen Vorgaben in einer Vielzahl gesonderter Op- und Anästhesie-Systeme. Bundesweit einheitlich verfügbar für alle stationären und teilsteationären Fälle aus allen deutschen Krankenhäusern einschließlich der an der Medizininformatik-Initiative-beteiligten Universitätsklinika sind nur die Angaben zu den DRG-relevanten Maßnahmen in der Tabelle OPS des Datensatzes gemäß § 301 SGB V.


Perspektivisch sind Prozedurenangaben von hoher Bedeutung für eine Vielzahl von Fragestellungen, z.B. in Wirksamkeitsstudien und gesundheitsökonomischen Analysen. Da allerdings aus den Use Cases der Medizininformatik-Initiative keine über eine OPS-Erfassung hinausgehenden Anforderungen vorliegen, beschränkt sich die Anpassung des MII-KDS vorliegend im Wesentlichen auf die FHIR-Profilierung und die Internationalisierung durch Ergänzung von SNOMED CT als erlaubtem Kodesystem.

---
### Bezüge zu anderen Modulen


Ähnlich wie das Modul DIAGNOSE ist das Modul PROZEDUR im MII-Kerndatensatz primär mit dem Modul [PERSON](https://simplifier.net/mii-basismodul-person-2024) verknüpft. 
Abgesehen davon, dass per se fast alle Prozeduren einen Leistungserbringer erfordern, stammen natürlich praktische alle Prozedurenangaben von Leistungserbringern, bei denen die prozedural untersuchten oder behandelten Personen Patienten und Fälle sind.
Dies wird durch eine Versorgungsfall-Prozedur-Relation ausgedrückt, die nicht im ART-Decor-Modell dargestellt ist, aber im FHIR-Profil implementiert wird.

Es sei drauf verwiesen, dass das Modul [MEDIKATION](https://simplifier.net/mii-basismodul-medikation-2024) als auch das Modul [FALL](https://simplifier.net/medizininformatikinitiative-modulfall) Referenzen auf dieses Modul besitzen. Erläuterungen hierzu finden sich im jeweiligen Modul.

### Zurückgestellte Beziehungen zu anderen Modulen

* Modul DIAGNOSE <br> In der Regel werden Prozeduren nur mit Begründung durch eine Diagnose durchgeführt. Im initialen MII-Kerndatensatz wird wie beim Datensatz gemäß § 21 KHEntgG auf die Zuordnung von Prozeduren zu Diagnosen verrzichtet. Die Gestaltung dieser Zuordnung wird bis zur nächsten Version des MII KDS zurückgestellt, in der diese Zuordnung für konkrete Use Cases eine Rolle spielt.

