// Instance: GOFSH-GENERATED-ID-3
// InstanceOf: Encounter
// Usage: #example
// * status = #finished
// * class = $Abteilungsfallklasse_1#stationaer "Stationär"
// * serviceType = $Fachabteilungsschluessel#0100 "Fachabteilung für Innere Medizin"
// * subject = Reference(Patient/12345)
// * reasonCode[0] = $Aufnahmeanlass#E "Einweisung durch einen Arzt"
// * reasonCode[+] = $Aufnahmegrund_1#01 "Krankenhausbehandlung, vollstationär"
// * diagnosis.condition = Reference(Condition/1234)
// * diagnosis.use = $diagnosis-role#billing "Billing"
// * hospitalization.extension.url = "Encounter.hospitalization.extension:entlassungsgrund.url"
// * hospitalization.extension.valueCoding = $Entlassungsgrund#01 "Behandlung regulär beendet"
// * hospitalization.destination = Reference(Organization/1234)
// * account.identifier.system = "https://diz.mii.example.org/fhir/NamingSystem/Versorgungsfallnummer"
// * account.identifier.value = "123456"
// * account.identifier.type = $v2-0203#VN
// * partOf = Reference(Encounter/verwaltungsfall123)