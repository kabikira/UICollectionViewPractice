//
//  MyCollectionViewCell.swift
//  UICollectionViewPractice
//
//  Created by koala panda on 2023/08/24.
//

import UIKit


struct MyContentConfiguration: UIContentConfiguration {
    func makeContentView() -> UIView & UIContentView {
        MyContentView(configuration: self)

    }

    let name: String
    //    private let nameLabel = UILabel()
    //
    //    var name: String? {
    //        didSet {
    //            nameLabel.text = name
    //        }
    //    }


    func updated(for state: UIConfigurationState) -> MyContentConfiguration {
        self
    }
    //    override init(frame: CGRect) {
    //        super.init(frame: frame)
    //        setupCoustraints()
    //
    //    }
    //
    //    @available(*, unavailable)
    //    required init?(coder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    //
    //    override func prepareForReuse() {
    //        super.prepareForReuse()
    //        name = nil
    //    }
    //
    //    private func setupCoustraints() {
    //        contentView.addSubview(nameLabel)
    //        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    //        NSLayoutConstraint.activate([
    //            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
    //            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
    //            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
    //            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
    //        ])
    //    }
}
final class MyContentView: UIView, UIContentView {
    private let nameLabel = UILabel()
    var configuration: UIContentConfiguration {
        didSet {
            guard let configuration = configuration as? MyContentConfiguration else { return }
            nameLabel.text = configuration.name
            nameLabel.textAlignment = .center
              }
    }
    init(configuration: MyContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        setupConstraints()
    }
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupConstraints() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])

        // セルの周りに黒線を追加
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.black.cgColor

    }

}
