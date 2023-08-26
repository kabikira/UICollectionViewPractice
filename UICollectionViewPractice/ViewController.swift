//
//  ViewController.swift
//  UICollectionViewPractice
//
//  Created by koala panda on 2023/08/24.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func myViewControllerTapped(_ sender: UIButton) {
        let vc = MyViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

