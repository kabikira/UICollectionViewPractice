//
//  ArticleDetailViewController.swift
//  UICollectionViewPractice
//
//  Created by koala panda on 2023/08/27.
//

import UIKit

class ArticleDetailViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!

    private var article: Article?

    convenience init(article: Article) {
        self.init(nib: R.nib.articleCollectionViewCell)
        self.article = article
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = article?.title
        self.dateLabel.text = article?.updatedAt.description

    }
    


}
