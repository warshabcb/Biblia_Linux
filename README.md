# Biblia Personal

Apuntes sobre comando en Linux y Powershell.

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


## Comandos Utiles

### Contar Filas | Palabras | byte de un Archivo (wc -l = Lineas) (wc -w = Palabras) (wc -c = byte)
```bash
wc miarchivo.txt
```
Ejemplo:
```
12 42 256 miarchivo.txt
```

