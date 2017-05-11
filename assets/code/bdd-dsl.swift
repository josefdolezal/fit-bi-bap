import Nimble
import Quick

class PrinterListViewModelTests: QuickSpec {
    var onAddPrinterButtonTapped: (() -> Void)?

    override func spec() {
        // Objekt, který bude testován
        var subject: PrinterListViewModel!
        // Vytvoření dat před každým testem
        beforeEach { }
        // Odstranění dat po konci testu
        afterEach { }

        // DSL testu
        it("notify delegate only when add button is tapped") {
            // Otestování hodnoty pomocí Nimble
            expect(addPrinterTapped) == false
            subject.inputs.addPrinterButtonTapped()
            expect(addPrinterTapped) == true
        }

        it("update printers count on change") { }
        it("supply correct network provider") { }
        it("provides correct view model for cell") { }
    }
}
