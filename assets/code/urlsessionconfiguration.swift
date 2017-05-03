import Foundation

let configuration = URLSessionConfiguration()

/// Přidání API klíče pro konkrétní tiskárnu
configuration.httpAdditionalHeaders = ["X-Api-Key": "123-ABC"]
configuration.httpCookieAcceptPolicy = .always

let printer = URLSession(configuration: configuration)
