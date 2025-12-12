# Must Support - MII Implementation Guide Core Dataset Base v2026.0.0

## Must Support

 
Diese Seite enthält Übersetzungen aus der Originalsprache, in der der Leitfaden verfasst wurde. Informationen zu diesen Übersetzungen und Anweisungen zum Abgeben von Feedback zu den Übersetzungen finden Sie[hier](translationinfo.md). 

Beim Abfragen und Lesen von MII-Profilen **MUSS** **Must Support** für jedes Profildatenelement wie folgt interpretiert werden:

### Verpflichtende Elemente

Elemente einer FHIR-Ressource können in einem Profil als verpflichtend oder als "Must Support" definiert werden. Verpflichtende Elemente sind Elemente mit einer Mindest-Kardinalität von 1 (min=1). Wenn ein Element verpflichtend ist, wird erwartet, dass die Daten immer vorhanden sind. In seltenen Fällen können Daten trotz einer Mindest-Kardinalität von 1 fehlen. Leitlinien für Fälle, in denen Daten fehlen, finden sich im Abschnitt [Fehlende Daten](missing-data.md).

### Must Support Elemente

Ressourcenelemente, die in einem Profil als "Must Support" (MS) gekennzeichnet sind, müssen von Systemen unterstützt werden, die Konformität zu diesem bestimmten Profil angeben. Dies unterscheidet sich von der Kardinalität. Es ist möglich, ein Element mit einer Mindest-Kardinalität von 0 zu haben, aber dennoch zu erwarten, dass Systeme das Element unterstützen.

Die Unterstützung (Must Support) eines Elements wird innerhalb der MII-Kerndatensatz-Spezifikationen wie folgt verstanden:

Es wird zwischen datenanfordernden Systemen (Empfänger/Clients) und datenbereitstellenden Systemen (Sender/Server) unterschieden. Im Kontext der MII-Infrastruktur ist die FHIR-API eines Datenintegrationszentrums (DIZ) das sendende System, das Anfragen entgegennimmt.

#### Server-Erwartungen

Das System (Sender/Server) **MUSS** in der Lage sein:

* Ein Must Support Element sinnvoll mit Daten zu befüllen (z.B. über ETL-Prozesse aus primären Datenquellen), sofern die Daten lokal verfügbar sind
* Das Element in einer Ressource zu speichern
* Es auf Anfrage abrufbar zu machen (z.B. Machbarkeitsabfrage)

#### Client-Erwartungen

Das datenanfordernde System (Empfänger/Client) **MUSS** in der Lage sein:

* Das Element dem Benutzer anzuzeigen
* Es für weitere Berechnungen oder andere Verarbeitungen zu berücksichtigen
* Ressourceninstanzen, die die Must Support Datenelemente enthalten, zu verarbeiten, ohne einen Fehler zu erzeugen oder die Anwendung zum Absturz zu bringen

#### Fehlende Daten

* Wenn Informationen zu einem bestimmten Datenelement nicht vorhanden sind und der Grund für das Fehlen unbekannt ist, **DÜRFEN** MII-Server das Datenelement **NICHT** in die als Teil der Abfrageergebnisse zurückgegebene Ressourceninstanz aufnehmen
* Beim Abfragen von MII-Servern **MÜSSEN** MII-Clients fehlende Datenelemente innerhalb von Ressourceninstanzen als im System des MII-Servers nicht vorhandene Daten interpretieren
* Wenn Informationen zu einem bestimmten Datenelement fehlen und der MII-Server den genauen Grund für das Fehlen der Daten kennt, **SOLLTEN** MII-Server den Grund für die fehlenden Informationen gemäß den Leitlinien im Abschnitt [Fehlende Daten](missing-data.md) senden

### Darstellung von Must Support und verpflichtenden Elementen

Auf jeder Profilseite werden mehrere verschiedene formale Ansichten des Profilinhalts in einem Baumformat unter Registerkarten mit den Bezeichnungen "Differential Table", "Key Elements Table" und "Snapshot Table" angezeigt.

#### Differential Table Ansicht

Elemente mit einer Kardinalität, die mit "1" unter der Spaltenüberschrift "Card." beginnt (z.B. 1..1), sind **verpflichtende** Elemente. Elemente, die in der Ansicht "Differential Table" als **Must Support** gekennzeichnet sind, werden mit einem S markiert.

#### Must Support - Primitive Elemente

Primitive Elemente sind einzelne Elemente mit einem primitiven Wert. Wenn sie als **Must Support** gekennzeichnet sind, **MUSS** der Server in der Lage sein, den Elementwert bereitzustellen, um die Must Support Anforderung zu erfüllen.

Beispielsweise, wenn ein Element wie `Patient.birthDate` als Must Support gekennzeichnet ist:

