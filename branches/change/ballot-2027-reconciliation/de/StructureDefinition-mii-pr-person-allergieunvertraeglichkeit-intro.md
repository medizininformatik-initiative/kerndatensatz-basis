Das MII-Profil Allergie / Unverträglichkeit ist eine neue Ergänzung des Moduls Person und strebt eine abgestimmte Abbildung patientenbezogener Allergien und Unverträglichkeiten an mit: 
- [IPS 2.0.1](https://hl7.org/fhir/uv/ips/2.0.1/en/StructureDefinition-AllergyIntolerance-uv-ips.html), 
- [ISiK 6.0.0](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0/StructureDefinition-ISiKAllergieUnvertraeglichkeit.html) 
- und [HL7 Europe Base 2.0.0](https://hl7.eu/fhir/base/2.0.0/StructureDefinition-allergyIntolerance-eu-core.html)

#### Terminologie

`code.coding:snomed-ct` und `reaction.manifestation.coding:snomed-ct` sind wie in ISiK *extensible* an die von der mio42 GmbH gemeinsam mit dem BfArM erarbeiteten ValueSets der auslösenden Substanzen und Manifestationen gebunden (`KBV_VS_AllergyIntolerance_Substance_SNOMED_CT` und `KBV_VS_AllergyIntolerance_Manifestation_SNOMED_CT`, Version 1.0.0). Die SNOMED-CT-Slices sind optional: Allergien, die nur mit anderen Codes, z.B. ATC, dokumentiert sind, bleiben valide. Die ValueSets sind im Paket `kbv.all.terminology.allergyintolerance` 1.0.0 veröffentlicht, das nur auf dem [BfArM-ZTS](https://terminologien.bfarm.de) nach Akzeptanz der Downloadbedingungen verfügbar ist.
