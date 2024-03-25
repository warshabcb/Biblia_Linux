# Biblia Personal

Apuntes sobre comando en Linux y Powershell.

## $ _ Bash Prompt Generator
-  Podemos personalizar el prompt de nuestra terminal con esta pagina web   ```https://bash-prompt-generator.org/```
   ``` bash
    PS1='\[\e[38;5;28;1m\]\u@\H\[\e[0m\]:\[\e[38;5;51m\][\[\e[90m\]\W\[\e[38;5;51m\]]\[\e[38;5;28;1m\]>\[\e[0m\]'   # Personal.
   ```
   ```
   PS1='\[\e[97;1m\]\u\[\e[38;5;34;2m\]@\[\e[0;1;97m\]\h\[\e[0m\]:[\[\e[38;5;220m\]\w\[\e[0m\]]--\[\e[1m\]>\[\e[0m\]'
   ```
   ```
   PS1='\[\e[97;1m\]\u\[\e[97m\]@\[\e[97m\]\h\[\e[0m\]:\[\e[91m\][\[\e[38;5;220m\]\w\[\e[91m\]]\[\e[0m\]--\[\e[1m\]>\[\e[0m\]'
   ```
   


## Repositorios 

### Repositorio Kali en Debian
- Agrega los repositorios de Kali.
  ```
  deb http://http.kali.org/kali kali-rolling main non-free contrib
  ```
- Agrega la clave GPG de Kali:
  ```
  wget -q -O - https://archive.kali.org/archive-key.asc | sudo apt-key add -
  ```
- Instala las herramientas de Kali
  ```
  sudo apt install kali-linux-default
  ```

### Seguridad
- ```https://github.com/akr3ch/BugBountyBooks.git``` Libros BugBountyBooks.
  

## Sistema Operativo

 - ```/etc/password``` Contiene la informacion de Usuarios.
 - ```/etc/shadow```   Contiene la informacion de contraseñas de los usuarios.
 - ```/etc/group```    Contiene la informacion de grupos y sus usuarios.

## Buscar Procesos Sistema
Podemos usar el siguiente comando : 
```
pgrep openvpn
```
y matar el proceso con 
```
sudo kill -9 PID
```
o 

```
sudo pkill openvpn
```

## Buscar Datos en logs con zgrep y grep 
- Buscar una cadena y seleccionar las posiciones que se necesitan devolver de esa fila.
  ```
  zgrep "Mensaje recibido" *.log.gz | awk '{print substr($0,196,21), substr($0, otro_inicio, otro_largo)}'

  ```

## Problemas al instalar Tarjeta Video NVIDIA GTX 1650 

Mensaje Error : ```  WARNING: The Nouveau kernel driver is currently in use by your system.  This driver is incompatible with the NVIDIA driver, and must be disabled before proceeding. ```
- Crear un archivo de configuración para el kernel:
- Primero Esto:
  ```
  sudo apt-get install linux-headers-$(uname -r)
  sudo apt-get update
  sudo apt-get install pkg-config
  sudo apt-get install software-properties-common
  sudo apt install build-essential
  sudo apt-get install wireless-tools   # iwconfig 
  sudo apt-get install -y build-essential libssl-dev git zlib1g-dev yasm libgmp-dev libpcap-dev pkg-config libbz2-dev
  ```
  Debes crear un archivo de configuración en el directorio /etc/modprobe.d/ para indicarle al sistema que no cargue el módulo Nouveau. Puedes hacerlo con el siguiente comando:
  ```
  sudo echo "blacklist nouveau" >> /etc/modprobe.d/blacklist-nouveau.conf
  ```
- Además, agrega la opción nomodeset para prevenir que el kernel cargue Nouveau antes de que se aplique la lista negra. Agrega la siguiente línea al mismo archivo:
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

## Manejo de Entorno Linux

#### Reconfigurar Zona Horaria en Debian

```bash
dpkg-reconfigure tzdata
```
#### Reiniciar Red Linux (Debian)
```bash
sudo systemctl restart networking.service
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
### Comprimir Directorio
```bash
zip -r archivo_comprimido.zip directorio_a_comprimir/
```
### Descomprimir Archivo
```bash
unzip archivo_comprimido.zip
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
```
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


## Python

### Paquete para Crear Enviroment
```
sudo apt install python3-venv
```
### Crea Entorno 
```
python3 -m venv mi_entorno

```
### Activar Entorno
```
source mi_entorno/bin/activate

```
### Instalar Librerias
```
pip install matplotlib seaborn

```

