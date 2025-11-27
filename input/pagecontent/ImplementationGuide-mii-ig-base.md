This ImplementationGuide resource defines the technical details of this publication, including dependencies and publishing parameters.

- [XML](ImplementationGuide-{{site.data.ig.id}}.xml)
- [JSON](ImplementationGuide-{{site.data.ig.id}}.json)
- [TTL](ImplementationGuide-{{site.data.ig.id}}.ttl)

### Cross Version Analysis

{% include cross-version-analysis.html %}

### IG Dependencies

This IG Contains the following dependencies on other IGs.

{% include dependency-table.xhtml %}

### Global Profiles

{% include globals-table.xhtml %}

### Copyrights

{% capture ip-statement %}{% include ip-statements.xhtml %}{% endcapture %}

{{ ip-statement | remove: '<p>' | remove: '</p>'}}

### Parameter Settings

The following [IG Parameters](https://confluence.hl7.org/display/FHIR/Implementation+Guide+Parameters) are set for this Implementation Guide:

{% for p in site.data.ig.definition.parameter -%}
- code: {{p.code}}<br/>value: {{p.value}}
{% endfor %}
