import Moya

let provider = ReactiveSwiftMoyaProvider<Printer>()

provider.request(.disconnectPrinter)
    .filterSuccessfullStatusCodes()
    .startWithResult { result in
        /* zpracování odpovědi */
    }
