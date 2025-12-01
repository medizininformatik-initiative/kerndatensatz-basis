---
parent: 
topic: DiagnoseCondition
subject: https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose
canonical: https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose
expand: 1
---

### Condition

---

## {{link}}

**Beschreibung**

Dieses Profil beschreibt eine Diagnose in der Medizininformatik-Initiative.

**Mehrfachkodierung und Condition-Ressourcen**

Bei der Kombination von ICD-10-Codes mit dem Kreuz-Stern-System wird für jeden ICD-10-Code (Ätiologie, Manifestation, Zusatzinformation) eine Condition-Ressource instanziiert. Die Condition-Ressourcen der Sekundärdiagnosen (Manifestation, Zusatzinformation) nutzen die [Extension Condition Related](http://hl7.org/fhir/R4/extension-condition-related.html), um auf die Primärdiagnose (Ätiologie) zu referenzieren. Zusätzlich zu kombinierten ICD-10-Codes gemappte Alpha-IDs oder Orpha-Codes, werden nur in der Condition-Ressource der Primärdiagnose angegeben. Bei abweichenden Diagnosesicherheiten zwischen Primär- und Sekundärdiagnose MUSS sichergestellt werden, dass die Diagnosesicherheit der Primärcondition auf die assoziierte Alpha-ID zutrifft. Das Vorgehen wird anhand der [Beispielressourcen](#beispiel-2) exemplarisch für Alpha-ID `I97525` und ICD-10-GM `A54.4+` `M73.09*` dargestellt.

Gegebenenfalls vorhandene Mehrfachkodierungskennzeichen (`*`, `†`, `!`) werden von den jeweiligen ICD-10-Codes abgetrennt und in die Extension 'Mehrfachkodierungs-Kennzeichen' gesetzt. Das Element `Condition.code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').code`, in dem der ICD-10-GM-Code abgebildet wird, SOLLTE NICHT ein Mehrfachkodierungskennzeichen oder Zusatzkennzeichen (z.B. Seitenlokalisation oder Diagnosesicherheit) enthalten. Siehe [Beispielressourcen](#beispiel-2).

---

@```
from 
    StructureDefinition 
where 
    url = 'https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose' 
select 
    Name: name, Status: status, Version: version, Lizenz: extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-ex-meta-license-codeable').value.coding.code, Canonical: url, Basis: baseDefinition
```

### Inhalt

<tabs>
  <tab title="Darstellung">{{tree, buttons}}</tab>
  <tab title="Beschreibung"> 
        @```
        from
	        StructureDefinition
        where
	        url = 'https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose'
        select
	        Beschreibung: description
        with
            no header
        ```
        @```
        from 
            StructureDefinition 
        where 
            url = 'https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose' 
        for 
            differential.element 
            where 
                mustSupport = true 
            select Feldname: id, Kurzbeschreibung: short, Hinweise: comment
        ```
  </tab>
  <tab title="XML">{{xml}}</tab>
  <tab title="JSON">{{json}}</tab>
  <tab title="Link">{{link}}</tab>
</tabs>

---

| FHIR-Element | Erklärung |
|--------------|-----------|
|Condition.id  | Must-support, jedoch OPTIONAL              |
|Condtion.meta              |  Must-support, jedoch OPTIONAL          |
| Condtion.clinicalStatus             | Keine Einschränkungen, Kompletter Diagnose-Workflow wird unterstützt. Das Element ist OPTIONAL, da es nicht routinemäßig erfasst wird. Zudem wird der Status bei der Entlassung meist nicht erfasst.|
| Condtion.code             | Min. eine kodierte Diagnose MUSS enthalten sein. System frei aus Alpha-ID, SNOMED CT, Orpahanet und ICD-10-GM wählbar.          |
| Condition.code.coding:icd10-gm.extension:Mehrfachcodierungs-Kennzeichen | Innerhalb der Extension "Mehrfachcodierungs-Kennzeichen" SOLLEN die jeweiligen Sonderzeichen ("!", "+" oder "*") vom ICD-10-GM-Code getrennt erfasst werden. |
| Condition.code.coding:icd10-gm.extension:Seitenlokalisation | Die Extension "Seitenlokalisation" SOLL zur Angabe der Seitenlokalisation in der ICD-10-GM-Codierung verwendet werden. |
| Condition.code.coding:icd10-gm.extension:Diagnosesicherheit | Die Extension "Diagnosesicherheit" SOLL zur Angabe der Diagnosesicherung in ICD-10-GM-Codierung verwendet werden. |
| Condtion.bodySite             | OPTIONAL. Falls dieses optionale Element verwendet wird, SOLL die Körperstelle min. mit einem SNOMED-Code kodiert werden. Hierbei DARF NICHT die Lateralität angegeben werden. Diese SOLL per Condition.code.coding:icd10-gm.extension:Seitenlokalisation angegeben werden. Das Element dient dazu, zusätzliche Angaben (über den Code hinausgehend) zur Manifestation zu dokumentieren. |
| Condtion.subject             | Die Referenz zum Modul Person MUSS stets gegeben sein.|
| Condition.encounter | Dieses Element SOLLTE NICHT zur Verknüpfung des Falls und der Diagnose verwendet werden. Ausnahme: Das Element KANN zur Verknüpfung der Diagnose mit dem Fall / Kontakt in dem die Diagnose festgestellt wird (immer ein Kontakt mit einer konkreten Versorgungsstelle!) verwendet werden. Generell SOLLTE die Verknüpfung über Encounter.diagnosis erfolgen.|
| Condtion.onset[x]             | KANN als Period oder dateTime erfasst werden. OPTIONAL zusätzlich Angabe von Lebensphase als Code mittels Extension, falls genaue Zeitpunkte nicht bekannt sind.|
| Condtion.recordedDate             | Dient der zeitlichen Einordnung der Diagnose (Anstelle der Abfragen auf des initialen Abteilungsfall der Feststellung der Diagnose) |
| Condtion.note             | Zusätzliche Erläuterung der Diagnose |

<br>

| FHIR-Element | Erklärung |
|--------------|-----------|
|Encounter.period.start / Diagnose.encounter | Es ist zu beachten, dass die Abbildung des logischen Datenelementes "Fesstellungsdatum" nicht auf die Condition-Ressource sondern auf die Encounter-Ressource erfolgt. Somit SOLLTE die Verknüpfung der Diagnose immer auf einen Einrichtungs-Kontakt erfolgen (Siehe [Modul Fall](https://simplifier.net/medizininformatikinitiative-modulfall)).|

<br>

Mapping Logischer Datensatz zu FHIR Diagnose-Profil 

@```
from StructureDefinition 
where url = 'https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose'  
    for differential.element
    where mapping.identity='LogicalModel'
    select 
        FHIR: id,
        LogischerDatensatz: mapping.map,
        Definition: mapping.comment
```

<br>

| FHIR Element | Logischer Datensatz |
|--------------|-----------|
|Encounter.period.start        | Diagnose.Feststellungsdatum         |

Es sind die Invarianten aus den Deutschen Basisprofilen zum Datentyp Profil ['Coding-Profil für ICD-10-GM'](https://ig.fhir.de/basisprofile-de/1.5.0/ig-markdown-Datentypen-Coding.html#ig-markdown-Datentypen-ICD-10GM-Coding) und der [Extension zur Diagnosesicherheit](https://ig.fhir.de/basisprofile-de/1.5.0/ig-markdown-ExtensionsfrCondition.html) zu beachten.

---

**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose' )
for differential.element
select
Path: path,
join binding.where(valueSet.exists())
{
  Name: valueSet.substring((9 + valueSet.indexOf('ValueSet/'))),
  Strength: strength,
  URL: valueSet
}
```

---

**Suchparameter**

Folgende Suchparameter sind für das Modul Person relevant, auch in Kombination:

1. Der Suchparameter "_id" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Condition?_id=12345```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "_profile" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Condition?_profile=https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_profile" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "code" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Condition?code=http://fhir.de/CodeSystem/bfarm/icd-10-gm|A15.0```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Condition.code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](http://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "subject" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Condition?subject=Patient/test```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Condition.subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

1. Der Suchparameter "patient" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Condition?patient=Patient/test```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Condition.subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

1. Der Suchparameter "icd10gm-diagnosesicherheit" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Condition?icd10gm-diagnosesicherheit=https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_DIAGNOSESICHERHEIT|G```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Condition.code.coding.extension.where(url='http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit').value" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "icd10gm-mehrfachcodierung" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Condition?icd10gm-mehrfachcodierung=http://fhir.de/CodeSystem/icd-10-gm-mehrfachcodierungs-kennzeichen|†```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Condition.code.coding.extension.where(url='http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen').value" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "icd10gm-seitenlokalisation" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Condition?icd10gm-seitenlokalisation=https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_SEITENLOKALISATION|B```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Condition.code.coding.extension.where(url = 'http://fhir.de/StructureDefinition/seitenlokalisation').value" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

---

**Beispiele**

### Beispiel 1
ICD-10-GM & SNOMED CT:

{{json:fsh-generated/resources/Condition-mii-exa-diagnose-condition-minimal.json}}

### Beispiel 2
ICD-10-GM Diagnose mit Kreuz-Stern-System und Zusatzkennzeichen plus Alpha-ID:

{{json:fsh-generated/resources/Condition-mii-exa-diagnose-mehrfachkodierung-primaercode.json}}

{{json:fsh-generated/resources/Condition-mii-exa-diagnose-mehrfachkodierung-sekundaercode.json}}

### Beispiel 3 
Alpha-ID und Orpha-Kennnummer:

{{json:fsh-generated/resources/Condition-mii-exa-diagnose-multiple-kodierungen.json}}



