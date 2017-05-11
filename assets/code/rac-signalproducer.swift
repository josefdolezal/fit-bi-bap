// Vytvoření Cold signálu
let producer = SignalProducer<Int, NoError>() { sink, _ in
    sink.send(value: 1)
    sink.send(value: 2)
}

// Tento Observer dostane hodnoty 1 i 2
producer.startWithValues { /* ... */}

// Tento Observer dostane také hodnoty 1 i 2,
// přestože už signálem prošly dříve
producer.startWithValues { /* ... */}
