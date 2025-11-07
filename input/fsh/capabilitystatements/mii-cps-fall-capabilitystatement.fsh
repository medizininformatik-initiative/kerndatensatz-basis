Instance: mii-cps-fall-capabilitystatement
InstanceOf: CapabilityStatement
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/CapabilityStatement/metadata"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* name = "MII_CPS_Fall_CapabilityStatement"
* title = "MII CPS Fall CapabilityStatement"
* status = #active
* experimental = false
* date = "2025-10-22"
* description = "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss, um das Modul Fall der Medizininformatik Initiative zu implementieren."
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #xml
* format[+] = #json
* rest.mode = #server

// Condition requirements
* insert SupportResource(Encounter, #SHALL)
* insert Profile(http://hl7.org/fhir/StructureDefinition/Encounter)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung|2025.0.1, #SHALL)
* insert SupportInteraction(#read, #SHALL)
* insert SupportInteraction(#search-type, #SHALL)
* insert SupportSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, #SHALL)
* insert SupportSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, #SHALL)
* insert SupportSearchParam(_profile, http://hl7.org/fhir/SearchParameter/Resource-profile, #uri, #SHALL)
* insert SupportSearchParam(identifier, http://hl7.org/fhir/SearchParameter/clinical-identifier, #token, #SHALL)
* insert SupportSearchParam(status, http://hl7.org/fhir/SearchParameter/Encounter-status, #token, #SHALL)
* insert SupportSearchParam(class, http://hl7.org/fhir/SearchParameter/Encounter-class, #token, #SHALL)
* insert SupportSearchParam(type, http://hl7.org/fhir/SearchParameter/clinical-type, #token, #SHALL)
* insert SupportSearchParam(category, http://hl7.org/fhir/SearchParameter/Condition-category, #token, #SHALL)
* insert SupportSearchParam(subject, http://hl7.org/fhir/SearchParameter/Encounter-subject, #reference, #SHALL)
* insert SupportSearchParam(date, http://hl7.org/fhir/SearchParameter/clinical-date, #date, #SHALL)
* insert SupportSearchParam(diagnosis, http://hl7.org/fhir/SearchParameter/Encounter-diagnosis, #reference, #SHALL)
* insert SupportSearchParam(location, http://hl7.org/fhir/SearchParameter/Encounter-location, #reference, #SHALL)
* insert SupportSearchParam(service-provider, http://hl7.org/fhir/SearchParameter/Encounter-service-provider, #reference, #SHALL)
* insert SupportSearchParam(part-of, http://hl7.org/fhir/SearchParameter/Encounter-part-of, #reference, #SHALL)
* insert SupportSearchParam(service-type, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-servicetype, #token, #SHALL)
* insert SupportSearchParam(diagnosis-use, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-diagnosis-use, #token, #SHALL)
* insert SupportSearchParam(hospitalization-admitsource, https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-hospitalization-admitSource, #token, #SHALL)
//* insert SupportSearchParam(hospitalization-discharge-reason-12, https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-hospitalization-dischargeReason-12, #token, #SHALL)
//* insert SupportSearchParam(hospitalization-discharge-reason-3, https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-hospitalization-dischargeReason-3, #token, #SHALL)
//* insert SupportSearchParam(hospitalization-discharge-reason, https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-hospitalization-dischargeReason, #composite, #SHALL)
* insert SupportSearchParam(location-physical-type, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-location-physical-type, #token, #SHALL)
