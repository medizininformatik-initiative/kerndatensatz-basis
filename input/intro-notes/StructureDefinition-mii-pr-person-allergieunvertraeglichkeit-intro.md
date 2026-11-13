The MII `AllergyIntolerance` profile is a new addition to the Person module and aims to align the representation of patient-related allergies and intolerances with
- [IPS 2.0.1](https://hl7.org/fhir/uv/ips/2.0.1/en/StructureDefinition-AllergyIntolerance-uv-ips.html), 
- [ISiK 6.0.0](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0/StructureDefinition-ISiKAllergieUnvertraeglichkeit.html), 
- and [HL7 Europe Base 2.0.0](https://hl7.eu/fhir/base/2.0.0/StructureDefinition-allergyIntolerance-eu-core.html)

### Terminology

`code.coding:snomed-ct` and `reaction.manifestation.coding:snomed-ct` are bound *extensible* to the ValueSets of causative substances and manifestations that mio42 GmbH developed together with BfArM (`KBV_VS_AllergyIntolerance_Substance_SNOMED_CT` and `KBV_VS_AllergyIntolerance_Manifestation_SNOMED_CT`, version 1.0.0), as in ISiK. The SNOMED CT slices are optional: allergies documented only with other codes, for example ATC, remain valid. The ValueSets are published in the package `kbv.all.terminology.allergyintolerance` 1.0.0, which is only available on the [BfArM ZTS](https://terminologien.bfarm.de) after accepting its download conditions.

### Onset and end as life phase

If onset or end are only known as a life phase (for example childhood), the extension [Lebensphase](http://fhir.de/StructureDefinition/lebensphase) from the German Base Profiles can be used on `onsetRange` and on `extension:abatement.valueRange`, as in the Condition profile. The extension's context does not allow `Age`.
