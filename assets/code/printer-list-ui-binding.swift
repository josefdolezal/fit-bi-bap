func bindViewModel() {
    let outs = viewModel.outputs
    collectionView.reactive.reloadData <~ outs.printersChanged
}
