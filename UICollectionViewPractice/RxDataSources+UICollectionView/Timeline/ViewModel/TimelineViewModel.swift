//
//  TimelineViewModel.swift
//  UICollectionViewPractice
//
//  Created by koala panda on 2023/08/27.
//

import RxSwift
import RxCocoa
import RxDataSources

typealias TimelineSectionModel = SectionModel<TimelineSection, TimelineItem>

enum TimelineSection {
    case news
}

enum TimelineItem {
    case article(article: Article)
}

final class TimelineViewModel {
    let items = BehaviorRelay<[TimelineSectionModel]>(value: [])

    func updateItems() {
        var sections: [TimelineSectionModel] = []

        let item1 = TimelineItem.article(article: Article(title: "巨大タコ､サメを喰う", updatedAt: Date()))
        let item2 = TimelineItem.article(article: Article(title: "マレーコケヒラタツユムシが大量発生", updatedAt: Date()))
        let item3 = TimelineItem.article(article: Article(title: "ジン・ハイマニューバⅡ型のマスターグレードが発売", updatedAt: Date()))
        let articleSection = TimelineSectionModel(model: .news, items: [item1, item2, item3])
        sections.append(articleSection)

        items.accept(sections)
    }
}
