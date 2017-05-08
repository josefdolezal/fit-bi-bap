override func collectionView(_ collectionView: UICollectionView,
                             cellForItemAt indexPath: IndexPath
) -> UICollectionViewCell {
    // Vyžádání objektu buňky pro CollectionView
    let cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: "identifier",
        for: indexPath
    ) as! PrinterListCollectionViewCell

    // Vyžádání nového ViewModelu pro buňku
    cell.viewModel =
        viewModel.outputs.storedPrinterCellViewModel(
            for: indexPath.row
        )

    return cell
}
