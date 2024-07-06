/*
ISSC 411 - PPOSX - 29 de febrero de 2024
Naomi Montserrat Barrera Bautista
Ejercicio: Piedra, Papel o Tijera
Descripción: Simular el juego de piedra, papel o tijera con emojis.
Emojis escritos en linea, y al finalizar el juego se debe anunciar 
al ganador o empate, si llega a darse.
*/

import Foundation

// Definir emojis para piedra, papel y tijera
let emojis = ["🪨", "🧻", "✂️"]
var conta1 = 0
var conta2 = 0

// Función para obtener la elección del jugador
func selectOpciones() -> String {
    print("Elige tu jugada (1 = 🪨, 2 = 🧻, 3 = ✂️):")
    if let elegido = readLine(), let opc = Int(elegido), opc >= 1 && opc <= 3 {
        return emojis[opc - 1]
    } else {
        print("Entrada inválida. Por favor, elige nuevamente.")
        return selectOpciones()
    }
}

// Función para determinar el resultado del juego
func determinaGanador(jugador1: String, jugador2: String) -> String {
    if jugador1 == jugador2 {
        return "Empate"
    } else if (jugador1 == "🪨" && jugador2 == "✂️") ||
              (jugador1 == "🧻" && jugador2 == "🪨") ||
              (jugador1 == "✂️" && jugador2 == "🧻") {
        conta1 += 1
        return "Jugador 1 gana"
    } else {
        conta2 += 1
        return "Jugador 2 gana"
    }
}

repeat {
    // Juego principal
    print("\n\n¡Bienvenido al juego de Piedra, Papel o Tijera!")
    print("--------------------------------------------------")
    let jugadorcito1 = selectOpciones()
    let jugadorcito2 = emojis.randomElement()!

    print("Jugador 1: \(jugadorcito1)")
    print("Jugador 2: \(jugadorcito2)")

    let resultado = determinaGanador(jugador1: jugadorcito1, jugador2: jugadorcito2)
    print("\nResultado: \(resultado)")
    print("Contador Global: J1: \(conta1) - J2: \(conta2)")

    if conta1 == 3 || conta2 == 3 {
        break // Salir del bucle si un jugador ha ganado 3 veces
    }
} while true

// Mostrar quién ganó
if conta1 == 3 {
    print("\n¡El jugador 1 ha ganado el juego!")
} else if conta2 == 3 {
    print("\n¡El jugador 2 ha ganado el juego!")
} else {
    print("\nHubo un empate.")
}


