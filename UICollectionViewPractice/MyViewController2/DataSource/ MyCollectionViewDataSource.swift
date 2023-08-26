//
//   MyCollectionViewDataSource.swift
//  UICollectionViewPractice
//
//  Created by koala panda on 2023/08/24.
//

import UIKit

final class MyCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    private weak var repository: MyItemRepository!

    init(repository: MyItemRepository) {
        self.repository = repository
        super.init()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        repository.numberOfItems()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = repository.item(at: indexPath.item)
        return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item
        )
    }

    private let cellRegistration = UICollectionView.CellRegistration<MyCollectionViewCell, MyItem> {
        cell, indexpath, item in
        cell.name = item.name
    }


}
