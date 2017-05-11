// Vytvoření signálu a Observeru pro vkládání hodnot
let (signal, sink) = Signal<Int, NoError>.pipe()

// Vytvoření nového signálu posílajícího změněné hodnoty,
// přídání Observeru pro přijímání hodnot
signal.map({ $0 * 10 }).observeValues { number in
    print(number)
}

// Vložení hodnot do signálu
sink.send(value: 1) // Vytiskne 10
sink.send(value: 2) // Vytiskne 20
