Diese ImplementationGuide-Ressource definiert die technischen Details dieser Publikation, einschließlich Abhängigkeiten und Veröffentlichungsparametern.

- [XML](ImplementationGuide-{{site.data.ig.id}}.xml)
- [JSON](ImplementationGuide-{{site.data.ig.id}}.json)
- [TTL](ImplementationGuide-{{site.data.ig.id}}.ttl)

### Versionsübergreifende Analyse

{% capture cross-version-analysis %}{% include cross-version-analysis.xhtml %}{% endcapture %}{{ cross-version-analysis | remove: '<p>' | remove: '</p>'}}

### IG-Abhängigkeiten

Dieser IG enthält die folgenden Abhängigkeiten von anderen IGs.

{% include dependency-table.xhtml %}

### Globale Profile

{% include globals-table.xhtml %}

### Urheberrechte

{% capture ip-statement %}{% include ip-statements.xhtml %}{% endcapture %}

{{ ip-statement | remove: '<p>' | remove: '</p>'}}

### Parametereinstellungen

Die folgenden [IG-Parameter](https://confluence.hl7.org/display/FHIR/Implementation+Guide+Parameters) sind für diesen Implementierungsleitfaden festgelegt:

{% for p in site.data.ig.definition.parameter -%}
- code: {{p.code}}<br/>value: {{p.value}}
{% endfor %}
