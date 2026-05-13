### Mapping LogicalModel Prozedur -> FHIR

{% sql {
	"query" : "SELECT json_extract(e.value, '$.id') AS path, json_extract(m.value, '$.map') AS map FROM Resources r, json_each(json_extract(r.Json, '$.differential.element')) e, json_each(json_extract(e.value, '$.mapping')) m WHERE r.Type = 'StructureDefinition' AND r.Url = 'https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/LogicalModel/Prozedur' AND json_extract(m.value, '$.identity') = 'FHIR' AND json_extract(m.value, '$.map') IS NOT NULL ORDER BY path",
	"class" : "grid",
	"columns" : [
		{ "source" : "path", "title" : "MII LM Prozedur", "type" : "text" },
		{ "source" : "map",  "title" : "FHIR", "type" : "text" }
	]
} %}
