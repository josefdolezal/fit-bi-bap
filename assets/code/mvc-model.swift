import Foundation

class Printer {
    dynamic var url: URL

    dynamic var displayName: String

    init(url: URL, displayName: String) {
        self.url = url
        self.displayName = displayName
    }
}
