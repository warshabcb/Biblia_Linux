#!/bin/bash

# Función para generar un número aleatorio de longitud especificada
generate_random_number() {
    local length=$1
    number=$(tr -dc '0-9' < /dev/urandom | fold -w ${1:-$length} | head -n 1)
    echo $number
}

# Función para generar una fecha de expiración aleatoria
generate_expiration_date() {
    # Mes aleatorio
    month=$(shuf -i 1-12 -n 1)
    # Año aleatorio (dentro de los próximos 5 años)
    year=$(date +%Y)
    year=$((year + RANDOM % 5 + 1))
    
    printf "%02d/%04d" $month $year
}

# Función para generar un número de tarjeta que comience con 4 para Visa y 5 para MasterCard
generate_card_number() {
    local type=$1
    if [ "$type" == "Visa" ]; then
        echo "4$(generate_random_number 15)"
    elif [ "$type" == "MasterCard" ]; then
        echo "5$(generate_random_number 15)"
    fi
}

# Lista de nombres de comercios ficticios y tipos de tarjeta
comercios=("Tienda A" "Tienda B" "Tienda C" "Tienda D")
tipos=("Visa" "MasterCard")

# Nombre del archivo de salida
output_file="Compras.txt"

# Escribir cabecera de columnas en el archivo
echo "Tipo, Tarjeta, CVV, Expira, Monto, Moneda, Comercio" > $output_file

# Generar datos aleatorios y guardarlos en el archivo
for i in {1..10000}; do
    # Tipo de tarjeta aleatorio
    tipo=${tipos[$RANDOM % ${#tipos[@]}]}
    
    # Número de tarjeta que concuerda con el tipo
    card_number=$(generate_card_number $tipo)
    
    # CVV falso de 3 dígitos
    cvv=$(generate_random_number 3)
    
    # Fecha de expiración
    expiration_date=$(generate_expiration_date)
    
    # Monto aleatorio entre 1 y 1000
    amount=$(shuf -i 1-1000 -n 1)
    
    # Moneda aleatoria (colones o dólares)
    currency=$(shuf -e "CRC" "USD" -n 1)
    
    # Nombre de comercio aleatorio
    comercio=${comercios[$RANDOM % ${#comercios[@]}]}
    
    # Añadir los datos generados al archivo, debajo de las columnas
    echo "$tipo, $card_number, $cvv, $expiration_date, $amount, $currency, $comercio" >> $output_file
done

echo "Los datos aleatorios se han guardado en $output_file."
