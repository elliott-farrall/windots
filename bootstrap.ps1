#Requires -RunAsAdministrator

# Install OpenSSH Server
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

# Configure port
$sshdConfig = "$env:ProgramData\ssh\sshd_config"
(Get-Content $sshdConfig) -replace '^#?Port \d+', 'Port 2222' | Set-Content $sshdConfig

# Start and enable service
Set-Service -Name sshd -StartupType Automatic
Start-Service sshd

# Authorized key for admin users
$pubKey = Read-Host "Paste public key"
$authKeysPath = "$env:ProgramData\ssh\administrators_authorized_keys"
Set-Content $authKeysPath $pubKey
icacls $authKeysPath /inheritance:r /grant "SYSTEM:(F)" /grant "Administrators:(F)"

# Firewall rule
New-NetFirewallRule -Name 'OpenSSH-Server-2222' `
    -DisplayName 'OpenSSH Server (2222)' `
    -Direction Inbound -Protocol TCP `
    -LocalPort 2222 -Action Allow -Profile Any
