print("--- Es Palindromo? ---");
print("Ingrese una cadena de texto: ");
var cadenilla = readLine()!;
var cadenita = cadenilla.lowercased();
var palindro = [Character]();
 
for caract in cadenita {
    if (caract >= "a" && caract <= "z" || caract.isNumber) {
        palindro.append(caract)
    }
}
 
var alReves = String(palindro.reversed())
var igualitos = String(palindro)
var si = false
if igualitos == alReves {
    si = true
    print("Es palindromo? :" + String(si))
} else {
    print("Es palindromo? :" + String(si))
}