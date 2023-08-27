//
//  ArticleCollectionViewCell.swift
//  UICollectionViewPractice
//
//  Created by koala panda on 2023/08/27.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!

    static let cellHeight: CGFloat = 70.0
    static let cellMargin: CGFloat = 8.0

    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
        self.dateLabel.text = nil
    }

    func update(title: String, date: Date) {
        titleLabel.text = title
        dateLabel.text = date.description
    }
}
