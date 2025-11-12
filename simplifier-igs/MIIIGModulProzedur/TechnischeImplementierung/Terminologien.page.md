---
parent: 
topic: Terminologien
subject: 
---

## Terminologien

| Hinweis |  |
|---------|---------------------|
| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} | CodeSystem-Ressourcen für externe Terminologien (OPS), werden nicht mehr in diesem Modul veröffentlicht, sondern sollen bei der Service Unit Terminologische Dienste (SU-TermServ) bezogen werden: https://www.ontoserver.mii-termserv.de/ |

----

### ConceptMaps

Folgende ConceptMap bildet ein Mapping der OPS-Klassentitel auf SNOMED CT. Es sei zu beachten, dass SNOMED CT ansich keine "Resteklassen" bietet, sodass anstelle von "Other" passerende SNOMED CT Kodes verwendet werden können, sollten diese für "Ergänzende Maßnahmen" vorliegen. Desweiteren bezieht sich die OPS-Kodes für der Klasse 6 nicht auf die Gabe der Medikamente sondern auf die Medikamente ansich als eigenständiges Konzept. 

Siehe [SNOMED-CT / OPS Mapping - Deutsche Basisprofile](https://ig.fhir.de/basisprofile-de/1.5.0/ig-markdown-Terminologie-ConceptMaps.html#ig-markdown-Terminologie-ConceptMaps-SNOMED-CTOPSMapping)

----

### ValueSets

Es ist zu beachten, dass die nachfolgenden ValueSets keine Expansion beinhalten. Zur Verwendung für Validationszwecke MUSS diese per FHIR-Terminologieserver erstellt werden. Um eine stabile [ValueSet-Expansion](http://hl7.org/fhir/R4/valueset.html#expansion) sicherzustellen, verwenden ValueSet-Ressourcen in diesem Release modulübergreifend im Element `ValueSet.compose.include.version` SNOMED CT in der Version: 

@```
from
	ValueSet
where
	url = 'https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-intend'
select
	Version: compose.include[0].version
```

---

| MII_VS_Prozedur_Durchfuehrungsabsicht_SNOMEDCT   |   |
|--|--|
|Canonical CodeSystem | http://snomed.info/sct  |
|Canonical ValueSet | https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-intend  |
|Simplifier Link| [ValueSet](https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-intend&fhirVersion=R4&scope=de.medizininformatikinitiative.kerndatensatz.prozedur@2025.0.0)|
| Binding | ([required](http://hl7.org/fhir/terminologies.html#required)) {{pagelink:ProzedurProcedure, text:Procedure.extension:Durchfuehrungsabsicht.value}}|

{{render:https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-intend}}

<br><br>

| MII_VS_Prozedur_OpsKategorien_SNOMEDCT   |   |
|--|--|
|Canonical CodeSystem | http://snomed.info/sct  |
|Canonical ValueSet | https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-category-sct  |
|Simplifier Link| [ValueSet](https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-category-sct&fhirVersion=R4&scope=de.medizininformatikinitiative.kerndatensatz.prozedur@2025.0.0) |
| Binding | ([required](http://hl7.org/fhir/terminologies.html#required)) {{pagelink:ProzedurProcedure, text:Procedure.category}}|

{{render:https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-category-sct}}

<br><br>

| MII_VS_Prozedur_Prozeduren_SNOMEDCT   |   |
|--|--|
|Canonical CodeSystem | http://snomed.info/sct  |
|Canonical ValueSet | https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-sct  |
|Simplifier Link| [ValueSet](https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-sct&fhirVersion=R4&scope=de.medizininformatikinitiative.kerndatensatz.prozedur@2025.0.0)|
| Binding | ([required](http://hl7.org/fhir/terminologies.html#required)) {{pagelink:ProzedurProcedure, text:Procedure.code}}|

{{render:https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/ValueSet/procedures-sct}}

----

### CodeSystems

Das CodeSystem mit der Canonical http://fhir.de/CodeSystem/bfarm/ops kann über die Service Unit Terminologische Dienste (SU-TermServ) bezogen werden: https://www.ontoserver.mii-termserv.de/
