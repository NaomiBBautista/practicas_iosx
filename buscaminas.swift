/*
    ISSC 411 - PPOSX - 21 de marzo de 2024
    Naomi Montserrat Barrera Bautista
    Ejercicio: Recrear el juego de buscaminas, en el que el usuario o jugador ingrese el tamaño
    del tablero, y después pueda ingresar las coordenadas de ataque, si encuentra una bomba el
    juego termina, si no debe mostrar cuantas bombas hay alrededor
*/

// ------------------------- GLOBAL -------------------------
// Declaramos las variables globales para el tablero y el tamaño
var tablero: [[Int]] = [];
var tamañoTablero: Int = 5;
 var perdiste: Bool = false;
 var ganaste: Bool = false;
 var coordenadas: String = ""; 

/* 
    Estados:
    -2 -> No tocada
    -1 -> Bomba
    0 -> No Bomba (tocada)
    1 -> Bomba cerca (tocada)
*/

// ------------------------- TABLERO -------------------------
/*
    Función crearTablero:
    In: tamañoTablero
    Out: Tablero creado
    Objetivo: Una vez que el usuario ingrese el tamaño que desea,
    la función creara el tablero de dicho tamaño, mínimo 5X5
*/
func crearTablero(_ tamaño:Int){
    tablero = Array(repeating: Array(repeating: -2, count: tamaño), count: tamaño);
}

/*
    Función Mostar Tablero:
    In: tamañoTablero
    Out: Tablero impreso con emojis
    Objetivo: Imprime el tablero, sustituyendo los estados
    del arreglo anterior, por sus emojis correspondientes
*/
func mostrarTablero(_ tablero: [[Int]]){
    header();
    for (index, fila) in tablero.enumerated(){
        numeroAEmoji(index);
        for celda in fila{
            switch celda {
                case -2:
                    print("⬜️",terminator:"");
                case -1:
                    if perdiste == true {
                        print("💣",terminator:"");
                    }else {
                        print("⬜️",terminator:"");
                    }
                case 0:
                    print("🔳",terminator:"");
                case 1:
                    print(" 1", terminator:"");
                case 2:
                    print(" 2", terminator:"");
                case 3:
                    print(" 3", terminator:"");
                case 4:
                    print(" 4", terminator:"");
                case 5:
                    print(" 5", terminator:"");
                case 6:
                    print(" 6", terminator:"");
                case 7:
                    print(" 7", terminator:"");
                case 8:
                    print(" 8", terminator:"");
                default:
                    print(" ?", terminator: "");
            }
        }
        print(""); 
    }
}

/*
    Función Imprimir Cabecera:
    In: tamañoTablero
    Out: Cabecera de números del tablero
    Objetivo: Imprime la cabecera con números de emojis
    del tablero.
*/
func header(){
    var headerText = "";
    let numeros = ["#️⃣ ","1️⃣ ","2️⃣ ","3️⃣ ","4️⃣ ","5️⃣ ","6️⃣ ","7️⃣ ","8️⃣ ","9️⃣ ","🔟 "];
    for i:Int in 0...tamañoTablero{
        headerText += numeros[i];
    }
    print(headerText);
}

/*
    Funcion mostrar NÚmero:
    Entrada: index
    Salida: emoji
    Descripción: Se da un numero y regresa un emoji
    Ejemplo:
    Entrada: 2
    Salida: 2️⃣
*/
func numeroAEmoji(_ indice:Int) -> Void{
    let numeros = ["1️⃣ ","2️⃣ ","3️⃣ ","4️⃣ ","5️⃣ ","6️⃣ ","7️⃣ ","8️⃣ ","9️⃣ ","🔟 "];
    print(numeros[indice],terminator:"");
}


// ------------------------- BOMBAS -------------------------
/*
    Función crearBombas:
    In: tamañoTablero
    Out: Tablero con bombas establecidas
    Objetivo: depende del tamaño del tablero será el número de bombas que tenga el 
    buscaminas, si es de 5X5 habrá 5 bombas
*/
func crearBombas(_ tamañoTablero: Int){
    var contarBombas:Int = 0;
    while contarBombas < tamañoTablero{
        let filaBomba: Int = Int.random(in: 0..<tamañoTablero);
        let columnaBomba: Int = Int.random(in: 0..<tamañoTablero);
        if(tablero[filaBomba][columnaBomba] != -1){
            tablero[filaBomba][columnaBomba] = -1;
            contarBombas += 1;
        }
    }
}

/*
    Función bombasCercanas:
    In: coordenadas
    Out: contadorMinas
    Objetivo: Checar en la posición ingresada cuantas
    minas alrededor hay 
*/
func bombasCercanas(_ coord_x: Int, _ coord_y: Int) -> Int{
    let rango_x: [Int] = Array(max(coord_x - 1, 0)...min(coord_x + 1, tamañoTablero - 1));
    let rango_y: [Int] = Array(max(coord_y - 1 , 0)...min(coord_y + 1 , tamañoTablero - 1));
    var contadorMinas: Int = 0;

    for i in rango_x{
        for j in rango_y{
            if i == coord_x && j == coord_y{
                continue
            }
            if tablero[i][j] == -1{
                contadorMinas += 1;
            }
        }
    }
    return contadorMinas;
}

