func primito(_ nume: Int) -> Bool {
    if nume <= 1 {
        return false
    }
    for i in 2..<nume {
        if nume % i == 0 {
            return false
        }
    }
    return true
}
 
 
print("--- Es Primo? ---");
print("Ingrese un número: ");
var numerillo = readLine()!;
if primito(numerillo) {
    print("\(numerillo) es un número primo.")
} else {
    print("\(numerillo) no es un número primo.")
}