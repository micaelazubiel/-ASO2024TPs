#!/bin/bash

API_KEY="9cd657e203ec45e7b2503319241106"

# verifica si se proporcionó una ciudad como argumento
if [ $# -eq 0 ]; then
    echo "Uso: $0 <ciudad>"
    exit 1
fi

# obtiene la ciudad de los argumentos del script
CIUDAD="$1"

# hace una solicitud a la API de WeatherAPI para obtener el clima actual
URL="http://api.weatherapi.com/v1/current.json?key=${API_KEY}&q=${CIUDAD}&aqi=no"

# curl para obtener los datos del clima
RESPUESTA=$(curl -s "$URL")

# verifica si la respuesta tiene algún error
if echo "$RESPUESTA" | grep -q "error"; then
    echo "Error al obtener el clima para la ciudad: $CIUDAD"
    exit 1
fi

# extrae y muestra información del clima
TEMP_ACTUAL=$(echo "$RESPUESTA" | jq '.current.temp_c')
CONDICION=$(echo "$RESPUESTA" | jq -r '.current.condition.text')
HUMEDAD=$(echo "$RESPUESTA" | jq '.current.humidity')

echo "Clima actual en $CIUDAD:"
echo "Temperatura: $TEMP_ACTUAL°C"
echo "Condición: $CONDICION"
echo "Humedad: $HUMEDAD%"