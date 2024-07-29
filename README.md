++++ÜBUNGSANGABE++++

Erstellen Sie eine App zur Darstellung von POIs (basierend auf Open Government Data Vienna) auf einer Karte. 
Wählen Sie selber aus, welche Daten Sie anzeigen möchten (z.B. Öffi-Haltestellen, Taxistände, Elektroladestationen, etc.) und sprechen Sie sich mit Ihren KollegInnen ab, damit Sie alle unterschiedliche Daten verwenden. 
Die App sollte mit einer Liste der jeweils abgefragten Daten starten. Ein Klick auf einen Listeneintrag öffnet eine Karte, die den ausgewählten Punkt anzeigt.

***Hinweise/Anmerkungen:***

- Die abgefragten Daten müssen als JSON-File formatiert sein

- Es reicht jeweils die Darstellung einer Koordinate (auch wenn mehrere Koordinaten bzw. ganze Flächen im JSON verfügbar wären).

- Die Struktur des JSON-Files ist anders als beim Beispiel im Unterricht. Daher muss sowohl das Auslesen, als auch das Abspeichern (Model) entsprechend angepasst werden.

- Die Daten sollen automatisch beim Start geholt werden und ein “Refresh” soll mittels Button möglich sein

- Ein Klick auf eine Annotation soll Zusatzinformationen anzeigen.

- Es soll eine Möglichkeit geben, abgefragte Einträge bzw. deren Inhalt persistent (in einer Art Favoritenliste) zu speichern. Diese Liste soll über einen eigenen Tab erreichbar sein.
