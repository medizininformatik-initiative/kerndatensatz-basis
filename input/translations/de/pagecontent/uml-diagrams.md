Diese Seite enthält UML-Klassendiagramme für die logischen Modelle der MII-Kerndatensatz-Basismodule. Diese Diagramme veranschaulichen die Beziehungen zwischen den verschiedenen Datenelementen und Klassen.

### Modul Person

Das folgende Diagramm zeigt die logische Struktur des Moduls Person:

<div style="text-align: center; margin: 20px 0;">
{% include person-uml.svg %}
</div>

<style>
.uml-diagram-container svg {
  max-width: 100%;
  height: auto !important;
  width: auto !important;
}
</style>

---

### Modul Fall

Das folgende Diagramm zeigt die logische Struktur des Moduls Fall:

<div style="text-align: center; margin: 20px 0;">
{% include fall-uml.svg %}
</div>

#### Zuordnung von Versorgungsstellen zu Abteilungen

Das UML-Modell unterscheidet die statische organisatorische Zuordnung von Versorgungsstellen von der Hierarchie einzelner Kontakte. Das Modell erlaubt, Versorgungsstellen unmittelbar einer Einrichtung zuzuordnen und auch ohne zusätzliche Abteilungszuordnung darzustellen. Versorgungsstellen können zusätzlich einer oder mehreren Abteilungen zugeordnet sein. Damit werden insbesondere zentral betriebene, temporäre oder abteilungsübergreifend genutzte Versorgungsstellen unterstützt, für die keine eindeutige Abteilungszuordnung besteht. Eine fehlende Abteilungszuordnung bedeutet daher nicht, dass die Versorgungsstelle keinen organisatorischen Träger hat; die Zuordnung zur Einrichtung bleibt bestehen.

Die Beziehung zwischen Versorgungsstellen und Abteilungen wird als reguläre n:m-Assoziation und nicht als Komposition modelliert, da dieselbe Versorgungsstelle von mehreren Abteilungen genutzt werden kann. Auch die Beziehung zwischen Einrichtungen und Abteilungen wird als reguläre Assoziation modelliert: Das UML-Diagramm beschreibt organisatorische Zuordnungen und keine gemeinsamen Lebenszyklen der Objekte. Diese statische Zuordnung ist nicht als mehrfache `Encounter.partOf`-Referenz zu verstehen: In FHIR R4 kann ein einzelner Kontakt mittels `Encounter.partOf` höchstens einen übergeordneten Kontakt referenzieren. Dieselbe Versorgungsstelle kann dennoch als Kontaktort verschiedener Kontakte verwendet werden, jeweils im Kontext des zutreffenden Abteilungskontakts.

#### Empfohlene Beziehung zwischen Abteilungskontakten und Diagnosen

Das Fall-UML zeigt, wie ein Abteilungskontakt einer Diagnose eine spezifische Rolle zuweist. Der Abteilungskontakt entspricht dabei der derzeit vom Implementierungsleitfaden empfohlenen Kontaktebene. Dies ist eine SOLL-Empfehlung; abhängig vom Anwendungsfall bleiben andere Kontaktebenen möglich.

<style>
.uml-diagram-container svg {
  max-width: 100%;
  height: auto !important;
  width: auto !important;
}
</style>

### Modul Diagnose

Das folgende Diagramm zeigt die logische Struktur des Moduls Diagnose:

<div style="text-align: center; margin: 20px 0;">
{% include diagnose-uml.svg %}
</div>

Das Diagnose-UML zeigt den Abteilungskontakt als allgemeinen Kontaktkontext einer Diagnose. Der Abteilungskontakt entspricht dabei der derzeit vom Implementierungsleitfaden empfohlenen Kontaktebene. Dies ist eine SOLL-Empfehlung; abhängig vom Anwendungsfall bleiben andere Kontaktebenen möglich.

<style>
.uml-diagram-container svg {
  max-width: 100%;
  height: auto !important;
  width: auto !important;
}
</style>

### Modul Prozedur

Das folgende Diagramm zeigt die logische Struktur des Moduls Prozedur:

<div style="text-align: center; margin: 20px 0;">
{% include prozedur-uml.svg %}
</div>

Das Prozedur-UML zeigt den Abteilungskontakt als allgemeinen Kontaktkontext einer Prozedur und bildet damit die derzeit vom Implementierungsleitfaden empfohlene Umsetzung ab. Abhängig vom Anwendungsfall bleiben andere Kontaktebenen möglich.

<style>
.uml-diagram-container svg {
  max-width: 100%;
  height: auto !important;
  width: auto !important;
}
</style>
