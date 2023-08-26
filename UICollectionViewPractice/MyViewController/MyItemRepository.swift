//
//  MyItemRepository.swift
//  UICollectionViewPractice
//
//  Created by koala panda on 2023/08/24.
//

import Foundation

//struct MyItem {
//    let name: String
//}
struct MyItem: Identifiable {
    let id = UUID()
    let name: String
}
enum MySection: CaseIterable {
    case main
    case secondary
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
//final class MyItemRepository {
//    private var items0 = (0..<15).map { MyItem(name: "Section 0 Item \($0)") }
//    private var items1 = (0..<15).map { MyItem(name: "Section 1 Item \($0)") }
//    func numberOfSections() -> Int {
//        2
//    }
//    func numberOfItems(inSection section: Int) -> Int { switch section {
//        case 0: return items0.count
//        case 1: return items1.count
//        default: return 0
//    }
//
//    }
//    func item(at indexPath: IndexPath) -> MyItem? { switch indexPath.section {
//        case 0: return items0[indexPath.item]
//        case 1: return items1[indexPath.item]
//        default: return nil
//    }
//
//  }
//}
final class MyItemRepository {
    private var items0 = (0..<15).map { MyItem(name: "0: \($0)") }
    private var items1 = (0..<15).map { MyItem(name: "1: \($0)") }
    private var items: [MyItem] { items0 + items1 }
    func sections() -> [MySection] {
        MySection.allCases
    }

    
    func ids(in section: MySection) -> [MyItem.ID] { // MyItem.ID は id プロパティの型名です(Identifiable プロトコルで定義されています)
        switch section {
        case .main: return items0.map { $0.id }
        case .secondary: return items1.map { $0.id }
        }
    }
    
    func item(id: MyItem.ID) -> MyItem? {
        items.first { $0.id == id }
    }
}
