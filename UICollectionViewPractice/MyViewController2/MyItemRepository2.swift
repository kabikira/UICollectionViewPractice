//
//  MyItemRepository.swift
//  UICollectionViewPractice
//
//  Created by koala panda on 2023/08/24.
//

import Foundation

struct MyItem2 {
    let name: String
}

//final class MyItemRepository {
//    private var items = (0..<30).map { MyItem(name: "Item\($0)")}
//
//    func numberOfItems() -> Int {
//        items.count
//    }
//
//    func item(at index: Int) -> MyItem {
//        items[index]
//    }
//}
final class MyItemRepository2 {
    private var items0 = (0..<15).map { MyItem(name: "Section 0 Item \($0)") }
    private var items1 = (0..<15).map { MyItem(name: "Section 1 Item \($0)") }
    func numberOfSections() -> Int {
        2
    }
    func numberOfItems(inSection section: Int) -> Int { switch section {
        case 0: return items0.count
        case 1: return items1.count
        default: return 0
    }

    }
    func item(at indexPath: IndexPath) -> MyItem? { switch indexPath.section {
        case 0: return items0[indexPath.item]
        case 1: return items1[indexPath.item] default: return nil
    }

  }
}
