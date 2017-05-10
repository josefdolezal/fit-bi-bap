provider.request(.currentPrinterState).filterSuccess().mapJSON()
    .mapTo(object: PrinterState.self)
    .flatMap(.latest) { state in
        /* Dokončení prvního požadavku a vytvoření nového */
        self.stateProperty.value = state
        return self.provider.request(.currentJob).
    }
    .filterSuccess().mapJSON().mapTo(object: Job.self)
    .flatMap(.latest) { job in
        /* Dokončení druhého požadavku a vytvoření nového */
        self.jobProperty.value = job
        return self.provider.request(.currentToolState)
    }
    .filterSuccess().mapJSON()
    .mapDictionary(collectionOf: Tool.self)
    .flatMap(.latest) { tools in
        /* Dokončení čtvrtého požadavku a vytvoření nového */
        self.toolProperty.value = tools.first
        return self.provider.request(.currentBedState)
    }
    .filterSuccess().mapJSON().mapTo(object: Bed.self)
    .startWithResult { result in
        /* Zpracování odpovědi */
    }
