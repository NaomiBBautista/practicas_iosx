print("--- Puntuar Palabras ---")
var puntitos = 0 // Inicializar la variable para almacenar la puntuación de la palabra
 
repeat {
    print("Ingrese una palabra: ")
    let palabrilla = readLine()! 
    // Calcular la puntuación de cada letra en la palabra
    for letrita in palabrilla.lowercased() { // Convertir la palabra a minúsculas
        // Asignar puntuación a cada letra (a=1, b=2, ..., z=26)
        if let valorAscii = letrita.asciiValue {
            let puntuacionLetra = Int(valorAscii) - Int("a".utf8.first!) + 1
            puntitos += puntuacionLetra
        }
    }
 
    // Imprimir la puntuación de la palabra y la puntuación total
    print("Puntuación de la palabra \(palabrilla): \(puntitos)")
} while puntitos < 100