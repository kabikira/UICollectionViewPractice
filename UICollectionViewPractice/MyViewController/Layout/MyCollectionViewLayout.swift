//
//  MyCollectionViewLayout.swift
//  UICollectionViewPractice
//
//  Created by koala panda on 2023/08/24.
//

import UIKit

extension MyViewController {
    func makeCollectionViewLayout() -> UICollectionViewLayout {
//        let itemSize = NSCollectionLayoutSize(
////            widthDimension: .fractionalWidth(1.0),
////            heightDimension: .absolute(44)
//            widthDimension: .fractionalWidth(0.25),
//            heightDimension: .fractionalHeight(0.25)
//        )
//
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//        let groupSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
////            heightDimension: .absolute(44)
//            heightDimension: .fractionalHeight(0.25)
//        )
//
//        let group = NSCollectionLayoutGroup.horizontal(
//            layoutSize: groupSize,
////            subitems: [item]
//            subitem: item, count: 4
//        )
//
//        let section = NSCollectionLayoutSection(group: group)
//        let layout = UICollectionViewCompositionalLayout {
//            sectionIndex, layoutEnvironment in
//            let section = NSCollectionLayoutSection(group: group)
//            return section
//        }
        let itemSmall =  NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)))

        let groupSmailPair = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)), subitem: itemSmall, count: 2)

        let itemLarge = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)))

        let groupLeftLarge = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5)), subitems: [itemLarge, groupSmailPair])

        let groupRightLarge = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)), subitems: [itemLarge, groupSmailPair])

        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0)), subitems: [groupLeftLarge,groupRightLarge])

        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
//        return UICollectionViewCompositionalLayout(section: section)
    }
}
