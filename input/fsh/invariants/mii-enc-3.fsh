Invariant: mii-enc-3
Description: "Geplante Kontakte DÜRFEN NICHT einen Start- oder End-Zeitpunkt angeben"
Severity: #error
Expression: "status = 'planned' implies period.exists().not()"