Instance: mii-exa-person-allergyintolerance-1
InstanceOf: mii-pr-person-allergieunvertraeglichkeit
Usage: #example
* clinicalStatus = $allergyintolerance-clinical#active
* verificationStatus = $allergyintolerance-verification#confirmed
* type = #allergy
* category = #medication
* criticality = #high
* code.coding[0] = $sct-no-ver#764146007 "Penicillin"
* patient = Reference(mii-exa-person-patient-1)
* encounter = Reference(mii-exa-fall-kontakt-gesundheitseinrichtung-9)
* recordedDate = "2020-01-08"
* reaction[0].manifestation[0].coding[0] = $sct-no-ver#24079001 "Atopic dermatitis"
* reaction[0].severity = #severe