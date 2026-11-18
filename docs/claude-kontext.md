# Kontext für Claude — Home Assistant Projekt

> Zu Beginn jeder Session lesen. Keine Passwörter, Tokens oder Schlüssel in diese Datei (Repo ist öffentlich).
> Stand: 2026-11-18

## Anlage

- Home Assistant OS auf Raspberry Pi, lokal `192.168.178.90:8123`, Fernzugriff über Nabu Casa
- PV: 4 kWp, Wechselrichter SMA STP4.0-3AV-40; keine Batterie (Kaufentscheid für ca. 10 kWh offen, Simulation in HA)
- Messung: Shelly Pro 3EM (Haus + Netz)
- Heizung: Wärmepumpe (Vitotronic-Fühler), Boiler mit Relais, Fussbodenheizung mit Raumfühlern (Shelly)
- Prognose: Solcast (HACS)
- Schweizer Konventionen: CHF, Rp, Deutsch

## Zugriff von Claude (Windows-PC via Desktop Commander)

- SSH (Shell `cmd`, nicht PowerShell):
  `C:\PROGRA~1\Git\usr\bin\ssh.exe -i %USERPROFILE%\.ssh\ha_rsa -o StrictHostKeyChecking=no -p 22 root@192.168.178.90 "<befehl>"`
- Ausgabe zuverlässig lesen: `... > %TEMP%\out.txt 2>&1 & type %TEMP%\out.txt`; bei Pipes/komplexen Befehlen Python `subprocess`
- SCP: gleicher Schlüssel, Port mit `-P 22`
- Schlüssel: `~\.ssh\ha_rsa` (privat, sichern!) und `ha_rsa.pub`; `.ssh` liegt per Junction auf D:
- **Nach Backup-Restore:** Terminal-&-SSH-Add-on setzt sich zurück → `ha_rsa.pub` als authorized_key neu eintragen, Port 22 freigeben
- Lokale Pfade: Repo `D:\Claude Projekte\Home Assistant`, Python `C:\Python314\python.exe`, Git `C:\Program Files\Git\bin\git.exe`
- GitHub: `sase2026/homeassistant-config` (öffentlich)

## Arbeitsweise

- Schritt für Schritt, Claude führt direkt aus, wo möglich
- Vor Änderungen auf HA: Backup der Datei als `<datei>.bak_JJJJMMTT_HHMM`
- YAML prüfen mit `ha core check` vor Neustart
- Session-Ende: Dateien speichern → Commits → `TODO.md` aktualisieren → Session-Summary → Push

## Konfiguration

- `configuration.yaml`: `packages: !include_dir_named packages`, Dashboards `lovelace: mode: storage` (UI-Modus seit 18.11.2026)
- Dashboards als Export in `dashboards/` (`*.storage.json`, YAML-Stände)
- Pakete in `packages/`: `energy_manager_helpers`, `energy_manager_parameters`, `energy_manager_statistics`, `influxdb`, `wp_nacht_kennzahlen`

## Wichtige Entities

- `sensor.stp4_0_3av_40_930_daily_yield` — PV heute
- `sensor.leistung_saldierung` — Netzsaldo; enthält `netzeinspeisung_leistung_w` bereits → **nicht** nochmals abziehen
- `sensor.verbrauch_haus_kwh`, `sensor.verbrauch_wp_heizung_kwh`, `sensor.netz_ruckspeisung_kwh`
- `sensor.boiler_temperatur_oben`, `sensor.haus_verbrauch_w`
- Boiler-Relais: `switch.haus_verbauch` (Tippfehler in HA ist echt, **nicht** `haus_verbrauch`)
- `automation.boiler_tagesbericht` ← `input_datetime.tagesabschluss_push_zeit`

## Formeln

- PV-Eigenverbrauch = PV heute − Einspeisung
- Gesamtverbrauch = Haus-Meter + WP heute
- Autarkie = PV-Eigenverbrauch / Gesamtverbrauch × 100

## Erfahrungen mit Karten / YAML

- plotly-graph-card v3: Invertieren mit `filters: - multiply: -1` (kein `lambda`); `x_fn`/`y_fn` scheitern still ohne History
- apexcharts-card: `data_generator` braucht `graph_span`; `statistics` braucht vorhandene Langzeitstatistik (nicht bei neuen `utility_meter`); `donut` geht nicht mit `data_generator`
- Zuverlässigste Variante für berechnete Werte ohne History: SVG in `button-card` mit `[[[...]]]` und `states[]`
- Lovelace-URL-Keys in `configuration.yaml`: genau ein Bindestrich (z. B. `solar-a`)
- Template-Sensoren in Paketen: `  - sensor:` (2 Leerzeichen), `    - name:` (4 Leerzeichen)

## Design-Standard (wie natives HA-Energie-Dashboard)

- Linien dünn (plotly `0.5`), Füllung transparent (`0.12–0.22`), keine unnötigen Beschriftungen
- Farben: PV `#ff9800`, Einspeisung `#7b1fa2`, Haus + WP `#5b9bd5`, Netzbezug `#ef4444`
