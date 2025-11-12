## {{page-title}}

**Version: 2025.0.1**

Datum 20.10.2025

- `Condition.onsetAge`: Unter `Condition.onset[x]` kann jetzt auch der Datentyp `Age` verwendet werden. Siehe: https://github.com/medizininformatik-initiative/kerndatensatzmodul-diagnose/issues/78
- `Condtion.bodySite`: Änderung der Kardinalität des SNOMED-Coding Slice von 1..1 zu 0..1. Siehe: https://github.com/medizininformatik-initiative/kerndatensatzmodul-diagnose/issues/75 
- Neu hinzugefügt wurden ValueSets und Bindings für ICD-10-GM (Canonical URL: `https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-icd10gm`) und AlphaID (Canonical URL: `https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-alphaid`), die mit dem MII-Terminologieserver (https://www.ontoserver.mii-termserv.de/) expandiert werden können und somit erweiterte Validierung ermöglichen.
- CapabilityStatement aktualisiert: das CapabilityStatement enthält nun Anforderungsdokumentation für Suchparameter `_count` und `_summary`.

**Version: 2025.0.0**

Datum 09.12.2024

- Dependency auf de.basisprofil.r4 aktualisiert auf [Version 1.5.0](https://simplifier.net/packages/de.basisprofil.r4/1.5.0). Die Änderung hat keine Auswirkung auf Implementierungen dieses Moduls.
- `Condition.code` und `Condition.bodySite` ICD-O-3 Slices entfernt. Diese werden nun durch das Modul Onkologie definiert.
- Profile enthalten zusätzliche Beschreibungen und Übersetzungen für Implementierer und das Forschungsdatenportal für Gesundheit (FDPG).
- Suchparameter aus diesem Modul entfernt. SearchParameter-Ressourcen werden nun zentral im Modul Meta verwaltet.
- Ressourcen verwenden in diesem Release modulübergreifend SNOMED CT in der Version `http://snomed.info/sct/900000000000207008/version/20240701`, um eine stabile [ValueSet-Expansion](http://hl7.org/fhir/R4/valueset.html#expansion) sicherzustellen.
- `Condition.verificationStatus` hat neu MustSupport-Label. Siehe: https://github.com/medizininformatik-initiative/kerndatensatzmodul-diagnose/issues/64 

**Version: 2024.0.0**

Datum 16.04.2024

- Die veröffentlichten FHIR-Packages verwenden nun [Calender Versioning (CalVer)](https://calver.org/) nach dem Schema YYYY.MINOR.PATCH. Damit wird ein Releasezyklus im Jahresrhythmus etabliert. Die Jahresversion (YYYY) zeigt das Jahr an, in dem das Kerndatensatzmodul angewendet wird. MINOR-Versionen werden bei Einführung neuer Funktionen, Erweiterungen oder substantieller Änderungen veröffentlicht. PATCH-Versionen umfassen Bugfixes oder textuelle Korrekturen.
- Die Benennung der Conformance-Ressourcen und Beispielinstanzen folgt nun einheitlichen [MII-Namenskonventionen](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Namenskonventionen-f%C3%BCr-FHIR%E2%80%90Ressourcen-in-der-MII).
- Ressourcen verwenden in diesem Release modulübergreifend SNOMED CT in der Version `http://snomed.info/sct/900000000000207008/version/20230731`, um eine stabile [ValueSet-Expansion](http://hl7.org/fhir/R4/valueset.html#expansion) sicherzustellen.
- Die {{pagelink: FHIRProfile, text: Anforderungsdokumentation, hint: Anforderungsdokumentation}} verwendet nun Schlüsselwörter nach [RFC-2119](https://datatracker.ietf.org/doc/html/rfc2119).
- Änderung der Dependency von [Version 0.9.13](https://simplifier.net/packages/de.basisprofil.r4/0.9.13) auf [Version 1.4.0](https://simplifier.net/packages/de.basisprofil.r4/1.4.0) der FHIR Basisprofile von HL7 Deutschland. 
- Beim Wechsel von Modul Diagnose Versionen 1.0 auf die Version 2.0 (2024.0.0) dieses Moduls ergeben sich durch die veränderte Dependency substantielle Änderungen (Breaking Change) am Profil {{pagelink: DiagnoseCondition, text: Diagnose (Condition), hint: MII_PR_Diagnose_Condition}}:
    - Bei doppel-/mehrfachkodierten ICD-Codes MUSS die Abbildung der Codebestandteile über separate Condition-Ressourcen erfolgen.
    - Die Verlinkung der Condition-Ressourcen MUSS über die [Extension: Condition Related](http://hl7.org/fhir/StructureDefinition/condition-related) erfolgen.
    - Ein gegebenenfalls vorhandenes Mehrfachkodierungskennzeichen (`*`, `†`, `!`) MUSS vom ICD-Code getrennt in der [Extension: Mehrfachkodierungs-Kennzeichen bei ICD-10-GM](https://simplifier.net/packages/de.basisprofil.r4/1.4.0/files/656614) erfasst werden.
    - Die Canonical-URL für das CodeSystem ICD-10-GM wurde geändert von ~~`http://fhir.de/CodeSystem/dimdi/icd-10-gm`~~ zu `http://fhir.de/CodeSystem/bfarm/icd-10-gm`. Für ICD-10-GM-Codes MUSS die aktuelle Canonical-URL im Element `Condition.code.coding.system` verwendet werden.
    - Siehe auch Beschreibung und Beispiele unter {{pagelink: DiagnoseCondition, text: Diagnose (Condition), hint: MII_PR_Diagnose_Condition}}.
- Im Profil {{pagelink: DiagnoseCondition, text: Diagnose (Condition), hint: MII_PR_Diagnose_Condition}} wurden die Elemente `Condition.code.coding` und `Condition.bodySite.coding` jeweils um ein OPTIONALes Slice für ICD-O-3 erweitert.
- Im Profil {{pagelink: DiagnoseCondition, text: Diagnose (Condition), hint: MII_PR_Diagnose_Condition}} unter `Condition.extension('http://hl7.org/fhir/StructureDefinition/condition-assertedDate')` ist neu eine Extension zur Angabe des Feststellungsdatums einer Diagnose.
- Im Profil {{pagelink: DiagnoseCondition, text: Diagnose (Condition), hint: MII_PR_Diagnose_Condition}} unter `Condition.onsetPeriod.(start|end).extension` befindet sich jetzt OPTIONAL eine Vorgabe zur Angabe der Lebensphase als Code mittels Extension, ab der ein Patient oder eine Patientin eine Erkrankung hat, bzw. nicht mehr hat. Siehe dazu auch die Erläuterung der Konzepte unter {{pagelink: Terminologien, text: Terminologien, hint: Terminologien}}.
- Das Modul wurde um SearchParameter-Ressourcen erweitert, mittels derer die Suche nach ICD-10-GM-Codes in Kombination mit Mehrfachcodierungs-Kennzeichen, Seitenlokalisation und Diagnosesicherheit ermöglicht wird. Siehe Suchparameter für {{pagelink: DiagnoseCondition, text: Diagnose (Condition), hint: MII_PR_Diagnose_Condition}}.
