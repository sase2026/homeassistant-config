# WP-Kennzahlen, Gebäudekennzahlen, Alarme (Stand 18.11.2026)

Alles über die HA-Oberfläche angelegt (Helfer in `.storage`, nicht im Repo). Automationen in `automations.yaml`, Dashboards als Export in `dashboards/`.

## Solar Manager › Register WP
- **WP-Betrieb (Heute/Woche/Monat/Jahr):** Starts, Starts/h, Laufzeit, Ø Laufzeit/Start, Laufzeitanteil, Kurztakte (< `input_number.wp_kurztakt_grenze`, 20 min), WP-Strom, kWh/Start, Ø Leistung im Betrieb. Zählung ab 18.11.2026 18:50.
  - `binary_sensor.wp_verdichter_lauft` (Threshold > 1000 W auf `sensor.heizung_verbrauch_w`)
  - `counter.wp_verdichter_starts` / `counter.wp_kurztakte` (Automation «WP Kennzahlen – Takte zählen»)
  - `sensor.wp_laufzeit_gesamt` (Riemann), utility_meter `wp_starts_*`, `wp_kurztakte_*`, `wp_laufzeit_*` (heute/woche/monat/jahr), `sensor.wp_strom_woche`, `sensor.wp_starts_letzte_stunde`
  - Abtauungen: offen (Muster erst bei Frost erkennbar)
- **Gebäude:** SQL-Sensor `sensor.gebaude_tageswerte` (UI-SQL, Langzeitstatistik; Polling aus, stündlich per Automation «Gebäude Tageswerte aktualisieren»). HGT 20/12, kWh/HGT, H [W/K], Heizlast bei Norm-Aussentemp. (−8 °C), W/m², Energiesignatur mit Trend/Heizgrenze.
  - Arbeitszahl `input_number.wp_arbeitszahl_annahme` = 3.3 aus Excel-Wärmezählern (Wärme Hzg + WW) ÷ Shelly-Strom: 03.02.–31.03.2026 = 3.22, 20.10.–10.11.2026 = 3.52. Hzg und WW gemeinsam betrachtet.
  - Auskühlrate / Zeitkonstante τ: Automation «Gebäude – Auskühlrate messen» (FBH-Pause 2–24 h, PV < 0.3 kWh).

## Dashboard «Alarme & Warnungen» (`alarme-a`)
- **Kritisch, Push aufs iPhone (zeitkritisch) + Entwarnung** – Automation «Alarm – kritisch aufs Handy»:
  - WP heizt nicht: FBH-Pumpe EIN, Verdichter AUS, Speicher unter VL < 28 °C, 90 min
  - Wohnraum < 21.8 °C, 15 min
  - Warmwasser (Speicher oben) < 40 °C, 30 min
  - Fühler ausgefallen: 8 Regelfühler > 30 min ohne Meldung / nicht erreichbar
  - Heizstab EIN bei > 500 W Netzbezug, 10 min
- **Warnungen, nur Dashboard:** HmIP-Batterie schwach (Gruppe 15 Sensoren), SD-Karte > 80 % (Supervisor-Speichersensoren aktiviert), WP taktet (≥ 3 Kurztakte/Tag, > 3 Starts/h, ab 4 Starts Ø < 20 min)
- **Tagesabschluss-Push (23:55)** ergänzt: WP-Strom, Starts, Ø Laufzeit, Laufzeit, Kurztakte, aktive Alarme/Warnungen
