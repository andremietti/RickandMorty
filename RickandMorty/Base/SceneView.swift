//
//  SceneView.swift
//  RickandMorty
//
//  Created by andre mietti on 10/04/25.
//

import UIKit

class SceneView: UIView, ConfigurableView {

    var contentView = UIView()

    override var backgroundColor: UIColor? {
        didSet {
            contentView.backgroundColor = backgroundColor
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear

        setupContentView()
        buildViewHierarchy()
        setupConstraints()
    }

    func buildViewHierarchy() {
        addSubview(contentView)
    }

    func setupConstraints() {
        contentView.constraint {[
            $0.topAnchor.constraint(equalTo: self.topAnchor),
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]}
    }

    override func addSubview(_ view: UIView) {
        if view == contentView {
            super.addSubview(view)
            return
        }

        contentView.addSubview(view)
    }

    private func setupContentView() {
        addSubview(contentView)
        contentView.constraint {[
            $0.topAnchor.constraint(equalTo: self.topAnchor),
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]}
    }

}