/*
    Función bombasCercanasRecursivas:
    In: coordenadas
    Out: void
    Objetivo: 
*/
func bombasCercanasRecursiva(_ coord_x: Int, _ coord_y: Int){
    let rango_x: [Int] = Array(max(coord_x - 1 , 0)...min(coord_x + 1 , tamañoTablero - 1)); 
    let rango_y: [Int] = Array(max(coord_y - 1 , 0)...min(coord_y + 1 , tamañoTablero - 1));

    for i in rango_x{
        for j in rango_y{
            if i == coord_x && j == coord_y{
                continue
            }
            if tablero[i][j] != -1 && tablero[i][j] == -2{
                if bombasCercanas(i, j) > 0{
                    tablero[i][j] = bombasCercanas(i, j);
                }
                else{
                    tablero[i][j] = 0;
                    bombasCercanasRecursiva(i, j);
                }
            }
        }
    }
}


// ------------------------- JUEGO -------------------------
/*
    Función obtener coordenadas:
    In: coordenadas tipo String
    Out: coordenadas tipo Int
    Objetivo: Una vez ingresadas las coordenadas por el usuario, las separaremos
    por coma en un nuevo arreglo para almacenarlas individualmente y posteriormente 
    convertirlas a número entero y regresarlas en una tupla
*/
func obtenerCoordenadas(_ coordenadas:String) -> (coor1:Int , coor2:Int){
    let coordenadas_trans:[String] = coordenadas.split(separator:",").map(String.init);
    if coordenadas_trans.count == 2{
        if let coor1 = Int(coordenadas_trans[0]){
            if let coor2 = Int(coordenadas_trans[1]){
                return (coor1, coor2)
            }
        }
        return (-1, -1)
    }
    return (-1, -1)
}


/*
    Función checarPosicion:
    In: coordenadas
    Out: void
    Objetivo: Checar si en la coordenada ingresada hay una bomba, vacio o 
    bombas cercanas
*/
func checarPosicion(_ x: Int, _ y: Int) -> Int{
    let coord_x: Int = x - 1;
    let coord_y: Int = y - 1;
    if coord_x < 0 || coord_y < 0
       || coord_x > tamañoTablero 
       || coord_y > tamañoTablero{
        return -3;
    }

    let valorEncontrado = tablero[coord_x][coord_y];
    // 3.1 Hay Bomba
    if valorEncontrado == -1{
        return -1;
    }
    else if valorEncontrado == -2{
        let bombasEncontradas: Int = bombasCercanas(coord_x, coord_y);
        if bombasEncontradas > 0{ //
            tablero[coord_x][coord_y] = bombasEncontradas;
        }
        else{
            tablero[coord_x][coord_y] = 0;
            bombasCercanasRecursiva(coord_x, coord_y)
            return 0; // TODO
        }
    }
    else{
        return 0; // TODO
    }
    return 0; //TODO
    
}


/*
    Función jugar:
    In: void
    Out: void
    Objetivo: Aqui es donde se desarrolla el juego y junta todas las funciones anteriores
    para crear las bombas y el tablero
*/
func jugar(){
    var entradaValida = false;
    print("Bienvenido al buscaminas"); // 1. Bienvenida
    // 1.1 Pedir Tamaño de tablero
    print("Indique el tamaño del tablero o salir para terminar: (Numero Entero X=3)");
    // Ciclo para asegurar entrada valida
    repeat{
        let entrada = readLine()!;
        if let out = Int (entrada){
            tamañoTablero = out;
            entradaValida = true;
            crearTablero(tamañoTablero); // 1.2 Crear Tablero
            crearBombas(tamañoTablero); // 1.3 Generar Bombas
            mostrarTablero(tablero); // 1.4 Mostrar tablero
            print(tablero);
        }
        else {
            entradaValida = false
            print("Tamaño no valido, ingrese un entero o salir");
        }
    }
    while (entradaValida == false);

    var coordenadasValidas = true;
    while (coordenadasValidas){
        // 2. Pedir Coordenadas
        print("Ingrese las coordenadas que desea asignar: (1,1) o salir");
        coordenadas = readLine()!; // 2.1 Obtener Coordenadas de String
        if coordenadas == "salir"{
            coordenadasValidas = false;
        }
        else{
            coordenadasValidas = true;
            let coordenadasTupla = obtenerCoordenadas(coordenadas); // 2.2 Convertir Coordenadas
            if coordenadasTupla.0 != -1{
                let checkPosition = checarPosicion(coordenadasTupla.0, coordenadasTupla.1); // 3. Calcular Posición
                // 3.1 Hay Bomba
                if checkPosition == -1{
                    print("PERDISTE")
                    perdiste=true;
                    mostrarTablero(tablero)
                    coordenadasValidas = false;
                    break;
                }
                else{
                    /* 
                        Hector Fuentes 77904
                        77904
                        11/04/2024
                    */
                    mostrarTablero(tablero);
                    let contieneNegativoDos = tablero.contains { fila in fila.contains(-2)}

                    if contieneNegativoDos {
                        continue;
                    } else {
                        print("Ya Ganaste!!!")
                        break;
                    }
                }
            }
        }
    }
}

jugar();
