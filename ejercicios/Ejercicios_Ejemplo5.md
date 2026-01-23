
# Ejercicios prácticos de Sets, Maps en Dart (Ejemplo 5)

A continuación tienes cuatro ejercicios prácticos inspirados en situaciones reales y juegos. Los dos primeros son de nivel medio y los dos últimos son opcionales de nivel avanzado.

---


## Ejercicio 1: Juego de Bingo
Crea un programa que simule un juego de bingo sencillo:

- Genera un cartón de bingo para el usuario con 15 números únicos entre 1 y 60. Usa un Set para asegurarte de que no haya números repetidos.
- Simula el sorteo de bolas: ve generando números aleatorios entre 1 y 60, sin repetir, y muestra cada número sorteado.
- Cada vez que salga un número, indica si está en el cartón del usuario y márcalo como acertado.
- Muestra en pantalla los números acertados y cuántos faltan para completar el cartón.
- El juego termina cuando el usuario ha acertado todos los números de su cartón.

Pistas:
- Puedes usar otro Set para guardar los números ya sorteados.
- Usa print para mostrar el estado del cartón tras cada sorteo.

---


## Ejercicio 2: Agenda de contactos
Crea una agenda digital interactiva:

- Usa un Map donde la clave sea el nombre del contacto y el valor su número de teléfono.
- Permite al usuario:
	- Añadir un nuevo contacto (pide nombre y teléfono).
	- Buscar un contacto por nombre y mostrar su teléfono.
	- Modificar el número de un contacto existente.
	- Eliminar un contacto de la agenda.
- Al final, muestra todos los contactos ordenados alfabéticamente por nombre.

Pistas:
- Puedes usar un bucle para mostrar un menú de opciones y pedir al usuario qué acción quiere realizar.

---


## Ejercicio 3 (Opcional): Juego de palabras prohibidas
Crea un programa para jugar a las "palabras prohibidas":

- Define un Set con varias palabras prohibidas (por ejemplo: "malo", "odio", "tonto").
- El usuario debe escribir frases libremente (puedes pedir varias frases en un bucle hasta que escriba "fin").
- Cada vez que el usuario escriba una frase, revisa si contiene alguna palabra prohibida (ignora mayúsculas/minúsculas).
- Si encuentra una palabra prohibida, avisa al usuario y lleva la cuenta de cuántas veces se ha usado cada una (usa un Map para el conteo).
- Al terminar (cuando el usuario escriba "fin"), muestra un resumen con las palabras prohibidas usadas y cuántas veces apareció cada una.

Pistas:
- Puedes dividir la frase en palabras usando split y limpiar signos de puntuación.

---


## Ejercicio 4 (Opcional): Sistema de reservas para un restaurante
Crea un sistema sencillo de reservas para un restaurante:

- Usa un Map donde la clave es la fecha (por ejemplo, "2026-01-21") y el valor es un Set con los nombres de las personas que han reservado para ese día.
- Permite al usuario:
	- Añadir una reserva (pide nombre y fecha).
	- Consultar las reservas de una fecha concreta (muestra todos los nombres reservados ese día).
	- Cancelar una reserva (elimina el nombre de la fecha indicada).
- Al final, muestra todas las reservas agrupadas por fecha y ordenadas alfabéticamente (tanto las fechas como los nombres dentro de cada fecha).

Pistas:
- Puedes usar un bucle con menú de opciones para gestionar las acciones del usuario.

---

¡Recuerda probar tus soluciones y comentar el código para explicar tu razonamiento!