* MII-Server **MÜSSEN** in der Lage sein, einen Wert in `Patient.birthDate` bereitzustellen
* MII-Clients **MÜSSEN** in der Lage sein, den Wert in `Patient.birthDate` zu verarbeiten

#### Must Support - Komplexe Elemente

Komplexe Elemente setzen sich aus primitiven und anderen komplexen Elementen zusammen. Für jedes komplexe Element, das als **Must Support** gekennzeichnet ist, **MUSS** der Server in der Lage sein, mindestens einen der Unterelementwerte bereitzustellen. Wenn ein Unterelement als **Must Support** gekennzeichnet ist, muss es ebenfalls die Must Support Anforderungen erfüllen und die Must Support Anforderungen für das übergeordnete Element erfüllen.

Beispielsweise, wenn `Patient.name` als **Must Support** gekennzeichnet ist und die **Must Support** Unterelemente "family" und "given" hat:

* MII-Server **MÜSSEN** in der Lage sein, Werte in `Patient.name.family` und `Patient.name.given` bereitzustellen
* MII-Clients **MÜSSEN** in der Lage sein, die Werte in `Patient.name.family` und `Patient.name.given` zu verarbeiten

Andererseits, wenn ein Unterelement als **Must Support** gekennzeichnet ist und das übergeordnete Element nicht, besteht **keine Erwartung**, dass Sie das übergeordnete Element unterstützen müssen. Wenn das übergeordnete Element jedoch in der Struktur dargestellt wird, **MÜSSEN** Server das/die als **Must Support** gekennzeichnete(n) Unterelement(e) unterstützen.

#### Must Support - Ressourcenreferenzen

Wenn ein Element vom Typ Reference als **Must Support** gekennzeichnet ist und auf ein einzelnes Zielprofil verweist, **MUSS** das Zielprofil unterstützt werden.

Beispielsweise, wenn `Condition.subject` auf das MII-Patient-Profil verweist und als Must Support gekennzeichnet ist:

* MII-Server **MÜSSEN** in der Lage sein, ein `Condition.subject` mit einer gültigen Referenz auf ein MII-Patient-Profil bereitzustellen
* MII-Clients **MÜSSEN** in der Lage sein, ein `Condition.subject` mit einer gültigen Referenz auf ein MII-Patient-Profil zu verarbeiten

Wenn ein Element vom Typ Reference als **Must Support** gekennzeichnet ist, mehrere Zielprofile referenziert, aber keines als **Must Support** gekennzeichnet ist, **MUSS** **mindestens ein** Zielprofil unterstützt werden.

#### Must Support - Auswahl von Datentypen

Wenn ein **Must Support** Element eine Auswahl von Datentypen für seinen Inhalt hat, sind die Datentypen, die der Server unterstützen **MUSS**, als **Must Support** gekennzeichnet.

Beispielsweise, wenn `Observation.value[x]` mehrere Must Support Datentypen hat:

* MII-Server **MÜSSEN** in der Lage sein, die gekennzeichneten Must Support Datentypen zu befüllen (z.B. `valueQuantity`, `valueCodeableConcept`, `valueString`)
* MII-Clients **MÜSSEN** in der Lage sein, alle gekennzeichneten Must Support Datentypen zu verarbeiten
* Systeme **KÖNNEN** andere Auswahlelemente unterstützen, aber dies ist keine Anforderung

#### Must Support - Slices

FHIR-Profile verwenden [Slicing](http://hl7.org/fhir/R4/profiling.html#slicing), um Einschränkungen für sich wiederholende Elemente zu definieren. Das Element, das den Slicing-Diskriminator ("discriminator") definiert, kann als Must Support gekennzeichnet sein, aber jeder Slice muss explizit mit der Must Support Eigenschaft versehen werden, um die Konformitätsanforderungen dieses Slices zu definieren.

Beispielsweise, wenn `Identifier` ein Must Support Slicing-Element ist und Slices für verschiedene Identifikatortypen definiert, sind nur die explizit als Must Support gekennzeichneten Slices erforderlich:

* MII-Server **MÜSSEN** in der Lage sein, Identifikatoren bereitzustellen, die den Must Support Slices entsprechen
* MII-Clients **MÜSSEN** in der Lage sein, Identifikatoren zu verarbeiten, die den Must Support Slices entsprechen
* Systeme **KÖNNEN** andere Slices unterstützen, aber dies ist nicht erforderlich

-------

Weitere Informationen finden Sie unter:

* [Allgemeine Anforderungen](general-requirements.md) - Anforderungen, die für alle Akteure und Profile gelten
* [Fehlende Daten](missing-data.md) - Leitfaden für den Umgang mit fehlenden Daten
* [Konformität](conformance.md) - Allgemeine Konformitätsanforderungen

