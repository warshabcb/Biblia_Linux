# Biblia Personal

Apuntes sobre comando en Linux y Powershell.

**HotKeys Windows Terminal**
=====================================

| **Atajo**          | **Descripción**                                                                               |
|---------------------|-----------------------------------------------------------|
| `Ctrl+C`         | Copiar                                                                                    |
| `Ctrl+V`         | Pegar                                                                                     |
| `Ctrl+A`         | Seleccionar todo                                                                          |
| `Ctrl+Shift+V`   | Pegar sin formato                                                                         |
| `Ctrl+Shift+C`   | Copiar texto seleccionado al portapapeles  (como Ctrl+C)    |
| `Ctrl+Shift+X`   | Cortar texto seleccionado                                                                 |
| `Ctrl+T`         | Abrir una nueva pestaña                                                                   |
| `Ctrl+Tab`       | Cambiar a la pestaña siguiente                                                            |
| `Ctrl+Shift+Tab` | Cambiar a la pestaña anterior                                                             |
| `Ctrl+Shift+T`   | Reabrir pestaña cerrada                                                                   |
| `Ctrl+W`         | Cerrar la pestaña actual                                                                  |
| `Ctrl+K`         | Cortar texto seleccionado                                                                 |
| `Ctrl+F`         | Buscar                                                                                    |
| `Ctrl+Shift+F`   | Buscar en todas las pestañas                                                              |
| `Ctrl+Plus`      | Aumentar el tamaño de la fuente                                                           |
| `Ctrl+Minus`     | Disminuir el tamaño de la fuente                                                          |
| `Ctrl+0`         | Restablecer el tamaño de la fuente                                                        |
| `Ctrl+Shift+Plus` | Aumentar el zoom                                                                          |
| `Ctrl+Shift+Minus`| Disminuir el zoom                                                                         |
| `Ctrl+L`         | Limpiar la pantalla                                                                       |
| `Alt+Enter`      | Alternar pantalla completa                                                                |
| `Alt+D`          | Mover el cursor al campo de entrada                                                       |
| `Ctrl+Shift+V`   | Pegar desde el portapapeles                                                               |
| `Ctrl+Shift+D`   | Dividir la terminal en una nueva pestaña vertical                      |
| `Alt+Shift+D`    | Dividir la terminal en una nueva pestaña vertical                      |
| `Alt+Shift+-`    | Dividir la terminal en una nueva pestaña horizontal              |
| `Ctrl+F3`        | Buscar la siguiente ocurrencia                                                            |
| `Ctrl+Shift+F3`  | Buscar la ocurrencia anterior                                                             |


**Configurar SSH con Clave**
==========================

Para configurar el acceso SSH con clave, sigue estos pasos:

### 1. Crear las claves

En PowerShell, ejecuta el comando:
```powershell
ssh-keygen -t rsa -b 2048
```
Este comando generará una pareja de claves (privada y pública).

### 2. Copiar la clave privada

Copia la clave privada en el directorio `C:\Users\<Cuenta>\.ssh`.

### 3. Copiar la clave pública al servidor Linux

En el servidor Linux, copia la clave pública en el archivo `.ssh/authorized_keys` ubicado en el directorio raíz
(`~/.ssh/authorized_keys`).

### 4. Configurar el comando SSH en Code

Modifica el comando en el archivo de configuración JSON (por ejemplo, `launch.json`) para utilizar la clave privada y la IP del
servidor Linux:
```json
"commandline": "ssh -i C:\\Users\\Warshab\\.ssh\\NombreFile user@IP"
```

**Generar Numeros Aleatorios Terminal**

```bash
echo $RANDOM
```

**Alias para Archivo .bashrc  Categorías**
-------------

### **Limpiadores**

* `alias cl='clear'`: Limpia la pantalla.
* `alias update='sudo apt update && sudo apt upgrade -y'`: Actualiza los paquetes y upgrade.

### **Juegos y entretenimiento**

* `alias sl='/usr/games/sl'`: Inicia el juego SL.
* `alias meminfo='cat /proc/meminfo | grep MemTotal'`: Muestra información de memoria física.

### **Navegación**

* `alias ..='cd ..'`: Regresa a la carpeta superior.
* `alias ...='cd ../../'`: Regresa a la carpeta superior varias veces.
* `alias ....='cd ../../../'`: Regresa a la carpeta superior varias veces.

### **Información y sistema**

* `alias now='date +%Y-%m-%d %H:%M:%S'`: Muestra la fecha y hora actual.
* `alias myip='curl http://ipinfo.io/ip;echo'`: Muestra la dirección IP actual.
* `alias count='echo "Número de archivos:" && ls -1 | wc -l'`: Cuenta el número de archivos en la carpeta actual.

### **Configuración**

* `alias gogo='source ~/.bashrc'`: Reemplaza el archivo de configuración Bash.


### Alias Utiles
```bash
alias cl='clear'
alias update='sudo apt update && sudo apt upgrade -y'
alias sl='/usr/games/sl'
alias meminfo='cat /proc/meminfo | grep MemTotal'
alias .. ='cd ..'
alias ... ='cd ../../'
alias .... ='cd ../../../'
alias now='date +"%Y-%m-%d %H:%M:%S"'
alias myip='curl http://ipinfo.io/ip;echo'
alias gogo='source ~/.bashrc'
alias bashrc='nano ~/.bashrc'
alias update='sudo apt update && sudo apt upgrade -y'
alias ctrs='source ~/enviroment/ctrs/bin/activate'
```

