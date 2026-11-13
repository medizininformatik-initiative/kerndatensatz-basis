# MII PR Person Patient - MII Implementation Guide Core Dataset Base v2027.0.0-ballot

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **MII PR Person Patient**

## Ressourcenprofil: MII PR Person Patient 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient | *Version*:2027.0.0-ballot |
| Active Stand: 2026-09-01 | *Maschinenlesbarer Name*:MII_PR_Person_Patient |

 
Demografische und andere administrative Informationen über eine Patientin oder einen Patienten. 

**Beispielhafte Anwendungsszenarien:**

* Dokumentation demografischer Patientendaten einschließlich Name, Geschlecht, Geburtsdatum und Adresse für klinische Versorgung und Forschung
* Erfassung von Krankenversicherungsinformationen für administrative Zwecke
* Verwaltung organisationsinterner Patienten-Identifikatoren (PID) zur Verknüpfung von Patientendaten über Systeme innerhalb einer Gesundheitseinrichtung hinweg
* Ermöglichung pseudonymisierter Patientendarstellungen für Forschungszwecke unter Beibehaltung wesentlicher demografischer Merkmale

### Profilspezifische Implementierungshinweise

Dieser Abschnitt enthält detaillierte Implementierungshinweise für das MII-Patient-Profil.

#### Patienten-Identifikation

Die Patienten-Identifikation verwendet je nach Kontext verschiedene Identifier-Typen:

* **`Patient.identifier:versichertenId`**: Lebenslange Krankenversicherten-ID (10-stellige KVID) für alle Krankenversicherungsarten (GKV, PKV, Sonderkostenträger) 
* **WICHTIG**: Das Assigner-Element MUSS die IKNR (Institutionskennzeichen) der ausgebenden Institution enthalten
* Repräsentiert stets die aktuelle Versicherungsnummer der PatientIn
* Verwenden Sie als `Identifier.type` den Code `KVZ10` aus `http://fhir.de/CodeSystem/identifier-type-de-basis`
* Die Codes `GKV` und `PKV` haben den Status `retired` und **SOLLEN NICHT** verwendet werden
 
