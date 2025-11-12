---
parent: 
topic: KontaktGesundheitseinrichtungEncounter
subject: https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung
canonical: https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung
expand: 1
---

### Kontakt Gesundheitseinrichtung (Encounter)

---

## {{link}}

**Beschreibung**

Dieses Profil beschreibt einen Fall / Kontakt in der Medizininformatik-Initiative.

@```
from 
    StructureDefinition 
where 
    url = 'https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung' 
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
	        url = 'https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung'
        select
	        Beschreibung: description
        with
            no header
        ```
        @```
        from 
            StructureDefinition 
        where 
            url = 'https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung' 
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

### Repräsentation der Fallarten in FHIR

Siehe auch Leitfaden [FHIR DE Basisprofile](https://ig.fhir.de/basisprofile-de/1.4.0/Ressourcen-AmbulanterStationaererFall.html):

Zur Kodierung von Encounter.class wird auf das ValueSet [ActEncounterCode](http://terminology.hl7.org/ValueSet/v3-ActEncounterCode) verwiesen.

#### Primärkontakte
|Fallart | Code in HL7 V2 | Repräsentation in FHIR|
|-
|Ambulant | O | Encounter.class = AMB |
|Ambulantes Operieren | O | Encounter.class = AMB</br>Encounter.type = operation|
|Stationär | I | Encounter.class = IMP |
|Normalstationär | I | Encounter.class = IMP</br>Encounter.type = normalstationaer|
|Intensivstationär | I | Encounter.class = IMP</br>Encounter.type = intensivstationaer|
|Wiederaufnahme | R | Encounter.class = IMP</br>Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle = 07|
|Voraufnahme |P | Encounter.class = PRENC|
|Virtuell | - | Encounter.class = VR|
|Vorstationär | V | Encounter.class = AMB</br>Encounter.type = vorstationaer|
|Nachstationär | NS |Encounter.class = AMB</br>Encounter.type = nachstationaer|
|Teilstationär | TS | Encounter.class = IMP **oder** SS</br>Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle = 03</br>Encounter.type = teilstationaer \| tagesklinik \| nachtklinik |
|Begleitperson | H | Encounter.class = IMP</br>Encounter.type = begleitperson|
|Stationsäquivalent| - | Encounter.class = HH</br>Encounter.type = stationsaequivalent</br>Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle = 10|
|Entbindung | - | Encounter.class = IMP</br>Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle = 05|
|Notfall | - | Encounter.class = AMB<br> Encounter.extension:Aufnahmegrund.VierteStelle = 7<br><br>Falls eine anschließende stationäre Aufnahme erfolgt, kann Encounter.hospitalization.admitSource = "N" verwendet werden.<br><br>Wenn der Aspekt der Dringlichkeit der Behandlung hervorgehoben werden soll, kann Encounter.priority = `http://terminology.hl7.org/CodeSystem/v3-ActPriority|EM` verwendet werden.|

#### Sekundärkontakte bei stationärem Aufenthalt
|Fallart | Code in HL7 V2 | Repräsentation in FHIR|
|-
|Untersuchung und Behandlung| - | Encounter.class = IMP</br>Encounter.type = ub|
|Konsil | - | Encounter.class = IMP</br>Encounter.type = konsil|
|Operation| - | Encounter.class = IMP</br>Encounter.type = operation|

---

### Kontaktort

Unter `Encounter.location` können OPTIONAL Details zum Ort, an dem der Kontakt stattfindet, angegeben werden. Die vorgegebene Detaillierung der Slices (Zimmer, Bett, Station) sind hauptsächlich im Kontakt vom Typ Versorgungsstellenkontakt anzulegen.

--- 

### Geplante Kontake

Geplante Kontake werden mit `Encounter.status = planned` abgebildet und SOLLTEN zusätzlich das geplante Start- bzw. Enddatum mittels Extension in `Encounter.extension` angeben.

---

### Must-Support FHIR Datenelemente