## $ _ Bash Prompt Generator
- Podemos personalizar el prompt de nuestra terminal con esta pagina web. ```https://bash-prompt-generator.org/```
    
   ```bash
   PS1='\[\e[97;1m\]\u\[\e[97m\]@\[\e[97m\]\h\[\e[0m\]:\[\e[91m\][\[\e[38;5;220m\]\w\[\e[91m\]]\[\e[38;5;35;1m\]-->\[\e[0m\]'
   ```

   ```bash
   PS1='\[\e[1m\]\u@\h\[\e[0m\] \[\e[91m\][\[\e[38;5;214m\]\w\[\e[91m\]]\[\e[0m\] \[\e[38;5;40;1m\]>\[\e[0m\] '
   ```

## Información sobre fstab (Tabla de Sistemas de Archivos)

El archivo /etc/fstab en Linux define cómo se montan los dispositivos de almacenamiento durante el arranque, especificando el dispositivo, el punto de montaje y las opciones:

*   `/dev/sda1`: Partición raíz, montada en `/`, `ext4`, `errors=remount-ro`. Esta es la partición principal de arranque.
    *   **Dispositivo:** `/dev/sda1` - Este es el nodo de dispositivo que representa la primera partición en el primer disco duro (o unidad de disco).
    *   **Punto de Montaje:** `/` - Este es el directorio raíz del sistema de archivos. Todos los demás directorios se encuentran dentro de este.
    *   **Tipo de Sistema de Archivos:** `ext4` - Este es el tipo de sistema de archivos utilizado para formatear la partición. `ext4` es un sistema de archivos con registro por diario (journaling) que se usa comúnmente en sistemas Linux.
    *   **Opciones de Montaje:** `errors=remount-ro` - Esta opción especifica qué hacer si se detectan errores en este punto de montaje. En este caso, la opción vuelve a montar la partición como solo lectura (`read-only`). Esto previene daños mayores en el sistema de archivos en caso de errores.
    *   **Campo de Dump (Volcado):** `0` - Este campo (que no se muestra explícitamente pero está presente) indica si el sistema de archivos debe ser respaldado con el comando `dump`. `0` significa que no se hará backup con este comando.
    *   **Campo de Pass (Paso):** `1` - Este campo (que tampoco se muestra explícitamente pero está presente) es usado por `fsck` para determinar el orden en el que los sistemas de archivos deben ser revisados al arrancar. La partición raíz debe ser la primera en ser verificada, por lo que se le asigna el valor `1`.

*   `/dev/sdb1`: Partición de datos, montada en `/data`, `ext4`, `defaults`. Esta partición contiene datos de usuario.
    *   **Dispositivo:** `/dev/sdb1` - La primera partición en el segundo disco duro.
    *   **Punto de Montaje:** `/data` - Este es el directorio donde la partición de datos será accesible.
    *   **Tipo de Sistema de Archivos:** `ext4` - El mismo sistema de archivos usado para la partición raíz.
    *   **Opciones de Montaje:** `defaults` - Esta es una abreviatura que representa un conjunto de opciones comunes, incluyendo `rw`, `suid`, `dev`, `exec`, `auto`, `nouser` y `async`.
        *   `rw`: Acceso de lectura y escritura.
        *   `suid`: Permite los bits set-user-identifier o set-group-identifier.
        *   `dev`: Interpreta los dispositivos especiales de carácter o bloque en el sistema de archivos.
        *   `exec`: Permite la ejecución de binarios.
        *   `auto`: Monta este sistema de archivos durante el arranque (o cuando se usa `mount -a`).
        *   `nouser`: Solo el usuario `root` puede montar el sistema de archivos.
        *   `async`: Todas las operaciones de E/S (entrada/salida) hacia el sistema de archivos se harán de forma asíncrona.
    *   **Campo de Dump (Volcado):** `0` - Esta partición no se incluirá en las copias de seguridad con `dump`.
    *   **Campo de Pass (Paso):** `2`- Se verifica después de la partición raíz. Las demás particiones deben tener el campo de paso establecido en `2`.

*   `UUID=some-long-uuid`: Partición de intercambio (swap), montada como `swap`.
    *   **Dispositivo:** `UUID=some-long-uuid` - Usar el UUID (Identificador Único Universal) es preferible a los nombres de dispositivos (por ejemplo, `/dev/sdX`) porque es más robusto. Los UUID permanecen consistentes incluso si el orden de los discos cambia.
    *   **Punto de Montaje:** `swap` - Esta palabra clave indica que la partición se utilizará como una partición de intercambio, no como un directorio regular.
    *   **Tipo de Sistema de Archivos:** `swap` - Indica que la partición es una partición de intercambio.
    *   **Campo de Dump (Volcado):** `0` - La partición de intercambio no debe ser respaldada.
    *   **Campo de Pass (Paso):** `0`- La partición de intercambio no necesita una verificación con `fsck`.

