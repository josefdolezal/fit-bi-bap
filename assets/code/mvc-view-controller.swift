import UIKit

class PrinterDetailController: UIViewController {

    private var printerView: PrinterView!
    private var printer: Printer!

    override func viewDidLoad(animated: Bool) {
        super.viewDidLoad(animated: animated)

        if let printer = printer {
            printerView.nameLabel.text = printer.displayName
            printerView.urlLabel.text =
                printer.url.absoluteString
        } else { /* ... */ }
    }
}
