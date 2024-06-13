# Arquitectura y Sistemas Operativos - Micaela Zubiel
## TP1
* [Resolución](TP1/captura.png)
## TP2
* [Resolución](https://github.com/micaelazubiel/-ASO2024TPs/blob/master/TP2/Captura%20de%20pantalla%20tp2.png)
## TP3
**1) a)** El tiempo de ejecución de los programas *conhilos.py* y *sinhilos.py* es diferente. Por un lado, *conhilos.py* tiene un tiempo de ejecución más rápido ya que realiza las tareas simultáneamente (en paralelo), reduciendo el tiempo de ejecución. Por otro lado, la duración de ejecución de *sinhilos.py* es más lenta y variable, debido a que ejecuta las tareas secuencialmente, una tras otra. Cada tarea debe esperar a que la anterior se complete antes de comenzar.

**b)** Después de comparar con un compañero, se observa que los tiempos de ejecución no son iguales, pero sí similares. Las diferencias entre los tiempos son mínimas, generalmente varían solo en los decimales.

**c)** Al ejecutar el archivo *suma_resta.py* sin descomentar las líneas establecidas, el valor final siempre es 0,... y el tiempo de ejecución es relativamente rápido, no obstante, al descomentar las líneas surgió la "condición de carrera", lo cual ocurre cuando varias tareas intentan cambiar el mismo valor al mismo tiempo. Esto sucede porque no se puede prever qué tarea terminará primero, causando resultados diferentes cada vez que se ejecuta el programa.

