//
//  MyCollectionViewLayout.swift
//  UICollectionViewPractice
//
//  Created by koala panda on 2023/08/24.
//

import UIKit

extension MyViewController {
    func makeCollectionViewLayout() -> UICollectionViewLayout {
        // 小さいアイテムのレイアウトを作成
        let itemSmall = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)))

        // 2つの小さいアイテムを垂直に配置するグループを作成
        let groupSmailPair = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)), subitem: itemSmall, count: 2)

        // 大きいアイテムのレイアウトを作成
        let itemLarge = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)))

        // 左側の大きいアイテムと2つの小さいアイテムを持つグループを作成
        let groupLeftLarge = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5)), subitems: [itemLarge, groupSmailPair])

        // 右側の大きいアイテムと2つの小さいアイテムを持つグループを作成
        let groupRightLarge = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)), subitems: [groupSmailPair, itemLarge])  // ここで順番を変更しています。

        // 上記の2つのグループを垂直に配置する大きなグループを作成
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0)), subitems: [groupLeftLarge,groupRightLarge])

        // グループをセクションに追加
        let section = NSCollectionLayoutSection(group: group)

        // セクションをレイアウトに追加して完成
        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }
}

