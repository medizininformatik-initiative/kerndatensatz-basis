Invariant: mii-enc-6
Description: "Kontakte mit Abwesenheitsstatus MÜSSEN einen Start-Zeitpunkt angeben"
Severity: #error
Expression: "status = 'onleave' implies period.start.exists()"