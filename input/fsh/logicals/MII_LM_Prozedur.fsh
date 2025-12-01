Logical: MII_LM_Prozedur
Parent: Element
Id: mii-lm-prozedur
Title: "MII LM Prozedur"
Description: "Logische Repräsentation des Basismoduls Prozedur"
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/LogicalModel/Prozedur"
* insert PR_CS_VS_Version
* insert Publisher
* insert LicenseCodeableCCBY40
* ^date = "2024-12-09"
* . ^short = "Das Basismodul Prozeduren umfasst die Beschreibung diagnostischer oder therapeutischer Maßnahmen, die als Leistungskomplexe auch für die Abrechnung dokumentiert und kodiert werden, z.B. Operationen."
* OPSProzedurKodiert 0..1 BackboneElement "Kodierung der durchgeführten Prozedur mittels OPS." "Kodierung der durchgeführten Prozedur mittels OPS."
  * VollstaendigerProzedurencode 0..1 Coding "Vollständiger Prozedurencode" "Der vollständige Prozedurencode: Tripel aus OPS-Code, Codesystem (inkl. Version!) und Katalogtext."
  * Seitenlokalisation 0..1 Coding "Seitenlokalisation" "Seitenlokalisation für die durchgeführte Prozedur gemäß BfArM"
* SNOMEDProzedurKodiert 0..1 BackboneElement "Kodierung der durchgeführten Prozedur mittels SNOMED CT." "Kodierung der durchgeführten Prozedur mittels SNOMED CT."
  * VollstaendigerProzedurencode 0..1 Coding "Vollständiger Prozedurencode" "Der vollständige Prozedurencode: Tripel aus SNOMED-CT-Code, Codesystem (Version optional) und präferierten Namen"
* Koerperstelle 0..* CodeableConcept "Körperstelle" "Körperstelle der Prozedur mittels SNOMED CT inkl. Lateralität (R, L, B)"
* Durchfuehrungsabsicht 0..1 Coding "Durchführungsabsicht" "Intention mit der die Prozedur durchgeführt wird."
* Durchfuehrungsdatum 1..1 dateTime "Durchführungsdatum" "Das Datum ist der Zeitpunkt, an dem eine Prozedur durchgeführt wurde." 
* Dokumentationsdatum 0..1 dateTime "Dokumentationsdatum" "Das Datum ist der Zeitpunkt, an dem eine Prozedur dokumentiert wurde." 
* Freitextbeschreibung 0..1 string "Freitextbeschreibung" "Freitextbeschreibung der durchgeführten Prozedur"

Mapping: Prozedur-LogicalModel
Id: FHIR
Title: "Prozedur LogicalModel FHIR Mapping"
Source: MII_LM_Prozedur
* OPSProzedurKodiert -> "Procedure.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/ops')"
  * VollstaendigerProzedurencode -> "Procedure.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/ops')"
  * Seitenlokalisation -> "Procedure.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/ops').extension('http://fhir.de/StructureDefinition/seitenlokalisation').value"
* SNOMEDProzedurKodiert -> "Procedure.code.coding.where(system='http://snomed.info/sct')"
  * VollstaendigerProzedurencode -> "Procedure.code.coding.where(system='http://snomed.info/sct')"
* Koerperstelle -> "Procedure.bodySite"
* Durchfuehrungsabsicht -> "Procedure.extension('https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht').value"
* Durchfuehrungsdatum -> "Procedure.performedDateTime"
* Dokumentationsdatum -> "Procedure.extension('http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum').value"
* Freitextbeschreibung -> "Procedure.code.text"