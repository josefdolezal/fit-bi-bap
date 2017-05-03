import Moya

provider.request(.authorize)
    .flatMap(.latest) {
        return provider.request(.movePrintHead(direction: .x))
    }
    .flatMap(.latest) {
        return provider.request(.extrude)
    }
    .startWithResult { /* ... */}
