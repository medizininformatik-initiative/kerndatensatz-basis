Invariant: pat-cnt-2or3-char
Description: "If the country element is present, the country SHOULD also be coded in the extension countryCode (http://hl7.org/fhir/StructureDefinition/iso21090-codedString) with a code from ValueSet ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2. Address.country itself may carry other values (e.g. DEÜV country codes)."
Severity: #warning
Expression: "country.empty() or country.extension('http://hl7.org/fhir/StructureDefinition/iso21090-codedString').where(value.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-2')).exists()"
