//
//  MyViewController.swift
//  UICollectionViewPractice
//
//  Created by koala panda on 2023/08/24.
//

import UIKit

class MyViewController: UIViewController {
    typealias DateSource = UICollectionViewDiffableDataSource<MySection, MyItem.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<MySection, MyItem.ID>
    private let repository = MyItemRepository()
    private var collectionView: UICollectionView!
//    private var dataSource: MyCollectionViewDataSource!
    private var dataSource: DateSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: makeCollectionViewLayout()
        )
        setupConstraints()
//        dataSource = MyCollectionViewDataSource(repository: repository)
        dataSource = makeDataSource(for: collectionView, repository: repository)
        applySnapshot()
        
    }
    
    private func setupConstraints() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor), collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor), collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}
extension MyViewController {
    func makeDataSource(
        for collectionView: UICollectionView, repository: MyItemRepository
    ) -> UICollectionViewDiffableDataSource<MySection, MyItem.ID> {
        let mainCellRegistration =
        UICollectionView.CellRegistration<UICollectionViewCell, MyItem> {
            cell, IndexPath, item in
            cell.contentConfiguration = MyContentConfiguration(name: item.name)
        }
        let secondaryCellRegistration = UICollectionView.CellRegistration<UICollectionViewCell, MyItem> {
            cell, IndexPath, item in
            cell.contentConfiguration = MyContentConfiguration(name: item.name)
        }
        return UICollectionViewDiffableDataSource<MySection, MyItem.ID>(
            collectionView: collectionView
        ) {
            [weak repository] collectionView, indexPath, id in
            let item = repository?.item(id: id)
            switch indexPath.section {
            case 0:
                return collectionView.dequeueConfiguredReusableCell(using: mainCellRegistration, for: indexPath, item: item)
            case 1:
                return collectionView.dequeueConfiguredReusableCell(using: secondaryCellRegistration, for: indexPath, item: item)
            default:
                fatalError()
            }
        }
    }
}
extension MyViewController {
    private func applySnapshot() {
        var snapshot = Snapshot()
        let sections = repository.sections()
        snapshot.appendSections(sections)
        sections.forEach { section in
            snapshot.appendItems(repository.ids(in: section), toSection: section)
        }
        dataSource.apply(snapshot)
    }
}
//#if DEBUG
//extension UIViewController {
//    @objc func injected() {
//        viewDidLoad()
//    }
//}
//#endif
