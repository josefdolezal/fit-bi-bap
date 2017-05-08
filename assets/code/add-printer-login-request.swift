// Načtení hodnot v momentě stisknutei tlačítka
formFields.sample(on: loginButtonPressed)
    .map({ values -> (Printer, OctoPrintProvider)
      /* Vytvoření Moya Provider objektu a objektu tiskárny */
    })
    .flatMap(.latest) { printer, provider in
        // Vytvoření požadavku na přihlášení
        return provider.request(.version)
        // Validace status kódu odpovědi
        .filterSuccessfulStatusCodes()
    }
    // Blok zpracování odpovědi
    .startWithResult { result in
        switch result {
        case .success: /* Uložení tiskárny */
        case let .failure(error): /* Zpracování chyby */
        }
    }
