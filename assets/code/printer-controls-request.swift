// Odchycení uživatelské interakce v Controllertu
view.moveLeftButton.reactive.controlEvents(.touchUpInside)
    .observeValues { [weak self] _ in
        self?.viewModel.inputs.moveHeadLeft()
    }

/* ... */

// Převedení uživatelského vstupu na konkrétní požadavek
// ve ViewModelu
func moveHeadLeft() {
    movePrintHead(axis: .x, direction: .decrease)
}

// Generický požadavek ve ViewModelu
func movePrintHead(axis: JogAxis, direction: JogDirection) {
    printHeadRequest(.jogPrintHead(axis, direction))
}