*   `//192.168.1.10/sharedfolder /mnt/shared cifs user,credentials=/root/.smbcredentials,iocharset=utf8,sec=ntlm 0 0`: Monta una carpeta compartida en red usando CIFS.
    *   **Dispositivo:** `//192.168.1.10/sharedfolder` - Esta es una ruta de red a una carpeta compartida en un servidor con la dirección IP 192.168.1.10.
    *   **Punto de Montaje:** `/mnt/shared` - El directorio local donde se montará el recurso compartido de red.
    *   **Tipo de Sistema de Archivos:** `cifs` - Este es el protocolo Common Internet File System, comúnmente usado para recursos compartidos de red en entornos Windows (también conocido como SMB).
    *   **Opciones de Montaje:**
        *   `user`: Permite que un usuario no root monte y desmonte el recurso compartido.
        *   `credentials=/root/.smbcredentials` - Especifica un archivo que contiene el nombre de usuario y la contraseña para acceder al recurso compartido. Este archivo debe tener permisos establecidos en `600` (lectura/escritura para el propietario, sin acceso para otros).
        *   `iocharset=utf8` - Especifica el juego de caracteres (codificación) usado para los nombres de archivo. UTF-8 se recomienda para una amplia compatibilidad.
        *   `sec=ntlm` - Especifica el protocolo de seguridad a usar. `ntlm` es un protocolo comúnmente usado para SMB. Otras opciones podrían incluir `ntlmssp` o `krb5`.
    *   **Campo de Dump (Volcado):** `0` - Los recursos compartidos de red no deberían ser respaldados.
    *   **Campo de Pass (Paso):** `0`- Los recursos compartidos de red no necesitan una verificación con `fsck`.

**Opciones de Montaje Comúnmente Usadas (Más allá de `defaults`):**

*   `noauto`: No montar automáticamente al arrancar. Deberás montarlo manualmente.
*   `user` / `users`: Permite a los usuarios regulares montar/desmontar. `users` permite que cualquier usuario monte, `user` permite al usuario que montó el sistema de archivos desmontarlo.
*   `ro`: Montar como solo lectura.
*   `rw`: Montar como lectura/escritura (esto usualmente es parte de `defaults`).
*   `noexec`: No permitir que se ejecuten binarios desde esta partición.
*   `nosuid`: Ignorar los bits set-user-ID y set-group-ID.
*   `nodev`: No interpretar dispositivos especiales de carácter o bloque en el sistema de archivos.
*   `sync`: Todas las operaciones de E/S hacia el sistema de archivos se harán de forma síncrona.
*   `data=journal`: Todos los datos de los archivos se escriben en el diario (journal) antes de escribirlos en el sistema de archivos.
*   `data=ordered`: Esta es la opción por defecto. Todos los datos de los archivos se fuerzan directamente al sistema de archivos principal antes de que sus metadatos se confirmen en el diario.
*   `data=writeback`: Los datos de los archivos se escriben en el sistema de archivos principal sin ninguna garantía de orden. Puede que se escriban en el sistema de archivos principal después de que sus metadatos se hayan confirmado en el diario.
*   `nofail`: No reportar errores para este dispositivo si no existe. Esto es útil para montajes opcionales.
*   `x-systemd.automount` : Montar el dispositivo cuando se acceda al punto de montaje.

**Notas Importantes:**

* Entradas incorrectas en `/etc/fstab` pueden impedir que tu sistema arranque. Asegúrate de tener copias de seguridad antes de hacer cambios.
* Usa UUID en lugar de la ruta del dispositivo si es posible.
* Siempre prueba los cambios en un entorno que no sea de producción primero.
* Si tienes la oportunidad, asegúrate de entender el comando `mount`.
* Asegúrate de crear el directorio del punto de montaje, antes de modificar el archivo `fstab`.
* Si estás trabajando con datos sensibles, asegúrate de entender las implicaciones de seguridad de cada opción.
* Si quieres que un punto de montaje sea permanente, añádelo al archivo `/etc/fstab`.
* Para montajes de red, asegúrate de tener los paquetes de protocolo necesarios instalados (por ejemplo, `cifs-utils` para CIFS).
* El archivo de credenciales para los montajes de red debe estar protegido estableciendo los permisos de archivo correctos. (600)
* Asegúrate de añadir los valores correctos para los campos `dump` y `pass`.




## Cálculos Aritméticos con la Terminal

Realizar cálculos aritméticos directamente en la terminal de Bash puede ser útil para scripts o simplemente para cálculos rápidos. A continuación, se describen dos métodos principales para realizar operaciones aritméticas en Bash.

### Usando `expr`

El comando `expr` permite evaluar expresiones. Es importante tener en cuenta que los operadores deben estar separados por espacios y la multiplicación debe ser escapada para evitar que sea interpretada como un carácter especial.

**Ejemplos:**

```bash
expr 2 + 3       # Suma: retorna 5
expr 2 - 1       # Resta: retorna 1
expr 2 \* 2      # Multiplicación: retorna 4 
expr 10 / 2      # División: retorna 5
```

## Usando Aritmética de Bash con $((expresión))

Bash permite realizar aritmética directamente dentro de su sintaxis usando $((expresión)). Es más flexible y fácil de usar para cálculos integrados en scripts, dado que no requiere espaciado especial o escape de caracteres.

**Ejemplos:**

```bash
echo $((2 + 2))   # Suma: imprime 4
echo $((2 - 1))   # Resta: imprime 1
echo $((2 * 2))   # Multiplicación: imprime 4
echo $((10 / 2))  # División: imprime 5
```
## Operadores Comunes en Bash
Aquí está una tabla rápida de operadores comunes utilizados en Bash para referencia rápida.

| Operador | Descripción    |
|----------|----------------|
| `+`      | Suma           |
| `-`      | Resta          |
| `\*`      | Multiplicación |
| `/`      | División       |
| `%`      | Módulo         |

