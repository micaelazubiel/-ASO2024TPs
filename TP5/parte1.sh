#!/bin/bash

echo "¡Bienvenido/a a Piedra, Papel o Tijera!"
continuar="s"

while [ "$continuar" = "s" ]; do
    echo "Elige piedra, papel o tijera: "
    read eleccion_usuario

    #genera la elección aleatoria de la computadora
    opciones=("piedra" "papel" "tijera")
    num_opciones=${#opciones[@]}
    indice_aleatorio=$((RANDOM % num_opciones))
    eleccion_computadora=${opciones[$indice_aleatorio]}

    echo "La computadora eligió: $eleccion_computadora"

    #determina el ganador
    if [ "$eleccion_usuario" = "$eleccion_computadora" ]; 
      then
        echo "¡Empate!"
    elif [ "$eleccion_usuario" = "piedra" ] && [ "$eleccion_computadora" = "tijera" ]; 
      then
        echo "¡Ganaste!"
    elif [ "$eleccion_usuario" = "papel" ] && [ "$eleccion_computadora" = "piedra" ]; 
      then
        echo "¡Ganaste!"
    elif [ "$eleccion_usuario" = "tijera" ] && [ "$eleccion_computadora" = "papel" ]; 
      then
        echo "¡Ganaste!"
    else
        echo "¡La computadora gana!"
    fi

    #pregunta si quiere seguir jugando
    echo "¿Querés jugar de nuevo? (s/n): "
    read continuar
done

echo "¡Gracias por jugar!"
