import Foundation

/// Vytvoření společné fronty pro zpracování operací
let queue = OperationQueue()

/// Operace, která má být spuštěna jako druhá
let secondOperation: Operation = BlockOperation {
    print("second.")
}

/// Operace, která má být spuštěna jako první
let firstOperation: Operation = BlockOperation {
    print("First come before", separator: " ", terminator: " ")
}

/// Vyžádá vykonání operace firstOperation před svým spuštěním
secondOperation.addDependency(firstOperation)

/// Vložení operací do fronty
queue.addOperation(secondOperation)
queue.addOperation(firstOperation)

/// Vytiskne "First comes before second.",
/// tedy nezáleží na pořadí vložení do fronty