## Eliminar Mensajes de Bienvenida al Conectar por SSH

Cuando te conectas a un sistema a través de SSH, es común recibir un mensaje de bienvenida, conocido técnicamente como 'Message of the Day' (MOTD). A continuación, te explicamos cómo modificar o eliminar estos mensajes.

### Modificar el Mensaje de Bienvenida

- Editar el archivo MOTD:
  Para cambiar el mensaje de bienvenida, edita el archivo /etc/motd en tu servidor. Puedes escribir el mensaje que desees que se muestre al conectarte vía SSH.
  ```bash
    sudo nano /etc/motd
  ```
  Aquí, puedes insertar el texto que desees que aparezca como mensaje de bienvenida.
### Eliminar los Mensajes de Bienvenida

- Identificar los scripts de actualización del MOTD:
  Los mensajes dinámicos son generados por scripts en el directorio /etc/update-motd.d/. Para ver qué scripts están activos:
  ```bash
    ls /etc/update-motd.d/
  ```

- Eliminar o deshabilitar los scripts:
  Si deseas eliminar completamente los mensajes, puedes eliminar o deshabilitar los scripts en este directorio. Para eliminarlos de forma segura, puedes moverlos a otro directorio o simplemente eliminar el contenido de los scripts.
  ```bash
    sudo rm /etc/update-motd.d/*
  ```

## Paquetes en Linux
=====================

### Buscar Paquetes

* Utiliza `sudo apt search <paquete>` para buscar paquetes en el repositorio de Linux.
* Otra forma de buscar paquetes es mediante `dpkg -s top`, que te muestra una lista de paquetes instalados.

### Instalar Paquetes

* Para instalar un paquete manualmente, utiliza `sudo dpkg -i <paquete>.deb`.
* Si el paquete no está disponible en los repositorios oficiales, puedes instalarlo mediante `sudo apt install --allow-downgrades <paquete>`.

### Eliminar Paquetes

* Para eliminar un paquete instalado, utiliza `sudo apt remove <paquete>`.
* Recuerda que eliminar un paquete puede causar problemas en tu sistema, por lo que asegúrate de que no estás eliminando un paquete esencial.

### Listar todos los Paquetes Instalados

* Para listrar todos los paquetes instalados, utiliza `dpkg -l`.
* Esta lista te muestra todos los paquetes instalados en tu sistema, incluyendo versiones y dependencias.

### Comprobar la Versión del Kernel

* Para comprobar la versión del kernel actual, utiliza `uname -sr`. Esto te muestra la información del kernel, incluyendo su versión y fecha de compilación.
* Esta información es útil para comprobar si tienes una versión actualizada o no.

### Actualizar el Kernel

* Para actualizar el kernel, utiliza `sudo apt dist-upgrade`, que es equivalente a un `sudo apt upgrade`.
* Esto te actualiza la versión del kernel y otros paquetes instalados.
* Recuerda que actualizar el kernel puede causar problemas en tu sistema, por lo que asegúrate de que no estás actualizando un paquete esencial.

```bash
sudo apt search openssh-server
dpkg -s top
sudo dpkg -i paquete.deb
sudo apt remove paquete
dpkg -l
uname -sr
sudo apt dist-upgrade
```

### Repositorio Kali en Debian
------------------------------

Para añadir el repositorio de Kali en sistemas Debian, sigue los pasos detallados a continuación:

- **URL del Repositorio de Kali:**
  - Visita la [documentación oficial de Kali Linux](https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/).
    ![Descripción de la imagen del repositorio Kali](Imagenes/Repo_Kali.png)

- **Configuración del Repositorio:**
  - Es recomendable agregar el repositorio en el directorio `/etc/apt/sources.list.d/` y no directamente en el archivo `/etc/apt/sources.list` para mantener las configuraciones organizadas y evitar conflictos. Usa el siguiente comando:
    ```bash
    sudo add-apt-repository "deb http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware"
    ```

- **Importación de la Clave Pública GPG de Kali:**
  - Descarga la clave con:
    ```bash
    wget https://archive.kali.org/archive-key.asc
    ```
  - Convierte el archivo de clave a formato `.gpg`:
    ```bash
    gpg -o kali-key.gpg --dearmor archive-key.asc
    ```
  - Copia la clave al directorio adecuado:
    ```bash
    cp kali-key.gpg /etc/apt/keyrings/
    ```

- **Modificación del Archivo de Fuentes de APT:**
  - Modifica el archivo creado en `/etc/apt/sources.list.d/` (nombre del archivo: `archive_uri-http_http_kali_org_kali-bookworm.list`) con la línea:
    ```bash
    deb [signed-by=/etc/apt/keyrings/kali-key.gpg] http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware
    ```

- **Actualización del Sistema:**
  - Actualiza los paquetes con:
    ```bash
    sudo apt update && sudo apt upgrade -y
    ```
  - O puedes optar por una actualización completa con:
    ```bash
    sudo apt full-upgrade
    ```

- **Instalación de Herramientas de Kali:**
  - Instala el paquete por defecto de Kali Linux:
    ```bash
    sudo apt install kali-linux-default
    ```
Sigue estos pasos para integrar correctamente el repositorio de Kali Linux en tu sistema Debian.

### Repositorios GitHub

En esta sección, encontrarás enlaces directos a varios repositorios de GitHub que pueden ser útiles para diversas tareas de seguridad informática y pruebas de penetración:

