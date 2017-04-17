import UIKit

class PrinterViewController: UIViewController {
    var printerView: printerView!

    private let viewModel = PrinterViewModel()

    override func viewDidLoad(animated: Bool) {
        super.viewDidLoad(animated: animated)

        printerView.nameLabel.text = viewModel.name
        printerView.urlLabel.text = viewModel.url
    }
}
