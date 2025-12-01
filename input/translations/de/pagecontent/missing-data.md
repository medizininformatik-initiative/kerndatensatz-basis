### Fehlende Daten

Es gibt Situationen, in denen Informationen zu einem bestimmten Datenelement fehlen und das Quellsystem den Grund für das Fehlen der Daten nicht kennt.

Dieser Abschnitt bietet Hinweise für MII-DIZ-Server zum Umgang mit fehlenden Daten in MII-Basismodul-Ressourcen. Die Regeln stimmen mit der [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/extensibility.html#Special-Case) überein und sind konsistent mit internationalen Best Practices, wie sie in der [International Patient Summary (IPS)](https://hl7.org/fhir/uv/ips/Empty-Sections-and-Missing-Data.html) definiert sind.

Für allgemeine Hinweise zu Must Support Elementen siehe die Seite [Must Support](must-support.html). Für Konformitätserwartungen und Anforderungen an kodierte Elemente siehe die Seite [Allgemeine Anforderungen](general-requirements.html).

#### Elemente mit Mindest-Kardinalität = 0

**Regel**: Wenn das Quellsystem keine Daten für ein Element mit einer Mindest-Kardinalität = 0 hat (einschließlich Elemente, die als [Must Support](must-support.html) gekennzeichnet sind), **MUSS** das Datenelement aus der Ressource weggelassen werden.

Dies gilt sowohl für nicht-kodierte als auch für kodierte Elemente mit min = 0. Lassen Sie das Element einfach aus der Ressourceninstanz weg.

#### Verpflichtende Elemente (Mindest-Kardinalität > 0)

**Regel**: Wenn das Datenelement ein verpflichtendes Element ist (Mindest-Kardinalität > 0), **MUSS** es vorhanden sein, auch wenn das Quellsystem keine Daten hat oder den Grund für das Fehlen der Daten nicht kennt.

Der Ansatz zur Darstellung fehlender Daten in verpflichtenden Elementen hängt davon ab, ob das Element kodiert oder nicht-kodiert ist:

##### Nicht-kodierte Datenelemente

Für nicht-kodierte Datenelemente (z.B. string, HumanName, Address) verwenden Sie die [DataAbsentReason Extension](http://hl7.org/fhir/R4/extension-data-absent-reason.html) im Datentyp mit dem Code `unknown`.

**Code**: `unknown` - Der Wert wird erwartet zu existieren, ist aber nicht bekannt.

**Beispiel**: Patient-Ressource, bei der der Familienname des Patienten nicht verfügbar ist:

```json
{
  "resourceType": "Patient",
  "id": "example-missing-name",
  "name": [
    {
      "extension": [
        {
          "url": "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
          "valueCode": "unknown"
        }
      ]
    }
  ],
  "gender": "unknown",
  "birthDate": "1990-01-01"
}
```

##### Kodierte Datenelemente

Für kodierte Datenelemente hängt der Ansatz von der Bindungsstärke des Elements ab:

###### Example, Preferred oder Extensible Bindungsstärken

Für Elemente mit `example`, `preferred` oder `extensible` Bindung (CodeableConcept- oder Coding-Datentypen):

1. **Wenn das Quellsystem Text, aber keine kodierten Daten hat**: Nur das `text`-Element wird verwendet.
   - Für Coding-Datentypen werden die reinen Textdaten als `display`-Element dargestellt.

2. **Wenn weder Text noch kodierte Daten vorhanden sind**:
   - Verwenden Sie den entsprechenden "unknown" Konzeptcode aus dem ValueSet, falls verfügbar.
   - Wenn das ValueSet keinen entsprechenden "unknown" Konzeptcode hat, verwenden Sie `unknown` aus dem [DataAbsentReason Code System](http://hl7.org/fhir/R4/codesystem-data-absent-reason.html).

**Beispiel**: Condition-Ressource, bei der der verpflichtende Wert `Condition.code` unbekannt ist:

```json
{
  "resourceType": "Condition",
  "id": "example-unknown-code",
  "clinicalStatus": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/condition-clinical",
        "code": "active"
      }
    ]
  },
  "code": {
    "coding": [
      {
        "system": "http://hl7.org/fhir/CodeSystem/data-absent-reason",
        "code": "unknown",
        "display": "Unknown"
      }
    ]
  },
  "subject": {
    "reference": "Patient/example"
  }
}
```

###### Required Bindungsstärke

Für Elemente mit `required` Bindung (CodeableConcept-, Coding- oder code-Datentypen):

1. Verwenden Sie den entsprechenden "unknown" Konzeptcode aus dem ValueSet, falls verfügbar.
2. **Wenn das ValueSet keinen entsprechenden "unknown" Konzeptcode hat**, **MÜSSEN** Sie ein Konzept aus dem ValueSet verwenden. Andernfalls ist die Instanz nicht konform.

#### Siehe auch

- [Must Support](must-support.html) - Server and Client expectations for Must Support elements
- [General Requirements](general-requirements.html) - Using codes in MII profiles and claiming conformance
- [FHIR R4 Conformance Rules](http://hl7.org/fhir/R4/conformance-rules.html#missing) - Core specification guidance on missing data
