---
topic: Terminologien
---

## Terminologien

| Hinweis |  |
|---------|---------------------|
| {{render:implementation-guides/ImplementationGuide-Common/images/Warning.jpg}} | CodeSystem-Ressourcen für externe Terminologien (ICD-10-GM), werden nicht mehr in diesem Modul veröffentlicht, sondern sollen bei der Service Unit Terminologische Dienste (SU-TermServ) bezogen werden: https://www.ontoserver.mii-termserv.de/ |

Nach [§ 301](https://www.sozialgesetzbuch-sgb.de/sgbv/301.html) und [§ 295](https://www.sozialgesetzbuch-sgb.de/sgbv/295.html) SGB V ist die Kodierung bei der Abrechnung im deutschen Gesundheitswesen mit der Internationalen statistischen Klassifikation (ICD-10-GM) gesetzlich vorgeschrieben.

Da die ICD-10-GM aber für viele Fragenstellungen nicht aussagekräftig genug ist (siehe *Beschreibung Modul*), soll im Kerndatensatz die Kodierung auch zusätzlich mit anderen Terminologien und Klassifikationen (wie Alpha-ID, SNOMED CT und ORPHA-Kennnummern) ermöglicht werden.

### ValueSets

Es ist zu beachten, dass die nachfolgenden ValueSets keine Expansion beinhalten. Zur Verwendung für Validationszwecke MUSS diese per FHIR-Terminologieserver erstellt werden.

**Diagnosen SNOMED CT**

| Diagnose Codes SNOMED| |
|--|--|
|Canonical ValueSet | https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/diagnoses-sct  |
| Binding | ([required](http://hl7.org/fhir/terminologies.html#required)) {{pagelink:DiagnoseCondition, text:Condition.code}}|
| Beschreibung | Das ValueSet 'diagnoses-sct' beinhaltet alle Codes welche für Condition.code:sct verwendet werden dürfen. |

{{render:https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/diagnoses-sct}}

---

**Lebensphase**

Das Lebensphase-ValueSet wird von HL7 Deutschland e.V. publiziert und in diesem Modul verwendet.

| ValueSetLebensphaseDe | |
|--|--|
|Canonical ValueSet | http://fhir.de/ValueSet/lebensphase-de  |
| Binding | ([required](http://hl7.org/fhir/terminologies.html#required)) {{pagelink:DiagnoseCondition, text:Condition.onset[x]:onsetPeriod.start.extension:lebensphase-von.value[x]:valueCodeableConcept.coding}} <br> ([required](http://hl7.org/fhir/terminologies.html#required)) {{pagelink:DiagnoseCondition, text:Condition.onset[x]:onsetPeriod.end.extension:lebensphase-bis.value[x]:valueCodeableConcept.coding}} |
| Beschreibung | Das ValueSet 'ValueSetLebensphaseDe' beinhaltet SNOMED-Codes zur Angabe der Lebensphase |

{{render:http://fhir.de/ValueSet/lebensphase-de}}

Unter den im ValueSet als SNOMED-Codes enthaltenen Konzepten sind folgende Altersgruppen zu verstehen:

@```
from
	CodeSystem
where
	url='https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/CodeSystem/mii-cs-diagnose-lebensphase-supplement-snomed'
for
	concept
select
	Code: code, Display: display, Description: property[0].value
```

----------------------------------------------------

### CodesSystems

Das CodeSystem mit der Canonical http://fhir.de/CodeSystem/bfarm/icd-10-gm kann über die Service Unit Terminologische Dienste (SU-TermServ) bezogen werden: https://www.ontoserver.mii-termserv.de/

--- 