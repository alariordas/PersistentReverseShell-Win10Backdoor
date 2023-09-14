function DescargarYDescomprimirNetcat {
    # COMANDO DE DESCARGA: Descargar y descomprimir el archivo ZIP
    $zipFilePath = "C:\Users\daw1xx\Downloads\netcat-win32-1.11.zip"
    $destinationPath = "C:\Users\daw1xx\Downloads"

    # Descargar el archivo ZIP
    Invoke-WebRequest -Uri "URL_DEL_ARCHIVO_ZIP" -OutFile $zipFilePath

    # Descomprimir el archivo ZIP
    Expand-Archive -Path $zipFilePath -DestinationPath $destinationPath

    # UNZIP DEL NC.EXE EN SYSTEM32: Mover el archivo nc.exe a la carpeta System32
    $ncFilePath = "C:\Users\daw1xx\Downloads\netcat-win32-1.11\nc.exe"
    $system32Path = "C:\Windows\System32"

    # Mover nc.exe a la carpeta System32
    Move-Item -Path $ncFilePath -Destination $system32Path
}