**2) a)**
```
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#define NUMBER_OF_THREADS 2
#define CANTIDAD_INICIAL_HAMBURGUESAS 20
int cantidad_restante_hamburguesas = CANTIDAD_INICIAL_HAMBURGUESAS;
int turno = 0;

void *comer_hamburguesa(void *tid)
{
	while (1 == 1)
	{ 
		while(turno!=(int)tid);
    // INICIO DE LA ZONA CRÍTICA
		if (cantidad_restante_hamburguesas > 0)
		{
			printf("Hola! soy el hilo(comensal) %d , me voy a comer una hamburguesa ! ya que todavia queda/n %d \n", (int) tid, cantidad_restante_hamburguesas);
			cantidad_restante_hamburguesas--; // me como una hamburguesa
		}
		else
		{
			printf("SE TERMINARON LAS HAMBURGUESAS :( \n");
        	        turno = (turno + 1)% NUMBER_OF_THREADS;

			pthread_exit(NULL); // forzar terminacion del hilo
		}
    // SALIDA DE LA ZONA CRÍTICA   
	turno = (turno + 1)% NUMBER_OF_THREADS;

	}
}

int main(int argc, char *argv[])
{
	pthread_t threads[NUMBER_OF_THREADS];
	int status, i, ret;
	for (int i = 0; i < NUMBER_OF_THREADS; i++)
	{
		printf("Hola!, soy el hilo principal. Estoy creando el hilo %d \n", i);
		status = pthread_create(&threads[i], NULL, comer_hamburguesa, (void *)i);
		if (status != 0)
		{
			printf("Algo salio mal, al crear el hilo recibi el codigo de error %d \n", status);
			exit(-1);
		}
	}

	for (i = 0; i < NUMBER_OF_THREADS; i++)
	{
		void *retval;
		ret = pthread_join(threads[i], &retval); // espero por la terminacion de los hilos que cree
	}
	pthread_exit(NULL); // como los hilos que cree ya terminaron de ejecutarse, termino yo tambien.
}
```
**b)** ![Comensales](https://github.com/micaelazubiel/-ASO2024TPs/assets/166451126/390f5ea2-16c3-40eb-8011-fed2ae6ec7f9)

## TP4
* [Resolución](https://github.com/micaelazubiel/-ASO2024TPs/commit/05374c4795b0b9a1e24be06d4f0942e6ccc245b6)

## TP5 - Realizado con Alexia Russo
### [Parte I (script)](https://github.com/micaelazubiel/-ASO2024TPs/commit/52bc51c0306f7ca943247e03e1ecbb80d1103722)

#### ¿Qué hace el script?
* El script comienza con un mensaje de bienvenida.
  
  ![1](https://github.com/micaelazubiel/-ASO2024TPs/assets/166451126/6e8409e1-64bc-4ba9-a0e8-e1dd5e4392d0)

* El juego se ejecuta dentro de un bucle while que permite repetir el juego mientras el usuario desee continuar.
  ![WhatsApp Image 2024-06-13 at 12 10 59](https://github.com/micaelazubiel/-ASO2024TPs/assets/166451126/64eb6fa3-3405-4745-aa2f-304379a6d32d)

* Se solicita al usuario que elija entre piedra, papel o tijera.
  
  ![3](https://github.com/micaelazubiel/-ASO2024TPs/assets/166451126/ad831c00-ba00-4f84-a6d0-32250fbc7552)

* La computadora hace una elección aleatoria entre piedra, papel o tijera.
  
  ![4](https://github.com/micaelazubiel/-ASO2024TPs/assets/166451126/ccb891ad-17d3-45da-b9e0-dee713f8963a)

* Se compara la elección del usuario con la de la computadora para determinar el ganador o si hay un empate.

  ![5](https://github.com/micaelazubiel/-ASO2024TPs/assets/166451126/6643ca10-183a-4ebc-a34f-3feb1da90b37)

* Se le pregunta al usuario si quiere jugar de nuevo.

  ![6](https://github.com/micaelazubiel/-ASO2024TPs/assets/166451126/91fc58f7-bf5c-44e7-96ae-eb9608be199c)

* Si el usuario decide no jugar más, se muestra un mensaje de despedida.

  ![7](https://github.com/micaelazubiel/-ASO2024TPs/assets/166451126/5b7956bf-2023-41b4-809a-8f7025185882)

#### ¿Cómo se ejecuta?
* Guardar el contenido del script en un archivo con extensión .sh, por ejemplo, piedra_papel_tijera.sh.

* Abrir una terminal y navegar al directorio donde guardaste el archivo. Luego, dar permisos de ejecución al archivo usando el siguiente comando:
```
chmod +x piedra_papel_tijera.sh
```
* Ejecuta el script en la terminal con el siguiente comando:
```
./piedra_papel_tijera.sh
```

  
### [Parte II (script)](https://github.com/micaelazubiel/-ASO2024TPs/commit/52bc51c0306f7ca943247e03e1ecbb80d1103722#diff-64fc42702434c5772fee3abfb862331ac13ab5bffe1abc8057847109170af097)

#### ¿Qué hace el script?
* Este script  consulta la API de WeatherAPI para obtener el clima actual de una ciudad especificada por el usuario.
* La clave API necesaria para autenticar las solicitudes a WeatherAPI se define como una variable.

  ![8](https://github.com/micaelazubiel/-ASO2024TPs/assets/166451126/5575b0e8-b1ea-46b9-afc6-fb4aad2d941b)

* Verifica si se proporcionó una ciudad como argumento al script. Si no se proporciona, muestra un mensaje de uso y termina el script.
  
  ![1](https://github.com/micaelazubiel/-ASO2024TPs/assets/166451126/e4db9fcc-0763-428a-b5a2-54bb7250b3dd)

* Construye la URL para realizar la solicitud a la API de WeatherAPI, incluyendo la clave API y la ciudad especificada.

  ![11](https://github.com/micaelazubiel/-ASO2024TPs/assets/166451126/6627f23c-bdba-4d0c-878f-9bf354f7996a)

* Utiliza curl para hacer una solicitud HTTP GET a la URL construida y almacena la respuesta en una variable.

  ![12](https://github.com/micaelazubiel/-ASO2024TPs/assets/166451126/4e463619-582e-4e5a-af55-718b77a63586)

* Verifica si la respuesta contiene un mensaje de error. Si es así, muestra un mensaje de error y termina el script.

  ![13](https://github.com/micaelazubiel/-ASO2024TPs/assets/166451126/ab3d1ed6-e363-4699-9e6b-5a13395955ff)

* Utiliza jq para extraer la temperatura actual, la condición y la humedad de la respuesta JSON.

  ![14](https://github.com/micaelazubiel/-ASO2024TPs/assets/166451126/7928e04d-3304-4716-9094-3dd4a52023f1)

* Imprime la información del clima en la terminal.

  ![15](https://github.com/micaelazubiel/-ASO2024TPs/assets/166451126/40a65b5b-502e-4d7f-bc7b-2b1c9bb1aa70)

#### ¿Cómo se ejecuta?
* Guardar el contenido del script en un archivo con extensión '.sh', por ejemplo, clima.sh.

* Abrir una terminal y navegar al directorio donde guardaste el archivo. Luego, dar permisos de ejecución al archivo usando el siguiente comando:
```
chmod +x clima.sh
```
* Instalar 'jq' en caso de no tenerlo para procesar JSON. Código para instalarlo:
```
sudo apt-get update
sudo apt-get install jq
jq --version
```
* Ejecutar el script proporcionando el nombre de una ciudad. Por ejemplo:
```
./clima.sh "Buenos Aires"
```






