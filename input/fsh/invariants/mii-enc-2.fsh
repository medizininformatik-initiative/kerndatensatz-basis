Invariant: mii-enc-2
Description: "Abgeschlossene, stationäre Kontakte MÜSSEN einen Start- und End-Zeitpunkt angeben"
Severity: #error
Expression: "status = 'finished' and class = 'IMP' implies period.start.exists() and period.end.exists()"