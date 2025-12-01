### Einführung

Dieser Implementierungsleitfaden beschreibt die FHIR-Repräsentation der Basismodule des Kerndatensatzes der Medizininformatik-Initiative (MII). Die Spezifikation umfasst die Module Person, Behandlungsfall, Diagnose und Prozedur. Der MII-Kerndatensatz zielt darauf ab, die Sekundärnutzung von klinischen Routinedaten in der Forschung zu ermöglichen.

#### Zielgruppe

Dieser Implementierungsleitfaden richtet sich an:

<div style="background-color: #E8F4F8; border-left: 5px solid #5C8DB3; padding: 15px; margin: 10px 0;">
<h5 style="color: #406A99; margin-top: 0;">Implementierer</h5>
<p>Implementierer, die für Datenmanagement und Integration in Datenintegrationszentren (DIZ) verantwortlich sind, Softwareentwickler und Systemarchitekten, die FHIR-basierte Lösungen implementieren</p>
<ul>
  <li>→ Siehe <a href="logical-models.html">Logische Modelle</a> für konzeptuelle Datenmodelle</li>
  <li>→ Siehe <a href="uml-diagrams.html">UML-Diagramme</a> für visuelle Darstellungen</li>
  <li>→ Siehe <a href="artifacts.html">FHIR-Artefakte</a> für technische Spezifikationen</li>
</ul>
</div>

<div style="background-color: #F0F8E8; border-left: 5px solid #91BC3D; padding: 15px; margin: 10px 0;">
<h5 style="color: #66727D; margin-top: 0;">Forschende</h5>
<p>Wissenschaftler*innen, die MII-Daten für medizinische Forschung nutzen</p>
<ul>
  <li>→ Siehe <a href="researcher-guidance.html">Leitfaden für Forschende</a> für Anleitungen, Beschreibungen und Beispieldaten zur Analyse</li>
  <li>→ Siehe <a href="logical-models.html">Logische Modelle</a> für Datenstruktur-Übersichten</li>
</ul>
</div>

### Hintergrund

<div style="clear: both;">
  <img src="2025-06-12_de_KDS-Abb_1.png" alt="MII Kerndatensatz Blockschema" style="display: block; max-width: 50%; height: auto; margin: 20px 0 10px 0;" />
  <p style="text-align: left; font-style: italic; color: #666; margin-top: 0;">MII Kerndatensatz Module</p>
</div>

#### Modulübersicht

**Modul Person**

Das Modul umfasst:
* Patienten-Identifikatoren und demografische Informationen ([Patient](StructureDefinition-mii-pr-person-patient.html))
* Pseudonymisierte Patienten-Repräsentationen für die Forschung ([Patient Pseudonymisiert](StructureDefinition-mii-pr-person-patient-pseudonymisiert.html))
* Vitalstatus ([Vitalstatus Observation](StructureDefinition-mii-pr-person-vitalstatus.html))
* Todesursache ([Todesursache Condition](StructureDefinition-mii-pr-person-todesursache.html))

**Modul Behandlungsfall**

Das Modul umfasst:
* Darstellung von Kontakten (Aufenthalte und Besuche) zwischen Patient*innen und Gesundheitseinrichtungen ([Encounter](StructureDefinition-mii-pr-fall-kontakt-gesundheitseinrichtung.html))

**Modul Diagnose**

Das Modul umfasst:
* Diagnosen und krankheitsbezogene Informationen ([Condition](StructureDefinition-mii-pr-diagnose-condition.html))

**Modul Prozedur**

Das Modul umfasst:
* Dokumentation von Operationen, Eingriffen und anderen medizinischen Prozeduren ([Procedure](StructureDefinition-mii-pr-prozedur-procedure.html))

### Kontaktinformationen

Fragen zu dieser Publikation können auf [chat.fhir.org](https://chat.fhir.org/#narrow/stream/179307-german.2Fmi-initiative) im Stream 'german/mi-initiative' oder auf [mii.zulipchat.com](https://mii.zulipchat.com/#narrow/channel/430086-MII-Kerndatensatz) gestellt werden.

Kommentare und Kritik sind jederzeit in Form von Issues im [GitHub-Repository](https://github.com/medizininformatik-initiative/kerndatensatz-basis) willkommen.

#### Mitwirkende

Dieser Implementierungsleitfaden wurde im Rahmen der Medizininformatik-Initiative erstellt und unterliegt dem Governance-Prozess des Interoperabilitätsforums und der Technischen Komitees von HL7 Deutschland e.V.

### Urheberrecht und Lizenz

© 2019+ TMF e. V., Charlottenstraße 42, 10117 Berlin

<a href="https://creativecommons.org/licenses/by/4.0/deed.de" target="_blank">
    <img src="https://licensebuttons.net/l/by/4.0/88x31.png" alt="CC BY 4.0 Logo" style="border:0;">
</a>

Dieses Werk ist lizenziert unter der [Creative Commons Namensnennung 4.0 International Lizenz](https://creativecommons.org/licenses/by/4.0/deed.de).

Für Nutzungsrechte der zugrunde liegenden FHIR-Technologie siehe die FHIR-Basisspezifikation.

Einige verwendete Codesysteme werden von anderen Organisationen veröffentlicht und gepflegt. Es gilt das Urheberrecht der jeweiligen Herausgeber.

### Haftungsausschluss

* Der Inhalt dieses Dokuments ist öffentlich. Bitte beachten Sie, dass Teile dieses Dokuments auf FHIR Version R4 basieren, dessen Urheberrecht bei HL7 International liegt.

* Obwohl diese Publikation mit größter Sorgfalt erstellt wurde, können die Autor*innen keine Haftung für direkte oder indirekte Schäden übernehmen, die aus dem Inhalt dieser Spezifikation entstehen könnten.
