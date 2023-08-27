//
//  SimpleCollectionViewCell.swift
//  UICollectionViewPractice
//
//  Created by koala panda on 2023/08/27.
//

import UIKit

final class SimpleCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var label: UILabel!
    static var className: String { String(describing: SimpleCollectionViewCell.self)}

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .blue
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.label.text = nil
    }
    func configure(int: Int) {
        self.label.text = "\(int.description)番目のセル"
    }

}
