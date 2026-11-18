# TODO — Home Assistant Projekt

_Letzte Aktualisierung: 2026-11-18_

## ✅ Erledigt

- [x] Dashboard-YAML für Boiler/PV-Überschuss erstellt (`boiler_pv_ueberschuss_dashboard.yaml`)
- [x] Dashboard-YAML Solar Manager erstellt (`solar_manager_dashboard.yaml`)
- [x] SSH-Zugang eingerichtet (Key-Auth, Port 22)
- [x] 2026-11-18: WP-Takt-/Laufzeit-Kennzahlen, Gebaeudekennzahlen (Heizlast, Energiesignatur, Auskuehlrate), Alarm-Dashboard mit Push
- [x] 2026-11-18: Veraltete Zugangs-Unterlagen und Altdateien aufgeräumt
- [x] Git-Repo initialisiert und auf GitHub gepusht → https://github.com/sase2026/homeassistant-config
- [x] HA-Typ geklärt: Home Assistant OS (HAOS) auf Alpine Linux, Raspberry Pi
- [x] Echte Pi-IP ermittelt: 192.168.178.90 (HA läuft auf :8123)

## 🔄 In Arbeit

- [ ] WP-Abtauungen erkennen (Leistungsmuster in erster Frostnacht auswerten)
- [ ] Energiesignatur/Heizlast nach ca. 14 Tagen Daten pruefen (docs/kennzahlen_alarme.md)
- [ ] Erste Auskuehlrate-Messungen pruefen
- [ ] Alarm-Dashboard alarme-a weiter ausbauen


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
- **SSH:** `ssh -i ~/.ssh/ha_rsa -p 22 root@192.168.178.90` (Schlüssel `ha_rsa` sichern!)
- **Nach Backup-Restore:** `ha_rsa.pub` im Terminal-&-SSH-Add-on unter authorized_keys neu eintragen, Port 22 freigeben
- **GitHub:** https://github.com/sase2026/homeassistant-config
