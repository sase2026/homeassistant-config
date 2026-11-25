# FBH-Smart – UI-Helfer (nicht in YAML, liegen in .storage)

Stand 25.11.2026 22:20. Diese Helfer wurden per UI/API angelegt und sind wegen `.storage/` in .gitignore nicht im Repository. Volltext aller Templates (sensor.fbh_smart_entscheid) und SQL-Abfragen: Claude-Projekt «WP-Verbrauchsanalyse», Dokument `claude/HA_FBH_UI_Helfer_Sicherung.md`; Beschreibung und Rückfallwerte in `claude/HA_FBH_Bilanz_2026-11-25.md`.

## Neue Helfer 25.11.2026
| Entität | Typ | Wert / Zweck |
|---|---|---|
| input_number.fbh_weitblick_stunden | input_number | 5 h – Horizont EIN-Entscheid (3 = aus) |
| input_number.fbh_weitblick_aussen_unter | input_number | 5 °C – Weitblick nur darunter (met.no 6 h) |
| input_datetime.fbh_nachtladen_ab | input_datetime | 21:30 – Nachtladen vor Werktag (05:29 = aus) |
| input_number.fbh_istwert_stale_nach | input_number | 2 h |
| input_number.fbh_istwert_stale_trend | input_number | −0.1 K/h (0 = aus) |
| input_datetime.fbh_morgen_aus_ab | input_datetime | 05:30 – Pumpe Mo–Fr aus bis 07:00 (07:00 = altes «Morgen halten») |
| sensor.wohnraum_prognose_weitblick | Template | `p + max(Hw−H,0) × (Trend_eff × 0.5 − k × (T − T_a))` |
| sensor.wohnraum_prognose_06_uhr | Template | `T − k (T − T_a) h_bis_06 + Nachwärme` |
| sensor.fbh_trend_effektiv | Template | Trend ±0.5, Stale-Abkühlung (Pumpe AUS, Sonne unten, Istwert > 2 h alt), Lüften ≥ 0 |
| sensor.fbh_strang_abweichung_relativ | SQL | Strang-Abweichung in % der Spanne (Strang-Ø − Raum), letzte Nacht / Vornacht / Ø 7 Nächte |
| sensor.fbh_warmeindex_nacht | SQL | Σ (VL−RL HK-II) × Zeit bei FBH aktiv 18–08 Uhr (K·h), 8 Nächte als Attribute |

Geändert: `sensor.wohnraum_prognose` nutzt seit 25.11. `sensor.fbh_trend_effektiv`; `sensor.fbh_smart_entscheid` mit Zweigen Weitblick, Nachtladen, Morgen-AUS.

Dashboard fbh-a: neue Grafik «Strang-Abgleich relativ» (FBH Übersicht), Messprotokoll Nächte bis 24./25.11. mit Wärmeindex (FBH Lernphase Prognose).
