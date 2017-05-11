/// Rozhraní vstupů
protocol PrinterDetailViewModelIntputs { /* ... */}

/// Rozhraní výstupů
protocol PrinterDetailViewModelOutputs { /* ... */}

/// Rozhraní ViewModelu pro Controller
protocol PrinterDetailViewModelType {
    var inputs: PrinterDetailViewModelIntputs { get }
    var outputs: PrinterDetailViewModelOutputs { get }
}

/// Implementace ViewModelu
class PrinterDetailViewModel: PrinterDetailViewModelIntputs,
PrinterDetailViewModelOutputs, PrinterDetailViewModelType {
    /* ... */
}