| FHIR-Element | Kurze Beschreibung |
|--------------|-----------|
| Encounter.id      | Angabe OPTIONAL, vom Server automatisch vergebene system-abhängige ID |
| Encounter.meta       | Angabe OPTIONAL zur Provenance und zum Profil |
| Encounter.extension:Aufnahmegrund | OPTIONAL, Aufnahmegrund entsprechend Schlüssel 1 der Anlage 2 zur § 301-Vereinbarung |
| Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle | OPTIONAL, Aufnahmegrund (1. und 2. Stelle), Datenübermittlung nach § 301 Abs. 3 SGB V. Required Binding auf `http://fhir.de/ValueSet/dkgev/AufnahmegrundErsteUndZweiteStelle` | 
| Encounter.extension:Aufnahmegrund.extension:DritteStelle | OPTIONAL, Aufnahmegrund (3. Stelle), Datenübermittlung nach § 301 Abs. 3 SGB V. Required Binding auf `http://fhir.de/ValueSet/dkgev/AufnahmegrundDritteStelle` | 
| Encounter.extension:Aufnahmegrund.extension:VierteStelle | OPTIONAL, Aufnahmegrund (4. Stelle), Datenübermittlung nach § 301 Abs. 3 SGB V. Required Binding auf `http://fhir.de/ValueSet/dkgev/AufnahmegrundVierteStelle` | 
| Encounter.identifier:Aufnahmenummer | OPTIONAL, Aufnahmenummer/Fallnummer, die Patient:innen bei der Planung einer Aufnahme oder bei der Aufnahme selbst bekommt. Generell SOLLTE die Aufnahmenummer in allen Encounter-Ressourcen unabhängig von der Kontaktebene und dem Kontakttyp angegeben werden. Als Gründe würden dagegen sprechen, wenn die Aufnahmenummer nur in einem Encounter der Encounter-Hierarchie angegeben werden kann. In diesem Fall SOLL auf die korrekte Encounter-Verlinkung über .partOf geachtet werden, sowie dass jeder Encounter einen eigenständigen Identifier mit unterschiedlichen Systemen enthält. | 
| Encounter.status | VERPFLICHTEND, required Binding auf `http://fhir.de/ValueSet/EncounterStatusDe` |
| Encounter.class | VERPFLICHTEND, Kontaktklasse. Required Binding auf `http://fhir.de/ValueSet/EncounterClassDE` |
| Encounter.type:Kontaktebene | OPTIONAL, 3 Ebenen: Einrichtungskontakt, Abteilungskontakt, Versorgungsstellenkontakt. Required Binding auf `http://fhir.de/ValueSet/kontaktebene-de` |
| Encounter.type:KontaktArt | OPTIONAL Differenzierung zwischen verschiedenen Arten von Kontakten (z.B. vorstationär, nachstationär, intensivstationär). Required Binding auf `http://fhir.de/ValueSet/kontaktart-de` |
| Encounter.serviceType.coding:Fachabteilungsschluessel | OPTIONAL, required Binding auf `http://fhir.de/ValueSet/dkgev/Fachabteilungsschluessel` |
| Encounter.serviceType.coding:ErweiterterFachabteilungsschluessel | OPTIONAL, required Binding auf `http://fhir.de/ValueSet/dkgev/Fachabteilungsschluessel-erweitert` |
| Encounter.subject | VERPFLICHTEND Referenz auf Patient:in |
| Encounter.period | VERPFLICHTEND, Zeitraum des Kontaktes |
| Encounter.period.start | VERPFLICHTEND, Start des Kontakt Zeitraums |
| Encounter.period.end | OPTIONAL, Ende des Kontakt Zeitraums |
| Encounter.diagnosis | OPTIONAL Angaben zu Diagnose(n) |
| Encounter.diagnosis.condition | VERPFLICHTEND, wenn Diagnosedaten angegeben werden, dann MUSS diese referenziert werden. Es SOLLTE nur die Primärdiagnose referenziert werden. |
| Encounter.diagnosis.use.coding: | VERPFLICHTEND mindestens die Angabe eines Codings. EMPFOHLEN ist die Angabe mittels Diagnosetyp- und DiagnosesubTyp-Coding. Weitere Codings OPTIONAL. Extensible Binding auf `http://hl7.org/fhir/ValueSet/diagnosis-role` |
| Encounter.diagnosis.use.coding:DiagnoseTyp | OPTIONAL, required Binding auf `http://fhir.de/ValueSet/DiagnoseTyp` |
| Encounter.diagnosis.use.coding:Diagnosesubtyp | OPTIONAL, required Binding auf `http://fhir.de/ValueSet/Diagnosesubtyp` |
| Encounter.diagnosis.rank | OPTIONAL |
| Encounter.hospitalization | OPTIONAL, Daten zur Aufnahme und Entlassung |
| Encounter.hospitalization.admitSource | VERPFLICHTEND, Aufnahmeanlass. Preferred Binding auf `http://fhir.de/ValueSet/dgkev/Aufnahmeanlass` |
| Encounter.hospitalization.dischargeDisposition | OPTIONAL, Entlassungsdaten |
| Encounter.hospitalization.dischargeDisposition.extension:Entlassungsgrund | OPTIONAL, Entlassungs-/Verlegungsgrund nach  § 301 Abs. 3 SGB V. `http://fhir.de/StructureDefinition/Entlassungsgrund` |
| Encounter.location | OPTIONAL Details zum Kontaktort wie Zimmer, Bett, Station |
| Encounter.location.physicalType | SOLL extensible Binding auf `https://www.medizininformatik-initiative.de/fhir/core/modul-fall/ValueSet/location-physical-type`
| Encounter.serviceProvider | OPTIONAL Referenz auf eine Einrichtung |
| Encounter.partOf | OPTIONAL Referenz auf andere Kontaktinstanzen | 

