Invariant: mii-enc-5
Description: "In-Durchführung befindliche Kontakte MÜSSEN einen Start-Zeitpunkt angeben"
Severity: #error
Expression: "status = 'in-progress' implies period.start.exists()"