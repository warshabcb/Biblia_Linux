myips()
{
    if command -v curl > /dev/null; then
        ip=$(curl -s http://ipinfo.io/ip)
        echo -e "\033[0;32m\nPublic IP address : $ip\n\033[0m"
    else
        echo "curl is not installed. Please install curl to use this function."
    fi
}
fechadt() {
    format_date() {
        date -d "$1" "+%d-%b-%y"
    }

    if [ $# -eq 0 ]; then
        echo "Uso: fechadt <archivo> | <fecha1> <fecha2> ..."
        return 1
    fi

    if [ -f "$1" ]; then
        # Si se pasa un archivo, leer desde ese archivo
        while IFS= read -r fecha; do
            printf "%s\n" "$(format_date "$fecha")"
        done < "$1"
    else
        # Si no se pasa un archivo, procesar los argumentos como fechas
        for fecha in "$@"; do
            printf "%s\n" "$(format_date "$fecha")"
        done
    fi
}
chg2820() {
    # Verificar si se proporciona entrada a través de tuberías o como un archivo
    if [ -p /dev/stdin ]; then
        # Si la entrada proviene de una tubería, leer desde stdin
        while IFS= read -r linea; do
            # Evaluar la línea como un comando bash para dividirla en campos
            eval "campos=($linea)"

            # Verificar si hay suficientes campos
            if [ "${#campos[@]}" -ne 5 ]; then
                echo "Error: La línea no tiene el formato correcto: $linea"
                continue
            fi

            # Construir la línea de salida con los datos recibidos
            salida="(T035FECSOL = '${campos[0]}' AND T035NUMTAR = '${campos[1]}' AND T035CODAUT = '${campos[2]}' AND T035TIPTRN = ${campos[3]} AND T035VLRORI = '${campos[4]}')"
            
            # Imprimir la línea de salida
            echo "$salida"
        done
    else
        # Si no se proporciona entrada a través de tuberías, leer desde el archivo especificado como argumento
        archivo="$1"
        # Verificar si se proporciona un archivo como argumento
        if [ $# -ne 1 ] || [ ! -f "$archivo" ]; then
            echo "Uso: chg2820 <archivo>"
            return 1
        fi

        # Leer cada línea del archivo y generar las líneas correspondientes
        while IFS= read -r linea; do
            # Evaluar la línea como un comando bash para dividirla en campos
            eval "campos=($linea)"

            # Verificar si hay suficientes campos
            if [ "${#campos[@]}" -ne 5 ]; then
                echo "Error: La línea no tiene el formato correcto: $linea"
                continue
            fi

            # Construir la línea de salida con los datos recibidos
            salida="(T035FECSOL = '${campos[0]}' AND T035NUMTAR = '${campos[1]}' AND T035CODAUT = '${campos[2]}' AND T035TIPTRN = ${campos[3]} AND T035VLRORI = '${campos[4]}')"
            
            # Imprimir la línea de salida
            echo "$salida"
        done < "$archivo"
    fi
}

fixnums() {
    for arg in "$@"; do
        # Verifica si el argumento es un nombre de archivo existente
        if [ -f "$arg" ]; then
            # Si es un archivo, procesa su contenido
            while IFS= read -r line; do
                # Llama a la lógica de procesamiento directamente aquí
                echo "$line" | {
                    while IFS= read -r line; do
                        # Elimina espacios y comas de mil, y convierte la coma decimal a punto si es necesario
                        local clean_number=$(echo "$line" | sed -r 's/ //g' | sed -r ':a;s/^([^,]*),([0-9]{3}(\.|,|$))/\1\2/;ta' | sed -r 's/,([0-9]{2})$/.\1/')
                        # Corrige números que terminan con '.00' para convertirlos en enteros completos
                        echo "$clean_number" | sed 's/\.00$//'
                    done
                }
            done < "$arg"
        else
            # Si no es un archivo, asume que es un valor directo y procesalo
            echo "$arg" | {
                while IFS= read -r line; do
                    # Elimina espacios y comas de mil, y convierte la coma decimal a punto si es necesario
                    local clean_number=$(echo "$line" | sed -r 's/ //g' | sed -r ':a;s/^([^,]*),([0-9]{3}(\.|,|$))/\1\2/;ta' | sed -r 's/,([0-9]{2})$/.\1/')
                    # Corrige números que terminan con '.00' para convertirlos en enteros completos
                    echo "$clean_number" | sed 's/\.00$//'
                done
            }
        fi
    done
}