<br>

### Mapping FHIR Element - Logical Model

| FHIR Element | Logischer Datensatz |
|--------------|-----------|
|Encounter.type|Fall.Einrichtungskontakt.KontaktEbene|
|Encounter.type|Fall.Einrichtungskontakt.KontaktArt|
|Encounter.subject|Fall.Einrichtungskontakt.PatientenIdentifikator|
|Encounter.identifier|Fall.Einrichtungskontakt.Aufnahmenummer|
|Encounter.hospitalization.admitSource|Fall.Einrichtungskontakt.Aufnahmeanlass|
|Encounter.reasonCode|Fall.Einrichtungskontakt.Aufnahmegrund|
|Encounter.period.start|Fall.Einrichtungskontakt.Beginndatum|
|Encounter.period.end|Fall.Einrichtungskontakt.Enddatum|
|Encounter.hospitalization.dischargeDisposition|Fall.Einrichtungskontakt.Entlassungsgrund|
|Encounter.type|Fall.Abteilungskontakt.KontaktEbene|
|Encounter.type|Fall.Abteilungskontakt.KontaktArt|
|Encounter.subject|Fall.Abteilungskontakt.PatientenIdentifikator|
|Encounter.identifier|Fall.Abteilungskontakt.Aufnahmenummer|
|Encounter.period.start|Fall.Abteilungskontakt.Beginndatum|
|Encounter.period.end|Fall.Abteilungskontakt.Enddatum|
|Encounter.type|Fall.Versorgungsstellenkontakt.KontaktEbene|
|Encounter.type|Fall.Versorgungsstellenkontakt.KontaktArt|
|Encounter.subject|Fall.Versorgungsstellenkontakt.PatientenIdentifikator|
|Encounter.identifier|Fall.Versorgungsstellenkontakt.Aufnahmenummer|
|Encounter.period.start|Fall.Versorgungsstellenkontakt.Beginndatum|
|Encounter.period.end|Fall.Versorgungsstellenkontakt.Enddatum|

---

### Invarianten

Folgende Invarianten müssen bei der Implementierung des Profils beachtet werden:

**Constraints**: @``` from StructureDefinition where url = 'https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung' for differential.element.constraint select key,severity,human, expression```


---

**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung' )
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

Folgende Suchparameter sind für das Modul Fall relevant, auch in Kombination:

@```
from CapabilityStatement 
where url = 'https://www.medizininformatik-initiative.de/fhir/core/modul-fall/CapabilityStatement/metadata'
    for rest.resource.where(type='Encounter').searchParam
        select 
            Name: name, Definition: definition, Type: type, Expectation: extension.where(url='http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value.ofType(code)
```

---

**Beispiele**

Beispiel Einrichtungskontakt:

{{json:fsh-generated/resources/Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-1.json}}

Beispiel Abteilungskontakt:

{{json:fsh-generated/resources/Encounter-mii-exa-fall-kontakt-gesundheitseinrichtung-2.json}} 

