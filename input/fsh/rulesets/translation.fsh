RuleSet: Translation(path, language, translation)
* {path}.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* {path}.extension[=].extension[0].url = "lang"
* {path}.extension[=].extension[0].valueCode = #{language}
* {path}.extension[=].extension[1].url = "content"
* {path}.extension[=].extension[1].valueString = "{translation}"

RuleSet: AddSnomedCodingTranslation(path)
* {path} ^short = "SNOMED CT Code"
* insert Translation({path} ^short, de-DE, SNOMED CT Code)
* insert Translation({path} ^short, en-US, SNOMED CT code)
* {path} ^definition = "Ein Verweis auf einen von SNOMED CT definierten Code"
* insert Translation({path} ^definition, de-DE, Ein Verweis auf einen von SNOMED CT definierten Code)
* insert Translation({path} ^definition, en-US, A reference to a code defined by SNOMED CT)

RuleSet: AddIcd10CodingTranslation(path)
* {path} ^short = "ICD-10-GM Code"
* insert Translation({path} ^short, de-DE, ICD-10-GM Code)
* insert Translation({path} ^short, en-US, ICD-10-GM code)
* {path} ^definition = "Ein Verweis auf einen von der ICD-10-GM definierten Code"
* insert Translation({path} ^definition, de-DE, Ein Verweis auf einen von der ICD-10-GM definierten Code)
* insert Translation({path} ^definition, en-US, A reference to a code defined by the ICD-10-GM)

RuleSet: AddAlphaIdCodingTranslation(path)
* {path} ^short = "Alpha-ID Code"
* insert Translation({path} ^short, de-DE, Alpha-ID Code)
* insert Translation({path} ^short, en-US, Alpha-ID code)
* {path} ^definition = "Ein Verweis auf einen von der Alpha-ID definierten Code"
* insert Translation({path} ^definition, de-DE, Ein Verweis auf einen von der Alpha-ID definierten Code)
* insert Translation({path} ^definition, en-US, A reference to a code defined by the Alpha-ID)

RuleSet: AddOrphaCodingTranslation(path)
* {path} ^short = "ORPHAcode"
* insert Translation({path} ^short, de-DE, ORPHAcode)
* insert Translation({path} ^short, en-US, ORPHAcode)
* {path} ^definition = "Ein Verweis auf einen von der Orphanet Nomenklatur der Seltenen Krankheiten definierten Code"
* insert Translation({path} ^definition, de-DE, Ein Verweis auf einen von der Orphanet Nomenklatur der Seltenen Krankheiten definierten Code)
* insert Translation({path} ^definition, en-US, A reference to a code defined by the Orphanet nomenclature of rare diseases)

RuleSet: AddOpsCodingTranslation(path)
* {path} ^short = "Operationen- und Prozedurenschlüssel (OPS) Code"
* insert Translation({path} ^short, de-DE, OPS Code)
* insert Translation({path} ^short, en-US, OPS code)
* {path} ^definition = "Ein Verweis auf einen vom Operationen- und Prozedurenschlüssel (OPS) definierten Code"
* insert Translation({path} ^definition, de-DE, Ein Verweis auf einen vom Operationen- und Prozedurenschlüssel definierten Code)
* insert Translation({path} ^definition, en-US, A reference to a code defined by the German Procedure Classification OPS)