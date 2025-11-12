## {{page-title}}

**Version: 2025.0.1**

Datum 22.10.2025

- `Added`: `Procedure.bodySite`: Enthält jetzt optionales SNOMED-Coding Slice und übernimmt die Modellierung aus dem Modul Diagnose von `Condition.bodySite`.
- `Added`: `ValueSet` und Binding für OPS (Canonical URL: `https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/mii-vs-prozedur-ops`). Dieses kann mit dem MII-Terminologieserver (https://www.ontoserver.mii-termserv.de/) expandiert werden und ermöglicht erweiterte Validierung.
- `Added`: `CapabilityStatement` enthält nun Anforderungsdokumentation für Suchparameter `_count` und `_summary`.

**Version: 2025.0.0**

Datum 09.12.2024

- Dependency auf de.basisprofil.r4 aktualisiert auf [Version 1.5.0](https://simplifier.net/packages/de.basisprofil.r4/1.5.0). Die Änderung hat keine Auswirkung auf Implementierungen dieses Moduls.
- Profile enthalten zusätzliche Beschreibungen und Übersetzungen für Implementierer und das Forschungsdatenportal für Gesundheit (FDPG).
- Suchparameter aus diesem Modul entfernt. SearchParameter-Ressourcen werden nun zentral im Modul Meta verwaltet.
- CodeSystem Ressourcen für Operationen- und Prozedurenschlüssel (OPS) wurden entfernt. Diese können nun über die Service Unit Terminologische Dienste (SU-TermServ) bezogen werden: https://www.ontoserver.mii-termserv.de/
- Ressourcen verwenden in diesem Release modulübergreifend SNOMED CT in der Version `http://snomed.info/sct/900000000000207008/version/20240701`, um eine stabile [ValueSet-Expansion](http://hl7.org/fhir/R4/valueset.html#expansion) sicherzustellen.

**Version: 2024.0.0**

Datum 16.04.2024

- Die veröffentlichten FHIR-Packages verwenden nun [Calender Versioning (CalVer)](https://calver.org/) nach dem Schema YYYY.MINOR.PATCH. Damit wird ein Releasezyklus im Jahresrhythmus etabliert. Die Jahresversion (YYYY) zeigt das Jahr an, in dem das Kerndatensatzmodul angewendet wird. MINOR-Versionen werden bei Einführung neuer Funktionen, Erweiterungen oder substantieller Änderungen veröffentlicht. PATCH-Versionen umfassen Bugfixes oder textuelle Korrekturen.
- Die Benennung der Conformance-Ressourcen und Beispielinstanzen folgt nun einheitlichen [MII-Namenskonventionen](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Namenskonventionen-f%C3%BCr-FHIR%E2%80%90Ressourcen-in-der-MII).
- Ressourcen verwenden in diesem Release modulübergreifend SNOMED CT in der Version `http://snomed.info/sct/900000000000207008/version/20230731`, um eine stabile [ValueSet-Expansion](http://hl7.org/fhir/R4/valueset.html#expansion) sicherzustellen.
- Die {{pagelink: FHIRProfile, text: Anforderungsdokumentation, hint: Anforderungsdokumentation}} verwendet nun Schlüsselwörter nach [RFC-2119](https://datatracker.ietf.org/doc/html/rfc2119).
- Änderung der Dependency von [Version 0.9.13](https://simplifier.net/packages/de.basisprofil.r4/0.9.13) auf [Version 1.4.0](https://simplifier.net/packages/de.basisprofil.r4/1.4.0) der FHIR Basisprofile von HL7 Deutschland. 
- Beim Wechsel von Modul Prozedur Versionen 1.0 auf die Version 2.0 (2024.0.0) dieses Moduls ergeben sich durch die veränderte Dependency substantielle Änderungen (Breaking Change) am Profil {{pagelink: ProzedurProcedure, text: Prozedur (Procedure), hint: MII_PR_Prozedur_Procedure}}:
    - Die Canonical-URL für das CodeSystem OPS wurde geändert von ~~`http://fhir.de/CodeSystem/dimdi/ops`~~ zu `http://fhir.de/CodeSystem/bfarm/ops`. Für OPS Codes MUSS die aktuelle Canonical-URL im Element `Procedure.code.coding.system` verwendet werden.
    - Siehe auch Beschreibung und Beispiele unter {{pagelink: ProzedurProcedure, text: Prozedur (Procedure), hint: MII_PR_Prozedur_Procedure}}.
- Breaking Change: Im ValueSet {{pagelink: Terminologien, text: MII_VS_Prozedur_OpsKategorien_SNOMEDCT}} wurde ein inzwischen inaktiver SNOMED-Code ~~`103693007 |Diagnostic procedure (procedure)|`~~ durch `165197003 |Diagnostic assessment (procedure)|` ersetzt. Das ValueSet wird auf `Procedure.category.coding` verwendet. Wenn bisher in Version 1.0 dieses Moduls der inaktive Code implementiert wurde, MUSS dieser Code mit Wechsel auf die Version 2.0 (2024.0.0) des Moduls Prozedur geändert werden.
