# TODO — Home Assistant Projekt

_Letzte Aktualisierung: 2025-05-22_

## ✅ Erledigt

- [x] Dashboard-YAML für Boiler/PV-Überschuss erstellt (`boiler_pv_ueberschuss_dashboard.yaml`)
- [x] Dashboard-YAML Solar Manager erstellt (`solar_manager_dashboard.yaml`)
- [x] Dokumentation HA Direct Access (Nabu Casa + Bearer Token via DC/PowerShell)
- [x] SSH-Zugang vorbereitet (homeassistant.local Port 22, HA Terminal Add-on)
- [x] Git-Repo initialisiert und auf GitHub gepusht

## 🔄 In Arbeit

- [ ] SSH-Verbindung über Desktop Commander testen und validieren
- [ ] SSH-Key-basierte Authentifizierung einrichten (kein Passwort)

## 📋 Backlog

### Dashboard & UI
- [ ] Wärmepumpen-Dashboard erstellen (Status, COP, Laufzeiten)
- [ ] Energie-Übersichts-Dashboard (PV + Netz + Verbrauch + Batterie)
- [ ] Dashboard-Karten für SMA-Inverter (Leistung, Ertrag, Einspeisung)
- [ ] Shelly 3EM Live-Dashboard (Phasenströme, Leistung)

### Automationen
- [ ] Boiler-Automation: PV-Überschuss → Boiler einschalten
- [ ] WP-Steuerung: Günstige Netzstromzeiten nutzen
- [ ] Benachrichtigung bei Solar-Peak > X kW

### Technisch
- [ ] SSH-Workflow in DC standardisieren (Helper-Skript)
- [ ] HA-Config-Backup-Skript via SSH
- [ ] Entity-Dokumentation (die wichtigsten ~394 Entities katalogisieren)

## 🗒️ Notizen

- HA-Instanz: `homeassistant.local` / Nabu Casa: `https://zgipfuef4lczccwz4g367yktoadecma5.ui.nabu.casa`
- SSH Port: 22 (HA Terminal Add-on muss aktiv sein)
- API-Zugriff via DC: PowerShell + `Invoke-RestMethod` + Bearer Token
