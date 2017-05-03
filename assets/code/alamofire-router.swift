import Alamofire

enum Router: URLRequestConvertible {
    case .authorize(apiKey: String)
    case .printFile(URL)
    case .movePrintHead(direction: Direction)

    func asURLRequest() throws -> URLRequest { /* .. */ }
}
