// Zkombinování nejnovějších hodnot formuláře
let formFields = Signal.combineLatest(/* ... */)

// Zvaliduje hodnoty kdykoliv se libolná
// z nich změní
let isFormValid = formFields.map(validateFields)

// Funkce validující hodnoty formuláře
func validateFields(_ name: String, _ url: String,
                    token: String, stream: String?
) -> Bool {
    /* Validační logika */
}
