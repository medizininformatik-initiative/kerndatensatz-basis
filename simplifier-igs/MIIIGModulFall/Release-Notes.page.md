## {{page-title}}

**Version: 2025.0.1**

Datum 28.10.2025

- `Changed`: `Encounter.location` erlaubt jetzt die Angabe ehemaliger Kontaktorte. Siehe: https://github.com/medizininformatik-initiative/kerndatensatzmodul-fall/issues/79

**Version: 2025.0.0**

Datum 10.12.2024

- Dependency auf de.basisprofil.r4 aktualisiert auf Version 1.5.0. Die Änderung hat keine Auswirkung auf Implementierungen dieses Moduls.
- Profile enthalten zusätzliche Beschreibungen und Übersetzungen für Implementierer und das Forschungsdatenportal für Gesundheit (FDPG).
- Suchparameter aus diesem Modul entfernt. SearchParameter-Ressourcen werden nun zentral im Modul Meta verwaltet.
- Änderung der Kardinalität von `Encounter.period` im Profil {{pagelink: KontaktGesundheitseinrichtungEncounter, text: Encounter (Kontakt Gesundheitseinrichtung), hint: MII_PR_Fall_KontaktGesundheitseinrichtung}} von 1..1 zu 0..1 zur Abbildung von geplanten Kontakten bei denen der tatsächliche Zeitraum des Kontakes noch unbekannt ist. Siehe: https://github.com/medizininformatik-initiative/kerndatensatzmodul-fall/issues/56 
- Das Vorhandensein von Beginn- und Endzeitpunkt (`Encounter.period`) abhängig vom Status eines Kontaktes wird nun durch Bedingungen geprüft, die auf der Seite {{pagelink: KontaktGesundheitseinrichtungEncounter, text: Encounter (Kontakt Gesundheitseinrichtung), hint: MII_PR_Fall_KontaktGesundheitseinrichtung}} im Abschnitt 'Invarianten' beschrieben sind. Siehe: https://github.com/medizininformatik-initiative/kerndatensatzmodul-fall/issues/34 
- Erweiterung des Encounter-Profils {{pagelink: KontaktGesundheitseinrichtungEncounter, text: Encounter (Kontakt Gesundheitseinrichtung), hint: MII_PR_Fall_KontaktGesundheitseinrichtung}} um zwei Extensions für das geplante Start- bzw. Enddatum in `Encounter.extension`.
- Korrektur des ValueSet-Bindings auf dem Element `Encounter.serviceType.coding:ErweiterterFachabteilungsschluessel` zu [http://fhir.de/ValueSet/dkgev/Fachabteilungsschluessel-erweitert](https://simplifier.net/packages/de.basisprofil.r4/1.4.0/files/656779). Siehe: https://github.com/medizininformatik-initiative/kerndatensatzmodul-fall/issues/60 und https://github.com/medizininformatik-initiative/kerndatensatzmodul-fall/issues/55 
- Must-Support FHIR Datenelemente im Profil {{pagelink: KontaktGesundheitseinrichtungEncounter, text: Encounter (Kontakt Gesundheitseinrichtung), hint: MII_PR_Fall_KontaktGesundheitseinrichtung}} enthalten jetzt erweiterte Beschreibungen unter 'Short description' und 'Definition'.
- `Encounter.diagnosis.use` hat neu ValueSet-Binding zu `https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/mii-vs-fall-diagnosis-use`.
- `Encounter.location` in den Slices für Zimmer, Bett, Station Änderung der Kardinaliät der Elemente `Encounter.location.location.identifier` und `Encounter.location.location.display` von 1..1 zu 0..1. Siehe: https://github.com/medizininformatik-initiative/kerndatensatzmodul-fall/issues/67 
- `Encounter.location` und `Encounter.serviceProvider` entfernen der MustSupport-Labels. Siehe: https://github.com/medizininformatik-initiative/kerndatensatzmodul-fall/issues/71 

---

**Version: 2024.0.1**

Datum: 17.04.2024

- Korrektur der Version-Parameter der Conformance-Ressourcen. Im zuvor veröffentlichten Package entsprach `StructureDefinition.version` nicht einheitlich der Package-Version. Siehe: https://github.com/medizininformatik-initiative/kerndatensatzmodul-fall/issues/51

---

**Version: 2024.0.0**

Datum: 28.03.2024

- Die veröffentlichten FHIR-Packages verwenden nun [Calender Versioning (CalVer)](https://calver.org/) nach dem Schema YYYY.MINOR.PATCH. Damit wird ein Releasezyklus im Jahresrhythmus etabliert. Die Jahresversion (YYYY) zeigt das Jahr an, in dem das Kerndatensatzmodul angewendet wird. MINOR-Versionen werden bei Einführung neuer Funktionen, Erweiterungen oder substantieller Änderungen veröffentlicht. PATCH-Versionen umfassen Bugfixes oder textuelle Korrekturen.
- Die Benennung der Conformance-Ressourcen und Beispielinstanzen folgt nun einheitlichen [MII-Namenskonventionen](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Namenskonventionen-f%C3%BCr-FHIR%E2%80%90Ressourcen-in-der-MII).
- Die {{pagelink: FHIRProfile, text: Anforderungsdokumentation, hint: Anforderungsdokumentation}} verwendet nun Schlüsselwörter nach [RFC-2119](https://datatracker.ietf.org/doc/html/rfc2119).
- Änderung der Dependency von [Version 0.9.13](https://simplifier.net/packages/de.basisprofil.r4/0.9.13) auf [Version 1.4.0](https://simplifier.net/packages/de.basisprofil.r4/1.4.0) der FHIR Basisprofile von HL7 Deutschland.
- Beim Wechsel von Modul Fall Version 1.0 auf die Version 2.0 (2024.0.0) dieses Moduls sind folgende substantielle Änderungen im Profil {{pagelink: KontaktGesundheitseinrichtungEncounter, text: Encounter (Kontakt Gesundheitseinrichtung), hint: MII_PR_Fall_KontaktGesundheitseinrichtung}} zu beachten:
    - Der Aufnahmegrund wurde in Version 1.0 unter ~~`Encounter.reasonCode`~~ angegeben. Neu ist die Erfassung des Aufnahmegrundes per [Extension aus den deutschen FHIR Basisprofilen](https://simplifier.net/packages/de.basisprofil.r4/1.4.0/files/656695) im Element `Encounter.extension:Aufnahmegrund`.
    - Das ValueSet-Binding auf dem Element `Encounter.identifier.type` für die Aufnahmenummer um den Code [v2-0203#VN](https://simplifier.net/resolve?scope=hl7.fhir.r4.core@4.0.1&filepath=package/CodeSystem-v2-0203.json) erweitert.
    - Unter `Encounter.location` befindet sich nun eine Vorgabe, wie Angaben zu den Aufenthaltsorten Zimmer, Bett und Station OPTIONAL abgebildet werden können.
    - In Version 1.0 war `Encounter.diagnosis.use` OPTIONAL zu verwenden bei Angabe einer Diagnose. Neu ab dieser Version ist die Aufteilung von `Encounter.diagnosis.use.coding` in Diagnosetyp und DiagnosesubTyp, von denen mindestens einer vorhanden sein MUSS.
    - In Version 1.0 enthielt `Encounter.serviceType` lediglich eine Vorgabe für den Fachabteilungsschlüssel. Dieser wurde in dieser Version um den Erweiterten-Fachabteilungsschlüssel ergänzt.