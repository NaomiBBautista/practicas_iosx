/*
ISSC 411 - PPOSX - 29 de febrero de 2024
Naomi Montserrat Barrera Bautista
Ejercicio: Máximo Común Multiplo y Mínimo Común Divisor
Descripción: Se busca que al ingresar un número entero, el programa
calcule el mínimo común multiplo y el máximo común divisor de este.
*/


// Ingresar los dos números
print("Ingrese el primer número: ");
if let numerillo1 = readLine(), let num1 = Int(numerillo1) {
    print("\nIngrese el segundo número: ");
    if let numerillo2 = readLine(), let num2 = Int(numerillo2) {
        // Establecer el número mayor y menor
        var a = 0;
        var b = 0;
        var mcd = 0;

        if (num1 > num2){
            a = num1;
            b = num2;
        } else {
            a = num2;
            b = num1;
        }

        // Algoritmo de Euclides
        var temp = 0
        while b != 0 {
            temp = b
            b = a % b
            a = temp
        }
        mcd = a

        let mcm = (num1 * num2) / mcd

        print("\nEl M.C.D de \(num1) y \(num2) es \(mcd)")
        print("El M.C.M de \(num1) y \(num2) es \(mcm)")
    } else {
        print("El segundo número ingresado no es válido.")
    }
} else {
    print("El primer número ingresado no es válido.")
}
