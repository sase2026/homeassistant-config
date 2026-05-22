# TODO — Home Assistant Projekt

_Letzte Aktualisierung: 2025-05-22_

## ✅ Erledigt

- [x] Dashboard-YAML für Boiler/PV-Überschuss erstellt (`boiler_pv_ueberschuss_dashboard.yaml`)
- [x] Dashboard-YAML Solar Manager erstellt (`solar_manager_dashboard.yaml`)
- [x] Dokumentation HA Direct Access (Nabu Casa + Bearer Token via DC/PowerShell)
- [x] Git-Repo initialisiert und auf GitHub gepusht → https://github.com/sase2026/homeassistant-config
- [x] HA-Typ geklärt: Home Assistant OS (HAOS) auf Alpine Linux, Raspberry Pi
- [x] Echte Pi-IP ermittelt: 192.168.178.90 (HA läuft auf :8123)

## 🔄 In Arbeit

- [ ] SSH Add-on (Terminal & SSH) in HA installieren und Port 22 freigeben
- [ ] SSH-Verbindung von Windows testen: `ssh root@192.168.178.90`
- [ ] SSH-Key einrichten (passwortloser Zugang für DC)

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
- [ ] SSH-Workflow in DC standardisieren (Python-Helper-Skript)
- [ ] HA-Config-Backup-Skript via SSH
- [ ] Entity-Dokumentation (wichtigste Entities katalogisieren)

## 🗒️ Notizen

- **HA-IP lokal:** `192.168.178.90:8123`
- **Nabu Casa:** `https://zgipfuef4lczccwz4g367yktoadecma5.ui.nabu.casa`
- **HA-Typ:** Home Assistant OS (HAOS) auf Alpine Linux 3.23
- **Pi Username (Host):** `rasppi5`
- **SSH (nach Add-on Setup):** `ssh root@192.168.178.90` Port 22
- **API-Zugriff via DC:** PowerShell + `Invoke-RestMethod` + Bearer Token
- **GitHub:** https://github.com/sase2026/homeassistant-config
