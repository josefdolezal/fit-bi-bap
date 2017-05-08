// Funkce napojená na stisknutí tlačítka v Controlleru
func addPrinterButtonTapped() {
    // Předání vstupu ViewModelu
    viewModel.inputs.addPrinterButtonTapped()
}

/* ... */

// Funkce ViewModelu reagující na vstup
private func addPrinterButtonTapped() {
    // Notifikace Coordinatoru na uživatelskou interakci
    delegate?.addPrinterButtonTapped()
}
