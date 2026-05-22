# SSH Setup für Home Assistant

## Voraussetzungen
# - HA Terminal & SSH Add-on installiert und aktiv
# - homeassistant.local erreichbar im Netz

## SSH-Key generieren (einmalig)
# ssh-keygen -t rsa -b 4096 -f $HOME\.ssh\ha_rsa -N ""

## SSH-Key auf HA hinterlegen (einmalig, dann passwortlos)
# type $HOME\.ssh\ha_rsa.pub | ssh root@homeassistant.local "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"

## Direkter SSH-Befehl (mit Passwort)
# ssh root@homeassistant.local

## SSH-Befehl ausführen und Ausgabe capturen (via Python für DC-Kompatibilität)

$SshScript = @'
import subprocess, sys

HOST = "root@homeassistant.local"
CMD = sys.argv[1] if len(sys.argv) > 1 else "echo 'HA SSH OK'"

r = subprocess.run(
    ["ssh", "-o", "StrictHostKeyChecking=no", HOST, CMD],
    capture_output=True, text=True, timeout=30
)

print("OUT:", r.stdout)
print("ERR:", r.stderr)  
print("EXIT:", r.returncode)
'@

# $SshScript | Out-File -FilePath "C:\temp\ha_ssh.py" -Encoding utf8
# C:\Python314\python.exe C:\temp\ha_ssh.py "ls /config"

Write-Host "SSH Helper geladen. Nutze: ssh root@homeassistant.local"
Write-Host "Oder via Python: C:\Python314\python.exe C:\temp\ha_ssh.py 'BEFEHL'"
