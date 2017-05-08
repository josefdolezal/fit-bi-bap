override func collectionView(_ collectionView: UICollectionView,
                             numberOfItemsInSection section: Int
) -> Int {
    switch section {
    // Sekce uložených tiskáren
    case 0: return viewModel.outputs.storedPrintersCount
    // Sekce automaticky nalezených tiskáren
    default: return viewModel.outputs.networkPrintersCount
    }
}
