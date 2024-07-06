func impriPer(_ palabra: String) {
    var arr = Array(palabra)
    var perms: [[Character]] = []
    generarPer(&arr, 0, arr.count - 1, &perms)
    for perm in perms {
        let strPerm = String(perm)
        print(strPerm)
    }
    print("Número total de permutaciones: \(perms.count)")
}
 
func generarPer(_ arr: inout [Character], _ inicio: Int, _ fin: Int, _ result: inout [[Character]]) {
    if inicio == fin {
        result.append(arr)
    } else {
        for i in inicio...fin {
            arr.swapAt(inicio, i)
            generarPer(&arr, inicio + 1, fin, &result)
            arr.swapAt(inicio, i) // Deshacer el intercambio para volver al estado original
        }
    }
}
 
// Uso del código
print("--- Permutador ---");
print("Ingrese una palabra: ");
let palabrita = readLine()!;
print("Permutaciones de '\(palabrita)':")
impriPer(palabrita)