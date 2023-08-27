//
//  Simple2CollectionViewCell.swift
//  UICollectionViewPractice
//
//  Created by koala panda on 2023/08/27.
//

import UIKit

final class Simple2CollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var label: UILabel!

    static var className: String { String(describing: Simple2CollectionViewCell.self)}
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.label.text = nil
    }
    func configure(int: Int) {
        self.label.text = "\(int.description)番目のセル"
    }
}