* **`Patient.identifier:pid`**: Organisationsinterner Patienten-Identifier - die führende (MPI) ID der PatientIn 
* Eine Referenz auf die ausgebende Organization in `Patient.identifier:pid.assigner` ist EMPFOHLEN
* Logische Referenz per IK-Nummer oder IHE Affinity Domain OID ist zulässig
* Das CodeSystem [Core-Location-Identifier](https://simplifier.net/packages/de.medizininformatikinitiative.kerndatensatz.meta/2025.0.0/files/2678530) für alle MII-Standorte kann verwendet werden
 
* **`Patient.identifier`**: Jegliche weiteren Identifier, falls GKV/PKV/PID nicht zutreffend ist

##### Best Practice - Änderungen bei der Krankenversicherten-ID

Im Vergleich zu Vorversionen wird die Krankenversicherten-ID in `Patient.identifier` nicht mehr in GKV und PKV unterschieden. `Patient.identifier:versichertenId` gilt für alle Krankenversichertennummern, unabhängig davon, ob es sich um GKV, PKV oder Sonderkostenträger handelt.

Als `Identifier.type` SOLL der Code `KVZ10` aus `http://fhir.de/CodeSystem/identifier-type-de-basis` verwendet werden. Die Codes `GKV` und `PKV` haben den Status `retired`. Siehe Constraint **kvid-2** im Profil [IdentifierKvid10](https://simplifier.net/packages/de.basisprofil.r4/1.5.4/files/2879564) in den Deutschen FHIR-Basisprofilen.

#### Patientenname

Patientennamen folgen dem [Deutschen FHIR-Basis-Profil für den Datentyp HumanName]:

* **Namensbestandteile**: Die Aufteilung des vollständigen Namens in seine Bestandteile (z.B. Vorsatzwort, Namenszusatz, Nachname) SOLL nur durchgeführt werden, falls diese Informationen explizit in dieser Granularität zur Verfügung stehen (z.B. durch einen direkten Import auf Basis eines VSDM-Datensatzes)
* **Geburtsname**: Per allgemeiner Konvention enthält der Geburtsname (`name.use = maiden`) nur den Familiennamen
* **Mehrere Namen**: Mehrere Namenseinträge sind für verschiedene Anwendungsfälle erlaubt (official, maiden, etc.)

#### Geschlecht

Die Geschlechtsdokumentation folgt den Vorgaben der [Deutschen FHIR-Basis-Profile für Geschlecht]:

* **`Patient.gender`**: Administratives Geschlecht (verpflichtend)
* **`Patient.gender.extension:other-amtlich`**: Amtliche Geschlechtscodes gemäß deutscher Vorschriften für Fälle jenseits von männlich/weiblich/unbekannt
* **[`Patient.extension:recordedSexOrGender`](https://hl7.org/fhir/extensions/StructureDefinition-individual-recordedSexOrGender.html)**: Wiederholbare Geschlechtsangaben, die aus einem Dokument oder einer anderen Aufzeichnung übernommen wurden. Diese Angaben werden getrennt vom administrativen Geschlecht in `Patient.gender` geführt und können beispielsweise das bei der Geburt zugewiesene Geschlecht abbilden. 
* **`value`**: Der dokumentierte Wert. Das [MII ValueSet Person Recorded Sex or Gender SNOMED](ValueSet-mii-vs-person-recordedsexorgender-snomed.md) ist mit der Bindungsstärke `extensible` gebunden ([HDB-1124](https://hl7germany.atlassian.net/browse/HDB-1124)): Passt ein Code daraus, **MUSS** er verwendet werden; andere Codes sind nur zulässig, wenn keiner passt. Es enthält SNOMED-CT-Codes zum biologischen Geschlecht sowie `261665006 | Unknown (qualifier value) |`. Die ConceptMap [MII CM Person Recorded Sex or Gender SNOMED to Administrative Gender](ConceptMap-mii-cm-person-recordedsexorgender-snomed-administrative-gender.md) setzt diese Codes in Beziehung zu `Patient.gender`; keine der Beziehungen ist äquivalent, da dokumentiertes und administratives Geschlecht unterschiedliche Konzepte sind ([HDB-1068](https://hl7germany.atlassian.net/browse/HDB-1068)).
* **`type`**: Kennzeichnet die Art der dokumentierten Geschlechtsangabe. Für das bei der Geburt zugewiesene Geschlecht SOLL `http://loinc.org|76689-9` (Sex assigned at birth) verwendet werden.
* **`acquisitionDate`**: Zeitpunkt, zu dem die Angabe erfasst wurde.
 
* **[`Patient.extension:sexParameterForClinicalUse`](https://hl7.org/fhir/extensions/StructureDefinition-patient-sexParameterForClinicalUse.html)**: Ein Parameter für klinische Entscheidungen, die vom Geschlecht abhängen, etwa Referenzbereiche oder Dosierungen (z. B. **specified**, **female-typical**, **male-typical**). Er wird nicht automatisch aus `Patient.gender` oder `recordedSexOrGender` abgeleitet und von beiden getrennt geführt ([HDB-1067](https://hl7germany.atlassian.net/browse/HDB-1067)). 
* **`value`**: Der Parameter, codiert aus dem ValueSet `sex-parameter-for-clinical-use`.
* **`period`**: Der Zeitraum, für den der Parameter gilt.
 

`Indeterminate sex` bezeichnet ein nicht bestimmbares Geschlecht, während `Unknown` bedeutet, dass die Angabe nicht bekannt ist oder nicht dokumentiert wurde. Implementierungen SOLLEN diese Unterscheidung beibehalten.

#### Staatsbürgerschaft und Nationalität

* **`Patient.extension:patient-citizenship`**: Rechtlicher Status des Patienten als Staatsbürger eines Landes. Mehrere Staatsbürgerschaften und ihre jeweiligen Gültigkeitszeiträume können abgebildet werden.
* **`Patient.extension:patient-nationality`**: Nationalität des Patienten. Mehrere Nationalitäten und ihre jeweiligen Gültigkeitszeiträume können abgebildet werden.

**Offener Klärungsbedarf:** Die vorgesehene Verwendung und Abgrenzung von `patient-citizenship` und `patient-nationality` muss noch geklärt werden. Insbesondere ist offen, ob der deutsche Begriff „Staatsangehörigkeit“ spezifisch die rechtliche Staatsbürgerschaft oder Nationalität in einem weiter gefassten rechtlichen, kulturellen oder ethnischen Sinn bezeichnet. Siehe [#86](https://github.com/medizininformatik-initiative/kerndatensatz-basis/issues/86).

#### Geburtsdatum, Geburtsort und Vitalstatus

* **`Patient.birthDate`**: Vollständiges Geburtsdatum, wenn verfügbar. Siehe [Basisprofil - Geburtsdatum] 
* **Bewusste Abweichung:** `birthDate` bleibt optional (0..1). Andere Spezifikationen wie ISiK fordern es verpflichtend (1..1, bei unbekanntem Datum mit `data-absent-reason`). Die MII folgt dem bewusst nicht: aus Datenschutzgründen (Datenminimierung) kann es weggelassen oder nur mit reduzierter Genauigkeit übermittelt werden ([HDB-1071](https://hl7germany.atlassian.net/browse/HDB-1071)).
 
* **`Patient.extension:birthPlace`**: Registrierter Geburtsort der PatientIn. Zur Abbildung des Geburtslandes ist `valueAddress.country` zu verwenden; die Extension `countryCode` unterstützt die Codierung mit ISO-3166-1-Alpha-2-Codes über ein `preferred` Binding.

**EHDS-Ausblick:** Die Verwendung der FHIR-Core-Extensions `patient-citizenship`, `patient-nationality` und `patient-birthPlace` mit diesen Kardinalitäten ist an [HL7 Europe Patient (EU base) 2.0.0](https://hl7.eu/fhir/base/2.0.0/StructureDefinition-patient-eu.html) und [HL7 Europe Patient (EU core) 2.0.0](https://hl7.eu/fhir/base/2.0.0/StructureDefinition-patient-eu-core.html) ausgerichtet. Dies unterstützt die zukünftige Interoperabilität im EHDS-Kontext.

* **`Patient.deceased[x]`**: 
* `deceasedBoolean` SOLL, wo möglich, durch `deceasedDateTime` ersetzt werden, wenn die PatientIn verstorben ist und der Zeitpunkt bekannt ist
 

#### Mutter und Neugeborenes

Nach der Geburt werden Mutter und Kind durch getrennte `Patient`-Ressourcen abgebildet. Drei unterschiedliche Beziehungen werden getrennt modelliert ([FHIR R4 – Mother and newborn relationships](https://hl7.org/fhir/R4/patient.html#mother)):

* die **familiäre Beziehung** zwischen Mutter und Kind: `RelatedPerson`;
* die **geburtshilfliche Episode**, d. h. die Kontakte von Mutter und Kind: `Encounter`;
* die **Abrechnungsfälle**: Fallnummer in `Encounter.account.identifier` oder ein `Account`.

**Familiäre Beziehung:**

```
%%{init: {'flowchart': {'htmlLabels': false}, 'theme': 'base', 'themeVariables': {'primaryColor': '#E8F4F8', 'primaryBorderColor': '#406A99', 'primaryTextColor': '#000000', 'lineColor': '#5C8DB3', 'fontSize': '14px'}}}%%
flowchart TD
  M["`**Patient**
      Eigener Datensatz der Mutter`"]
  R["`**RelatedPerson**
      Mutter dieses Kindes
      relationship.coding.code = MTH`"]
  C["`**Patient**
      Eigener Datensatz des Kindes`"]

  M -.->|"`link.other (optional)
      link.type = seealso`"| R
  R -->|"`RelatedPerson.patient`"| C

```

Die Mutter erscheint zweimal: als `RelatedPerson`, die auf das Kind verweist, und, wenn sie selbst Patientin ist, als eigener `Patient`. Eine Referenz vom `Patient` der Mutter auf den `Patient` des Kindes gibt es bewusst nicht.

* Die Mutter **SOLL** als `RelatedPerson` abgebildet werden, mit `RelatedPerson.patient` als Referenz auf den `Patient` des Kindes und `RelatedPerson.relationship` = `MTH` aus `http://terminology.hl7.org/CodeSystem/v3-RoleCode`. `MTH` umfasst eine Frau, die das Kind gezeugt, geboren oder großgezogen hat; wo die Unterscheidung relevant ist, **SOLLEN** spezifischere Codes wie `NMTH` (leibliche Mutter), `GESTM` (austragende Mutter), `ADOPTM` (Adoptivmutter) oder `STPMTH` (Stiefmutter) verwendet werden.
* Ist die Mutter selbst Patientin, **KANN** ihr eigenes `Patient.link.other` mit `Patient.link.type` = `seealso` auf diese `RelatedPerson` verweisen.
* `Patient.link` **DARF NICHT** verwendet werden, um den `Patient` der Mutter direkt mit dem `Patient` des Kindes zu verknüpfen: Es verknüpft Ressourcen, die dieselbe tatsächliche Person betreffen.
* **Referenzprofil:** [ISiKAngehoeriger 6.0.0](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0/StructureDefinition-ISiKAngehoeriger.html) ist das deutsche Krankenhausprofil für `RelatedPerson` (`patient.reference` 1..1, `relationship` Must Support). Seine Must-Support-Elemente (offizieller Name, Telekommunikation, Adresse) zielen auf Angehörige als Brief- und Rechnungsempfänger. Eine `RelatedPerson`, die nur aus dem Identifikator der Mutter gebildet wird, z. B. aus HL7 v2 `PID-21`, kann Konformität zu ISiKAngehoeriger nur beanspruchen, wenn sie den [ISiK-Regeln zum Umgang mit fehlenden Daten](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0/UebergreifendeFestlegungen_UmgangFehlendeDaten.html) folgt: Liegt kein Name vor, trägt `RelatedPerson.name` die Extension `data-absent-reason`; unbekannte optionale Must-Support-Elemente wie Telekommunikation und Adresse werden weggelassen.
* `Patient.contact` ist ein Eintrag für eine Kontaktperson innerhalb des `Patient` des Kindes; er kann einen Beziehungscode wie `MTH` und Kontaktdaten enthalten. `RelatedPerson` **SOLL** verwendet werden, wenn die Mutter eigenständig referenzierbar sein muss, z. B. aus ihrem eigenen `Patient.link` oder aus anderen Ressourcen.
* `FamilyMemberHistory` beschreibt die klinisch relevante Vorgeschichte von Angehörigen; es dient nicht der Verknüpfung mit einer identifizierten Mutter.

**Kontakte:**

* Der Einrichtungskontakt des Neugeborenen **KANN** über `Encounter.partOf` auf den Entbindungs-Einrichtungskontakt der Mutter verweisen, wie in FHIR R4 beschrieben.
* Eine solche `partOf`-Referenz auf einen Encounter mit anderem `Encounter.subject` drückt nur die geburtshilfliche Zuordnung aus. Sie ist nicht Teil der Kontakthierarchie: Die Traversierung der Hierarchie endet am Einrichtungskontakt des Neugeborenen (siehe [Kontakthierarchien und Kontaktebenen](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md#encounter-partof-across-patients)).

**Abrechnung:**

* Besteht für das Neugeborene ein eigener Abrechnungsfall, kann dessen Fallnummer in `Encounter.account.identifier` des Neugeborenen angegeben werden, als logische Referenz auch ohne verfügbare Account-Ressource (siehe [Best Practice - Aufnahmenummer vs. Fallnummer](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.md#best-practice-aufnahmenummer-vs-fallnummer)).
* Ob ein eigener Fall besteht, richtet sich nach den Abrechnungsregeln des jeweiligen Jahres, nicht nach der `partOf`-Referenz. Für 2026 sieht [FPV 2026 § 1 Abs. 5](https://www.g-drg.de/content/download/17465/file/2025_11_14_FPV_2026.pdf#page=3) für jedes Neugeborene, das nach der Versorgung im Kreißsaal weiter im Krankenhaus versorgt wird, einen eigenen Fall und eine eigene Rechnung vor, mit Ausnahmen, z. B. wenn die Mindestverweildauer nicht erreicht wird.

**Mehrlingsschwangerschaft und Mehrlingsgeburt:**

* Eine Mehrlingsschwangerschaft ist ein Befund der **Mutter** und wird als Observation zur schwangeren Patientin erfasst, z. B. im KBV-MIO-Mutterpass-1.1.0-Profil [`KBV_PR_MIO_MR_Observation_Pregnancy_Information`](https://hub.kbv.de/spaces/MP1X1X0/pages/109842757/9.3.2.2%2BAngaben%2Bzur%2BSchwangerschaft) (SNOMED CT `370386005` mit booleschem Wert).
* Nach der Geburt ist jedes Kind ein eigener `Patient`. Liegen Angaben zur Mehrlingsgeburt vor, werden sie in `Patient.multipleBirth[x]` (0..1) angegeben. `multipleBirthInteger` ist die Geburtsreihenfolge, nicht die Anzahl der Kinder; `multipleBirthBoolean` = `true` zeigt nur eine Mehrlingsgeburt an. Am `Patient` der Mutter würde `multipleBirth[x]` ihre eigene Geburt beschreiben.
* Jedes Kind erhält eine eigene `RelatedPerson` für die Mutter, wie im [CH-EPREG-Beispiel für mehrere Kinder](https://www.fhir.ch/ig/ch-epreg/child-relationships.html).

Beispiel für Zwillinge:

| | |
| :--- | :--- |
| `Patient`Kind 1 | `multipleBirthInteger`=`1`(oder`multipleBirthBoolean`=`true`, wenn die Reihenfolge unbekannt ist) |
| `Patient`Kind 2 | `multipleBirthInteger`=`2`(oder`multipleBirthBoolean`=`true`, wenn die Reihenfolge unbekannt ist) |
| `RelatedPerson`Mutter für Kind 1 | `patient`→ Kind 1,`relationship`=`MTH` |
| `RelatedPerson`Mutter für Kind 2 | `patient`→ Kind 2,`relationship`=`MTH` |

**Nicht im Umfang:** Die Identifikation einzelner Feten während der Schwangerschaft ist nicht Gegenstand dieses Moduls; siehe [HL7 International Birth and Child Model](https://build.fhir.org/ig/HL7/fetal_records/) und CH EPREG. Gleiches gilt für die in [HDB-1035](https://hl7germany.atlassian.net/browse/HDB-1035) aufgeworfenen Fragen zur Vergabe von Identifikatoren bei der Geburt, zur Verknüpfung pränataler Befunde mit dem späteren Kind und zur Zuordnung von Nabelschnurblut-Proben zu Mutter oder Kind. Diese werden an geburtshilfliche und perinatale Leitfäden verwiesen.

**HL7 v2:** Gemäß dem [HL7-v2-to-FHIR-Mapping](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pid-to-patient.html) wird `PID-21` (Mother's Identifier) auf eine `RelatedPerson` für die Mutter abgebildet, `PID-25` (Birth Order) auf `multipleBirthInteger` und `PID-24` (Multiple Birth Indicator) auf `multipleBirthBoolean`, wenn `PID-25` nicht befüllt ist.

#### Adressinformationen

Adressdetails folgen dem [Basisprofil - Adresse]:

* **Mehrere Adressen**: Mehrere Adressen sind erlaubt
* **Adressverlauf**: Systeme SOLLEN ehemalige Adressen als solche kennzeichnen, sodass die aktuelle Adresse der PatientIn erkennbar ist
* **Adressbestandteile**: 
* `address.line` mit Extensions für Straße, Hausnummer, Adresszusatz, Postfach
* `address.city` mit Extension für Gemeindeschlüssel und Stadtteil (bei Stadtstaaten)
* `address.postalCode` für PLZ
* `address.country` für Land
 

**EHDS-Ausblick:** Über die Abhängigkeit von den Deutschen FHIR-Basisprofilen 1.6.0 basieren die Adress-Slices des Patient-Profils auf [AddressDeBasis 1.6.0](https://simplifier.net/packages/de.basisprofil.r4/1.6.0/files/3644189). Für eine einheitlich codierte Länderangabe **SOLLTEN** Implementierungen die geerbte Extension `Address.country.extension:countryCode` (`iso21090-codedString`) mit einem ISO-3166-1-Alpha-2-Code verwenden; Alpha-3-Codes aus Quellsystemen **MÜSSEN** beim Befüllen dieser Extension in den entsprechenden Alpha-2-Code überführt werden. `AddressDeBasis` bindet den Wert der Extension mit der Bindungsstärke `required` an das ValueSet `ISO 3166 Part 1: 2 Letter Codes`. Damit werden dieselbe Extension und dasselbe ValueSet wie in [HL7 Europe Address (EU) 2.0.0](https://hl7.eu/fhir/base/2.0.0/StructureDefinition-Address-eu.html) verwendet, wo die Bindungsstärke `preferred` ist; dies unterstützt die zukünftige EHDS-Interoperabilität. Diese Empfehlung betrifft die codierte Darstellung in der Extension; `Address.country` bleibt ein String. Die Invariante `pat-cnt-2or3-char` (Schweregrad warning) an den Adress-Slices prüft diese Extension und nicht `Address.country`, sodass `Address.country` auch andere Werte wie DEÜV-Länderschlüssel enthalten darf ([HDB-1069](https://hl7germany.atlassian.net/browse/HDB-1069)).

##### Best Practice - Adressbestandteile

**Stadtteil:** Der Stadtteil ist nicht Bestandteil des [VSDM-Datensatzes](https://fachportal.gematik.de/anwendungen/versichertenstammdatenmanagement) der Gematik. Andere Quellen konform zu §21 KHEntgG müssen eventuell hinzugezogen werden.

**Adressstruktur:** Für Stadtstaaten verwenden Sie `Patient.address.city` kombiniert mit `Patient.address.extension.Stadtteil`, um `Person.Demographie.Adresse.Wohnort` darzustellen.

**Usages:**

* Examples for this Profil: [Patient/mii-exa-person-patient-1](Patient-mii-exa-person-patient-1.md)
* CapabilityStatements using this Profil: [MII CPS Person CapabilityStatement](CapabilityStatement-mii-cps-person-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.base|current/StructureDefinition/StructureDefinition-mii-pr-person-patient.json)

### Formale Ansichten des Profilinhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Schlüsselelemente-Tabelle](#tabs-key) 
*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Patient](http://hl7.org/fhir/R4/patient.html) 

#### Terminology Bindings (Differential)

#### Constraints

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Patient](http://hl7.org/fhir/R4/patient.html) 

 **Schlüsselelemente-Ansicht** 

#### Terminology Bindings

#### Constraints

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [Patient](http://hl7.org/fhir/R4/patient.html) 

#### Terminology Bindings (Differential)

#### Constraints

 **Snapshot-AnsichtView** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Patient](http://hl7.org/fhir/R4/patient.html) 

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-mii-pr-person-patient.csv), [Excel](../StructureDefinition-mii-pr-person-patient.xlsx), [Schematron](../StructureDefinition-mii-pr-person-patient.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-person-patient",
  "meta" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license",
      "valueCode" : "CC-BY-4.0"
    },
    {
      "extension" : [{
        "url" : "packageId",
        "valueId" : "de.medizininformatikinitiative.kerndatensatz.base"
      },
      {
        "url" : "version",
        "valueString" : "2027.0.0-ballot"
      },
      {
        "url" : "uri",
        "valueUri" : "https://www.medizininformatik-initiative.de/fhir/modul-base"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/package-source"
    }],
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm",
    "valueCoding" : {
      "system" : "http://hl7.org/fhir/version-algorithm",
      "code" : "semver",
      "display" : "SemVer"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "shareable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "publishable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionPolicy",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/artifact-version-policy-codes",
        "version" : "3.0.0",
        "code" : "package",
        "display" : "Package"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-usage",
    "valueMarkdown" : "Use this profile as the technical FHIR representation of the corresponding Medical Informatics Initiative logical model. The profile constrains a base FHIR resource for the MII module context by specifying how elements are used, which elements are required or not used, which extensions and terminology bindings apply, and how the resource maps to the module-specific content model. Implementers should produce and consume resource instances that conform to this profile when exchanging data for the corresponding MII module."
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-approvalDate",
    "valueDate" : "2024-03-07"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-effectivePeriod",
    "valuePeriod" : {
      "start" : "2027"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-topic",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl",
        "code" : "C16960"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-author",
    "valueContactDetail" : {
      "telecom" : [{
        "system" : "email",
        "value" : "julian.sass@charite.de"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-editor",
    "valueContactDetail" : {
      "name" : "Taskforce Core Data Set"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-reviewer",
    "valueContactDetail" : {
      "name" : "Interoperability Working Group",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/interoperability-working-group"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-reviewer",
    "valueContactDetail" : {
      "name" : "National Steering Committee",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/national-steering-committee"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-endorser",
    "valueContactDetail" : {
      "name" : "Interoperability Working Group",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/interoperability-working-group"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-endorser",
    "valueContactDetail" : {
      "name" : "National Steering Committee",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/national-steering-committee"
      }]
    }
  }],
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient",
  "version" : "2027.0.0-ballot",
  "name" : "MII_PR_Person_Patient",
  "title" : "MII PR Person Patient",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "de-DE"
      },
      {
        "url" : "content",
        "valueString" : "Patient / Patientin"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    },
    {
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en-US"
      },
      {
        "url" : "content",
        "valueString" : "Patient"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "active",
  "experimental" : false,
  "date" : "2026-09-01",
  "publisher" : "Medical Informatics Initiative (MII)",
  "contact" : [{
    "name" : "Medical Informatics Initiative (MII)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/en"
    }]
  }],
  "description" : "Dieses Profil beschreibt eine Patient*in in der Medizininformatik-Initiative.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "de-DE"
      },
      {
        "url" : "content",
        "valueString" : "Demografische und andere administrative Informationen über eine Patientin oder einen Patienten."
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    },
    {
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en-US"
      },
      {
        "url" : "content",
        "valueString" : "Demographics and other administrative information about a patient."
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "purpose" : "Constrain the FHIR Patient resource for consistent exchange of patient information in the MII Person module.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "loinc",
    "uri" : "http://loinc.org",
    "name" : "LOINC code for the element"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Patient",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Patient",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Patient",
      "path" : "Patient",
      "constraint" : [{
        "key" : "mii-pat-1",
        "severity" : "error",
        "human" : "Falls die Geschlechtsangabe 'other' gewählt wird, muss die amtliche Differenzierung per Extension angegeben werden",
        "expression" : "gender.exists() and gender='other' implies gender.extension('http://fhir.de/StructureDefinition/gender-amtlich-de').exists()",
        "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient"
      }]
    },
    {
      "id" : "Patient.id",
      "path" : "Patient.id",
      "mustSupport" : true
    },
    {
      "id" : "Patient.meta",
      "path" : "Patient.meta",
      "mustSupport" : true
    },
    {
      "id" : "Patient.meta.profile",
      "path" : "Patient.meta.profile",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension",
      "path" : "Patient.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Patient.extension:birthPlace",
      "path" : "Patient.extension",
      "sliceName" : "birthPlace",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Geburtsort"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Birth Place"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/patient-birthPlace"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:birthPlace.url",
      "path" : "Patient.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:birthPlace.value[x]",
      "path" : "Patient.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:birthPlace.value[x].country",
      "path" : "Patient.extension.value[x].country",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Geburtsland"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Country of Birth"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:birthPlace.value[x].country.extension",
      "path" : "Patient.extension.value[x].country.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Patient.extension:birthPlace.value[x].country.extension:countryCode",
      "path" : "Patient.extension.value[x].country.extension",
      "sliceName" : "countryCode",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/iso21090-codedString"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:birthPlace.value[x].country.extension:countryCode.value[x]",
      "path" : "Patient.extension.value[x].country.extension.value[x]",
      "mustSupport" : true,
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "http://hl7.org/fhir/ValueSet/iso3166-1-2"
      }
    },
    {
      "id" : "Patient.extension:birthPlace.value[x].country.extension:countryCode.value[x].system",
      "path" : "Patient.extension.value[x].country.extension.value[x].system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:birthPlace.value[x].country.extension:countryCode.value[x].code",
      "path" : "Patient.extension.value[x].country.extension.value[x].code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship",
      "path" : "Patient.extension",
      "sliceName" : "patient-citizenship",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Staatsbürgerschaft"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Citizenship"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/patient-citizenship"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship.extension:code",
      "path" : "Patient.extension.extension",
      "sliceName" : "code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship.extension:code.url",
      "path" : "Patient.extension.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship.extension:code.value[x]",
      "path" : "Patient.extension.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship.extension:code.value[x].coding",
      "path" : "Patient.extension.extension.value[x].coding",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship.extension:code.value[x].coding.system",
      "path" : "Patient.extension.extension.value[x].coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship.extension:code.value[x].coding.code",
      "path" : "Patient.extension.extension.value[x].coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship.extension:period",
      "path" : "Patient.extension.extension",
      "sliceName" : "period",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship.extension:period.url",
      "path" : "Patient.extension.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship.extension:period.value[x]",
      "path" : "Patient.extension.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-citizenship.url",
      "path" : "Patient.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality",
      "path" : "Patient.extension",
      "sliceName" : "patient-nationality",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Nationalität"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Nationality"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/patient-nationality"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality.extension:code",
      "path" : "Patient.extension.extension",
      "sliceName" : "code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality.extension:code.url",
      "path" : "Patient.extension.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality.extension:code.value[x]",
      "path" : "Patient.extension.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality.extension:code.value[x].coding",
      "path" : "Patient.extension.extension.value[x].coding",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality.extension:code.value[x].coding.system",
      "path" : "Patient.extension.extension.value[x].coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality.extension:code.value[x].coding.code",
      "path" : "Patient.extension.extension.value[x].coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality.extension:period",
      "path" : "Patient.extension.extension",
      "sliceName" : "period",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality.extension:period.url",
      "path" : "Patient.extension.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality.extension:period.value[x]",
      "path" : "Patient.extension.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:patient-nationality.url",
      "path" : "Patient.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender",
      "path" : "Patient.extension",
      "sliceName" : "recordedSexOrGender",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Dokumentiertes Geschlecht"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Recorded Sex or Gender"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/individual-recordedSexOrGender"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:value",
      "path" : "Patient.extension.extension",
      "sliceName" : "value",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:value.url",
      "path" : "Patient.extension.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:value.value[x]",
      "path" : "Patient.extension.extension.value[x]",
      "mustSupport" : true,
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "https://www.medizininformatik-initiative.de/fhir/modul-person/ValueSet/mii-vs-person-recordedsexorgender-snomed"
      }
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:value.value[x].coding",
      "path" : "Patient.extension.extension.value[x].coding",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:value.value[x].coding.system",
      "path" : "Patient.extension.extension.value[x].coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:value.value[x].coding.code",
      "path" : "Patient.extension.extension.value[x].coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:type",
      "path" : "Patient.extension.extension",
      "sliceName" : "type",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:type.url",
      "path" : "Patient.extension.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:type.value[x]",
      "path" : "Patient.extension.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:type.value[x].coding",
      "path" : "Patient.extension.extension.value[x].coding",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:type.value[x].coding.system",
      "path" : "Patient.extension.extension.value[x].coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:type.value[x].coding.code",
      "path" : "Patient.extension.extension.value[x].coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:acquisitionDate",
      "path" : "Patient.extension.extension",
      "sliceName" : "acquisitionDate",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:acquisitionDate.url",
      "path" : "Patient.extension.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.extension:acquisitionDate.value[x]",
      "path" : "Patient.extension.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:recordedSexOrGender.url",
      "path" : "Patient.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse",
      "path" : "Patient.extension",
      "sliceName" : "sexParameterForClinicalUse",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Geschlechtsparameter für die klinische Verwendung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Sex Parameter for Clinical Use"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/patient-sexParameterForClinicalUse"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse.extension:value",
      "path" : "Patient.extension.extension",
      "sliceName" : "value",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse.extension:value.url",
      "path" : "Patient.extension.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse.extension:value.value[x]",
      "path" : "Patient.extension.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse.extension:value.value[x].coding",
      "path" : "Patient.extension.extension.value[x].coding",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse.extension:value.value[x].coding.system",
      "path" : "Patient.extension.extension.value[x].coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse.extension:value.value[x].coding.code",
      "path" : "Patient.extension.extension.value[x].coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse.extension:period",
      "path" : "Patient.extension.extension",
      "sliceName" : "period",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse.extension:period.url",
      "path" : "Patient.extension.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse.extension:period.value[x]",
      "path" : "Patient.extension.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.extension:sexParameterForClinicalUse.url",
      "path" : "Patient.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier",
      "path" : "Patient.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "short" : "Patienten-Identifikator",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Identifikator"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Identifier"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Ein Identifikator für den/die Patient*in",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Ein Identifikator für den/die Patient*in"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "An identifier for this patient"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId",
      "path" : "Patient.identifier",
      "sliceName" : "versichertenId",
      "short" : "Krankenversichertennummer",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Krankenversichertennummer"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Health insurance number"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Krankenversichertennummer, unabhängig, ob GKV, PKV oder Sonderkostenträger",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "10-stellige KVID"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "10-digit health insurance number"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-kvid-10"]
      }],
      "patternIdentifier" : {
        "type" : {
          "coding" : [{
            "system" : "http://fhir.de/CodeSystem/identifier-type-de-basis",
            "code" : "KVZ10"
          }]
        }
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.type",
      "path" : "Patient.identifier.type",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.type.coding",
      "path" : "Patient.identifier.type.coding",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.type.coding.system",
      "path" : "Patient.identifier.type.coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.type.coding.code",
      "path" : "Patient.identifier.type.coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.system",
      "path" : "Patient.identifier.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.value",
      "path" : "Patient.identifier.value",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.assigner",
      "path" : "Patient.identifier.assigner",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.assigner.identifier",
      "path" : "Patient.identifier.assigner.identifier",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-iknr"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.assigner.identifier.type",
      "path" : "Patient.identifier.assigner.identifier.type",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.assigner.identifier.type.coding",
      "path" : "Patient.identifier.assigner.identifier.type.coding",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.assigner.identifier.type.coding.system",
      "path" : "Patient.identifier.assigner.identifier.type.coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.assigner.identifier.type.coding.code",
      "path" : "Patient.identifier.assigner.identifier.type.coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.assigner.identifier.system",
      "path" : "Patient.identifier.assigner.identifier.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:versichertenId.assigner.identifier.value",
      "path" : "Patient.identifier.assigner.identifier.value",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid",
      "path" : "Patient.identifier",
      "sliceName" : "pid",
      "short" : "Patientenidentifikation",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Organisationsinterner Patienten-Identifikator"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Organization-internal patient identifier"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Patientenidentifikator innerhalb einer Organisation",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Führende ID der Patient*in in der Organisation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Medical record number of the patient in the organization"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-pid"]
      }],
      "patternIdentifier" : {
        "type" : {
          "coding" : [{
            "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code" : "MR"
          }]
        }
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.type",
      "path" : "Patient.identifier.type",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.type.coding",
      "path" : "Patient.identifier.type.coding",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.type.coding.system",
      "path" : "Patient.identifier.type.coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.type.coding.code",
      "path" : "Patient.identifier.type.coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.system",
      "path" : "Patient.identifier.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.value",
      "path" : "Patient.identifier.value",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.assigner",
      "path" : "Patient.identifier.assigner",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.assigner.identifier",
      "path" : "Patient.identifier.assigner.identifier",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.assigner.identifier.type",
      "path" : "Patient.identifier.assigner.identifier.type",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
          "code" : "XX"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.assigner.identifier.type.coding",
      "path" : "Patient.identifier.assigner.identifier.type.coding",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.assigner.identifier.type.coding.system",
      "path" : "Patient.identifier.assigner.identifier.type.coding.system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.assigner.identifier.type.coding.code",
      "path" : "Patient.identifier.assigner.identifier.type.coding.code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:pid.assigner.identifier.system",
      "path" : "Patient.identifier.assigner.identifier.system",
      "constraint" : [{
        "key" : "mii-pat-2",
        "severity" : "error",
        "human" : "Entweder IKNR oder MII Core Location Identifier muss verwendet werden",
        "expression" : "$this = 'http://fhir.de/sid/arge-ik/iknr' or $this = 'https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier'",
        "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient"
      }]
    },
    {
      "id" : "Patient.name",
      "path" : "Patient.name",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "short" : "Name",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Name"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Name"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Name der Patientin oder des Patienten",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Name der Patientin oder des Patienten"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "A name associated with the patient"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:name",
      "path" : "Patient.name",
      "sliceName" : "name",
      "short" : "Personenname",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Personenname"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Person's name"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Personenname mit in Deutschland üblichen Namensbestandteilen",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Personenname mit in Deutschland üblichen Namensbestandteilen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "A person's name with components typically used in Germany"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "HumanName",
        "profile" : ["http://fhir.de/StructureDefinition/humanname-de-basis"]
      }],
      "patternHumanName" : {
        "use" : "official"
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:name.use",
      "path" : "Patient.name.use",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:name.family",
      "path" : "Patient.name.family",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:name.family.extension:namenszusatz",
      "path" : "Patient.name.family.extension",
      "sliceName" : "namenszusatz",
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:name.family.extension:nachname",
      "path" : "Patient.name.family.extension",
      "sliceName" : "nachname",
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:name.family.extension:vorsatzwort",
      "path" : "Patient.name.family.extension",
      "sliceName" : "vorsatzwort",
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:name.given",
      "path" : "Patient.name.given",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:name.prefix",
      "path" : "Patient.name.prefix",
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:name.prefix.extension:prefix-qualifier",
      "path" : "Patient.name.prefix.extension",
      "sliceName" : "prefix-qualifier",
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:geburtsname",
      "path" : "Patient.name",
      "sliceName" : "geburtsname",
      "short" : "Geburtsname",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Geburtsname"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Maiden name"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Name, der vor einer Namensänderung aufgrund von Heirat verwendet wurde",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Name, der vor einer Namensänderung aufgrund von Heirat verwendet wurde."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "A name used prior to changing name because of marriage."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "HumanName",
        "profile" : ["http://fhir.de/StructureDefinition/humanname-de-basis"]
      }],
      "patternHumanName" : {
        "use" : "maiden"
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:geburtsname.use",
      "path" : "Patient.name.use",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:geburtsname.family",
      "path" : "Patient.name.family",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:geburtsname.family.extension:namenszusatz",
      "path" : "Patient.name.family.extension",
      "sliceName" : "namenszusatz",
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:geburtsname.family.extension:nachname",
      "path" : "Patient.name.family.extension",
      "sliceName" : "nachname",
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:geburtsname.family.extension:vorsatzwort",
      "path" : "Patient.name.family.extension",
      "sliceName" : "vorsatzwort",
      "mustSupport" : true
    },
    {
      "id" : "Patient.name:geburtsname.given",
      "path" : "Patient.name.given",
      "max" : "0"
    },
    {
      "id" : "Patient.name:geburtsname.prefix",
      "path" : "Patient.name.prefix",
      "max" : "0"
    },
    {
      "id" : "Patient.name:geburtsname.prefix.extension:prefix-qualifier",
      "path" : "Patient.name.prefix.extension",
      "sliceName" : "prefix-qualifier",
      "mustSupport" : true
    },
    {
      "id" : "Patient.gender",
      "path" : "Patient.gender",
      "short" : "Administratives Geschlecht",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Administratives Geschlecht"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Administrative gender"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "männlich | weiblich | andere | unbekannt | unbestimmt | divers",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "männlich | weiblich | andere | unbekannt | unbestimmt | divers"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "male | female | other | unknown | undetermined | diverse"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.gender.extension",
      "path" : "Patient.gender.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Patient.gender.extension:other-amtlich",
      "path" : "Patient.gender.extension",
      "sliceName" : "other-amtlich",
      "short" : "Extension Administratives Geschlecht",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Extension Administratives Geschlecht"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Extension administrative gender"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Extension zur genaueren Differenzierung des administrativen Geschlechts",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Extension zur genaueren Differenzierung des administrativen Geschlechts"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Extension for detailed differentiation of administrative gender"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://fhir.de/StructureDefinition/gender-amtlich-de"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.gender.extension:other-amtlich.url",
      "path" : "Patient.gender.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.gender.extension:other-amtlich.value[x]",
      "path" : "Patient.gender.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.gender.extension:other-amtlich.value[x].system",
      "path" : "Patient.gender.extension.value[x].system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.gender.extension:other-amtlich.value[x].code",
      "path" : "Patient.gender.extension.value[x].code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.birthDate",
      "path" : "Patient.birthDate",
      "short" : "Geburtsdatum",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Geburtsdatum"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Date of birth"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Das Geburtsdatum der Patientin oder des Patienten",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das Geburtsdatum der Patientin oder des Patienten"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "The date of birth for the individual"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.birthDate.extension",
      "path" : "Patient.birthDate.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Patient.birthDate.extension:data-absent-reason",
      "path" : "Patient.birthDate.extension",
      "sliceName" : "data-absent-reason",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/data-absent-reason"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.deceased[x]",
      "path" : "Patient.deceased[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      },
      "short" : "Verstorben",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Verstorben"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Deceased"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Gibt an, ob die Person verstorben ist oder nicht",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Gibt an, ob die Person verstorben ist oder nicht"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Indicates if the individual is deceased or not"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.deceased[x]:deceasedBoolean",
      "path" : "Patient.deceased[x]",
      "sliceName" : "deceasedBoolean",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.deceased[x]:deceasedDateTime",
      "path" : "Patient.deceased[x]",
      "sliceName" : "deceasedDateTime",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.address",
      "path" : "Patient.address",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "short" : "Adresse",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Adresse"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Address"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Eine Adresse der Patientin oder des Patienten",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Eine Adresse der Patientin oder des Patienten"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "An address for the individual"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift",
      "path" : "Patient.address",
      "sliceName" : "Strassenanschrift",
      "short" : "Straßenanschrift",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Straßenanschrift"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Street address"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Eine Straßenanschrift der Patientin oder des Patienten",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Eine Straßenanschrift der Patientin oder des Patienten"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "A street address for the individual"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Address",
        "profile" : ["http://fhir.de/StructureDefinition/address-de-basis"]
      }],
      "patternAddress" : {
        "type" : "both"
      },
      "constraint" : [{
        "key" : "pat-cnt-2or3-char",
        "severity" : "warning",
        "human" : "If the country element is present, the country SHOULD also be coded in the extension countryCode (http://hl7.org/fhir/StructureDefinition/iso21090-codedString) with a code from ValueSet ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2. Address.country itself may carry other values (e.g. DEÜV country codes).",
        "expression" : "country.empty() or country.extension('http://hl7.org/fhir/StructureDefinition/iso21090-codedString').where(value.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-2')).exists()",
        "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.extension:Stadtteil",
      "path" : "Patient.address.extension",
      "sliceName" : "Stadtteil",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.type",
      "path" : "Patient.address.type",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.line",
      "path" : "Patient.address.line",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.line.extension:Strasse",
      "path" : "Patient.address.line.extension",
      "sliceName" : "Strasse",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.line.extension:Hausnummer",
      "path" : "Patient.address.line.extension",
      "sliceName" : "Hausnummer",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.line.extension:Adresszusatz",
      "path" : "Patient.address.line.extension",
      "sliceName" : "Adresszusatz",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.line.extension:Postfach",
      "path" : "Patient.address.line.extension",
      "sliceName" : "Postfach",
      "max" : "0",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.city",
      "path" : "Patient.address.city",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.city.extension",
      "path" : "Patient.address.city.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Patient.address:Strassenanschrift.city.extension:gemeindeschluessel",
      "path" : "Patient.address.city.extension",
      "sliceName" : "gemeindeschluessel",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://fhir.de/StructureDefinition/destatis/ags"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.city.extension:gemeindeschluessel.url",
      "path" : "Patient.address.city.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.city.extension:gemeindeschluessel.value[x]",
      "path" : "Patient.address.city.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.city.extension:gemeindeschluessel.value[x].system",
      "path" : "Patient.address.city.extension.value[x].system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.city.extension:gemeindeschluessel.value[x].code",
      "path" : "Patient.address.city.extension.value[x].code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.postalCode",
      "path" : "Patient.address.postalCode",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Strassenanschrift.country",
      "path" : "Patient.address.country",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach",
      "path" : "Patient.address",
      "sliceName" : "Postfach",
      "short" : "Postfach",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Postfach"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Postbox"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Eine Postfachanschrift der Patientin oder des Patienten",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Eine Postfachanschrift der Patientin oder des Patienten"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "A postbox address for the individual"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Address",
        "profile" : ["http://fhir.de/StructureDefinition/address-de-basis"]
      }],
      "patternAddress" : {
        "type" : "postal"
      },
      "constraint" : [{
        "key" : "pat-cnt-2or3-char",
        "severity" : "warning",
        "human" : "If the country element is present, the country SHOULD also be coded in the extension countryCode (http://hl7.org/fhir/StructureDefinition/iso21090-codedString) with a code from ValueSet ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2. Address.country itself may carry other values (e.g. DEÜV country codes).",
        "expression" : "country.empty() or country.extension('http://hl7.org/fhir/StructureDefinition/iso21090-codedString').where(value.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-2')).exists()",
        "source" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.extension:Stadtteil",
      "path" : "Patient.address.extension",
      "sliceName" : "Stadtteil",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.type",
      "path" : "Patient.address.type",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.line",
      "path" : "Patient.address.line",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.line.extension:Strasse",
      "path" : "Patient.address.line.extension",
      "sliceName" : "Strasse",
      "max" : "0"
    },
    {
      "id" : "Patient.address:Postfach.line.extension:Hausnummer",
      "path" : "Patient.address.line.extension",
      "sliceName" : "Hausnummer",
      "max" : "0"
    },
    {
      "id" : "Patient.address:Postfach.line.extension:Adresszusatz",
      "path" : "Patient.address.line.extension",
      "sliceName" : "Adresszusatz",
      "max" : "0"
    },
    {
      "id" : "Patient.address:Postfach.line.extension:Postfach",
      "path" : "Patient.address.line.extension",
      "sliceName" : "Postfach",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.city",
      "path" : "Patient.address.city",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.city.extension",
      "path" : "Patient.address.city.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Patient.address:Postfach.city.extension:gemeindeschluessel",
      "path" : "Patient.address.city.extension",
      "sliceName" : "gemeindeschluessel",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://fhir.de/StructureDefinition/destatis/ags"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.city.extension:gemeindeschluessel.url",
      "path" : "Patient.address.city.extension.url",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.city.extension:gemeindeschluessel.value[x]",
      "path" : "Patient.address.city.extension.value[x]",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.city.extension:gemeindeschluessel.value[x].system",
      "path" : "Patient.address.city.extension.value[x].system",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.city.extension:gemeindeschluessel.value[x].code",
      "path" : "Patient.address.city.extension.value[x].code",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.postalCode",
      "path" : "Patient.address.postalCode",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address:Postfach.country",
      "path" : "Patient.address.country",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.link",
      "path" : "Patient.link",
      "short" : "Verweis",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Verweis"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Link"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Verweis auf eine andere Patientenressource, die die gleiche tatsächliche Person betrifft",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Verweis auf eine andere Patientenressource, die die gleiche tatsächliche Person betrifft"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        },
        {
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en-US"
          },
          {
            "url" : "content",
            "valueString" : "Link to another patient resource that concerns the same actual person"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.link.other",
      "path" : "Patient.link.other",
      "mustSupport" : true
    },
    {
      "id" : "Patient.link.type",
      "path" : "Patient.link.type",
      "mustSupport" : true
    }]
  }
}

```
