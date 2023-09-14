# PermanentRevershell-win10backdoor
 "PermanentRevershell: A potent Windows 10 backdoor providing persistent access and full system control. Explore its capabilities today!"
![image](https://github.com/alariordas/PermanentRevershell-win10backdoor/assets/80034759/82e62466-3dff-4a75-b90d-51602e27e753)

**Disclaimer: Use Responsibly**

This tool is provided for educational and legitimate security testing purposes only. The author (insert your name or username) does not condone or endorse any unauthorized or malicious use of this tool. Any actions and activities carried out using this tool are the sole responsibility of the user.

By downloading, using, or distributing this tool, you acknowledge and agree to use it in compliance with all applicable laws and ethical guidelines. Improper or unlawful use of this tool is strictly prohibited, and the author will not be held responsible for any consequences arising from such actions.

Please exercise caution and always obtain proper authorization before using this tool on systems or networks that you do not own or have explicit permission to test.

Use this tool responsibly and for legitimate purposes only.

**Note:** It is important to be aware of and comply with the laws and regulations governing cybersecurity and ethical hacking activities in your jurisdiction. Unauthorized access or malicious activities may result in legal consequences.

**Descripción del Script**
El script proporcionado automatiza la descarga, instalación y configuración de la herramienta Netcat en sistemas Windows. Netcat, o "nc.exe," es una utilidad de red versátil que permite la comunicación en redes a través de puertos TCP o UDP. Este script se enfoca en la instalación de la versión para Windows de Netcat.

**Instrucciones de Uso**
Nota: Este script debe ejecutarse con privilegios de administrador.

Abre PowerShell como administrador.

Copia y pega el contenido del script en la ventana de PowerShell.

Ejecuta el script.

**El script realizará las siguientes acciones:**

Obtiene el nombre de usuario actual.
Descarga el archivo ZIP de Netcat desde la URL proporcionada y lo guarda en la carpeta de descargas del usuario.
Descomprime el archivo ZIP en una carpeta de destino.
Mueve el archivo "nc.exe" a la carpeta "System32" de Windows.
Agrega una entrada de registro para ejecutar Netcat automáticamente al iniciar el sistema.
Configura una regla de firewall para permitir la comunicación a través del puerto 455.
Borra la carpeta de descargas y el archivo ZIP una vez que la instalación esté completa.
**Notas Adicionales**
Asegúrate de tener permisos de administrador para ejecutar este script, ya que realiza cambios en la configuración del sistema y en el firewall.
El script utiliza la versión específica de Netcat disponible en la URL proporcionada. Asegúrate de que esta URL sea válida y que la versión de Netcat sea la deseada.
La regla del firewall permite la comunicación a través del puerto 455. Si deseas utilizar un puerto diferente, asegúrate de cambiar tanto el comando de arranque como la regla del firewall en el script.
Después de ejecutar el script, Netcat estará configurado para ejecutarse automáticamente al iniciar el sistema y escuchar en el puerto especificado. Asegúrate de entender las implicaciones de seguridad de esta configuración.

