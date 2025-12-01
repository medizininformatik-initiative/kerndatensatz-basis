Invariant: mii-enc-7
Description: "Kontakte mit unbekannten Status SOLLTEN einen Start-Zeitpunkt angeben"
Severity: #warning
Expression: "status = 'unknown' implies period.start.exists()"