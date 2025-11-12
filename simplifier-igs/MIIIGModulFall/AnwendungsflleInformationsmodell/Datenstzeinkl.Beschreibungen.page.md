---
parent: 
---
## Datensätze inkl. Beschreibungen

Die offizielle und abgenommene Version des Informationsmodells für das Modul FALL ist nachfolgend als FHIR Logical Model abgebildet:

{{tree:https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/LogicalModel/Fall}}

Es ist zu beachten, dass das Logical Model rein auf die Abbildung der Datenelemente und deren Beschreibung abzielt. Verwendete Datentypen und Kardinalitäten sind nicht als verpflichtend anzusehen. Dies wird abschließend durch die FHIR-Profile festgelegt. Für jedes Element innerhalb des Logical Models existiert ein Mapping auf ein Element einer konkreten FHIR Ressource.


| Logischer Datensatz | Beschreibung |
| -------- | ----- |
| Fall | Das Basismodul Fall vereint Merkmale eines Aufenthaltes in einer Gesundheitseinrichtung wie Aufnahmenummer, Aufnahmegrund, Entlassungsgrund etc. |
| Fall.Einrichtungskontakt | ambulanter, stationärer, prästationärer oder nachstationärer Aufenthalt eines Patienten in einer Gesundheitseinrichtung |
| Fall.Einrichtungskontakt.KontaktEbene | Art eines Falls (**Einrichtungskontakt**, Abteilungskontakt, Versorgungsstellenkontakt) |
| Fall.Einrichtungskontakt.KontaktKlasse | Auf Einrichtungsebene, also auf der Kontakt-Ebene Einrichtungskontakt, kann die Kontakt-Klasse stationär, ambulant oder teilstationär sein. |
| Fall.Einrichtungskontakt.KontaktArt | Differenzierung zwischen verschiedenen Arten von Kontakten (z.B. vorstationär, nachstationär, intensivstationär) |
| Fall.Einrichtungskontakt.PatientenIdentifikator | Bei der internen Nutzung dient die sogenannte Patientennummer als Identifikator. Diese wird bei der ersten Aufnahme in die Einrichtung parallel zur ersten Fallnummer (Aufnahmenummer) vergeben. Bei jeder Wiederaufnahme (oder korrigierend danach) erfolgt eine Zuordnung zu dieser konstanten Patientennummer und die Vergabe einer neuen wechselnden Fallnummer. |
| Fall.Einrichtungskontakt.Aufnahmenummer | Jeder Patient erhält bei der Planung einer Aufnahme oder bei der Aufnahme selbst eine Aufnahmenummer (auch Fallnummer oder Krankenhausinternes Kennzeichen genannt). Im Prinzip gilt diese Aufnahmenummer von der Aufnahme bis zur Entlassung - und auch bei den zugehörigen vorstationären und nachstationären Kontakten. Sie dient bei allen digital unterstüzten Vorgängen der Zuordnung zu dem Aufenthalt des Patienten in der Einrichtung. | 
| Fall.Einrichtungskontakt.Aufnahmeanlass | Gemäß §21 KHEntgG | 
| Fall.Einrichtungskontakt.Aufnahmegrund | Es ist der Aufnahmegrund entsprechend Schlüssel 1 der Anlage 2 zur § 301-Vereinbarung anzugeben. Als 3. und 4. Stelle (xx) sind die nach Schlüssel 1 möglichen Werte (01 bis 07, bei tagesbezogenen Entgelten auch 21 bis 27) anzugeben. Fälle mit den Werten „41“ bis „47“ in der 3. und 4. Stelle (Behandlungen im Rahmen von Verträgen zur integrierten Versorgung) können übermittelt werden. Der Aufnahmegrund kann bei Begleitpersonen und mitaufgenommenen Pflegekräften (Aufnahmeanlass „B“) entfallen. In allen anderen Fällen ist der Aufnahmegrund eine Muss-Angabe. | 
| Fall.Einrichtungskontakt.Beginndatum | Beginn eines medizinischen Einrichtungskontaktes |
| Fall.Einrichtungskontakt.Enddatum | Ende eines medizinischen Einrichtungskontaktes |
| Fall.Einrichtungskontakt.Entlassungsgrund | Gemäß §21 KHEntgG | 
| Fall.Abteilungskontakt |  |
| Fall.Abteilungskontakt.KontaktEbene | Art eines Falls (Einrichtungskontakt, **Abteilungskontakt**, Versorgungsstellenkontakt) |
| Fall.Abteilungskontakt.KontaktArt | Differenzierung zwischen verschiedenen Arten von Kontakten (z.B. vorstationär, nachstationär, intensivstationär) | 
| Fall.Abteilungskontakt.Patientenidentifikator | Analog zu Fall.Einrichtungskontakt.Patientenidentifikator | 
| Fall.Abteilungskontakt.Aufnahmenummer | Entspricht der unter Einrichtungskontakt beschriebenen Fall- bzw. Aufnahmenummer |
| Fall.Abteilungskontakt.Beginndatum | Beginn eines medizinischen Abteilungskontaktes | 
| Fall.Abteilungskontakt.Enddatum | Ende eines medizinischen Abteilungskontaktes | 
| Fall.Abteilungskontakt.Fachabteilungsschluessel | Eindeutiger Identifikator einer Fachabteilung in stationären Gesundheitseinrichtungen. Für einrichtungsübergreifende Forschungsprojekte im Gesundheitswesen Deutschlands ist der FAB-Schlüssel zu verwenden. |
| Fall.Versorgungsstellenkontakt | |
| Fall.Versorgungsstellenkontakt.KontaktEbene | Art eines Falls (Einrichtungskontakt, Abteilungskontakt, **Versorgungsstellenkontakt**) | 
| Fall.Versorgungsstellenkontakt.KontaktArt | Differenzierung zwischen verschiedenen Arten von Kontakten (z.B. vorstationär, nachstationär, intensivstationär) |
| Fall.Versorgungsstellenkontakt.Patientenidentifikator | Analog zu Fall.Einrichtungskontakt.Patientenidentifikator |
| Fall.Versorgungsstellenkontakt.Aufnahmenummer | Entspricht der unter Einrichtungskontakt beschriebenen Fall- bzw. Aufnahmenummer |
| Fall.Versorgungsstellenkontakt.Beginndatum | Beginn eines medizinischen Versorgungsstellenkontaktes |
| Fall.Versorgungsstellenkontakt.Enddatum | Ende eines medizinischen Versorgungsstellenkontaktes |