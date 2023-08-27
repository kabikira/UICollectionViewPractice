//
//  SimpleViewController.swift
//  UICollectionViewPractice
//
//  Created by koala panda on 2023/08/27.
//

import UIKit

class SimpleViewController: UIViewController {



    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib.init(nibName: Simple2CollectionViewCell.className, bundle: nil),  forCellWithReuseIdentifier: Simple2CollectionViewCell.className)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // セルのイベントを無効にする スクロールも無効
//        collectionView.isUserInteractionEnabled = false
    }
    


}
// MARK: - CollectionView
extension SimpleViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("タップされたよん")
        // スクロールをリセット(一番上に戻す)
        self.collectionView.resetScrollPositionToTop()
    }

}
extension SimpleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Simple2CollectionViewCell.className, for: indexPath) as? Simple2CollectionViewCell else {
            fatalError()
        }
        cell.configure(int: indexPath.row)

        return cell
    }
}
extension SimpleViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
// MARK: - ScrollView
extension UIScrollView {
    func resetScrollPositionToTop() {
        self.contentOffset = CGPoint(x: -contentInset.left, y: -contentInset.top)
    }
}
