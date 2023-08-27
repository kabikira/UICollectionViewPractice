//
//  TimelineViewController.swift
//  UICollectionViewPractice
//
//  Created by koala panda on 2023/08/27.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources


class TimelineViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: "ArticleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ArticleCollectionViewCell")

        }
    }


    private lazy var dataSource = RxCollectionViewSectionedReloadDataSource<TimelineSectionModel>(configureCell: configureCell)

    private lazy var configureCell: RxCollectionViewSectionedReloadDataSource<TimelineSectionModel>.ConfigureCell = { [weak self] (_, tableView, indexPath, item) in
        guard let strongSelf = self else { return UICollectionViewCell() }
        switch item {
        case .article(let article):
            return strongSelf.articleCell(indexPath: indexPath, article: article)
        }
    }

    private var viewModel: TimelineViewModel!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupCollectionView()
        setupViewModel()
    }

}

extension TimelineViewController {
    private func setupViewController() {
        self.navigationItem.title = "ニュース"
    }

    private func setupCollectionView() {
        collectionView.contentInset.top = ArticleCollectionViewCell.cellMargin
//        collectionView.register(UINib(resource: R.nib.articleCollectionViewCell), forCellWithReuseIdentifier: R.nib.articleCollectionViewCell.name.identity)
        collectionView.register(UINib(nibName: "ArticleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ArticleCollectionViewCell")
        collectionView.rx.setDelegate(self).disposed(by: disposeBag)
        collectionView.rx.itemSelected
            .map { [weak self] indexPath -> TimelineItem? in
                return self?.dataSource[indexPath]
            }
            .subscribe(onNext: { [weak self] item in
                guard let item = item else { return }
                switch item {
                case .article(let article):
                    self?.presentArticleDetailViewController(article: article)
                }
            })
            .disposed(by: disposeBag)
    }

    private func setupViewModel() {
        viewModel = TimelineViewModel()
        viewModel.items
            .asDriver()
            .drive(collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        viewModel.updateItems()
    }

    private func articleCell(indexPath: IndexPath, article: Article) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCollectionViewCell", for: indexPath) as? ArticleCollectionViewCell {
            cell.update(title: article.title, date: article.updatedAt)
            return cell
        }

        return UICollectionViewCell()
    }

    private func presentArticleDetailViewController(article: Article) {
        let articleDetailViewController = ArticleDetailViewController(article: article)
        navigationController?.pushViewController(articleDetailViewController, animated: true)
    }
}

extension TimelineViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let item = dataSource[section]
        switch item.model {
        case .news:
            return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = dataSource[indexPath]
        switch item {
        case .article:
            let width = collectionView.bounds.width - (ArticleCollectionViewCell.cellMargin * 2)
            return CGSize(width: width, height: ArticleCollectionViewCell.cellHeight)
        }
    }
}
