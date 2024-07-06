import Foundation

// Crear arreglos para los tableros
var l0: [String] = [" ", "  1", "  2", "  3"]
var l1: [String] = ["A", " 🌊", " 🌊", " 🌊"]
var l2: [String] = ["B", " 🌊", " 🌊", " 🌊"]
var l3: [String] = ["C", " 🌊", " 🌊", " 🌊"]

var e0: [String] = [" ", "  1", "  2", "  3"]
var e1: [String] = ["A", " 🌊", " 🌊", " 🌊"]
var e2: [String] = ["B", " 🌊", " 🌊", " 🌊"]
var e3: [String] = ["C", " 🌊", " 🌊", " 🌊"]

var j0: [String] = [" ", "  1", "  2", "  3"]
var j1: [String] = ["A", " 🌊", " 🌊", " 🌊"]
var j2: [String] = ["B", " 🌊", " 🌊", " 🌊"]
var j3: [String] = ["C", " 🌊", " 🌊", " 🌊"]

func imprimirTablero() {
    print("-----  TU TABLERO -----")
    print(j0)
    print(j1)
    print(j2)
    print(j3)

    print("\n--- TABLERO ENEMIGO ---")
    print(l0)
    print(l1)
    print(l2)
    print(l3)
}

print("------------------------- BATALLA NAVAL -------------------------")

// Crear variables para cambiar emojis
var cambiarBarcosE: [Int] = []
var cambiarBarcosJ: [Int] = []

// Generar 3 números aleatorios
for _ in 0..<3 {
    let ne = Int.random(in: 1..<4)
    cambiarBarcosE.append(ne)
}

for _ in 0..<3 {
    let nj = Int.random(in: 1..<4)
    cambiarBarcosJ.append(nj)
}

// Reemplaza solo emoji de olas por un emoji de barco en cada arreglo
e1[cambiarBarcosE[0]] = " 🚢"
e2[cambiarBarcosE[1]] = " 🚢"
e3[cambiarBarcosE[2]] = " 🚢"

j1[cambiarBarcosJ[0]] = " 🚢"
j2[cambiarBarcosJ[1]] = " 🚢"
j3[cambiarBarcosJ[2]] = " 🚢"

