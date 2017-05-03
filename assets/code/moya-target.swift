import Moya

enum Printer: TargetType {
    case printFile(URL)
    case disconnectPrinter

    var baseURL = /* ... */
    var path = /* ... */
    var method = /* ... */
    var parameters = /* ... */
    var parametersEncoding = /* ... */
    var sampleData = /* ... */
    var task = /* ... */
}
