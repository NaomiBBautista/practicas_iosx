import Foundation
var carril1 = "🏁_____🧱____🧱_____🚗"
var carril2 = "🏁___________________🛻"

while !carril1.contains("🏁🚗") && !carril2.contains("🏁🛻"){
    //Avanza el carro
    if carril1.contains("_🚗"){
        carril1 = carril1.replacingOccurrences(of: "_🚗", with:"🚗")
    }
    //Colision
    else if carril1.contains("🧱🚗"){
        carril1 = carril1.replacingOccurrences(of: "🧱🚗", with:"_💥")
    }
    else if carril1.contains("💥"){
        carril1 = carril1.replacingOccurrences(of: "💥", with: "🚗")
    }

    if carril2.contains("_🛻"){
        carril2 = carril2.replacingOccurrences(of: "_🛻", with:"🛻")
    }
    else if carril1.contains("🧱🏎️"){
        carril1 = carril1.replacingOccurrences(of: "🧱🛻", with:"_💥")
    }
    else if carril1.contains("💥"){
        carril1 = carril1.replacingOccurrences(of: "💥", with: "🛻")
    }


    print(String(repeating: "\n", count: 15 ))
    print(carril1)
    print(carril2)
    sleep(1)
}



