### Table View

{% sql {
  "query" : "SELECT json_extract(element.value, '$.id') AS logical_model_id, COALESCE( NULLIF( ( SELECT json_extract(content.value, '$.valueString') FROM json_each( json_extract(element.value, '$._short.extension') ) AS translation, json_each( json_extract(translation.value, '$.extension') ) AS lang, json_each( json_extract(translation.value, '$.extension') ) AS content WHERE json_extract(translation.value, '$.url') = 'http://hl7.org/fhir/StructureDefinition/translation' AND json_extract(lang.value, '$.url') = 'lang' AND ( lower(json_extract(lang.value, '$.valueCode')) = 'en' OR lower(json_extract(lang.value, '$.valueCode')) LIKE 'en-%' ) AND json_extract(content.value, '$.url') = 'content' AND NULLIF(json_extract(content.value, '$.valueString'), '') IS NOT NULL ORDER BY CASE WHEN lower(json_extract(lang.value, '$.valueCode')) = 'en' THEN 0 ELSE 1 END, CAST(translation.key AS INTEGER) LIMIT 1 ), '' ), json_extract(element.value, '$.short') ) AS description FROM Resources AS resource, json_each( json_extract(CAST(resource.Json AS TEXT), '$.differential.element') ) AS element WHERE resource.Type = 'StructureDefinition' AND resource.Url = 'https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/LogicalModel/Diagnose' ORDER BY CAST(element.key AS INTEGER)",
  "class" : "grid",
  "columns" : [
    {
      "source" : "logical_model_id",
      "title" : "Logical dataset",
      "type" : "text"
    },
    {
      "source" : "description",
      "title" : "Description",
      "type" : "text"
    }
  ]
} %}

### Mapping LogicalModel Diagnose -> FHIR

{% sql {
  "query" : "SELECT json_extract(e.value, '$.id') AS path, json_extract(m.value, '$.map') AS map FROM Resources r, json_each(json_extract(r.Json, '$.differential.element')) e, json_each(json_extract(e.value, '$.mapping')) m WHERE r.Type = 'StructureDefinition' AND r.Url = 'https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/LogicalModel/Diagnose' AND json_extract(m.value, '$.identity') = 'FHIR' AND json_extract(m.value, '$.map') IS NOT NULL ORDER BY path",
  "class" : "grid",
  "columns" : [
    { "source" : "path", "title" : "MII LM Diagnose", "type" : "text" },
    { "source" : "map",  "title" : "FHIR", "type" : "text" }
  ]
} %}