// Condicion para atacar si aun hay barcos
while j1.contains(" 🚢") || j2.contains(" 🚢") || j3.contains(" 🚢") || e1.contains(" 🚢") || e2.contains(" 🚢") || e3.contains(" 🚢") || l1.contains(" 🚢") || l2.contains(" 🚢") || l3.contains(" 🚢") {
    // Imprimir tableros
    imprimirTablero()

    // Pedir que ingrese la columna que desea atacar
    print("\nIngrese un número del 1 al 3 correspondiente a la columna:")
    guard let inputNumero = readLine(), let numero = Int(inputNumero) else {
        print("Entrada no válida. Ingrese un número del 1 al 3.")
        continue
    }

    // Pedir que ingrese la fila que desea atacar
    print("\nIngrese la letra de la A a la C correspondiente a la columna:")
    guard let letra = readLine(), letra.count == 1, let fila = letra.uppercased().unicodeScalars.first?.value else {
        print("Entrada no válida. Ingrese una letra válida (A, B, C).")
        continue
    }

    // Comprobar fila y columna
    switch fila {
        case 65: // Caso fila A
            //Si hay barco
            if e1[numero].contains(" 🚢" ) {
                e1[numero] = e1[numero].replacingOccurrences(of: " 🚢", with: " 💥")
                l1[numero] = l1[numero].replacingOccurrences(of: " 🌊", with: " 💥")
            }
            // Si no hay barco
            else if e1[numero].contains(" 🌊" ) {
                e1[numero] = e1[numero].replacingOccurrences(of: " 🌊", with: " 📍")
                l1[numero] = l1[numero].replacingOccurrences(of: " 🌊", with: " 📍")
            } 
            // Si vuelve a tirar donde mismo
            else if e1[numero].contains(" 📍" ) {
                e1[numero] = e1[numero].replacingOccurrences(of: " 📍", with: " 💥")
                l1[numero] = l1[numero].replacingOccurrences(of: " 📍", with: " 💥")
            } 
        
        case 66: // Caso fila B
            
            // Si hay un barco
            if e2[numero].contains(" 🚢" ) {
                e2[numero] = e2[numero].replacingOccurrences(of: " 🚢", with: " 💥")
                l2[numero] = l2[numero].replacingOccurrences(of: " 🌊", with: " 💥")
            }
            // Si no hay barco
            else if e2[numero].contains(" 🌊" ) {
                e2[numero] = e2[numero].replacingOccurrences(of: " 🌊", with: " 📍")
                l2[numero] = l2[numero].replacingOccurrences(of: " 🌊", with: " 📍")
            } 
             // Si vuelve a tirar donde mismo
            else if e2[numero].contains(" 📍" ) {
                e2[numero] = e2[numero].replacingOccurrences(of: " 📍", with: " 💥")
                l2[numero] = l2[numero].replacingOccurrences(of: " 📍", with: " 💥")
            } 

        case 67: // Caso fila C
            // Si hay un barco
            if e3[numero].contains(" 🚢" ) {
                e3[numero] = e3[numero].replacingOccurrences(of: " 🚢", with: " 💥")
                l3[numero] = l3[numero].replacingOccurrences(of: " 🌊", with: " 💥")
            }
            // Si no hay barco
            else if e3[numero].contains(" 🌊" ) {
                e3[numero] = e3[numero].replacingOccurrences(of: " 🌊", with: " 📍")
                l3[numero] = l3[numero].replacingOccurrences(of: " 🌊", with: " 📍")
            }
            // Si vuelve a tirar donde mismo 
            else if e3[numero].contains(" 📍" ) {
                e3[numero] = e3[numero].replacingOccurrences(of: " 📍", with: " 💥")
                l3[numero] = l3[numero].replacingOccurrences(of: " 📍", with: " 💥")
            }

        default:
            print("Valor de fila no válido.")
    }

    // Asignar ataque para la computadora
    let filaCompu = Int.random(in: 1..<4)
    let columnaCompu = Int.random(in: 1..<4)

    switch filaCompu {
        case 1:
            // Condiciones de paro para cambiar emojis
            if j1[columnaCompu].contains(" 🌊" ) {
                // Si no hay barco
                j1[columnaCompu] = j1[columnaCompu].replacingOccurrences(of: " 🌊", with: " 📍")
            } else if j1[columnaCompu].contains(" 📍" ) {
                // Si vuelve a tirar donde mismo
                j1[columnaCompu] = j1[columnaCompu].replacingOccurrences(of: " 📍", with: " 💥")
            } else if j1[columnaCompu].contains(" 🚢" ) {
                // Si hay un barco
                j1[columnaCompu] = j1[columnaCompu].replacingOccurrences(of: " 🚢", with: " 💥")
            }
        case 2:
            // Condiciones de paro para cambiar emojis
            if j2[columnaCompu].contains(" 🌊" ) {
                // Si no hay barco
                j2[columnaCompu] = j2[columnaCompu].replacingOccurrences(of: " 🌊", with: " 📍")
            } else if j2[columnaCompu].contains(" 📍" ) {
                // Si vuelve a tirar donde mismo
                j2[columnaCompu] = j2[columnaCompu].replacingOccurrences(of: " 📍", with: " 💥")
            } else if j2[columnaCompu].contains(" 🚢" ) {
                // Si hay un barco
                j2[columnaCompu] = j2[columnaCompu].replacingOccurrences(of: " 🚢", with: " 💥")
            }
        case 3:
            // Condiciones de paro para cambiar emojis
            if j3[columnaCompu].contains(" 🌊" ) {
                // Si no hay barco
                j3[columnaCompu] = j3[columnaCompu].replacingOccurrences(of: " 🌊", with: " 📍")
            } else if j3[columnaCompu].contains(" 📍" ) {
                // Si vuelve a tirar donde mismo
                j3[columnaCompu] = j3[columnaCompu].replacingOccurrences(of: " 📍", with: " 💥")
            } else if j3[columnaCompu].contains(" 🚢" ) {
                // Si hay un barco
                j3[columnaCompu] = j3[columnaCompu].replacingOccurrences(of: " 🚢", with: " 💥")
            }

        default:
            print("Valor de fila no válido.")
    }
}

imprimirTablero()

// Determinar el ganador
if !l1.contains(" 🚢") && !l2.contains(" 🚢") && !l3.contains(" 🚢") {
    print("¡Felicidades! Has hundido todos los barcos enemigos. ¡Eres el ganador!")
} else {
    print("¡Juego terminado! El enemigo ha hundido todos tus barcos. Mejor suerte la próxima vez.")
}