- **BugBountyBooks**:
  - **Descripción**: Colección de libros sobre programas de recompensa por bugs.
  - **URL**: [BugBountyBooks en GitHub](https://github.com/akr3ch/BugBountyBooks.git)

- **Rockyou Wordlist**:
  - **Descripción**: Repositorio que contiene la famosa wordlist Rockyou, útil para pruebas de fuerza bruta.
  - **URL**: [Rockyou en GitHub](https://github.com/zacheller/rockyou.git)

- **LinEnum**:
  - **Descripción**: Script útil para la enumeración de sistemas Linux. Especialmente valioso para validar configuraciones en máquinas virtuales gestionadas con Proxmox.
  - **URL**: [LinEnum en GitHub](https://github.com/rebootuser/LinEnum.git)

## Sistema Operativo
-----------------------

### Directorios Importantes

* **Seguridad**:
        + `/etc/passwd`: Contiene información de usuarios.
        + `/etc/shadow`: Contiene información de contraseñas de usuarios.
        + `/etc/group`: Contiene información de grupos y sus usuarios.
* **Configuración**:
        + `/etc/resolv.conf`: Configura DNS. Puedes validar el DNS con el comando `dig`. Modificable temporalmente.
* **Repositorios**:
        + `/etc/apt/sources.list`: Archivo de repositorios del sistema.
* **Perfiles y entornos**:
        + `/etc/profile`: Permite definir variables de entorno y scripts. No es recomendado modificar directamente (crear un nuevo fichero 
en `/etc/profile.d`).
        Se ejecuta en shells con login.
* **Entornos de bash**:
        + `/etc/bashrc`: Permite definir variables de entorno y scripts que estarán disponibles para programas iniciados desde la shell bas
bash. No se ejecuta en shells con login.
* **Perfiles de usuario**:
        + `~/.profile`: Permite definir variables de entorno y scripts. Se ejecutará al iniciar la sesión de Escritorio o en una shell con
login. Las variables afectan a todos los programas ejecutados desde el escritorio gráfico o desde la shell.
* **Perfiles de bash**:
        + `~/.bashrc`: Permite definir variables de entorno y scripts. Se ejecuta cuando se abre la shell sin necesidad de hacer login.

### Variables de Entorno
 -  Mostrar lista de variables de Entorno. ```printenv```.
### Funciones de Entorno
 -  Para ver todas las funciones que tenemos podemos ejecutar ```set``` y este nos mostrara las diferentes configuraciones que tenemos.
# Networking 
 - Saber mi IP Publica ```curl icanhazip.com```.
 - Mostrar estadisticas de Conecciones  ```ss -ta``` Muestra los Sockect TCP  ```ss -tu``` Muestra los Sockect UTP.
 - Comando para localizar puerto en uso y el proceso que lo esta utulizando ```sudo ss -lptn 'sport = :8080'```.
 - Mostrar tablas de rutas de nuestra PC  ```netstat -nr```.
 - Mostrar Conecciones TCP ```netstat -at```.
 - Mostrar Conecciones UTP ```netstat -au```.
 - Mostrar Conecciones en Escucha ```netstat -l```.
 - Mostrar Conecciones Establecidas ```netstat -pntu```.

## Servicios en Ejecucion Debian
  Con este comando podemos ver todos los servicios que estan en ejecucion en nuestro sistema.
```
systemctl list-units --type=service
```

## Crontab en Linux
=====================

### Sintaxis y Opciones
```markdown
crontab -e
```
Crontab es una herramienta de programación de tareas en Linux que permite ejecutar scripts o comandos en momentos específicos de manera automática. A continuación, se presenta la sintaxis y opciones de
crontab:

**Tabla de Sintaxis**

| Campo              | Valor                   | Descripción                                           |
|-------------------|------------------------|------------------------------------------------------|
| Minuto             | `0-59`                  | El minuto en el que se ejecutará la tarea.            |
| Hora               | `0-23`                  | La hora en la que se ejecutará la tarea.              |
| Día del mes        | `1-31`                  | El día del mes en el que se ejecutará la tarea.       |
| Mes                | `1-12` o `Jan-Dec`      | El mes en el que se ejecutará la tarea.               |
| Día de la semana   | `0-7` o `Sun- Sat`       | El día de la semana en el que se ejecutará la tarea.  |
| Comando            | `/path/to/command`      | El comando o script que se ejecutará.                 |

![Crontab](Imagenes/Crontab.png)

- **URL**: [Ejemplos Practicos](https://crontab.guru/)

### Caracteres Especiales

Las siguientes son algunas de las características especiales que puedes utilizar en crontab:

| Carácter  | Descripción                                                                             |
|----------|----------------------------------------------------------------------------------------|
| `*`       | Representa "cada" unidad de tiempo (cada hora, cada día, etc.).                         |
| `,`       | Permite especificar una lista de valores (p. ej., `1,3,5`).                              |
| `-`       | Define un rango de valores (p. ej., `1-5`).                                              |
| `/`       | Especifica un intervalo de tiempo (p. ej., `*/10` para "cada 10 minutos").               |

**Ejemplos de Crontab**

| **Tarea** | **Configuración** | **Comando** |
| --- | --- | --- |
| Ejecutar `backup. sh` | 2:30 AM, todos los días | `30 2 * * * /path/to/backup.sh` |
| Ejecutar un script cada 15 minutos | 0, 15, 30, 45, todos los días | `*/15 * * * * /path/to/script.sh` |
| Ejecutar `logs. sh` | 3 PM, lunes | `0 15 * 1 * /path/to/logs.sh` |
| Limpiar log a las 4:30 AM | 4:30 AM, todos los días | `30 4 * * * rm -f /var/log/myapp.log` |
| Ejecutar `update. sh` | 2:15 AM, viernes | `15 2 * 5 * /path/to/update.sh` |
| Enviar correo electrónico a las 9 PM | 9 PM, todos los días | `0 21 * * * /path/to/send-email.sh` |
| Ejecutar `compress. sh` | 1:45 AM, martes y jueves | `45 1 * 2,4 * /path/to/compress.sh` |
| Actualizar base de datos a las 3:30 AM | 3:30 AM, tercer día del mes (1-28) | `30 3 1-28/3 * * /path/to/update-db.sh` |

# Procesos y Shell

## Buscar, Priorizar, Matar Procesos

### Buscar procesos por nombre

* `pgrep openvpn`

### Matar un proceso por medio del PIP

* `sudo kill -9 PID`

  ![Image text](Imagenes/kill.png)

### Matar un proceso por medio del nombre

* `sudo pkill openvpn`

### Detener procesos

* `Ctrl+z` ![Image text](Imagenes/Ctrlz.png)
* `fg` para reanudar el proceso detenido o con el signo % seguido el numero de proceso mostrado al presionar CTRL + Z

### Ejecutar un proceso en segundo plano

* `./infinito.sh &`


### Ejecutar programa en un solo CPU y en segundo plano

* `taskset --cpu-list 1 ./infinito.sh &`

### Nice y Renice procesos (A mayor número más amigable con los otros procesos)

-- Nice
* `taskset --cpu-list 1 nice -n 10 ./infinito.sh &`


-- Renice | Si se debe de dar mas prioridad puede que solicite permisos en caso contrario sin problemas.
* ```renice 10 -p #proceso```


## Comando TOP

- Al presionar la tecla ```s``` este nos permite cambiar la velocidad de actualizacion.
- Filtrar procesos por el nombre del Usuario ```u```.
- Cambiar valores de medicion a Megas | Gigas etc  ```e```.
- Filtrar los procesos por alguna de las columnas disponibles ```o```  escribimos el nombre de la columna seguido del ```=``` mas el valor a buscar ```COMMAND=top``` para regresar    con solo presionar la tecla ```=```.
- Mostrar solo un proceso con Top. ``` top -p 774```
  
  ![Top](Imagenes/top.png)

 ## Expresiones Regulares

  ![Image text](Imagenes/Regular_Expressions.png)

- Importante Manejar Expresiones regulares en Notepad++ (```https://www.youtube.com/playlist?list=PL1z4RL0Mc_2UEn-9qHIIT_P1jN0nwde2f```)
- Web para generar y probar expresiones regulares(```https://regex101.com/```)
 ## Comando AWK 

  ### Variables Incorporadas AWK
  | Variable | Descripción |
|----------|-------------|
| `NR`     | Número de registro actual, típicamente el número de línea procesada hasta el momento. |
| `NF`     | Número de campos en el registro actual. |
| `$0`     | Toda la línea de entrada actual. |
| `$1`, `$2`, ..., `$n` | El primer, segundo, ..., n-ésimo campo de la línea actual, respectivamente. |
| `FS`     | Separador de campos (Field Separator), espacio en blanco por defecto. |
| `RS`     | Separador de registros (Record Separator), una nueva línea por defecto. |
| `OFS`    | Separador de salida de campos (Output Field Separator), utilizado para formatos de salida. |
| `ORS`    | Separador de salida de registros (Output Record Separator), utilizado en la salida de datos. |


  ### Ejemplos

  - Buscar datos basados en la columna # 4, donde esta sea menor igual a 100 (```$4<=100```). Este Comando  ```%-20s``` Indica que Genere un espacio para la primer columna de 20  y el ```\n``` es el Salto de linea.
   ```bash
   awk -F, '$4<=100 {printf "%-30s %-5s\n", $1,$3}' fake_data.txt
   ```
  - Para los casos en que se desea sumar una columna podemos usar el siguiente Comando:
   ```bash
   awk -F, '{ suma += $4 } END {print "La Suma es de : " suma}' fake_data.txt
   ```
   ![Image text](Imagenes/Suma_Awk.png)
  - Para los casos en que se desea Contar una columna podemos usar el siguiente Comando:
   ```bash
   awk -F, '{ count++ } END {print "La cuenta es de : " count}' fake_data.txt
   ```
   ![Image text](Imagenes/Contar_Awk.png)
   - Para saber el tamaño de una columna usar el Comando:

   ```bash
   awk -F, '{print $1, "La Colunma $1 tiene una logitud de :", length($1) }' fake_data.txt | head -2
   ```
   ![Image text](Imagenes/Length_Awk.png)

   - Buscar las shell disponibles diferentes del archivo passwd ```$NF```  Significa Ultima Columna o ultimo campo de Linea segun el delimitador establecido al inicio con ```-F```

   ```bash
   awk -F':' '{print $NF}' /etc/passwd | sort | uniq
   ```
   - Ordenar Lista de Numero y Saber cuales estan repetidos.

   ```bash
   cat numeros.txt | sort | uniq -c | awk ' $1 > 1'
   ```
   ![Image text](Imagenes/OrdenaNumeros.png)
   ![Image text](Imagenes/OrdenaNumerosv2.png)

## Comando Grep $ zgrep

 - Buscar una cadena y seleccionar las posiciones que se necesitan devolver de esa fila.
   ```
   zgrep "Mensaje recibido" *.log.gz | awk '{print substr($0,196,21), substr($0, otro_inicio, otro_largo)}'
   ```
   ![Image text](Imagenes/Consulta_AWK_$4.png)

 - Para casos en los que se necesita tener un mensaje cuando no se encuentre resultados con el ```grep``` o ```zgrep``` podemos usar el siguiente comando:
    ```bash
    grep "Mensaje" *.log || echo "No se encontraron Datos."

    ```
 

## Practicas Comandos

 


## Solución de Problemas al Instalar Tarjeta de Video NVIDIA GTX 1650

### Mensaje de Error.

    ```error
      WARNING: The Nouveau kernel driver is currently in use by your system. This driver is incompatible with the NVIDIA driver, and must be disabled before proceeding.
    ```

### Pasos para la Instalación

1. **Desinstalar el Controlador Nouveau**
   - **Crear un archivo de configuración para deshabilitar Nouveau**:
     ```
     echo "blacklist nouveau" | sudo tee /etc/modprobe.d/blacklist-nouveau.conf
     echo "options nouveau modeset=0" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
     ```

2. **Actualizar el GRUB**
   - **Modificar la configuración de GRUB** para incluir la configuración de Nouveau:
     ```bash
     sudo nano /etc/default/grub
     ```
     Añade `nouveau.modeset=0` a la línea `GRUB_CMDLINE_LINUX_DEFAULT`:
     ```bash
     GRUB_CMDLINE_LINUX_DEFAULT="quiet nouveau.modeset=0"
     ```
     Guarda los cambios y actualiza GRUB:
     ```bash
     sudo update-grub
     ```
   - **Regenerar initramfs**:
     ```bash
     sudo update-initramfs -u
     ```

3. **Instalación de Paquetes Necesarios**
   - **Instalar paquetes básicos y herramientas**:
     ```bash
     sudo apt-get install linux-headers-$(uname -r) firmware-linux firmware-linux-nonfree pkg-config software-properties-common build-essential bsdmainutils lm-sensors psensor glances
     sudo apt-get update
     ```

4. **Reiniciar el Sistema**
   - Reinicia el sistema para aplicar todos los cambios:
     ```bash
     sudo reboot
     ```

5. **Validar la Instalación**
   - Comprueba si la tarjeta está instalada correctamente:
     ```bash
     nvidia-smi
     ```

6. **Instalar CUDA Drivers**
   - Descarga e instala los drivers CUDA:
     ```bash
     wget https://developer.download.nvidia.com/compute/cuda/12.4.0/local_installers/cuda_12.4.0_550.54.14_linux.run
     sudo sh cuda_12.4.0_550.54.14_linux.run
     ```





















## Problemas al instalar Tarjeta Video NVIDIA GTX 1650 

Mensaje Error : ```WARNING: The Nouveau kernel driver is currently in use by your system.  This driver is incompatible with the NVIDIA driver, and must be disabled before proceeding.```
- Crear un archivo de configuración para el kernel.
- Instalar estos paquetes necesarios primero.
  ```
  #Requeridos
  sudo apt-get install linux-headers-$(uname -r)
  sudo apt install firmware-linux firmware-linux-nonfree
  sudo apt-get update
  sudo apt-get install pkg-config
  sudo apt-get install software-properties-common
  sudo apt install build-essential
  sudo apt update
  sudo apt install -y build-essential tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev libffi-dev
  sudo apt-get install -y build-essential libssl-dev git zlib1g-dev yasm libgmp-dev libpcap-dev pkg-config libbz2-dev
  sudo apt-get install wireless-tools   # iwconfig
  sudo apt-get install net-tools        # ifconfig -a
  sudo apt-get install network-manager  # nmcli dev wifi list  Lista de Wifis

  #Aplicaciones
  sudo apt install bsdmainutils
  sudo apt install lm-sensors
  sudo apt install psensor
  sudo apt install glances
  ```
- Debes crear un archivo de configuración en el directorio /etc/modprobe.d/ para indicarle al sistema que no cargue el módulo Nouveau. Puedes hacerlo con el siguiente comando:
  ```
  sudo echo "blacklist nouveau" >> /etc/modprobe.d/blacklist-nouveau.conf
  ```
- Además, agrega la opción nomodeset para prevenir que el kernel cargue Nouveau antes de que se aplique la lista negra. Agrega la siguiente   línea al mismo archivo:
  ```
  sudo echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist-nouveau.conf
  ```
- Necesitas actualizar la configuración de GRUB, el cargador de arranque, para asegurarte de que se aplique la configuración de la lista negra. Abre el archivo de configuración de GRUB con un editor de texto:
  ```
  sudo nano /etc/default/grub
  ```
  Busca la línea que comienza con GRUB_CMDLINE_LINUX_DEFAULT y añade nouveau.modeset=0 al final de las comillas. Por ejemplo, si la línea era:
  ```
  GRUB_CMDLINE_LINUX_DEFAULT="quiet"
  ```
  Deberías cambiarla a:
  ```
  GRUB_CMDLINE_LINUX_DEFAULT="quiet nouveau.modeset=0"
  ```
- Guarda y cierra el archivo. Luego, actualiza la configuración de GRUB con:
  ```
  sudo update-grub
  ```
- Para asegurarte de que los cambios tomen efecto en el próximo arranque, regenera el initramfs con el siguiente comando:
  ```
  sudo update-initramfs -u
  ```
- Después de realizar estos cambios, reinicia tu sistema para aplicarlos:
  ```
  sudo reboot
  ```
- Validar si esta Instalado Correctamente
  ```
  nvidia-smi
  ```
- Instalar Cuda Drivers
  ```
  wget https://developer.download.nvidia.com/compute/cuda/12.4.0/local_installers/cuda_12.4.0_550.54.14_linux.run
  sudo sh cuda_12.4.0_550.54.14_linux.run
  ```
  
  
## Programas Top
- ```htop``` Monitor de Procesos.
- ```btop``` Monitor de Procesos mas moderno.
- ```figlet``` Genera texto con letras grandes en terminal.
- ```cmatrix```Wallpaper Matrix en Terminal.
- ```mtr``` Permite realizar un seguimiento de la ruta que toma un paquete de datos desde tu computadora hasta un destino específico en la red, al mismo tiempo que muestra información sobre la latencia y la pérdida de paquetes en cada salto de la red.
- ```sl``` El tren en la terminal ```sudo apt install sl``` podemos crear un alias ```alias sl='/usr/games/sl'``` en ```.bashrc```.

## Manejo de Entorno Linux

#### Reconfigurar Zona Horaria en Debian

```bash
dpkg-reconfigure tzdata
```
#### Reiniciar Red Linux (Debian)
```bash
sudo systemctl restart networking.service
```

#### Reiniciar SSH (Debian)
```bash
sudo systemctl restart sshd
```
#### Permitir Root SSH (Modificar Archivo /etc/ssh/sshd_config) Habilitar Linea ```PermitRootLogin yes```
```bash
sudo nano /etc/ssh/sshd_config
```

#### Status Red Linux (Debian)
```bash
sudo systemctl status networking.service
```
#### Configurar Red Linux (Debian)
```bash
sudo nano /etc/network/interfaces
```

## Manejo de Zip | Unzip en Linux

### Instalar Zip y Unzip

```bash
sudo apt install zip unzip
```
### Comprimir Archivo
```bash
zip archivo_comprimido.zip archivo_a_comprimir.txt
```
```
 gzip file
```
### Comprimir Directorio
```bash
zip -r archivo_comprimido.zip directorio_a_comprimir/
```
```
gzip -r directorio  // comprime los archivos dentro del directorio no la carpeta
```
### Descomprimir Archivo
```bash
unzip archivo_comprimido.zip
```
```
gunzip file.gz
```
### Descomprimir en Directorio
```bash
unzip archivo_comprimido.zip -d /ruta/del/directorio/
```
### Descomprimir Archivos tar ejemplo (rockyou.txt.tar.gz)
 - -x: indica a tar que extraiga los archivos.
 - -z: le dice a tar que descomprima el archivo (ya que está comprimido con gzip).
 - -v: significa "verbose", lo que hace que tar muestre los archivos a medida que se extraen (esto es opcional, pero útil para ver lo que está sucediendo).
 - -f: le dice a tar que el siguiente argumento es el nombre del archivo a procesar, en este caso, rockyou.txt.tar.gz.
```bash
   tar -xzvf rockyou.txt.tar.gz
```


## Comandos Utiles

### Contar Filas | Palabras | byte de un Archivo (wc -l = Lineas) (wc -w = Palabras) (wc -c = byte)
```bash
wc miarchivo.txt
```
Ejemplo:
```
12 42 256 miarchivo.txt
```
Lineas = ```wc -l ```
Palabras = ```wc -w```
Caracteres = ```wc -m```

## Como Instalar PhpMyAdmin Ubuntu 20.04 LTS

### Ejecutar los Siguientes Comandos

#### Actualiza lista de paquetes
```
sudo apt update
```
#### Instala PhpMyAdmin
```
sudo apt install phpmyadmin
```

#### Habilitar la Extensión PHP mcrypt y mbstring
```
sudo apt install php-mbstring php-zip php-gd php-json php-curl
sudo phpenmod mbstring
```
#### Reiniciar Apache
```
sudo systemctl restart apache2

```

### Aumentar Limite a la hora de importar Archivos

Se debe de buscar el archivo `php.ini`  con el comando `find`  en el servidor

Ruta 
```
/etc/php/7.4/apache2/php.ini
```

Cambia los siguientes valores:

`upload_max_filesize` Este valor define el tamaño máximo de archivo que se puede subir. Establécelo según tus necesidades, por ejemplo, 64M para un límite de 64 megabytes.
`post_max_size` Este valor debe ser mayor o igual que `upload_max_filesize`. Habitualmente se establece un poco más alto que `upload_max_filesize`.
`max_execution_time` y `max_input_time` : Estos valores controlan el tiempo máximo que PHP espera para la ejecución de scripts y la entrada de datos, respectivamente. Puedes aumentarlos según sea necesario.


## Python AI

## Instalar Python
```bash
sudo apt install python3 python3-pip

```
### Paquete para Crear Enviroment
```bash
sudo apt install python3-venv
```
### Crea Entorno 
```bash
python3 -m venv mi_entorno

```
### Activar Entorno
```bash
source mi_entorno/bin/activate

```
### Desactivar Entorno
```bash
deactivate

```
### Instalar Librerias
```bash
pip install matplotlib seaborn
pip install tensorflow
pip install tensorflow-gpu

```

