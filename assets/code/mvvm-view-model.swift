class PrinterViewModel {
    var name: String {
        return printer?.displayName ?? "unknown"
    }

    var url: String {
        return printer?.url.absoluteString
            ?? "unknown"
    }

    private var printer: Printer?

    init() {
        self.printer = loadPrinter()
    }

    /* ... */
}
